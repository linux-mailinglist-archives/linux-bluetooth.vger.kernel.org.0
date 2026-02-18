Return-Path: <linux-bluetooth+bounces-19136-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e1QLDRsolWkfMQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19136-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 03:46:51 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53723152BA2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 03:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CB6C3027964
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 02:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5B12DC352;
	Wed, 18 Feb 2026 02:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b="J/g49o9O"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3D35966
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 02:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382802; cv=none; b=d3x2g0pan3W77q+WzCWnlSOrv5JWIG7z+fGI96qiKMTn4RWSM5wIvlSo71ykiAgiON3TjRxwz+JlCtfz6OMnmQtegp1zV3B7ItoLizsUnXht5fQ5N5IY3ufKL3blKmnG8CAgzeoKI0FVf2NxaD9lvami6VHm8DgC+jloNyKb/Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382802; c=relaxed/simple;
	bh=WK4avjGl1XEI46lBrG/VraGL4nl//x8Ai0b3HHS4T1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=risamsOfXUjsZsAPRlNSde9lHNWmQ+3JQUsCEgzSYvfRArn+gTP5nF02swIKiV5XZHXm7LQcIKzXhtbLUuz92pgEL/MV7kJCtl79KEQZ1+w7r7vc2HyErq51Gui6J85h4WgPvkcs+xcDvnSb2l62Ccj5lIbIMoZSk0wrMrLVFpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie; spf=pass smtp.mailfrom=rjp.ie; dkim=pass (1024-bit key) header.d=rjp.ie header.i=@rjp.ie header.b=J/g49o9O; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rjp.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rjp.ie
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rjp.ie; s=key1;
	t=1771382798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nI4faPd2ZlM3MNNcx4921MgeUBOXEQV0/tzgJpoNbHM=;
	b=J/g49o9OiE8FZvauztiu0H+YXlHjF0OlRrwasVBRNrLBBc7AuYgVuRworllTljQjEO0btH
	PfeGQrKzcFaLrs26trSxR+DZ1veRSV0/w9Gi64shUuOvIZBh3OaNXAZdH8OdMlZWcMNpqb
	bX5ouTIaLwY1T5kECWJZo1AHFNhWHfA=
From: Ronan Pigott <ronan@rjp.ie>
To: linux-bluetooth@vger.kernel.org
Cc: Ronan Pigott <ronan@rjp.ie>
Subject: [PATCH BlueZ 0/2] shared: recover from failed input initialization
Date: Tue, 17 Feb 2026 19:32:58 -0700
Message-ID: <20260218024605.70890-1-ronan@rjp.ie>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rjp.ie,quarantine];
	R_DKIM_ALLOW(-0.20)[rjp.ie:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19136-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ronan@rjp.ie,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rjp.ie:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rjp.ie:mid,rjp.ie:dkim]
X-Rspamd-Queue-Id: 53723152BA2
X-Rspamd-Action: no action

This fixes an issue where bluetoothctl stopped printing values outside
of the shell. I reported this in [1] and bisected the error to commit
e73bf582dae60356641a32fc27ae03d359ec4c47.

My motivation is to keep the zsh completions functional, so I have also
included a few small fixes for the zsh completions.

I saw that another patch was submitted which unfortunately is not a
satisfactory resolution, since it causes bluetoothctl to print all the
extraneous lines present in the interactive session for non-interactive
sessions as well. So I have submitted this suggestion instead.

[1] https://github.com/bluez/bluez/issues/1896

Ronan Pigott (2):
  zsh: amend completions
  shared/shell: gracefully recover from failed input initialization

 completion/zsh/_bluetoothctl | 133 ++++++++++++++++-------------------
 src/shared/shell.c           |  23 ++++--
 2 files changed, 79 insertions(+), 77 deletions(-)

-- 
2.53.0


