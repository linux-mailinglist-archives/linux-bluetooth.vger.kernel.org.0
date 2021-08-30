Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC093FB899
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Aug 2021 16:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237271AbhH3O6I convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Aug 2021 10:58:08 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43444 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233162AbhH3O6H (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Aug 2021 10:58:07 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 36819CED2F;
        Mon, 30 Aug 2021 16:57:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC] Bluetooth: Fix using address type from events
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210827165332.1562474-1-luiz.dentz@gmail.com>
Date:   Mon, 30 Aug 2021 16:57:12 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <93F5BEBD-E11E-46F4-BB96-DF7F7C6C9361@holtmann.org>
References: <20210827165332.1562474-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Address types ADDR_LE_DEV_PUBLIC_RESOLVED and
> ADDR_LE_DEV_RANDOM_RESOLVED shall be converted to ADDR_LE_PUBLIC and
> ADDR_LE_RANDOM repectively since they are not safe to be used beyond
> the scope of the events themselves.
> 
> Also don't connect using RPA as peer address when LL Privacy is
> enabled since the controller will be resolving the addresses it should
> be able to generate the RPA.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_conn.c  | 10 +++++---
> net/bluetooth/hci_core.c  |  9 -------
> net/bluetooth/hci_event.c | 52 ++++++++++++++++++---------------------
> 3 files changed, 30 insertions(+), 41 deletions(-)
> 
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index bdaa64cb2f3a..28f23654b8a6 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -1087,10 +1087,12 @@ struct hci_conn *hci_connect_le(struct hci_dev *hdev, bdaddr_t *dst,
> 	 * be resolved back into the original identity address
> 	 * from the connect request.
> 	 */
> -	irk = hci_find_irk_by_addr(hdev, dst, dst_type);
> -	if (irk && bacmp(&irk->rpa, BDADDR_ANY)) {
> -		dst = &irk->rpa;
> -		dst_type = ADDR_LE_DEV_RANDOM;
> +	if (!hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {

I do not understand this pre-caution with HCI_LL_RPA_RESOLUTION. What is this for?

> +		irk = hci_find_irk_by_addr(hdev, dst, dst_type);
> +		if (irk && bacmp(&irk->rpa, BDADDR_ANY)) {
> +			dst = &irk->rpa;
> +			dst_type = ADDR_LE_DEV_RANDOM;
> +		}
> 	}
> 
> 	if (conn) {
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 6ab0ff3cd4bc..e83a3accfc33 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -3562,15 +3562,6 @@ struct hci_conn_params *hci_pend_le_action_lookup(struct list_head *list,
> {
> 	struct hci_conn_params *param;
> 
> -	switch (addr_type) {
> -	case ADDR_LE_DEV_PUBLIC_RESOLVED:
> -		addr_type = ADDR_LE_DEV_PUBLIC;
> -		break;
> -	case ADDR_LE_DEV_RANDOM_RESOLVED:
> -		addr_type = ADDR_LE_DEV_RANDOM;
> -		break;
> -	}
> -
> 	list_for_each_entry(param, list, action) {
> 		if (bacmp(&param->addr, addr) == 0 &&
> 		    param->addr_type == addr_type)
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 24d0773b861a..028cdf7ef075 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -2411,6 +2411,24 @@ static void hci_cs_disconnect(struct hci_dev *hdev, u8 status)
> 	hci_dev_unlock(hdev);
> }
> 
> +static u8 ev_bdaddr_type(struct hci_dev *hdev, u8 type)
> +{
> +	/* When using controller based address resolution, then the new
> +	 * address types 0x02 and 0x03 are used. These types need to be
> +	 * converted back into either public address or random address type
> +	 */
> +	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
> +		switch (type) {
> +		case ADDR_LE_DEV_PUBLIC_RESOLVED:
> +			return ADDR_LE_DEV_PUBLIC;
> +		case ADDR_LE_DEV_RANDOM_RESOLVED:
> +			return ADDR_LE_DEV_RANDOM;
> +		}
> +	}
> +

The check for HCI_LL_RPA_RESOLUTION makes no sense to me. It is always safe to convert addr_type 0x02 and 0x03. You really only see them if resolving list usage is active.

> +	return type;
> +}
> +
> static void cs_le_create_conn(struct hci_dev *hdev, bdaddr_t *peer_addr,
> 			      u8 peer_addr_type, u8 own_address_type,
> 			      u8 filter_policy)
> @@ -2422,20 +2440,7 @@ static void cs_le_create_conn(struct hci_dev *hdev, bdaddr_t *peer_addr,
> 	if (!conn)
> 		return;
> 
> -	/* When using controller based address resolution, then the new
> -	 * address types 0x02 and 0x03 are used. These types need to be
> -	 * converted back into either public address or random address type
> -	 */
> -	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
> -		switch (own_address_type) {
> -		case ADDR_LE_DEV_PUBLIC_RESOLVED:
> -			own_address_type = ADDR_LE_DEV_PUBLIC;
> -			break;
> -		case ADDR_LE_DEV_RANDOM_RESOLVED:
> -			own_address_type = ADDR_LE_DEV_RANDOM;
> -			break;
> -		}
> -	}
> +	own_address_type = ev_bdaddr_type(hdev, own_address_type);
> 
> 	/* Store the initiator and responder address information which
> 	 * is needed for SMP. These values will not change during the
> @@ -5333,20 +5338,7 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
> 		conn->dst_type = irk->addr_type;
> 	}
> 
> -	/* When using controller based address resolution, then the new
> -	 * address types 0x02 and 0x03 are used. These types need to be
> -	 * converted back into either public address or random address type
> -	 */
> -	if (hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION)) {
> -		switch (conn->dst_type) {
> -		case ADDR_LE_DEV_PUBLIC_RESOLVED:
> -			conn->dst_type = ADDR_LE_DEV_PUBLIC;
> -			break;
> -		case ADDR_LE_DEV_RANDOM_RESOLVED:
> -			conn->dst_type = ADDR_LE_DEV_RANDOM;
> -			break;
> -		}
> -	}
> +	conn->dst_type = ev_bdaddr_type(hdev, conn->dst_type);
> 

I see, it comes from the original code.

Frankly, I fail to see why any of these checks are needed. When we get that value, we need to convert it. So we better remove these pointless checks unless someone tells me the reason for it. Greping through the code seems we have even more and even more complex ones.

> 	if (status) {
> 		hci_le_conn_failed(conn, status);
> @@ -5663,6 +5655,8 @@ static void process_adv_report(struct hci_dev *hdev, u8 type, bdaddr_t *bdaddr,
> 	 * controller address.
> 	 */
> 	if (direct_addr) {
> +		direct_addr_type = ev_bdaddr_type(hdev, direct_addr_type);
> +
> 		/* Only resolvable random addresses are valid for these
> 		 * kind of reports and others can be ignored.
> 		 */
> @@ -5690,6 +5684,8 @@ static void process_adv_report(struct hci_dev *hdev, u8 type, bdaddr_t *bdaddr,
> 		bdaddr_type = irk->addr_type;
> 	}
> 
> +	bdaddr_type = ev_bdaddr_type(hdev, bdaddr_type);
> +
> 	/* Check if we have been requested to connect to this device.
> 	 *
> 	 * direct_addr is set only for directed advertising reports (it is NULL

Regards

Marcel

