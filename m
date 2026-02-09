Return-Path: <linux-bluetooth+bounces-18882-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBr8NIvgiWnGCwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18882-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 14:26:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 198FF10FA9D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 14:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 285B2300443B
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 13:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBE9372B5B;
	Mon,  9 Feb 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="XhCFnuZN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F6125A0
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770643591; cv=none; b=H+QlMXQUxpiNsuBEotLwG4wfavrxGd1lS5Bd3CZ9vXCZscwAey/xvQK/ySiUMZ/1gtEpEnkngC8KXtQ25sRQgbhqF3vUCDMPAxNoNqp9VAA73RFQ0p6LZjr+WhQTEb9JCvCNxjbKcZTOWYH4LWX1IzJsB/yShhXYngtr6MsiZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770643591; c=relaxed/simple;
	bh=wmsdEgOnROu2CtuYYUwAcj+VSBj48p+Y4CiHly5Xt+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0Bhu1suGXqFKogM292A4xIQXA3WfxILisL2wClNizqUkPb0aknlj3nTnptAUFlcLP5rDnXXuyatSO7Bn50UNtwsj9QdC7zImf7DOKNsivlbIP9aw7G6LVBRqIxnXx5ycOJ3WTLIb/KDncARfvixrRwtz+T9v+v9IhSuMyXsR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=XhCFnuZN; arc=none smtp.client-ip=202.108.3.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1770643590;
	bh=7xdMeIMLp5QRX/x7oHbQrqds5PqEfD/OdXvxKy/2riE=;
	h=From:Subject:Date:Message-ID;
	b=XhCFnuZNR8ZA5rmYSyI8EHsiqLSIBKwAbyni10T++UXcvyVEATkRMDECHZOzxfasU
	 iquw6xIpaEL2wa1sR6n3eYCSz3hBqLCUBKK+CPVodJ37Osu8E+rDjhYvH22FWDiHeE
	 phrmp+mw/hz/khdlFkDwl+oV7xWWjYxYRkBZZK4w=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.34) with ESMTP
	id 6989E0570000299E; Mon, 9 Feb 2026 21:25:44 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9849856291932
X-SMAIL-UIID: 4C00404A582A40DA8FEAAC4AA80A5B5A-20260209-212544-1
From: Hillf Danton <hdanton@sina.com>
To: Masahiro Kawada <youjingxiaogao2@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	linux-kernel@vger.kernel.org,
	syzbot+3609b9b48e68e1fe47fd@syzkaller.appspotmail.com
Subject: Re: [PATCH] Bluetooth: fix use-after-free in hci_conn_drop
Date: Mon,  9 Feb 2026 21:25:33 +0800
Message-ID: <20260209132535.2716-1-hdanton@sina.com>
In-Reply-To: <20260209100211.36533-1-youjingxiaogao2@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18882-lists,linux-bluetooth=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,holtmann.org,syzkaller.appspotmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sina.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth,3609b9b48e68e1fe47fd];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Queue-Id: 198FF10FA9D
X-Rspamd-Action: no action

On Mon,  9 Feb 2026 19:02:11 +0900 Masahiro Kawada wrote:
> Fix a use-after-free in hci_conn_drop triggered via hci_cmd_sync_work.
> 
> In hci_conn_del(), hci_cmd_sync_dequeue() is called after
> hci_conn_cleanup() which may have already freed the conn pointer.
> Fix by moving the dequeue before cleanup.
> 
> Additionally, le_read_features_complete() calls hci_conn_drop(conn)
> without checking whether conn is still valid. When
> hci_le_read_remote_features_sync() blocks waiting for an HCI event,
> another thread can free conn through hci_conn_del(). Fix by adding
> a hci_conn_valid() check before calling hci_conn_drop().
> 
> Fixes: 881559af5f5c ("Bluetooth: hci_sync: Attempt to dequeue connection attempt")
> Fixes: a106e50be74b ("Bluetooth: HCI: Add support for LL Extended Feature Set")
> Reported-by: syzbot+3609b9b48e68e1fe47fd@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3609b9b48e68e1fe47fd
> Tested-by: syzbot+3609b9b48e68e1fe47fd@syzkaller.appspotmail.com
> Signed-off-by: Masahiro Kawada <youjingxiaogao2@gmail.com>
> ---
>  net/bluetooth/hci_conn.c | 6 +++---
>  net/bluetooth/hci_sync.c | 3 +++
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 0795818963a..aa3607327ad 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -1232,15 +1232,15 @@ void hci_conn_del(struct hci_conn *conn)
>  	skb_queue_purge(&conn->data_q);
>  	skb_queue_purge(&conn->tx_q.queue);
>  
> +	/* Dequeue callbacks using connection pointer as data */
> +	hci_cmd_sync_dequeue(hdev, NULL, conn, NULL);
> +
>  	/* Remove the connection from the list and cleanup its remaining
>  	 * state. This is a separate function since for some cases like
>  	 * BT_CONNECT_SCAN we *only* want the cleanup part without the
>  	 * rest of hci_conn_del.
>  	 */
>  	hci_conn_cleanup(conn);
> -
> -	/* Dequeue callbacks using connection pointer as data */
> -	hci_cmd_sync_dequeue(hdev, NULL, conn, NULL);
>  }
>  
>  struct hci_dev *hci_get_route(bdaddr_t *dst, bdaddr_t *src, uint8_t src_type)
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index f04a90bce4a..f31086c187f 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -7371,6 +7371,9 @@ static void le_read_features_complete(struct hci_dev *hdev, void *data, int err)
>  	if (err == -ECANCELED)
>  		return;
>  
> +	if (!hci_conn_valid(hdev, conn))
> +		return;
> +
>  	hci_conn_drop(conn);
>  }
>  
> -- 
> 2.43.0
>
The uaf [1] is due to the following race,

	cpu1				cpu2
	hci_cmd_sync_work()		hci_rx_work()
	mutex_lock(&hdev->cmd_sync_work_lock);
	entry = list_first_entry_or_null(&hdev->cmd_sync_work_list,
					 struct hci_cmd_sync_work_entry,
					 list);
	if (entry)
		list_del(&entry->list);
	mutex_unlock(&hdev->cmd_sync_work_lock);

					hci_conn_del()
					hci_conn_hash_del(hdev, conn);
					hci_conn_cleanup(conn)	// free conn
					hci_cmd_sync_dequeue()
					mutex_lock(&hdev->cmd_sync_work_lock);
					while ((entry = _hci_cmd_sync_lookup_entry(hdev, func, data,
						   destroy))) {
						_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
						ret = true;
					}
					mutex_unlock(&hdev->cmd_sync_work_lock);

	hci_req_sync_lock(hdev);
	err = entry->func(hdev, entry->data);
	if (entry->destroy)
		entry->destroy(hdev, entry->data, err);
		hci_conn_drop(conn)	// uaf
	hci_req_sync_unlock(hdev);

but the race still exists after this patch.

	cpu1				cpu2
	hci_conn_valid(hdev, conn)
					hci_conn_hash_del(hdev, conn);
					hci_cmd_sync_dequeue()
					hci_conn_cleanup(conn)	// free conn
	hci_conn_drop(conn); // uaf

[1] Subject: [syzbot] [bluetooth?] KASAN: slab-use-after-free Write in hci_conn_drop (3)
https://lore.kernel.org/lkml/69301edd.a70a0220.2ea503.00cf.GAE@google.com/

