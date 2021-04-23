Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D438B36921B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Apr 2021 14:28:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242273AbhDWM3J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Apr 2021 08:29:09 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36079 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242328AbhDWM3E (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Apr 2021 08:29:04 -0400
Received: from marcel-macbook.holtmann.net (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 44672CED00;
        Fri, 23 Apr 2021 14:36:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 04/10] Bluetooth: HCI: Use skb_pull to parse Inquiry
 Result event
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210419171257.3865181-5-luiz.dentz@gmail.com>
Date:   Fri, 23 Apr 2021 14:28:27 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <BB6AA021-E6B3-46BA-B394-1C1DCE53B123@holtmann.org>
References: <20210419171257.3865181-1-luiz.dentz@gmail.com>
 <20210419171257.3865181-5-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This uses skb_pull to check the Inquiry Result events received have
> the minimum required length.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci.h |  5 +++++
> net/bluetooth/hci_event.c   | 19 ++++++++++++++-----
> 2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 9251ae3a2ce0..b65205b4d830 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -1910,6 +1910,11 @@ struct inquiry_info {
> 	__le16   clock_offset;
> } __packed;
> 
> +struct hci_ev_inquiry_result {
> +	__u8    num;
> +	struct inquiry_info info[];
> +};
> +
> #define HCI_EV_CONN_COMPLETE		0x03
> struct hci_ev_conn_complete {
> 	__u8     status;
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index c353dfafb04c..6516538fe238 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -2990,13 +2990,21 @@ static void hci_inquiry_complete_evt(struct hci_dev *hdev, struct sk_buff *skb)
> 
> static void hci_inquiry_result_evt(struct hci_dev *hdev, struct sk_buff *skb)
> {
> +	struct hci_ev_inquiry_result *ev;
> 	struct inquiry_data data;
> -	struct inquiry_info *info = (void *) (skb->data + 1);
> -	int num_rsp = *((__u8 *) skb->data);
> +	int i;
> 
> -	BT_DBG("%s num_rsp %d", hdev->name, num_rsp);
> +	ev = hci_ev_skb_pull(hdev, skb, HCI_EV_INQUIRY_RESULT, sizeof(*ev));
> +	if (!ev)
> +		return;
> 
> -	if (!num_rsp || skb->len < num_rsp * sizeof(*info) + 1)
> +	if (!hci_ev_skb_pull(hdev, skb, HCI_EV_INQUIRY_RESULT,
> +			     flex_array_size(ev, info, ev->num)))
> +		return;
> +
> +	BT_DBG("%s num %d", hdev->name, ev->num);

please switch to bt_dev_dbg() here.

Regards

Marcel

