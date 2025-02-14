Return-Path: <linux-bluetooth+bounces-10384-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB4A3629E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Feb 2025 17:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2EB73AB444
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Feb 2025 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38DF2673B4;
	Fri, 14 Feb 2025 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyMbMMjo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6FF266B66
	for <linux-bluetooth@vger.kernel.org>; Fri, 14 Feb 2025 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739548808; cv=none; b=FpzQQZyrZFmBdrj4Mn6jlfcrA2J0XDEp43FJIdN1KwOWDW2385rJh9jPFpNyvZKcOEPMvGacmqSfLfwh2G8faEF0iz8aCvpR2x6nfdyHNx87HFA1Ou7wEYwEJcndSP1dnKz7vqB5Qv24yEoLKpcEARmWPG/+iJmlFsqhov8o+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739548808; c=relaxed/simple;
	bh=L2Sng6IZmYKFjY6vCSvpR0s2j8IAQ8HemICeONp+iFk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Z3TNs72aF4El6BYnHq2xiofEVcfyFHp5OVms8F+9tTGWf1cKyvEHaEs8dbD0j0aObXk0tJLATpUGA+Ec+4WXBPG9Soa40IMAVoub6Mp5k/g4aq3hklsnnfeWf/OpRDFR0FN7HD9G49+GUbZqXI1RQ0dk2h22LXO8COwo6a7qisQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyMbMMjo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8822EC4CED1;
	Fri, 14 Feb 2025 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739548807;
	bh=L2Sng6IZmYKFjY6vCSvpR0s2j8IAQ8HemICeONp+iFk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nyMbMMjoCygr2D0LwS/8VhvdGS1NNVrpF5tuW6pg048MVYgW/mZ3bvcJCrnNIUg+H
	 ij/X+MqI99PYRqxa12R3Xx9IR+rovq4DovUmfI3VviGssnY7Uj/u4ZRSnLgXpK56P9
	 ujU0+b90He8GEW0FtaymLAVcsGCYpP5iZlomO2IrBX++giNlNA61wOKdks1mrGOmPK
	 JY3Uy1R/1dl2EVDHbTefvSXTRS9wB/7Ln7+4/7+0vQImZsPAsKTqMI7IJfjD+M9r1R
	 jfAAw22HW/RzkXUzyCwbAPu6dJd1zQAsKzoN3dpbOWeb6QJiIINaj9aDdY6ZUCbUxj
	 GH6kyCGxVFRKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34812380CEE8;
	Fri, 14 Feb 2025 16:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] test-runner: Allow to use host CPU on demand
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <173954883667.2022852.14373856975607648469.git-patchwork-notify@kernel.org>
Date: Fri, 14 Feb 2025 16:00:36 +0000
References: <20250214064527.159950-1-arkadiusz.bokowy@gmail.com>
In-Reply-To: <20250214064527.159950-1-arkadiusz.bokowy@gmail.com>
To: arkadiusz.bokowy <arkadiusz.bokowy@gmail.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 14 Feb 2025 07:45:27 +0100 you wrote:
> The "-cpu host" option for QEMU can not be enabled by default because
> our CI system does not have a support for KVM. In order to allow to run
> the test-runner on systems where binaries built on the host are not
> compatible with QEMU CPU variant, the "--qemu-host-cpu" option will add
> the "-cpu host" to the QEMU command line arguments.
> ---
>  tools/test-runner.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [BlueZ] test-runner: Allow to use host CPU on demand
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=af3d67d799aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



