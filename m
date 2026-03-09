Return-Path: <linux-bluetooth+bounces-19950-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFEdKFfVrmlhJAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19950-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:12:39 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DD223A522
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 51CD13022546
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 14:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F7E39B493;
	Mon,  9 Mar 2026 14:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="WSRlzTYn"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB73CCA02
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065546; cv=none; b=UwbGQIpRX8zUCA1ihwMnhqzeLbmjk7FDH7qL8CenzxknC9ReQRCDhMEHzfT7CZ6enBWlQhWiiU/sP8nCNazNXrVIAQpMyt2OUgMmYqbruh0KlSYjoBJvMCPu9ELK0cTusGOv8MNr02dIgOB3Hisxbkrdrjm7MaGDaLGpMQxHM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065546; c=relaxed/simple;
	bh=tZnuuMdRJIvKWAUiTdQBAzQMzA3qXZmBWsOLGAao9rk=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=shimz2IkO76h5teNhl5CZsIM0Znkqz+zIWb4D/03B3q8go5neGOI2NWJqIwJneSvCE7Q64XFoq8Gs7sUkFPQSLEY9//44ItlwR5plHj82kDjx4q93HIK3TkUL4sjgp6Wp5J22t2mEPHK5D72zqwfSAQyLE57YOah1QtnbsiYqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=WSRlzTYn; arc=none smtp.client-ip=192.30.252.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3ed5116.va3-iad.github.net [10.51.93.15])
	by smtp.github.com (Postfix) with ESMTPA id ADDDE9212C8
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1773065544;
	bh=/PG2ZUiFpPqc/CFjb7UPWRMap1b4Qgwc5V5jv4TN2Yo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=WSRlzTYnd1kfyDK311MhZGNGA5TrRRk+uev+6CM8RTpMZqUxSwCY4Epdp6FAReo5K
	 n9q4EQ7bqiUKS69yyvlkvTPjrMbUiiAycqUFhtG1KzradKnXTH2v6ux0FvowAG7n23
	 60io8jpp3Np3NiRnMuIHMIiD9JWrOoYn3Qn1tln0=
Date: Mon, 09 Mar 2026 07:12:24 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1063415/537886-000000@github.com>
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
X-Rspamd-Queue-Id: 56DD223A522
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
	TAGGED_FROM(0.00)[bounces-19950-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.125];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1063415
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

