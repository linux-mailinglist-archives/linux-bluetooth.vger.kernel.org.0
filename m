Return-Path: <linux-bluetooth+bounces-18571-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BpCCM4GeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18571-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB299428
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3225D3006210
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6C6329365;
	Tue, 27 Jan 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Fjzt7023"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FA32863E
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539272; cv=none; b=dxNR+I9rALbCDCdNlAsiU+Kxi4GNv5eu1MK+wbW82syuUFTR96YcoAVcbTjrAHzoCWRjQ8rzVjvjXD7KNolspd75zkXQhqUoIQ1F8sTVTmBF0n3a37Db3iR3tPvIwBjB1obLe/gBjhib/eD4OZfhhzPRUdxZItWBBXqOO0hnEIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539272; c=relaxed/simple;
	bh=AU96moau/6AXNrtnn9rFv/9iw3cku7JdG73sp+7b3yE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=WqpuWo30bWwgKODuiXBEdTFgQ1CRyl2LhuZ85YQEb61zfFeW2uctilkn7LQ90RNXsHIxrnM4M3+FwqX1NsnwBC9ZBhFRMIKltOB5uaIP+i+GZ+xeKz7u+WViEq5tPSF0wu+9uNtpJwjzLlDhRCGxc2fAZEfmzxl3AIXBU0k+CtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Fjzt7023; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d8adab1.va3-iad.github.net [10.48.133.16])
	by smtp.github.com (Postfix) with ESMTPA id 10A313C11E5
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539269;
	bh=TcA0rbz4Lbk4znujJXkbdZ08fNJnwYry2tnoUq7V9vg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Fjzt7023izi80pVpWHPuUa9XUqkspSorRSUEdbaYtgpbhs3TMpoDrAG/n27tZkH9q
	 N0IChfdaFN4eOihJefsVXmPPa6660F8BylZsydPhaJ6yOZ4aW5/IhmFbQalfZLBLHy
	 QYAfYfkswl3E/1GiwGdXpEulHAJ2mV/ij1SBcBsE=
Date: Tue, 27 Jan 2026 10:41:09 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047686/11c867-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18571-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83FB299428
X-Rspamd-Action: no action

  Branch: refs/heads/1047686
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

