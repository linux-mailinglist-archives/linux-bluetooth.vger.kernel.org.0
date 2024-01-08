Return-Path: <linux-bluetooth+bounces-965-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AA8277F9
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jan 2024 19:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5EB11C22BB0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jan 2024 18:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A6654F8F;
	Mon,  8 Jan 2024 18:55:35 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6B054BED;
	Mon,  8 Jan 2024 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=v0yd.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=v0yd.nl
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4T83D06Bdgz9tQy;
	Mon,  8 Jan 2024 19:55:28 +0100 (CET)
Message-ID: <40550fc1-3b5b-438c-891d-2da0f30874f3@v0yd.nl>
Date: Mon, 8 Jan 2024 19:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/4] Bluetooth: Remove pending ACL connection attempts
Content-Language: en-US
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, verdre@v0yd.nl
References: <20240108183938.468426-1-verdre@v0yd.nl>
 <20240108183938.468426-5-verdre@v0yd.nl>
 <5d1f2013-5758-4d6c-8d01-e96a76bb2686@v0yd.nl>
From: =?UTF-8?Q?Jonas_Dre=C3=9Fler?= <verdre@v0yd.nl>
In-Reply-To: <5d1f2013-5758-4d6c-8d01-e96a76bb2686@v0yd.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/8/24 19:44, Jonas Dreßler wrote:
> On 1/8/24 19:39, Jonas Dreßler wrote:
>> With the last commit we moved to using the hci_sync queue for "Create
>> Connection" requests, removing the need for retrying the paging after
>> finished/failed "Create Connection" requests and after the end of
>> inquiries.
>>
>> hci_conn_check_pending() was used to trigger this retry, we can remove it
>> now.
>>
>> Note that we can also remove the special handling for COMMAND_DISALLOWED
>> errors in the completion handler of "Create Connection", because "Create
>> Connection" requests are now always serialized.
>>
>> This is somewhat reverting commit 4c67bc74f016 ("[Bluetooth] Support
>> concurrent connect requests").
>>
>> With this, the BT_CONNECT2 state of ACL hci_conn objects should now be
>> back to meaning only one thing: That we received a connection request
>> from another device (see hci_conn_request_evt), but the actual connect
>> should be deferred.
>> ---
>>   include/net/bluetooth/hci_core.h |  1 -
>>   net/bluetooth/hci_conn.c         | 16 ----------------
>>   net/bluetooth/hci_event.c        | 21 ++++-----------------
>>   3 files changed, 4 insertions(+), 34 deletions(-)
>>
>> diff --git a/include/net/bluetooth/hci_core.h 
>> b/include/net/bluetooth/hci_core.h
>> index 2c30834c1..d7483958d 100644
>> --- a/include/net/bluetooth/hci_core.h
>> +++ b/include/net/bluetooth/hci_core.h
>> @@ -1330,7 +1330,6 @@ struct hci_conn *hci_conn_add(struct hci_dev 
>> *hdev, int type, bdaddr_t *dst,
>>                     u8 role);
>>   void hci_conn_del(struct hci_conn *conn);
>>   void hci_conn_hash_flush(struct hci_dev *hdev);
>> -void hci_conn_check_pending(struct hci_dev *hdev);
>>   struct hci_chan *hci_chan_create(struct hci_conn *conn);
>>   void hci_chan_del(struct hci_chan *chan);
>> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
>> index 541d55301..22033057b 100644
>> --- a/net/bluetooth/hci_conn.c
>> +++ b/net/bluetooth/hci_conn.c
>> @@ -2534,22 +2534,6 @@ void hci_conn_hash_flush(struct hci_dev *hdev)
>>       }
>>   }
>> -/* Check pending connect attempts */
>> -void hci_conn_check_pending(struct hci_dev *hdev)
>> -{
>> -    struct hci_conn *conn;
>> -
>> -    BT_DBG("hdev %s", hdev->name);
>> -
>> -    hci_dev_lock(hdev);
>> -
>> -    conn = hci_conn_hash_lookup_state(hdev, ACL_LINK, BT_CONNECT2);
>> -    if (conn)
>> -        hci_cmd_sync_queue(hdev, hci_acl_create_connection_sync, 
>> conn, NULL);
>> -
>> -    hci_dev_unlock(hdev);
>> -}
>> -
>>   static u32 get_link_mode(struct hci_conn *conn)
>>   {
>>       u32 link_mode = 0;
>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>> index e8b4a0126..91973d6d1 100644
>> --- a/net/bluetooth/hci_event.c
>> +++ b/net/bluetooth/hci_event.c
>> @@ -117,8 +117,6 @@ static u8 hci_cc_inquiry_cancel(struct hci_dev 
>> *hdev, void *data,
>>           hci_discovery_set_state(hdev, DISCOVERY_STOPPED);
>>       hci_dev_unlock(hdev);
>> -    hci_conn_check_pending(hdev);
>> -
>>       return rp->status;
>>   }
>> @@ -149,8 +147,6 @@ static u8 hci_cc_exit_periodic_inq(struct hci_dev 
>> *hdev, void *data,
>>       hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);
>> -    hci_conn_check_pending(hdev);
>> -
>>       return rp->status;
>>   }
>> @@ -2296,10 +2292,8 @@ static void hci_cs_inquiry(struct hci_dev 
>> *hdev, __u8 status)
>>   {
>>       bt_dev_dbg(hdev, "status 0x%2.2x", status);
>> -    if (status) {
>> -        hci_conn_check_pending(hdev);
>> +    if (status)
>>           return;
>> -    }
>>       set_bit(HCI_INQUIRY, &hdev->flags);
>>   }
>> @@ -2323,12 +2317,9 @@ static void hci_cs_create_conn(struct hci_dev 
>> *hdev, __u8 status)
>>       if (status) {
>>           if (conn && conn->state == BT_CONNECT) {
>> -            if (status != HCI_ERROR_COMMAND_DISALLOWED || 
>> conn->attempt > 2) {
>> -                conn->state = BT_CLOSED;
>> -                hci_connect_cfm(conn, status);
>> -                hci_conn_del(conn);
>> -            } else
>> -                conn->state = BT_CONNECT2;
>> +            conn->state = BT_CLOSED;
>> +            hci_connect_cfm(conn, status);
>> +            hci_conn_del(conn);
>>           }
>>       } else {
>>           if (!conn) {
>> @@ -3020,8 +3011,6 @@ static void hci_inquiry_complete_evt(struct 
>> hci_dev *hdev, void *data,
>>       bt_dev_dbg(hdev, "status 0x%2.2x", ev->status);
>> -    hci_conn_check_pending(hdev);
>> -
>>       if (!test_and_clear_bit(HCI_INQUIRY, &hdev->flags))
>>           return;
>> @@ -3247,8 +3236,6 @@ static void hci_conn_complete_evt(struct hci_dev 
>> *hdev, void *data,
>>   unlock:
>>       hci_dev_unlock(hdev);
>> -
>> -    hci_conn_check_pending(hdev);
>>   }
>>   static void hci_reject_conn(struct hci_dev *hdev, bdaddr_t *bdaddr)
> 
> Please take a special look at this one: I'm not sure if I'm breaking the 
> functionality of deferred connecting using BT_CONNECT2 in 
> hci_conn_request_evt() here, as I don't see anywhere where we check for 
> this state and establish a connection later.
> 
> It seems that this is how hci_conn_request_evt() was initially written 
> though, hci_conn_check_pending() only got introduced later and seems 
> unrelated.

Ahh nevermind... The check for BT_CONNECT2 on "Conn Complete event" got 
introduced with 4c67bc74f01 ([Bluetooth] Support concurrent connect 
requests). And later the deferred connection setup on "Conn Request 
event" got introduced with 20714bfef8 ("Bluetooth: Implement deferred 
sco socket setup").

I assume the latter commit was relying on the "Create Connection" 
request "Conn Complete event" that got introduced with the former commit 
then? That would imply that we use BT_CONNECT2 if there's already a 
"Create Connection" going on when the "Conn Request event" happens, and 
we must wait for that existing request to finish.. Is that how those 
deferred connections are supposed to work?

> 
> Thanks,
> Jonas

