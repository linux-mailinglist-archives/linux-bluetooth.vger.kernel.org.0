Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7CE35F147
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Apr 2021 12:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhDNKLB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Apr 2021 06:11:01 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48818 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233990AbhDNKKk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Apr 2021 06:10:40 -0400
Received: from mac-pro.holtmann.net (p4fefc77b.dip0.t-ipconnect.de [79.239.199.123])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0E875CECE0;
        Wed, 14 Apr 2021 12:18:02 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [RFC 2/2] Bluetooth: HCI: Use bt_skb_pull to parse events
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CABBYNZJAgEtmnhHOq5k0NPxTgGAcOfoY66REMo1uirwMGwiMUw@mail.gmail.com>
Date:   Wed, 14 Apr 2021 12:10:17 +0200
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <0903BFFF-3323-4D75-AE4A-582CD752BF39@holtmann.org>
References: <20210412184033.2504931-1-luiz.dentz@gmail.com>
 <20210412184033.2504931-2-luiz.dentz@gmail.com>
 <D319A29F-E16F-469D-99D9-0770F87BC6D9@holtmann.org>
 <CABBYNZJAgEtmnhHOq5k0NPxTgGAcOfoY66REMo1uirwMGwiMUw@mail.gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

>>> This uses bt_skb_pull to check the events received have the minimum
>>> required length, while at it also rework checks for flexible arrays to
>>> use flex_array_size.
>>> 
>>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>> ---
>>> include/net/bluetooth/hci.h |  59 ++-
>>> net/bluetooth/hci_event.c   | 848 ++++++++++++++++++++++++++++--------
>>> 2 files changed, 722 insertions(+), 185 deletions(-)
>>> 
>>> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
>>> index ea4ae551c426..13b7c7747bd1 100644
>>> --- a/include/net/bluetooth/hci.h
>>> +++ b/include/net/bluetooth/hci.h
>>> @@ -1894,6 +1894,10 @@ struct hci_cp_le_reject_cis {
>>> } __packed;
>>> 
>>> /* ---- HCI Events ---- */
>>> +struct hci_ev_status {
>>> +     __u8    status;
>>> +} __packed;
>>> +
>>> #define HCI_EV_INQUIRY_COMPLETE               0x01
>>> 
>>> #define HCI_EV_INQUIRY_RESULT         0x02
>>> @@ -1906,6 +1910,11 @@ struct inquiry_info {
>>>      __le16   clock_offset;
>>> } __packed;
>>> 
>>> +struct hci_ev_inquiry_result {
>>> +     __u8    num;
>>> +     struct inquiry_info info[];
>>> +};
>>> +
>>> #define HCI_EV_CONN_COMPLETE          0x03
>>> struct hci_ev_conn_complete {
>>>      __u8     status;
>>> @@ -2017,7 +2026,7 @@ struct hci_comp_pkts_info {
>>> } __packed;
>>> 
>>> struct hci_ev_num_comp_pkts {
>>> -     __u8     num_hndl;
>>> +     __u8     num;
>>>      struct hci_comp_pkts_info handles[];
>>> } __packed;
>>> 
>>> @@ -2067,7 +2076,7 @@ struct hci_ev_pscan_rep_mode {
>>> } __packed;
>>> 
>>> #define HCI_EV_INQUIRY_RESULT_WITH_RSSI       0x22
>>> -struct inquiry_info_with_rssi {
>>> +struct inquiry_info_rssi {
>>>      bdaddr_t bdaddr;
>>>      __u8     pscan_rep_mode;
>>>      __u8     pscan_period_mode;
>>> @@ -2075,7 +2084,7 @@ struct inquiry_info_with_rssi {
>>>      __le16   clock_offset;
>>>      __s8     rssi;
>>> } __packed;
>>> -struct inquiry_info_with_rssi_and_pscan_mode {
>>> +struct inquiry_info_rssi_pscan {
>>>      bdaddr_t bdaddr;
>>>      __u8     pscan_rep_mode;
>>>      __u8     pscan_period_mode;
>>> @@ -2084,6 +2093,14 @@ struct inquiry_info_with_rssi_and_pscan_mode {
>>>      __le16   clock_offset;
>>>      __s8     rssi;
>>> } __packed;
>>> +struct hci_ev_inquiry_result_rssi {
>>> +     __u8     num;
>>> +     struct inquiry_info_rssi info[];
>>> +} __packed;
>>> +struct hci_ev_inquiry_result_rssi_pscan {
>>> +     __u8     num;
>>> +     struct inquiry_info_rssi_pscan info[];
>>> +} __packed;
>>> 
>>> #define HCI_EV_REMOTE_EXT_FEATURES    0x23
>>> struct hci_ev_remote_ext_features {
>>> @@ -2138,6 +2155,11 @@ struct extended_inquiry_info {
>>>      __u8     data[240];
>>> } __packed;
>>> 
>>> +struct hci_ev_ext_inquiry_result {
>>> +     __u8     num;
>>> +     struct extended_inquiry_info info[];
>>> +} __packed;
>>> +
>>> #define HCI_EV_KEY_REFRESH_COMPLETE   0x30
>>> struct hci_ev_key_refresh_complete {
>>>      __u8    status;
>>> @@ -2305,13 +2327,18 @@ struct hci_ev_le_conn_complete {
>>> 
>>> #define HCI_EV_LE_ADVERTISING_REPORT  0x02
>>> struct hci_ev_le_advertising_info {
>>> -     __u8     evt_type;
>>> +     __u8     type;
>>>      __u8     bdaddr_type;
>>>      bdaddr_t bdaddr;
>>>      __u8     length;
>>>      __u8     data[];
>>> } __packed;
>>> 
>>> +struct hci_ev_le_advertising_report {
>>> +     __u8    num;
>>> +     struct hci_ev_le_advertising_info info[];
>>> +} __packed;
>>> +
>>> #define HCI_EV_LE_CONN_UPDATE_COMPLETE        0x03
>>> struct hci_ev_le_conn_update_complete {
>>>      __u8     status;
>>> @@ -2355,7 +2382,7 @@ struct hci_ev_le_data_len_change {
>>> 
>>> #define HCI_EV_LE_DIRECT_ADV_REPORT   0x0B
>>> struct hci_ev_le_direct_adv_info {
>>> -     __u8     evt_type;
>>> +     __u8     type;
>> 
>> these changes look unrelated. Prepare to send a prepare patch.
> 
> Yep, I might split the changes so I make each event into a separate
> patch since some changes require some changes in the struct (or just
> simplify the naming).
> 
>> 
>>>      __u8     bdaddr_type;
>>>      bdaddr_t bdaddr;
>>>      __u8     direct_addr_type;
>>> @@ -2363,6 +2390,11 @@ struct hci_ev_le_direct_adv_info {
>>>      __s8     rssi;
>>> } __packed;
>>> 
>>> +struct hci_ev_le_direct_adv_report {
>>> +     __u8     num;
>>> +     struct hci_ev_le_direct_adv_info info[];
>>> +} __packed;
>>> +
>>> #define HCI_EV_LE_PHY_UPDATE_COMPLETE 0x0c
>>> struct hci_ev_le_phy_update_complete {
>>>      __u8  status;
>>> @@ -2372,8 +2404,8 @@ struct hci_ev_le_phy_update_complete {
>>> } __packed;
>>> 
>>> #define HCI_EV_LE_EXT_ADV_REPORT    0x0d
>>> -struct hci_ev_le_ext_adv_report {
>>> -     __le16   evt_type;
>>> +struct hci_ev_le_ext_adv_info {
>>> +     __le16   type;
>>>      __u8     bdaddr_type;
>>>      bdaddr_t bdaddr;
>>>      __u8     primary_phy;
>>> @@ -2381,11 +2413,16 @@ struct hci_ev_le_ext_adv_report {
>>>      __u8     sid;
>>>      __u8     tx_power;
>>>      __s8     rssi;
>>> -     __le16   interval;
>>> -     __u8     direct_addr_type;
>>> +     __le16   interval;
>>> +     __u8     direct_addr_type;
>>>      bdaddr_t direct_addr;
>>> -     __u8     length;
>>> -     __u8     data[];
>>> +     __u8     length;
>>> +     __u8     data[];
>>> +} __packed;
>>> +
>>> +struct hci_ev_le_ext_adv_report {
>>> +     __u8     num;
>>> +     struct hci_ev_le_ext_adv_info info[];
>>> } __packed;
>>> 
>>> #define HCI_EV_LE_ENHANCED_CONN_COMPLETE    0x0a
>>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>>> index 5e99968939ce..db40358521fa 100644
>>> --- a/net/bluetooth/hci_event.c
>>> +++ b/net/bluetooth/hci_event.c
>>> @@ -45,9 +45,16 @@
>>> static void hci_cc_inquiry_cancel(struct hci_dev *hdev, struct sk_buff *skb,
>>>                                u8 *new_status)
>>> {
>>> -     __u8 status = *((__u8 *) skb->data);
>>> +     struct hci_ev_status *rp;
>>> 
>>> -     BT_DBG("%s status 0x%2.2x", hdev->name, status);
>>> +     rp = bt_skb_pull(skb, sizeof(*rp));
>>> +     if (!rp) {
>>> +             bt_dev_err(hdev, "Malformed Command Complete: 0x%4.4x",
>>> +                        HCI_OP_INQUIRY_CANCEL);
>>> +             return;
>>> +     }
>> 
>> So you are repeating this over and over again. The error needs to be part of bt_skb_pull and I would make bt_skb_pull static and local to hci_event.c.
> 
> Understood, would something like the following make sense:
> 
> static void *hci_ev_pull(skb, opcode, size)
> 
> The reason I had introduced bt_skb_pull as public function is that it
> may be convenient to parse packets in other protocols as well, but I
> guess it could be introduced later if we decide to expand this sort of
> logic to other protocols as well.

I would go with hci_ev_skb_pull() to make clear it operates on the skb.

Regards

Marcel

