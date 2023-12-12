Return-Path: <linux-bluetooth+bounces-563-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A8F80F24F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Dec 2023 17:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 108DEB20DD2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Dec 2023 16:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F9177F2F;
	Tue, 12 Dec 2023 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpH97Akq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6177F0F
	for <linux-bluetooth@vger.kernel.org>; Tue, 12 Dec 2023 16:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE0C9C433C7;
	Tue, 12 Dec 2023 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702398025;
	bh=RVdCPjlQlsj2Dh9vDQXJmPs96w6GEO8Xnr5r0yTUcqc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WpH97Akq1U9B/7pZUqgU9kIndZGpEynDNhz3v3uGJcj7WaP5/cb1f4EZJRuPhQYR/
	 XO68pmk9kQhpFa+xv2qlqRiiD13bFv1DazrDKZL3nC+v4CDzrkUM/Yr7MqAzs09N/Q
	 dhbcyQFikWqfFXlzLTHlIefKu3Nw671mzeD21KkE6F+yuV0SVuu1jOZk2of/I6Kenw
	 Ljtb3cVQ0nIYMN3CQ25Yvz7B6ML5JZSyaU/nxh6u+wCwEgUuOz9OuwO7YPSlRDhFk7
	 MlOLD63dQ2h3DigvwALqMFB2ggQZGTsyi4R++D29niiHMR81O+85jp4GfU/VrsMYZY
	 RA8gMlTQUvong==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97BAFDD4F01;
	Tue, 12 Dec 2023 16:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: hci_core: Fix hci_conn_hash_lookup_cis
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <170239802561.22444.2733058726592486366.git-patchwork-notify@kernel.org>
Date: Tue, 12 Dec 2023 16:20:25 +0000
References: <20231208222843.70028-1-luiz.dentz@gmail.com>
In-Reply-To: <20231208222843.70028-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri,  8 Dec 2023 17:28:43 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> hci_conn_hash_lookup_cis shall always match the requested CIG and CIS
> ids even when they are unset as otherwise it result in not being able
> to bind/connect different sockets to the same address as that would
> result in having multiple sockets mapping to the same hci_conn which
> doesn't really work and prevents BAP audio configuration such as
> AC 6(i) when CIG and CIS are left unset.
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: hci_core: Fix hci_conn_hash_lookup_cis
    https://git.kernel.org/bluetooth/bluetooth-next/c/ce168429c3b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



