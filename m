Return-Path: <linux-bluetooth+bounces-18414-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNxbO5qqd2k6kAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18414-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:55:38 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A018BCEC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AC203004DC5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF7434D4C2;
	Mon, 26 Jan 2026 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="FdyGTysT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99234D3A5
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450135; cv=none; b=sppowHOkizuvGNNZcEW2vZCJt1vl7V+ONcbhxb32wde0LDNDxp/QcbY/9Zo5ddkojpNfup/oPfkOskGpKXwriyh9Am5CzX+/MsXOsurHoRbcKPPyQA4WWCrfhKO+YRYmhSMotLTi4bnDsdPMVS5abVmPt+Z7O1qa7sD4e+NEc3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450135; c=relaxed/simple;
	bh=kzMJozbXGKQ51da3EA1JERci3mpj1IQRma+VE5ycWkI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Wvvb2h7xTLpq0kygzCYu9WfVcHYVWjzAZT1YDc19kFSwyqKklOAsbGu06xEm/e6CcnSg+RbQ11PxfuQkreXU4/GTpZxT/IhyeTQ0uLrtf5vOLO7WJzuavQKfSP06N5AD5KLXlK/NnJR1/RNCK7dY5I2CTmljS20jVg5RxxFwADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FdyGTysT; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-48c6993.ash1-iad.github.net [10.56.175.30])
	by smtp.github.com (Postfix) with ESMTPA id 9E305921315
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769450133;
	bh=hZ1WlwPk58QPkbYRbGj34pQqxQ6XAZ0Q/AYPdj4lWBQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FdyGTysTs/Tjj99eSUQbk7lH742o0EmquMLNffN4DJeCvssnxPBysLpoQYQn+A9XK
	 FeECXOOFPAKduK5eEmTcUrNpzGjsSfMR8/2RRcINjS3da62k4tNznBsYWOnc1fYVWa
	 uVlHMHTb8u91Tzvy0Gqp7cDg74WGm15n6XFt638I=
Date: Mon, 26 Jan 2026 09:55:33 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047202/3d429d-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18414-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88A018BCEC
X-Rspamd-Action: no action

  Branch: refs/heads/1047202
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

