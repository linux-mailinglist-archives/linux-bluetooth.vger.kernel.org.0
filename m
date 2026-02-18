Return-Path: <linux-bluetooth+bounces-19139-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7T/dExMplWl2MQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19139-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 03:50:59 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780E152BBC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 03:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE853028EDA
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 02:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5976A2874E0;
	Wed, 18 Feb 2026 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ZN8csg8g"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14835966
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771383052; cv=none; b=j+H2XRAAUZghhmKWujIpyD7FoaomV3bj/xwWWnSgvSfFHUZ5HB8fR9N6QZ4EInWER3z9JGXmLIlLU+l5dJTxQP7d1BcWw1XSjt6QmEo2+25Tr3UsuvqoLWBJ3NUa4uuvb+fTSLVDAKMULce+/B2gyjRp7L/rE3dFZGbIqAk1d8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771383052; c=relaxed/simple;
	bh=1QwcEITsjcC9SAJyBP6fTEaz8mC65snd8k2xgFmQ71E=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=l7ua6FvMI8QU4V7HNHmusEJmf/mmDQm242VFRMAOmuPEY0GasEHecBdZWjIMMJ9hBbaDQRINGdnurVZOck2sv0TK6+yZa/vocge4JcrkppYVcFrtCxaOWeoxhha7Uk26Ac9JL4FpjJosyuVhG5FBBaekHsGFgKVIOaXHAvigQG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ZN8csg8g; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-04d7a4c.ac4-iad.github.net [10.52.141.32])
	by smtp.github.com (Postfix) with ESMTPA id 11E40203B3
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 18:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771383051;
	bh=ULtgH1w/BX6+fCFO1EkEWYaQCROJIBZ4+Vw1xYe8bI4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ZN8csg8gIYKoD8TdRUdRYUgh8V6AHDrNslBDCR9nKzpDmkU6Ep8y+tkRMtN80KfR/
	 16+pgc64fOz0gHNj9QsmBe774L233NAK+H3Yif9vNEyvuhqx3Wa0Hpt41RMicKxd1b
	 pruWBDC3ifwJVz6hlGzNZ8JD5rgpMC1I6j+0b86s=
Date: Tue, 17 Feb 2026 18:50:51 -0800
From: Ronan Pigott <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055060/000000-03b822@github.com>
Subject: [bluez/bluez] ed49db: zsh: amend completions
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19139-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rjp.ie:email]
X-Rspamd-Queue-Id: 9780E152BBC
X-Rspamd-Action: no action

  Branch: refs/heads/1055060
  Home:   https://github.com/bluez/bluez
  Commit: ed49db97eb584187a2d2c96123752c3592c6c5b2
      https://github.com/bluez/bluez/commit/ed49db97eb584187a2d2c96123752c3592c6c5b2
  Author: Ronan Pigott <ronan@rjp.ie>
  Date:   2026-02-18 (Wed, 18 Feb 2026)

  Changed paths:
    M completion/zsh/_bluetoothctl
    M src/shared/shell.c

  Log Message:
  -----------
  zsh: amend completions

First, use the correct completion return value.

The return value of a completion function is significant, if we fail to
return success additional completers may be invoked when they otherwise
should not be.

Also cleanup up the zsh completion, removing the redundant definition of
_bluetoothctl and using the _call_program helper where appropriate.

Finally, update the bluetoothctl command invocations to account for the
media lines printed after some of the non-interactive commands.


  Commit: 03b8221c842fd1e43cffcb5a7f99e9050b0193c9
      https://github.com/bluez/bluez/commit/03b8221c842fd1e43cffcb5a7f99e9050b0193c9
  Author: Ronan Pigott <ronan@rjp.ie>
  Date:   2026-02-18 (Wed, 18 Feb 2026)

  Changed paths:
    M src/shared/shell.c

  Log Message:
  -----------
  shared/shell: gracefully recover from failed input initialization

If input initialization fails, back out before waiting on events that
will not come. In turn, we can go back to initializing inputs for
non-interactive invocations, which fixes printing for non-interactive
commands and the zsh completions that rely on it.

This effectively reverts commit e73bf582dae60356641a32fc27ae03d359ec4c47.


Compare: https://github.com/bluez/bluez/compare/ed49db97eb58%5E...03b8221c842f

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

