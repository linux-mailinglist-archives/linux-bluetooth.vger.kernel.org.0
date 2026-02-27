Return-Path: <linux-bluetooth+bounces-19481-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE9eMLu/oWnPwAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19481-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 17:00:59 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A34281BA73D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 17:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2ECD30CE530
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 15:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B829E44A70F;
	Fri, 27 Feb 2026 15:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="eyeK6waT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB7944B695
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 15:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207790; cv=none; b=udJtqL36dvqeR7xLR9z1vPjVLv6FnZyGhw2tOlkl3wqdZYZWt81SVGAldTYdLhy5KSO8Gn9sh9MNUEj9bWIVD6isgu9INdGmBvXAYXt8c5etkL5rXVF/EQEgxwxxX+hAPo8/x0brQ7cEmJopTm8RqOoD3XcEdIZN+idZFHOVL2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207790; c=relaxed/simple;
	bh=xSTkmPIlHNXYuc+pfX2Hba7r7FszKFLrYywPSPJxplE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=cbtL4PjguHPVwY5ZSQI/Ig7knxMvIkNdxBqNjExP/0Qfm3Y+UnTvp7i5TzUuYRtdl3YxBc9sVESI/tpEi9zop0aGPgH7zHD2uVEY2nciy+QwoqMkPMO/4gCj36EfJii099+gBXI7BZk5LvnRPqVnkFfBs0TIaBeF4hQVLuN+Eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=eyeK6waT; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e4c9d5a.ac4-iad.github.net [10.52.155.46])
	by smtp.github.com (Postfix) with ESMTPA id 2678A40091B
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 07:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772207784;
	bh=u+66Utsin2oZDmbMnQMcWUTOBZuq0qZWi2ZivyhfJIs=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=eyeK6waTFPuRiNybARVshce02S994ftJKhknip1ZLitkC/Yapf3MoaClIAZvSljh3
	 A7oTwPwjajmSn3IoeREBSpkjlORpr5V336MQdehV+3H42yJT6Gijgf9LnhN9R4SZX1
	 5ZXiVdt79yOr+PIFGB0N3i7Si08BlnT9gAopzYq0=
Date: Fri, 27 Feb 2026 07:56:24 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048150/d8aa72-000000@github.com>
Subject: [bluez/bluez]
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19481-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A34281BA73D
X-Rspamd-Action: no action

  Branch: refs/heads/1048150
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

