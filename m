Return-Path: <linux-bluetooth+bounces-19594-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLM6EhTxpWlLHwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19594-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 21:20:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B243C1DF3DF
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 21:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F15EE30082A1
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2026 20:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09A637BE75;
	Mon,  2 Mar 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkL+goCY"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F6B2FE044
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 20:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482806; cv=none; b=Y1YI62q73rrZ1UHxZ59eejDVd79Z8l+nejPUt2whppq0YKJqfM/CBgx2T0ifCO9pPORyS7UCB8KWHXFpHKUb/0jVXXlWxI6coh09hlE1CzCDs6NOL7ApGPy0WZRZjDQD/UkTFOPg3P15JuNOK/2/Aoc0WR4u0zCS1qAYIr7IJ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482806; c=relaxed/simple;
	bh=FeF/zgJKWnrHxqFmmh8MMtpXvJGVlQU9+g5OYvytmck=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UimQS5+ZXVM3nLfKw7STTAE5Lnk4CjeebdFSNNt7vG3kGbjLOz25chwymaj8k03WFm+kqhVFsU4KYjg1asDltXL5vHvg7QQa34symrSAXKpCDf6T4kjFTkOxjWxXTVUR2AIORiC8hQi0bZBorQfNbi2VYrd4w1XG6VMya4tHKW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkL+goCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F59C19423;
	Mon,  2 Mar 2026 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772482805;
	bh=FeF/zgJKWnrHxqFmmh8MMtpXvJGVlQU9+g5OYvytmck=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gkL+goCY3ykbC6I2SvF/uMXQgKfnGrWdnMYSKPjXi5ShYLuhvhf4U9zxIdqbcsru9
	 smLk5G19HC7wwhDYAR0sVzYCb8RcuJoKOAev5IMGom2xqHNV4rhW/hker0iqI5lCKc
	 iXH+bhXawd7HJjfIhB90GvqMlUu4WAGtbG5UJ0x4xZ55ChRXtYvIHkUlHJsS6pHSMC
	 Ks0ncqbglnPFSRp9WD7XGRFzL/pOedV0cOohKNKjiNzdPdcF8YYtvDlupXq/1q9mCk
	 SYznsHFtzcCJT0yM4uq/cnAenngzHTTJFZTZKVOP6xegK1624mi9Fs2vd1xc8QfGYm
	 lPXEAwBOg8M6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F363809A80;
	Mon,  2 Mar 2026 20:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2 00/15] doc/qualification: Updates for TCRL pkg101
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177248280755.467971.14039615652305364969.git-patchwork-notify@kernel.org>
Date: Mon, 02 Mar 2026 20:20:07 +0000
References: <20260302134540.25540-1-ceggers@arri.de>
In-Reply-To: <20260302134540.25540-1-ceggers@arri.de>
To: Christian Eggers <ceggers@arri.de>
Cc: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
X-Rspamd-Queue-Id: B243C1DF3DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-19594-lists,linux-bluetooth=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 2 Mar 2026 14:30:28 +0100 you wrote:
> I am working on a qualification of Linux/BlueZ for "LE / peripheral only".
> Due to updates on the SIG's ICS/TCMT/TCRL, some ICS options and tests
> have been added.
> 
> As I am not able to perform all the tests as Frederic did, these patches
> bring the documentation into a slightly inconsistent state (as I tested
> with a newer TCRL/ICS/PTS version, but only updated the test docs for
> the testcases I actually ran).
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2,01/15] doc/qualification: gap-pics: add footnote for TSPC_GAP_21_9 feature
    (no matching commit)
  - [BlueZ,v2,02/15] doc/qualification: gap-pts: fix GAP/SEC/CSIGN/* tests
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4da5d644b884
  - [BlueZ,v2,03/15] doc/qualification: gap-pts: fix GAP/SEC/SEM/BV-24-C test
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=737b2e6b1067
  - [BlueZ,v2,04/15] doc/qualification: sm-pics: update capabilities in table 7b
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=68b03755160d
  - [BlueZ,v2,05/15] doc/qualification: sm-pts: fix SM/PER/PKE/BI-03-C and BV-02-C tests
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=61424fa2886f
  - [BlueZ,v2,06/15] doc/qualification: sm-pts: fix SM/PER/SCPK/BI-03-C test
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=160e9bdf20ae
  - [BlueZ,v2,07/15] doc/qualification: sm-pts: add description for M/PER/PIS/BV-0[1-2]-C
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=682fff74cd2a
  - [BlueZ,v2,08/15] doc/qualification: sm-pts: add description for SM/PER/KDU/BI-04-C test
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=19b050c73b60
  - [BlueZ,v2,09/15] doc/qualification: gatt-pts: add description for GATT/SR/GAW/BI-39-C
    (no matching commit)
  - [BlueZ,v2,10/15] doc/qualification: gatt-pts: update description for GATT/SR/GAN/BV-01-C
    (no matching commit)
  - [BlueZ,v2,11/15] doc/qualification: gatt-pts: add description for GATT/SR/GAN/BV-03-C
    (no matching commit)
  - [BlueZ,v2,12/15] doc/qualification: gatt-pts: update description for GATT/SR/GAI/BV-01-C
    (no matching commit)
  - [BlueZ,v2,13/15] doc/qualification: gatt-pts: add description for GATT/SR/GAI/BV-02-C
    (no matching commit)
  - [BlueZ,v2,14/15] doc/qualification: l2cap-pts: remove redundant test documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=8a2186d6926f
  - [BlueZ,v2,15/15] doc/qualification: l2cap-pts: add descriptions for LE CFC tests
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



