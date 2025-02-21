Return-Path: <linux-bluetooth+bounces-10581-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD7A3FC39
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 17:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAD381897189
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Feb 2025 16:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F63E20FA99;
	Fri, 21 Feb 2025 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQpEDzZs"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29020E32D
	for <linux-bluetooth@vger.kernel.org>; Fri, 21 Feb 2025 16:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156604; cv=none; b=d9e5cnDIjtfVe68NV7ppPDjTK2ILQPdkts30ShTxQF7brWAfZvbv8pXnLuFTd3ETsqffSK16QfwG34JUWK5vYfQFcZa+u0KXWBrsU8hYLPHEK6rwzNo1IaGLNEozOisiY9XQMmLYI//fWlyTyMkN7uTyY/heOj1Kxyz28K/8KSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156604; c=relaxed/simple;
	bh=v+GU0fzFAvQuV72aGUxbcRqg52+7ZjEdPqq12bpzjws=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MksiWUoTOy5+Nc1ifGqdDcn+sZS4TY7bSQud9mhm9x15frksWT/3k96Zpl7hZIIglBzsIHFZiujZfcLvYiTI905dhX3PcEY3zI1NwFhC+Y2sbGn14ONhbZQUUITB0mQsfb+3Z7G0CvFwRv/8L0rln/uUBTGBiEoTXxZ8JDyFMZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQpEDzZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85274C4CEE7;
	Fri, 21 Feb 2025 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740156604;
	bh=v+GU0fzFAvQuV72aGUxbcRqg52+7ZjEdPqq12bpzjws=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SQpEDzZsGBvSYfZG1XYdOV5O8+3hAEKZUZqNfDaX0Q8D9dMPRoAfJT6vkEeC11Sow
	 ZU6+i97eJXAleTLdV9unI7IuJPxf6+IOUgv6nBe3dW9skQS0t1pj5cuvpm2EWKmcLT
	 tMnjPt+z4NZLllCmmXmvLg1uiATCP6CtllutLh+9K3TiRQOA7z3DjY/SeYFNEe9H5P
	 C2e2yjvdZzJXZy4DVLmhYXW+dmpBB/qBPjMFThaHCjmdVHX1CyZ8D7lEdnMjn53Vbl
	 BX+tEH6pntls79LaP+/LJj8cWOoyRUybxYvdWruURLyypqDzHwW/+jjxo6ZS/1WKtj
	 ANJJCpAKeIHwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF42380CEEE;
	Fri, 21 Feb 2025 16:50:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 1/2] obexd/client/map: Add SupportedTypes property to
 MessageAccess1
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174015663550.2112364.11236992781055040008.git-patchwork-notify@kernel.org>
Date: Fri, 21 Feb 2025 16:50:35 +0000
References: <20250220072446.190256-1-frederic.danis@collabora.com>
In-Reply-To: <20250220072446.190256-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 20 Feb 2025 08:24:45 +0100 you wrote:
> This lists the message types supported the remote MSE.
> Possible values are: EMAIL, SMS_GSM, SMS_CDMA, MMS and IM.
> 
> Those values can be used as message type when sending a message
> using PushMessage method.
> ---
>  obexd/client/map.c | 47 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [BlueZ,1/2] obexd/client/map: Add SupportedTypes property to MessageAccess1
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=1c4f52767236
  - [BlueZ,2/2] doc: Add SupportedTypes property to MessageAccess1
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=41431caf8af3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



