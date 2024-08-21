Return-Path: <linux-bluetooth+bounces-6909-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E450395A0CB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Aug 2024 17:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97C322886A1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Aug 2024 15:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EAC139D1E;
	Wed, 21 Aug 2024 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU1IgbpK"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87539136352
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Aug 2024 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724252438; cv=none; b=F5kqf4fZARByihC00tkjktk+BiHhyxmx7phrPayv7a/U9TjT95PsiEHzSc/T5jfSe8CMDX1IhuWkKHvSXNFCHrX6bB5sANNQDAMo8feD8+JEIhCn8tU9TtrzeXyKgBCH8HRxddF8E0msZNw+J9zDjhRLSsFauqib20gkDEj2Ie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724252438; c=relaxed/simple;
	bh=GtyZFVNuddLbq3xJcmel5S4PnKb6tN0ki55ukHxgDCw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PCNNBbUNH2Y2WEVTySQ0yA7WKR89ALOI8QBXjg0o1iMYMRCRfBcFRm7hj1021GDqnJHh0WC0kyqWdfd2yf08BBs4+sihJYp65JTmODMGo95qwxcM57kRCck78l0U2oq4d9Lhak3tE2xhqx2HfzhE6ktaTX7E76Z0n+TE7tV8P6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU1IgbpK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202A5C32781;
	Wed, 21 Aug 2024 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724252438;
	bh=GtyZFVNuddLbq3xJcmel5S4PnKb6tN0ki55ukHxgDCw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jU1IgbpKbJ7EHSnMjwO7/mD1cgBAWXDTMJ7fYry+7z81K9nsPLMqOOiU6SbLDGJql
	 ffBc5i80+7Xo6CVDKSPvK8llurOsv/7KOic44qHwbRkSYrzZToAap2L3AG9tk9SPlB
	 1GbW/akOQVQ+x5oBdy02VVSuBN8p55LmA7dRaPp0WBVKYtPaUrepE4wVR1fiAziINH
	 IIE+Xxg8kcquhRrM0XMSKeDIV12b0M+AlmA8DuEgdiHiU1OqtZs2EPi3bzD5wdDJwe
	 /wHaEtZJl8kEr9Z1eFbpaAiJcXk1fr6oqRfAQkWmn9pl9RbPG6/n5RdL1TJhsSTetv
	 P/EBoa6Vpzmmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFD43809ABF;
	Wed, 21 Aug 2024 15:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1] bluetoothctl-endpoint.1: Update documentation
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <172425243778.1748278.4966340684494666771.git-patchwork-notify@kernel.org>
Date: Wed, 21 Aug 2024 15:00:37 +0000
References: <20240820162817.179210-1-luiz.dentz@gmail.com>
In-Reply-To: <20240820162817.179210-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 20 Aug 2024 12:28:17 -0400 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This updates the documentation for endpoint.presets command and also add
> some examples of how to enter extra capabilities/configuration and
> how to setup custom presets.
> ---
>  client/bluetoothctl-endpoint.rst | 72 +++++++++++++++++++++++++++++++-
>  1 file changed, 70 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [BlueZ,v1] bluetoothctl-endpoint.1: Update documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9746e59d1149

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



