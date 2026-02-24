Return-Path: <linux-bluetooth+bounces-19359-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KfQFd78nWmeSwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19359-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 20:32:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C593118C1A3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 20:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 706DD305AD45
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 19:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA5C2DF15C;
	Tue, 24 Feb 2026 19:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="LRlYf4nm"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478028505E
	for <linux-bluetooth@vger.kernel.org>; Tue, 24 Feb 2026 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771961559; cv=none; b=L9ZzLb6NMCdjW0VMk8oQPkD0m0vQr0wTV9wt0f2pXy/LA78ZcHVDWgzWrIF3pe9vPCdsZSCia1BosNtU+EpyITc4PKxGbIzd4Nbb/MmQBqcLq9bhvS44qAYXtj+HFSmYr7aqt2apzPWkgJBOAMH8mbF8qnpbiWcKiKjMJ5FJIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771961559; c=relaxed/simple;
	bh=1GyGBB6mK5tlYIpt7ezsrsbKjtBR259fuhLLE4di6jw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ZIFW6FkeLfCvRIbLPPwmoszYpbnauRSOSDx094a5lGH+hi2yDRVg2make7LzbqMzzI5lQab84pSFYKAd1zOnyi0vHUj4v4cOvV1gL4fyDHanMn8AelsfC555umfQSJFpipcWZKkauYmb4fHOBebqUC+ATIF/61j4ImVT08oEG9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=LRlYf4nm; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-13f4862.ac4-iad.github.net [10.52.181.50])
	by smtp.github.com (Postfix) with ESMTPA id 15076401245
	for <linux-bluetooth@vger.kernel.org>; Tue, 24 Feb 2026 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771961557;
	bh=az5+1we7ZTaIUpFSZs6HrSerjyVlHbOxk5N/HZrl5rM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=LRlYf4nmwXX1gCCoViz4MYjLGeHaUTHgjNGiWFXLzNxKu5qXUPQzgmHPAvqI4bykp
	 RKy8OJE/O4xmaeHrdHcbFMjMqUx8ODSrGBADuJyTPBI/93R/PRR/7kwtLLBhOP56ba
	 BJmrH+4qkoiwzGYPdnjYJ3oKQk+KUa6M3gfhrOuM=
Date: Tue, 24 Feb 2026 11:32:37 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1057371/000000-9bfb0b@github.com>
Subject: [bluez/bluez] 9bfb0b: shared/att: Simplify logic of DB out of sync
 recovery
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19359-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: C593118C1A3
X-Rspamd-Action: no action

  Branch: refs/heads/1057371
  Home:   https://github.com/bluez/bluez
  Commit: 9bfb0b7f42e0a368d568c1a836d8b15f8d86fe79
      https://github.com/bluez/bluez/commit/9bfb0b7f42e0a368d568c1a836d8b15f8d86fe79
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-24 (Tue, 24 Feb 2026)

  Changed paths:
    M src/shared/att.c

  Log Message:
  -----------
  shared/att: Simplify logic of DB out of sync recovery

This removes struct pending_db_sync since it is not really necessary
to record all the field in bt_att_pdu_error_rsp, most of them can be
directly recovered from the original request and the ecode is meant
to be only BT_ATT_ERROR_DB_OUT_OF_SYNC.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

