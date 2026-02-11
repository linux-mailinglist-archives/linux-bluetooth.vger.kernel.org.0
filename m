Return-Path: <linux-bluetooth+bounces-18945-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNj2FpRcjGmWlwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18945-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 11:40:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A3A12381F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 11:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA2753102AF6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3C9369987;
	Wed, 11 Feb 2026 10:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="R9Lf1d2+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B067536999A
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806103; cv=none; b=mXFaT4moi81++jmN/V14qMLmnf7YpRJPukm4h+NjlOaaVN1PTskiNiRxbDX1bFvkBxbXxWpbWc5E91TpbuCr0ADFIld+eOpQdXXvySV2ahpJX1dWWEVi2qh3W2XQaM8vVaNrL9xOd2u1S9yTeFUEv+TKl9lyi5Q4sBsF57FNBXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806103; c=relaxed/simple;
	bh=un201yQaHuOQY/PuwCoOcQizB+MwcrV3z2pDZedT/a8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=pPLrE8SY104uu2if9pzLLV9sTyzb2Ux9fyFu4tyvCJZBitYf6BHlPrOt+S1HxBi6E3GRKjSXHnQdk0ZR4I5wrbo+k2PM1G1MAvGsGR+uWghnhMSligZJ/eCg+owz5Z2FyTdp1jo4OxS/00RgtSpzHP3N1IMnaW8DpTcFTaxlFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=R9Lf1d2+; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a4af42d.ac4-iad.github.net [10.52.13.31])
	by smtp.github.com (Postfix) with ESMTPA id E4F3220A16
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 02:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770806101;
	bh=Q16BaSC5d3dzerMQigQcKHhQpKUIPX/lyDle0Dl4H4w=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=R9Lf1d2+rra/fB09xONzoRhipcPeMUD4kAXBu1k6Kf+q3pSYDOX3leAB3SrlL6HIB
	 k1DHPkMTgtnc5sx9tL7coak7c9e22L1JejDi0MmUwFdK8b4sjKXuchMmWGPIZUl5/Z
	 lTKTA2j2ePuy8dYawzgebN+GLQMElwkY+B+ndbOY=
Date: Wed, 11 Feb 2026 02:35:01 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1053057/000000-95aab8@github.com>
Subject: [bluez/bluez] 95aab8: tools/btpclient: Add GATT support to get Device
 name
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18945-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: C8A3A12381F
X-Rspamd-Action: no action

  Branch: refs/heads/1053057
  Home:   https://github.com/bluez/bluez
  Commit: 95aab8d38ba11b73a5bcdf3173f5507bce43d8ff
      https://github.com/bluez/bluez/commit/95aab8d38ba11b73a5bcdf3173f55=
07bce43d8ff
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-02-11 (Wed, 11 Feb 2026)

  Changed paths:
    M src/shared/btp.h
    M tools/btpclient.c

  Log Message:
  -----------
  tools/btpclient: Add GATT support to get Device name

The device name is retrieved during GATT connection, so no need to
send a specific request, just need to send the name to PTS when the
property is updated.

This allows to pass GAP/IDLE/NAMP/BV-01-C.



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

