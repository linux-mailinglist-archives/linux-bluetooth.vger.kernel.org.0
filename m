Return-Path: <linux-bluetooth+bounces-19032-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLA0CUJ8j2m+RAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19032-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:32:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D81393AA
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 883423020FC0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 19:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA89F1DF254;
	Fri, 13 Feb 2026 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="gwfcMAgu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF453594A
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 19:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771011135; cv=none; b=GalWxHYQRDsdgmO7k8q7AUgBAC7W0s4ihWm9Tx5tq8TG8FbWvzv+26tJLaUQLQnEYKd2lfyUXgvPOr8y/Pi33TzlskpyiL9nQ9Drp+9wT2ZjGxVF1z440mYWGcLiSIi0p/wR6Cd1wOIoNcjXBzNIAdYWvHQe83T76ho0+3bEe9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771011135; c=relaxed/simple;
	bh=qm/wEKq4x4t8jvXwIk16srmaZgFrOGbMO2850gOCLvM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=iDF4CNZi6S53T1QnfFxQIJQf9Pn+Nls4RDod7XPmCNVvlz4M/lv8ixuxu6YpR+T2gbr7iBBAredqpRLGFlbpEnw3hcdOVFOmfjxDonKfCk6H9vKr0ia72TwlMtFzQUT3oTiHaMWUAJ0ZDrhd5TVpYW9Xfd0OVCF9132ZMDrm5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=gwfcMAgu; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-48fa146.ac4-iad.github.net [10.52.206.108])
	by smtp.github.com (Postfix) with ESMTPA id 7078E4010C2
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 11:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771011133;
	bh=WK4svXH/uAeBaahtthurAkXD+Y1a0dD3CPApJTN2CrM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=gwfcMAguh5gKk/n/nnH2DthvmJ0jgqOPKcRYt0W4zlCDiOOi83qeGbXViPSmHPUt/
	 mbSm80mCKhW2ZTJqrHXRsiFz+jyZeuEsDpNe9Qxcv7y5JUweAzXZkBM2squhqgHdar
	 PVjLShHuZfxpEqRAyw49xiXBEqBukoF/RUgSmdDs=
Date: Fri, 13 Feb 2026 11:32:13 -0800
From: Copilot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/copilot/fix-dualshock4-random-inputs/3fb5ad-902d82@github.com>
Subject: [bluez/bluez] 902d82: input: Improve documentation for continuation
 fram...
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19032-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 944D81393AA
X-Rspamd-Action: no action

  Branch: refs/heads/copilot/fix-dualshock4-random-inputs
  Home:   https://github.com/bluez/bluez
  Commit: 902d825f6b13444cae60e8950d351cd78a6ae6ef
      https://github.com/bluez/bluez/commit/902d825f6b13444cae60e8950d351cd78a6ae6ef
  Author: copilot-swe-agent[bot] <198982749+Copilot@users.noreply.github.com>
  Date:   2026-02-13 (Fri, 13 Feb 2026)

  Changed paths:
    M profiles/input/device.c

  Log Message:
  -----------
  input: Improve documentation for continuation frame handling

- Add inline comment documenting intr_datc_count field purpose
- Clarify comment explaining DATA vs DATC frame handling
- Move explanatory comment to precede DATC handling logic
- Makes the code intent clearer for future maintainers

Co-authored-by: Vudentz <2156363+Vudentz@users.noreply.github.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

