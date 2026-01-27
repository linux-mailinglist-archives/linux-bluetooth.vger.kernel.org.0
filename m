Return-Path: <linux-bluetooth+bounces-18490-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKViKrv1eGnYuAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18490-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7698703
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DD73052611
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 17:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D252E2DD2;
	Tue, 27 Jan 2026 17:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="SJkvns4q"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE33230BD5
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 17:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534778; cv=none; b=OCVF/WEqHTEpNZlv15uMj/DDA/lBhtngulBAxgi94iUycV5WjqY0uMTEfes70yIlCEGovYunQZYGjzwJTyIMqlkw+G+lEGPxbttFlo5ym0474XNVNYx5Y9coOsMpnjOTG/7yZiiroke0uIN7OHj+fFnrpB68RLiPlPIp4iCM8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534778; c=relaxed/simple;
	bh=yexRryeVPVsS7k0gwRz8ibKntCGl1unwkegGaExzlOU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=B65zmVSwloBDg7ZJ5f8MfpxVwhard0h8zN5b39qswbrV6JYE7/RpExFQFTlP7tjvgIF1gg8GO0AxgzwVOw0EuiwlZSO2BIKKql4Nu/TJAvn3PVbQwJbt4ClceVqqCNF2ypDxd2fg827kZulRjnvfNHhjXz+Sw/EAHOW/JHTjjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=SJkvns4q; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3bdede2.va3-iad.github.net [10.48.222.66])
	by smtp.github.com (Postfix) with ESMTPA id 3A99D3C0E23
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769534776;
	bh=pcHbXDMDU+yZDK8MvCJXuifajafX35Ieey8OQKNVaTo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=SJkvns4qSZmfeLUZ2d531ygpbLbG5WfNv2OB+e0xY0pNs801fzYxmW3dpSolXpYzb
	 hYtynxAB3nFzXSsnqWMNq1ne0ScI4zJYnreHwE8maOpB4y6GzwUj0/jANBFmqSUPX+
	 AWSX7fMyzPdVMkyPvKx/udwyE3CBmso1e/OoCIUk=
Date: Tue, 27 Jan 2026 09:26:16 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047690/000000-0dc1f3@github.com>
Subject: [bluez/bluez] 0dc1f3: doc/qualification: Add PICS and howto for the
 AVDT...
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-18490-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 0CE7698703
X-Rspamd-Action: no action

  Branch: refs/heads/1047690
  Home:   https://github.com/bluez/bluez
  Commit: 0dc1f3c499824ca5a453d83b450303beb482729e
      https://github.com/bluez/bluez/commit/0dc1f3c499824ca5a453d83b45030=
3beb482729e
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-01-27 (Tue, 27 Jan 2026)

  Changed paths:
    A doc/qualification/avdtp-pics.rst
    A doc/qualification/avdtp-pts.rst

  Log Message:
  -----------
  doc/qualification: Add PICS and howto for the AVDTP qualification



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

