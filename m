Return-Path: <linux-bluetooth+bounces-10874-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C5A50C6D
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Mar 2025 21:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E70591890294
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Mar 2025 20:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B3725485B;
	Wed,  5 Mar 2025 20:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Yk5zm7h+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PVEaGF1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Lqnz94by";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dttRoax/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E717B50B
	for <linux-bluetooth@vger.kernel.org>; Wed,  5 Mar 2025 20:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741206347; cv=none; b=nUrM2UdztcYwvGzoQ6mMWc3UqtqBx3luP6RTqm+/x90Mx5KzD5RyvBoxxFRYL2aGcHLJtnr1zzBKa/XVX1E/xji1aAL/v2colYBTve+MHplOM+yfp4PaA9sBehV8fYnc0GmEhkR/95vNC0vAqd9u+JCrFe9ZOgA+OT60bfxsg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741206347; c=relaxed/simple;
	bh=joH7wBa56QInwUwV05VwW+Yd+CZDc30SdqbIEgUbbRE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=StLt68ODSkOUibPFbR9ZX9eDwHUHprXlQt1OcRsr71l1NRq/ZkrodRyj1yP+Geu/uoswa9YsaDp4oPXNgKRzObGOiUqqHTVePj7yfTqkN1bkbvNUARi3O5w470GZTP9T897DW3fE9QMija5UAfm7G1cwWTC+SFSgtcA2fZg5bTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Yk5zm7h+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PVEaGF1M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Lqnz94by; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dttRoax/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E4D1D211A0;
	Wed,  5 Mar 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741206343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFaCj5KyZaC78uyg6ohGmZZQ/AAQaTQCUrz63AtK6hQ=;
	b=Yk5zm7h+niQoQvA3wYkWXnz3HBmeOE6y0VtKbKLH9sKOG6+X+eO8e96MTSSvLuQSBIPAj0
	Eie8dLx5nj1T53I7W6ETMXvLHe4CM6hKSzmk0IMaFMmE3SAo/ZF8RYCPxahZkdBF1Py6bv
	IgIG3kjUh7mothcU0CeQcMJuaT//4E8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741206343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFaCj5KyZaC78uyg6ohGmZZQ/AAQaTQCUrz63AtK6hQ=;
	b=PVEaGF1MgeAzY6KIsJTNGy1zMSCt9yveCSL9qIaUkUTwzCHKSH9EvgXBfszLrLed+IRj4j
	uyTkrSwWFKZEYBCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741206341; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFaCj5KyZaC78uyg6ohGmZZQ/AAQaTQCUrz63AtK6hQ=;
	b=Lqnz94byAXf24AFTYSdGGfXBnYlbIeA+1sGGyUhlEnL+m3jiKSZ4AltPhpXgs0gB/kbunl
	QBkt/yjTITIxCAHOM00Z3HvbkZgn0m6oNuebSxO3OeUddTQaL84/Mq2+4AfYKqTVwyyDHJ
	+GEsYvybG1i7xcLjJ9GMZU1WdW0LNGw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741206341;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yFaCj5KyZaC78uyg6ohGmZZQ/AAQaTQCUrz63AtK6hQ=;
	b=dttRoax/RS7TffT9ISB/q6PdD0dmA8s23X6FyAFB5QRRBelnD6629MKUvC+0NFCyuZ+vXI
	64gA0RlQl5Z6E6CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCC7B1366F;
	Wed,  5 Mar 2025 20:25:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eBunLEWzyGeBQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 20:25:41 +0000
Date: Wed, 05 Mar 2025 21:25:41 +0100
Message-ID: <87jz93ql6i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org,
	Pauli Virtanen <pav@iki.fi>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v1] Revert "Bluetooth: hci_core: Fix sleeping function called from invalid context"
In-Reply-To: <CABBYNZLYp9MT1hNsvRBLdstGaXj54N5MVrdBU5L943vjLuqH2g@mail.gmail.com>
References: <20250304153934.112156-1-luiz.dentz@gmail.com>
	<CABBYNZLYp9MT1hNsvRBLdstGaXj54N5MVrdBU5L943vjLuqH2g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.79
X-Spamd-Result: default: False [-1.79 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.961];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 05 Mar 2025 20:50:54 +0100,
Luiz Augusto von Dentz wrote:
> 
> Hi Pauli, Takashi,
> 
> On Tue, Mar 4, 2025 at 10:39 AM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >
> > This reverts commit 4d94f05558271654670d18c26c912da0c1c15549 which has
> > problems (see [1]) and is no longer needed since 581dd2dc168f
> > ("Bluetooth: hci_event: Fix using rcu_read_(un)lock while iterating")
> > has reworked the code where the original bug has been found.
> >
> > [1] Link: https://lore.kernel.org/linux-bluetooth/877c55ci1r.wl-tiwai@suse.de/T/#t
> > Fixes: 4d94f0555827 ("Bluetooth: hci_core: Fix sleeping function called from invalid context")
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > ---
> >  include/net/bluetooth/hci_core.h | 108 +++++++++++--------------------
> >  net/bluetooth/hci_core.c         |  10 ++-
> >  net/bluetooth/iso.c              |   6 --
> >  net/bluetooth/l2cap_core.c       |  12 ++--
> >  net/bluetooth/rfcomm/core.c      |   6 --
> >  net/bluetooth/sco.c              |  12 ++--
> >  6 files changed, 57 insertions(+), 97 deletions(-)
> >
> > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> > index 2f320eeddfec..7966db4038cc 100644
> > --- a/include/net/bluetooth/hci_core.h
> > +++ b/include/net/bluetooth/hci_core.h
> > @@ -804,6 +804,7 @@ struct hci_conn_params {
> >  extern struct list_head hci_dev_list;
> >  extern struct list_head hci_cb_list;
> >  extern rwlock_t hci_dev_list_lock;
> > +extern struct mutex hci_cb_list_lock;
> >
> >  #define hci_dev_set_flag(hdev, nr)             set_bit((nr), (hdev)->dev_flags)
> >  #define hci_dev_clear_flag(hdev, nr)           clear_bit((nr), (hdev)->dev_flags)
> > @@ -2014,47 +2015,24 @@ struct hci_cb {
> >
> >         char *name;
> >
> > -       bool (*match)           (struct hci_conn *conn);
> >         void (*connect_cfm)     (struct hci_conn *conn, __u8 status);
> >         void (*disconn_cfm)     (struct hci_conn *conn, __u8 status);
> >         void (*security_cfm)    (struct hci_conn *conn, __u8 status,
> > -                                __u8 encrypt);
> > +                                                               __u8 encrypt);
> >         void (*key_change_cfm)  (struct hci_conn *conn, __u8 status);
> >         void (*role_switch_cfm) (struct hci_conn *conn, __u8 status, __u8 role);
> >  };
> >
> > -static inline void hci_cb_lookup(struct hci_conn *conn, struct list_head *list)
> > -{
> > -       struct hci_cb *cb, *cpy;
> > -
> > -       rcu_read_lock();
> > -       list_for_each_entry_rcu(cb, &hci_cb_list, list) {
> > -               if (cb->match && cb->match(conn)) {
> > -                       cpy = kmalloc(sizeof(*cpy), GFP_ATOMIC);
> > -                       if (!cpy)
> > -                               break;
> > -
> > -                       *cpy = *cb;
> > -                       INIT_LIST_HEAD(&cpy->list);
> > -                       list_add_rcu(&cpy->list, list);
> > -               }
> > -       }
> > -       rcu_read_unlock();
> > -}
> > -
> >  static inline void hci_connect_cfm(struct hci_conn *conn, __u8 status)
> >  {
> > -       struct list_head list;
> > -       struct hci_cb *cb, *tmp;
> > +       struct hci_cb *cb;
> >
> > -       INIT_LIST_HEAD(&list);
> > -       hci_cb_lookup(conn, &list);
> > -
> > -       list_for_each_entry_safe(cb, tmp, &list, list) {
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> >                 if (cb->connect_cfm)
> >                         cb->connect_cfm(conn, status);
> > -               kfree(cb);
> >         }
> > +       mutex_unlock(&hci_cb_list_lock);
> >
> >         if (conn->connect_cfm_cb)
> >                 conn->connect_cfm_cb(conn, status);
> > @@ -2062,43 +2040,22 @@ static inline void hci_connect_cfm(struct hci_conn *conn, __u8 status)
> >
> >  static inline void hci_disconn_cfm(struct hci_conn *conn, __u8 reason)
> >  {
> > -       struct list_head list;
> > -       struct hci_cb *cb, *tmp;
> > +       struct hci_cb *cb;
> >
> > -       INIT_LIST_HEAD(&list);
> > -       hci_cb_lookup(conn, &list);
> > -
> > -       list_for_each_entry_safe(cb, tmp, &list, list) {
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> >                 if (cb->disconn_cfm)
> >                         cb->disconn_cfm(conn, reason);
> > -               kfree(cb);
> >         }
> > +       mutex_unlock(&hci_cb_list_lock);
> >
> >         if (conn->disconn_cfm_cb)
> >                 conn->disconn_cfm_cb(conn, reason);
> >  }
> >
> > -static inline void hci_security_cfm(struct hci_conn *conn, __u8 status,
> > -                                   __u8 encrypt)
> > -{
> > -       struct list_head list;
> > -       struct hci_cb *cb, *tmp;
> > -
> > -       INIT_LIST_HEAD(&list);
> > -       hci_cb_lookup(conn, &list);
> > -
> > -       list_for_each_entry_safe(cb, tmp, &list, list) {
> > -               if (cb->security_cfm)
> > -                       cb->security_cfm(conn, status, encrypt);
> > -               kfree(cb);
> > -       }
> > -
> > -       if (conn->security_cfm_cb)
> > -               conn->security_cfm_cb(conn, status);
> > -}
> > -
> >  static inline void hci_auth_cfm(struct hci_conn *conn, __u8 status)
> >  {
> > +       struct hci_cb *cb;
> >         __u8 encrypt;
> >
> >         if (test_bit(HCI_CONN_ENCRYPT_PEND, &conn->flags))
> > @@ -2106,11 +2063,20 @@ static inline void hci_auth_cfm(struct hci_conn *conn, __u8 status)
> >
> >         encrypt = test_bit(HCI_CONN_ENCRYPT, &conn->flags) ? 0x01 : 0x00;
> >
> > -       hci_security_cfm(conn, status, encrypt);
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> > +               if (cb->security_cfm)
> > +                       cb->security_cfm(conn, status, encrypt);
> > +       }
> > +       mutex_unlock(&hci_cb_list_lock);
> > +
> > +       if (conn->security_cfm_cb)
> > +               conn->security_cfm_cb(conn, status);
> >  }
> >
> >  static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
> >  {
> > +       struct hci_cb *cb;
> >         __u8 encrypt;
> >
> >         if (conn->state == BT_CONFIG) {
> > @@ -2137,38 +2103,40 @@ static inline void hci_encrypt_cfm(struct hci_conn *conn, __u8 status)
> >                         conn->sec_level = conn->pending_sec_level;
> >         }
> >
> > -       hci_security_cfm(conn, status, encrypt);
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> > +               if (cb->security_cfm)
> > +                       cb->security_cfm(conn, status, encrypt);
> > +       }
> > +       mutex_unlock(&hci_cb_list_lock);
> > +
> > +       if (conn->security_cfm_cb)
> > +               conn->security_cfm_cb(conn, status);
> >  }
> >
> >  static inline void hci_key_change_cfm(struct hci_conn *conn, __u8 status)
> >  {
> > -       struct list_head list;
> > -       struct hci_cb *cb, *tmp;
> > +       struct hci_cb *cb;
> >
> > -       INIT_LIST_HEAD(&list);
> > -       hci_cb_lookup(conn, &list);
> > -
> > -       list_for_each_entry_safe(cb, tmp, &list, list) {
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> >                 if (cb->key_change_cfm)
> >                         cb->key_change_cfm(conn, status);
> > -               kfree(cb);
> >         }
> > +       mutex_unlock(&hci_cb_list_lock);
> >  }
> >
> >  static inline void hci_role_switch_cfm(struct hci_conn *conn, __u8 status,
> >                                                                 __u8 role)
> >  {
> > -       struct list_head list;
> > -       struct hci_cb *cb, *tmp;
> > +       struct hci_cb *cb;
> >
> > -       INIT_LIST_HEAD(&list);
> > -       hci_cb_lookup(conn, &list);
> > -
> > -       list_for_each_entry_safe(cb, tmp, &list, list) {
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_for_each_entry(cb, &hci_cb_list, list) {
> >                 if (cb->role_switch_cfm)
> >                         cb->role_switch_cfm(conn, status, role);
> > -               kfree(cb);
> >         }
> > +       mutex_unlock(&hci_cb_list_lock);
> >  }
> >
> >  static inline bool hci_bdaddr_is_rpa(bdaddr_t *bdaddr, u8 addr_type)
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index e7ec12437c8b..012fc107901a 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -57,6 +57,7 @@ DEFINE_RWLOCK(hci_dev_list_lock);
> >
> >  /* HCI callback list */
> >  LIST_HEAD(hci_cb_list);
> > +DEFINE_MUTEX(hci_cb_list_lock);
> >
> >  /* HCI ID Numbering */
> >  static DEFINE_IDA(hci_index_ida);
> > @@ -2972,7 +2973,9 @@ int hci_register_cb(struct hci_cb *cb)
> >  {
> >         BT_DBG("%p name %s", cb, cb->name);
> >
> > -       list_add_tail_rcu(&cb->list, &hci_cb_list);
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_add_tail(&cb->list, &hci_cb_list);
> > +       mutex_unlock(&hci_cb_list_lock);
> >
> >         return 0;
> >  }
> > @@ -2982,8 +2985,9 @@ int hci_unregister_cb(struct hci_cb *cb)
> >  {
> >         BT_DBG("%p name %s", cb, cb->name);
> >
> > -       list_del_rcu(&cb->list);
> > -       synchronize_rcu();
> > +       mutex_lock(&hci_cb_list_lock);
> > +       list_del(&cb->list);
> > +       mutex_unlock(&hci_cb_list_lock);
> >
> >         return 0;
> >  }
> > diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
> > index 44acddf58a0c..0cb52a3308ba 100644
> > --- a/net/bluetooth/iso.c
> > +++ b/net/bluetooth/iso.c
> > @@ -2187,11 +2187,6 @@ int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
> >         return HCI_LM_ACCEPT;
> >  }
> >
> > -static bool iso_match(struct hci_conn *hcon)
> > -{
> > -       return hcon->type == ISO_LINK || hcon->type == LE_LINK;
> > -}
> > -
> >  static void iso_connect_cfm(struct hci_conn *hcon, __u8 status)
> >  {
> >         if (hcon->type != ISO_LINK) {
> > @@ -2373,7 +2368,6 @@ void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
> >
> >  static struct hci_cb iso_cb = {
> >         .name           = "ISO",
> > -       .match          = iso_match,
> >         .connect_cfm    = iso_connect_cfm,
> >         .disconn_cfm    = iso_disconn_cfm,
> >  };
> > diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> > index d21267261a5e..7b4adab353cf 100644
> > --- a/net/bluetooth/l2cap_core.c
> > +++ b/net/bluetooth/l2cap_core.c
> > @@ -7182,11 +7182,6 @@ static struct l2cap_chan *l2cap_global_fixed_chan(struct l2cap_chan *c,
> >         return NULL;
> >  }
> >
> > -static bool l2cap_match(struct hci_conn *hcon)
> > -{
> > -       return hcon->type == ACL_LINK || hcon->type == LE_LINK;
> > -}
> > -
> >  static void l2cap_connect_cfm(struct hci_conn *hcon, u8 status)
> >  {
> >         struct hci_dev *hdev = hcon->hdev;
> > @@ -7194,6 +7189,9 @@ static void l2cap_connect_cfm(struct hci_conn *hcon, u8 status)
> >         struct l2cap_chan *pchan;
> >         u8 dst_type;
> >
> > +       if (hcon->type != ACL_LINK && hcon->type != LE_LINK)
> > +               return;
> > +
> >         BT_DBG("hcon %p bdaddr %pMR status %d", hcon, &hcon->dst, status);
> >
> >         if (status) {
> > @@ -7258,6 +7256,9 @@ int l2cap_disconn_ind(struct hci_conn *hcon)
> >
> >  static void l2cap_disconn_cfm(struct hci_conn *hcon, u8 reason)
> >  {
> > +       if (hcon->type != ACL_LINK && hcon->type != LE_LINK)
> > +               return;
> > +
> >         BT_DBG("hcon %p reason %d", hcon, reason);
> >
> >         l2cap_conn_del(hcon, bt_to_errno(reason));
> > @@ -7565,7 +7566,6 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
> >
> >  static struct hci_cb l2cap_cb = {
> >         .name           = "L2CAP",
> > -       .match          = l2cap_match,
> >         .connect_cfm    = l2cap_connect_cfm,
> >         .disconn_cfm    = l2cap_disconn_cfm,
> >         .security_cfm   = l2cap_security_cfm,
> > diff --git a/net/bluetooth/rfcomm/core.c b/net/bluetooth/rfcomm/core.c
> > index 4c56ca5a216c..ad5177e3a69b 100644
> > --- a/net/bluetooth/rfcomm/core.c
> > +++ b/net/bluetooth/rfcomm/core.c
> > @@ -2134,11 +2134,6 @@ static int rfcomm_run(void *unused)
> >         return 0;
> >  }
> >
> > -static bool rfcomm_match(struct hci_conn *hcon)
> > -{
> > -       return hcon->type == ACL_LINK;
> > -}
> > -
> >  static void rfcomm_security_cfm(struct hci_conn *conn, u8 status, u8 encrypt)
> >  {
> >         struct rfcomm_session *s;
> > @@ -2185,7 +2180,6 @@ static void rfcomm_security_cfm(struct hci_conn *conn, u8 status, u8 encrypt)
> >
> >  static struct hci_cb rfcomm_cb = {
> >         .name           = "RFCOMM",
> > -       .match          = rfcomm_match,
> >         .security_cfm   = rfcomm_security_cfm
> >  };
> >
> > diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> > index ed6846864ea9..5d1bc0d6aee0 100644
> > --- a/net/bluetooth/sco.c
> > +++ b/net/bluetooth/sco.c
> > @@ -1407,13 +1407,11 @@ int sco_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
> >         return lm;
> >  }
> >
> > -static bool sco_match(struct hci_conn *hcon)
> > -{
> > -       return hcon->type == SCO_LINK || hcon->type == ESCO_LINK;
> > -}
> > -
> >  static void sco_connect_cfm(struct hci_conn *hcon, __u8 status)
> >  {
> > +       if (hcon->type != SCO_LINK && hcon->type != ESCO_LINK)
> > +               return;
> > +
> >         BT_DBG("hcon %p bdaddr %pMR status %u", hcon, &hcon->dst, status);
> >
> >         if (!status) {
> > @@ -1430,6 +1428,9 @@ static void sco_connect_cfm(struct hci_conn *hcon, __u8 status)
> >
> >  static void sco_disconn_cfm(struct hci_conn *hcon, __u8 reason)
> >  {
> > +       if (hcon->type != SCO_LINK && hcon->type != ESCO_LINK)
> > +               return;
> > +
> >         BT_DBG("hcon %p reason %d", hcon, reason);
> >
> >         sco_conn_del(hcon, bt_to_errno(reason));
> > @@ -1455,7 +1456,6 @@ void sco_recv_scodata(struct hci_conn *hcon, struct sk_buff *skb)
> >
> >  static struct hci_cb sco_cb = {
> >         .name           = "SCO",
> > -       .match          = sco_match,
> >         .connect_cfm    = sco_connect_cfm,
> >         .disconn_cfm    = sco_disconn_cfm,
> >  };
> > --
> > 2.48.1
> >
> 
> Are you guys ok if I push this?

Yes, thanks!


Takashi

