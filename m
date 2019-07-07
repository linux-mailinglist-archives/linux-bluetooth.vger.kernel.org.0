Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9757A610E0
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfGFNqr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:46:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43630 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGFNqq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:46:46 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9CA64CF12E;
        Sat,  6 Jul 2019 15:55:16 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] LE Privacy implementation
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1561108901-9475-1-git-send-email-spoorthix.k@intel.com>
Date:   Sat, 6 Jul 2019 15:46:43 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <63AB195E-9CD0-4FA5-9E12-88F8133871C0@holtmann.org>
References: <1561108901-9475-1-git-send-email-spoorthix.k@intel.com>
To:     SpoorthiX K <spoorthix.k@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Spoorthi,

> As per Core specification 5.0, Vol 2, Part E, Section 7.8.38,
> following code changes implements LE add device to Resolving List.
> < HCI Command: LE Set Scan Pa.. (0x08|0x000b) plen 7  #3 [hci0] 06:08:22.083786
>        Type: Active (0x01)
>        Interval: 22.500 msec (0x0024)
>        Window: 11.250 msec (0x0012)
>        Own address type: Random (0x01)
>        Filter policy: Accept all advertisement (0x00)
>> HCI Event: Command Complete (0x0e) plen 4           #4 [hci0] 06:08:22.084498
>      LE Set Scan Parameters (0x08|0x000b) ncmd 1
>        Status: Success (0x00)
> < HCI Command: LE Add Devic.. (0x08|0x0027) plen 39  #26 [hci0] 06:08:30.646867
>        Address type: Random (0x01)
>        Address: E8:E9:93:AD:7E:A2 (Static)
>        Peer identity resolving key: 704baf18bc90ffffb83c2d40d2b0ffff
>        Local identity resolving key: 8e4902a3ffffffff0040af18bc90ffff
>> HCI Event: Command Complete (0x0e) plen 4          #27 [hci0] 06:08:30.647408
>      LE Add Device To Resolving List (0x08|0x0027) ncmd 1
>        Status: Success (0x00)
> < HCI Command: LE Set Scan P.. (0x08|0x000b) plen 7  #28 [hci0] 06:08:30.647456
>        Type: Passive (0x00)
>        Interval: 60.000 msec (0x0060)
>        Window: 30.000 msec (0x0030)
>        Own address type: Public (0x00)
>        Filter policy: Accept all advertisement, inc. directed unresolved RPA (0x02)
>> HCI Event: Command Complete (0x0e) plen 4          #29 [hci0] 06:08:30.648901
>      LE Set Scan Parameters (0x08|0x000b) ncmd 1
>        Status: Success (0x00)
> < HCI Command: LE Create Co.. (0x08|0x000d) plen 25  #43 [hci0] 06:08:31.142393
>        Scan interval: 60.000 msec (0x0060)
>        Scan window: 60.000 msec (0x0060)
>        Filter policy: White list is not used (0x00)
>> HCI Event: Command Status (0x0f) plen 4            #44 [hci0] 06:08:31.144909
>      LE Create Connection (0x08|0x000d) ncmd 2
>        Status: Success (0x00)
> @ MGMT Command: Add Device (0x0033) plen 8      {0x0001} [hci0] 06:08:40.939043
>        LE Address: E8:E9:93:AD:7E:A2 (Static)
>        Action: Auto-connect remote device (0x02)
> 
> Signed-off-by: Spoorthi Ravishankar Koppad <spoorthix.k@intel.com>
> ---
> include/net/bluetooth/hci.h |   1 +
> net/bluetooth/hci_request.c | 119 +++++++++++++++++++++++++++++++++++++++++++-
> 2 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index c36dc1e..99a38cf36 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -420,6 +420,7 @@ enum {
> #define HCI_LE_SLAVE_FEATURES		0x08
> #define HCI_LE_PING			0x10
> #define HCI_LE_DATA_LEN_EXT		0x20
> +#define HCI_LE_LL_PRIVACY		0x40
> #define HCI_LE_PHY_2M			0x01
> #define HCI_LE_PHY_CODED		0x08
> #define HCI_LE_EXT_ADV			0x10
> diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
> index ca73d36..d4ecf71 100644
> --- a/net/bluetooth/hci_request.c
> +++ b/net/bluetooth/hci_request.c
> @@ -773,6 +773,119 @@ static u8 update_white_list(struct hci_request *req)
> 	return 0x01;
> }
> 
> +static void add_to_resolve_list(struct hci_request *req,
> +				struct hci_conn_params *params)
> +{
> +	struct hci_cp_le_add_to_resolv_list cp;
> +	struct bdaddr_list_with_irk *entry;
> +
> +	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return;
> +
> +	cp.bdaddr_type = params->addr_type;
> +	bacpy(&cp.bdaddr, &params->addr);
> +	memcpy(entry->peer_irk, cp.peer_irk, 16);
> +	memcpy(entry->local_irk, cp.local_irk, 16);
> +	hci_req_add(req, HCI_OP_LE_ADD_TO_RESOLV_LIST, sizeof(cp), &cp);
> +}
> +
> +static u8 update_resolve_list(struct hci_request *req)
> +{
> +	struct hci_dev *hdev = req->hdev;
> +	struct hci_conn_params *params;
> +	struct bdaddr_list *b;
> +	uint8_t resolve_list_entries = 0;
> +
> +	/* Go through the current white list programmed into the
> +	 * controller one by one and check if that address is still
> +	 * in the list of pending connections or list of devices to
> +	 * report. If not present in either list, then queue the
> +	 * command to remove it from the controller.
> +	 */
> +	list_for_each_entry(b, &hdev->le_resolv_list, list) {
> +		/* If the device is neither in pend_le_conns nor
> +		 * pend_le_reports then remove it from the whitelist.
> +		 */
> +		if (!hci_pend_le_action_lookup(&hdev->pend_le_conns,
> +                                               &b->bdaddr, b->bdaddr_type) &&
> +                    !hci_pend_le_action_lookup(&hdev->pend_le_reports,
> +                                               &b->bdaddr, b->bdaddr_type)) {
> +                        struct hci_cp_le_del_from_resolv_list cp;
> +
> +                        cp.bdaddr_type = b->bdaddr_type;
> +                        bacpy(&cp.bdaddr, &b->bdaddr);
> +
> +                        hci_req_add(req, HCI_OP_LE_DEL_FROM_RESOLV_LIST,
> +                                    sizeof(cp), &cp);
> +                        continue;
> +                }
> +
> +                if (hci_find_irk_by_addr(hdev, &b->bdaddr, b->bdaddr_type)) {
> +                        /* White list can not be used with RPAs */
> +                        return 0x00;
> +                }
> +
> +                resolve_list_entries++;
> +        }
> +
> +       /* Since all no longer valid white list entries have been
> +        * removed, walk through the list of pending connections
> +        * and ensure that any new device gets programmed into
> +        * the controller.
> +        *
> +        * If the list of the devices is larger than the list of
> +        * available white list entries in the controller, then
> +        * just abort and return filer policy value to not use the
> +        * white list.
> +        */
> +       list_for_each_entry(params, &hdev->pend_le_conns, action) {
> +               if (hci_bdaddr_list_lookup(&hdev->le_resolv_list,
> +                                          &params->addr, params->addr_type))
> +                       continue;
> +
> +                if (resolve_list_entries >= hdev->le_resolv_list_size) {
> +                        /* Select filter policy to accept all advertising */
> +                        return 0x00;
> +                }
> +
> +                if (hci_find_irk_by_addr(hdev, &params->addr,
> +                                         params->addr_type)) {
> +                        /* White list can not be used with RPAs */
> +                        return 0x02;
> +                }
> +
> +                resolve_list_entries++;
> +                add_to_resolve_list(req, params);
> +        }
> +
> +        /* After adding all new pending connections, walk through
> +         * the list of pending reports and also add these to the
> +         * white list if there is still space.
> +        */
> +        list_for_each_entry(params, &hdev->pend_le_reports, action) {
> +                if (hci_bdaddr_list_lookup(&hdev->le_resolv_list,
> +                                           &params->addr, params->addr_type))
> +                        continue;
> +
> +                if (resolve_list_entries >= hdev->le_resolv_list_size) {
> +                        /* Select filter policy to accept all advertising */
> +                        return 0x00;
> +                }
> +
> +                if (hci_find_irk_by_addr(hdev, &params->addr,
> +                                         params->addr_type)) {
> +                        /* White list can not be used with RPAs */
> +                        return 0x02;
> +                }
> +
> +                resolve_list_entries++;
> +                add_to_resolve_list(req, params);
> +        }
> +       /* Select filter policy to use white list */
> +        return 0x02;
> +}
> +
> static bool scan_use_rpa(struct hci_dev *hdev)
> {
> 	return hci_dev_test_flag(hdev, HCI_PRIVACY);
> @@ -876,7 +989,11 @@ void hci_req_add_le_passive_scan(struct hci_request *req)
> 	 * happen before enabling scanning. The controller does
> 	 * not allow white list modification while scanning.
> 	 */
> -	filter_policy = update_white_list(req);
> +
> +	if (!(hdev->le_features[0] & HCI_LE_LL_PRIVACY))
> +		filter_policy = update_white_list(req);
> +	else
> +		filter_policy = update_resolve_list(req);

this white list and resolving list are not one or the other. You can use both and disabling the white list is a pretty bad idea here.

Regards

Marcel

