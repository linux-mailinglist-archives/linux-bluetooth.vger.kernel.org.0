Return-Path: <linux-bluetooth+bounces-19159-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEm3BdD+lWkDYAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19159-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 19:02:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8201587C2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 19:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB11F3008C35
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 18:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD475346A1B;
	Wed, 18 Feb 2026 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Hc4zV22Q"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436CD346A02
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 18:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437766; cv=none; b=FYRkmemmLDmpUpX9eY8XJK8rFUmWjHTmtCF52FhgE7ez7aDbmN6itvWZOkjIgDS1RWj8R/Kd2FyIo066onFes5D7XzURpyQLQEqRYxxwpFUSzBVkdvtTx0Ex63klMPa7cAu+6nkMV3EPWrrIfE2nLIETrVSlkM9N3EcnrwRdUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437766; c=relaxed/simple;
	bh=ljelCtzHmPqX/iGq4Vkp57TXRb+qThThns2azcjqKmI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=NhiqEWbCHWAn0i6nPBsaem0l27PdF1Ta9xHp8QqPxbDW11ylTnUvQi2yKRna6NraZku8is+pTCydMDzrauro9ZJHLdrqokdts56RKtRcmIV5AtmjfQzJTaWiFA0k3/7NaOPDB01N46hehIftBf7Pa6DwJKPFx2aYhRgT3ypL/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Hc4zV22Q; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-f70c086.ash1-iad.github.net [10.56.226.69])
	by smtp.github.com (Postfix) with ESMTPA id 82D2E9211D2
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 10:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771437764;
	bh=HHZTCOtxv5x0KDtqdtmi3Vb8Klrq+IkRiq3LaQ8kBpQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Hc4zV22QbkJaHaCq1p/cn5vRbSl2OSNzRcjsrjr5uSlfpimZcByBNA1KYRRIBJ3Je
	 gflyGxQWNaYNWOfAH8CqevUtrHucGSKyfUgBFiMP8QwJslbyF0LC0p1TrtB47hN/72
	 CGdoia/BjR33qCw2b4l6zS1HA0OWTW5AAPt1lnks=
Date: Wed, 18 Feb 2026 10:02:44 -0800
From: Ronan Pigott <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055282/000000-f484da@github.com>
Subject: [bluez/bluez] f484da: zsh: amend completions
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
	TAGGED_FROM(0.00)[bounces-19159-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rjp.ie:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC8201587C2
X-Rspamd-Action: no action

  Branch: refs/heads/1055282
  Home:   https://github.com/bluez/bluez
  Commit: f484dab82fa968b4c28811ec529c7d44574562ae
      https://github.com/bluez/bluez/commit/f484dab82fa968b4c28811ec529c7d44574562ae
  Author: Ronan Pigott <ronan@rjp.ie>
  Date:   2026-02-18 (Wed, 18 Feb 2026)

  Changed paths:
    M completion/zsh/_bluetoothctl

  Log Message:
  -----------
  zsh: amend completions

First, use the correct completion return value.

The return value of a completion function is significant, if we fail to
return success additional completers may be invoked when they otherwise
should not be.

Also cleanup up the zsh completion, removing the redundant definition of
_bluetoothctl and using the _call_program helper where appropriate.

Finally, update the bluetoothctl invocations to be a little more robust
when parsing the output of device and list commands in case new output
lines are added.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

