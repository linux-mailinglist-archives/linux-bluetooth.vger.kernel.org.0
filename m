Return-Path: <linux-bluetooth+bounces-9648-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3756A07D4A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2025 17:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4C718894E4
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2025 16:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D60622256B;
	Thu,  9 Jan 2025 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pK5AJOia"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA88225773
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jan 2025 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736439409; cv=none; b=WGCpae6b07OoXCKBK0tRc0NEr+HrXuhUDYB5MiW0FRqUc1bRhnrYeGwCthz8l+obFMvSxxph3TK/V+L0lwWGQE8DJbW+tZlDEcGL8mQ5So3YNVnK4AX2LFv8/cRtP/ZQvXsSlOyT8AjBaICKd75w9Xdt7ZAzIUWbvbZjl0pIWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736439409; c=relaxed/simple;
	bh=43YJK9Ej+ZQCLOLmScn762/ZVJzezaKWcq887rC42uk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tLSVfH9Ty8N7tXQz1pXF8dqbCqXLYlUdpv/ZO/rEo3izp+jUW/mGFndmOBK3JIsqmF2Cb0B12Fa+385se5Gth6n2Q6FIEJzaKxMVJMGNYJ6HWPTljk/Mf/hA6XWdL+9N4LQreSxzdg4OGcyevqiZ92XOVOg+I4NezaO6NRANKlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pK5AJOia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA79C4CED3;
	Thu,  9 Jan 2025 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439408;
	bh=43YJK9Ej+ZQCLOLmScn762/ZVJzezaKWcq887rC42uk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pK5AJOia8yRu1s5IViIJnrPjA4zPmkfwBypBPFhboapRI5MnFm/Q55dZVoaPOBUsK
	 UTJglXXUUInd6JqyfAocmRrdSqa1Kjm7KQDsK6NjZHdD6S5oW9DyasoLwQosp/NhIK
	 LzcUj4WAiMq7E2yIVCUT1JXFeA3g90ou4svI3qlAtAEg2ohncMMT05TWuXl+wYDlK0
	 6Z435KUFcvOtc8lFFDt96XDr5bCdrnlGoKVKww2xcyFRCngbFcbT3Tn9Src+Q4eV2p
	 3DX2vQaddzPizpMV+oRrKMd8fvLWehv22hUBQmr02SFISgon7hsbgjJCosOfcp1lst
	 N3CHT6WqqG4Ng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7395E380A97D;
	Thu,  9 Jan 2025 16:17:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] obexctl: Implement support for message listing format
 version 1.1 for MCE
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <173643942998.1375203.14085511969972957620.git-patchwork-notify@kernel.org>
Date: Thu, 09 Jan 2025 16:17:09 +0000
References: <20250107114713.3594001-1-quic_amisjain@quicinc.com>
In-Reply-To: <20250107114713.3594001-1-quic_amisjain@quicinc.com>
To: Amisha Jain <quic_amisjain@quicinc.com>
Cc: linux-bluetooth@vger.kernel.org, quic_mohamull@quicinc.com,
 quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 7 Jan 2025 17:17:13 +0530 you wrote:
> This change is corresponding to obexd changes done for implementing
> ‘Messages-Listing Format Version 1.1’ .
> This change will emit the newly added properties values in obexctl
> which are sent by server.
> 
> ---
>  tools/obexctl.c | 5 +++++
>  1 file changed, 5 insertions(+)

Here is the summary with links:
  - [v1] obexctl: Implement support for message listing format version 1.1 for MCE
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5e965f8d2ac7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



