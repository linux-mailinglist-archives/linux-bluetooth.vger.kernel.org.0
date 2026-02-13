Return-Path: <linux-bluetooth+bounces-19023-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEIHD1pZj2lxQgEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19023-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 18:03:22 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFB13876F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 18:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B96C1303CB7C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 17:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AAB364E9D;
	Fri, 13 Feb 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="SsOjcyNB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691B27EFEE
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002174; cv=none; b=YOXzzb3sADck0OINRDWVaxWtrVUbCTdlDZPLnh7WEtaUdbkv+EdpAHPvIDEbJwvI7+3jFWxc65ND4so4ubvoKQlFjPIdgYqdk2f9vtkvyN647FYT4TtePfaqbn0qPw2kd4m3WCssXOu+YsNDSkOSfJWhZhQ4yYQOnqnnu7wr3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002174; c=relaxed/simple;
	bh=r9ug3D2OFVW9umuu1+MFZ3kabLC54EP0DrP8aL3PyJE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=CGyJiNOdtFxWu8o0H683EjnP5mzdCnzT02mwIt+SStZXZVCbsp7mzv/9mQL/8W9iU/F4iRVvsGL+chawEFPiwTJXMg8NAIzR8mE7hql+U94Q1YlQyR3CdKCFu6e1FTFc+Ewllwrx6M1e9Fk6JWUixc1fv367vA0ensw+yyHAT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=SsOjcyNB; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fde30bd.ash1-iad.github.net [10.56.201.93])
	by smtp.github.com (Postfix) with ESMTPA id 4779B141281
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771002172;
	bh=T51X6XQmlstqSnYiMqZGpr/X+B38srygc/KhU98WBs8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=SsOjcyNB21Zvs4CmkhmFi9j3fudyn+mww1Fetawm3D5wpPKGm+/hntYGPzi/BWR2l
	 gr19Wrsk3B038cU5CmozhhEFZGiq9gbavNiMWD6hK6Zc+4v31v4T0jAIw0tNuyDaVx
	 NmKycZR43TVzRqxnsMLQNffRdR5xyVFEDMYfADCg=
Date: Fri, 13 Feb 2026 09:02:52 -0800
From: Sarveshwar Bajaj <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1053982/000000-11f128@github.com>
Subject: [bluez/bluez] 11f128: bap: Fix use-after-free in broadcast sink
 cleanup
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-19023-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[github.com:-];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7EDFB13876F
X-Rspamd-Action: no action

  Branch: refs/heads/1053982
  Home:   https://github.com/bluez/bluez
  Commit: 11f12809eda49e6ffb36de106b61c1d0e8eae87e
      https://github.com/bluez/bluez/commit/11f12809eda49e6ffb36de106b61c1d0e8eae87e
  Author: Sarveshwar Bajaj <sarveshwar.bajaj@nxp.com>
  Date:   2026-02-13 (Fri, 13 Feb 2026)

  Changed paths:
    M profiles/audio/bap.c

  Log Message:
  -----------
  bap: Fix use-after-free in broadcast sink cleanup

bap_data_free() was calling bt_bap_detach() before destroying
bcast_snks queue. bt_bap_detach() frees all streams but broadcast
sink setups in bcast_snks queue were still holding pointers to these
streams. When queue_destroy() calls setup_free() as its destructor,
it attempts to access these already-freed stream pointers, causing
a use-after-free.

Fix this by destroying the bcast_snks queue before calling
bt_bap_detach() and ensuring stream references are released while the
streams are still valid. This matches the cleanup order already used
for unicast.

Crash trace:
  AddressSanitizer: heap-use-after-free
  #0 bt_bap_stream_unlock src/shared/bap.c:6384
  #1 setup_free profiles/audio/bap.c:1123
  #2 queue_destroy src/shared/queue.c:60
  #3 bap_data_free profiles/audio/bap.c:210

https://github.com/bluez/bluez/issues/1866



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

