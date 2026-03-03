Return-Path: <linux-bluetooth+bounces-19784-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF29KaUIp2k7bgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19784-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 17:13:25 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AAD1F3696
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 17:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49A4F300B52C
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Mar 2026 16:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E06C4ADD8F;
	Tue,  3 Mar 2026 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="LSpEcY3T"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91A43B5840
	for <linux-bluetooth@vger.kernel.org>; Tue,  3 Mar 2026 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554399; cv=none; b=jTOM3QuGsqlU5PMCegId0O/IKFWAIQEj2/S16dfKzWB2mIDzTWuMf0uvbc+HDL6lNv67JRhyEpphXfUkGFRX/A6nRISm/cXSwgEVfF/6/GYAfbaD+UoH4VPTCKgHxX6DIfRdVQ/ae2KaLxm2yVfw05RR7M2rOLw3eqKsfprTPqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554399; c=relaxed/simple;
	bh=h7SqyABdkRStRri6vFXneIv56xu6qWgNkiAo5lzsfzw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=c8jAXfpabxEBytnIr0e+Beg6ordbNN0iY9N/ckYou94QOpvXlzraaDMNBBJRvB1Zq1sXi57/q6+ndOOQ08zjpmpc6yN9ZR0AxkVZ175UTTTpzQ4Y1OTD7rlbvJ6FBtkq3Dc8cTSbwBgZIKY4vXdFGer42WyIeDSQU84CMBEBRuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=LSpEcY3T; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-02c2680.va3-iad.github.net [10.48.220.33])
	by smtp.github.com (Postfix) with ESMTPA id 6FAB84FC4BB
	for <linux-bluetooth@vger.kernel.org>; Tue,  3 Mar 2026 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772553680;
	bh=rOmtpULl9i/bJw0YWiWAFOR5YY5/fa3StkH7cWigNJs=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=LSpEcY3T7YLQkclvDmFgL91UpcI7f5Vk8wiZqcmz6F+wUHivV+WqMZ0HA+lYuq5oB
	 /nwwloeVnfOJtbRaIq9S7RV2ccb3FnyVWcF6JFJEUhFXmV6Yk5+JTnxAe9lPBzpRLK
	 i59tCgrPdxrET8CZgvwwCbprbk9auho1cfmuJnu4=
Date: Tue, 03 Mar 2026 08:01:20 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1058038/eea7a6-000000@github.com>
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
X-Rspamd-Queue-Id: 09AAD1F3696
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19784-lists,linux-bluetooth=lfdr.de];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_SPAM(0.00)[0.961];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

  Branch: refs/heads/1058038
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

