Return-Path: <linux-bluetooth+bounces-18496-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO0wB871eGnYuAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18496-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C49870C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A8473062C75
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 17:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3BB2FE577;
	Tue, 27 Jan 2026 17:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="dgPYG6P6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C36308F2A
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534801; cv=none; b=gndV3xrpxaWy0B/xhLXfBI0OMTgMz0plrONgJCeDXQNMC/lJvcNHkAHTNC2PlHTjI4nmZo64C+R2vy3uSpbKUPZq2/OFVjBSzPb7dvGBPOpaEFWIJO2d1KMvue6COlA3IVk0rL7IllRBBdJqzuT3M+tnomv9o3lWW7niUtKeV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534801; c=relaxed/simple;
	bh=fCMwXimVEFS3sudo4ucFoTddEB/0VBsAZ/Au3dwPmRk=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=kgy3hZPdJ8Yb2fJA5R4ItkT6Kh/VH+Y+o74yi6rp3L9yn0XsIkmMaFOAeGn/8drdk13AaBYZOEx2hd6PP0ONZdWLHXTPDjhiRPpfTBVDcDV0kUR2yxhCQ+V/SHeNkbbeCHkeAR8eu6ThT83MQYDwfBAj/ZArs/holK1uk4MszCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=dgPYG6P6; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2c707a5.va3-iad.github.net [10.48.205.91])
	by smtp.github.com (Postfix) with ESMTPA id DDCB04E0E28
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 09:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769534791;
	bh=UPkQiacCHM6OSGDrDwhBL6Wi4AjtLD4HN5fZ9WC6xqg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=dgPYG6P62cEXMAxm0bqbMkhjc1S1CQUbEK0QDmgHCX1T777qVS2yeb9aevxy+UhEG
	 Ey/iUpaISlf5WtBWkJdM8Z7ZLkQUTFexQ1iwuEjHhn5NxTbbTV6zM8/PxKOC4i8ZfI
	 iruRz8OMMfV3LnuekCCIYXnnPW/O6/yL/5t6B4RA=
Date: Tue, 27 Jan 2026 09:26:31 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047699/000000-108554@github.com>
Subject: [bluez/bluez] 108554: doc/qualification: Add PICS and howto for the
 SPP ...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18496-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 639C49870C
X-Rspamd-Action: no action

  Branch: refs/heads/1047699
  Home:   https://github.com/bluez/bluez
  Commit: 1085548cd4422371c3518c8e3d9e0dc837b73f3f
      https://github.com/bluez/bluez/commit/1085548cd4422371c3518c8e3d9e0=
dc837b73f3f
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-01-27 (Tue, 27 Jan 2026)

  Changed paths:
    A doc/qualification/spp-pics.rst
    A doc/qualification/spp-pts.rst

  Log Message:
  -----------
  doc/qualification: Add PICS and howto for the SPP qualification



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

