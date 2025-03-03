Return-Path: <linux-bluetooth+bounces-10812-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA86A4CAAF
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 19:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 044633AA40A
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Mar 2025 17:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542C2215079;
	Mon,  3 Mar 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdTbOJHw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE27080D
	for <linux-bluetooth@vger.kernel.org>; Mon,  3 Mar 2025 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741024204; cv=none; b=Ekns3BuEW44mDYtS37UhuHywGqUZK1+4kvR+Ho/RvVM4mveIs8g+ozz14sQ+xAFxParWWQGKwlFs8d2+pk8YqH/erBjwgcdxqGvh+nECqKdb2aFULfY0QID8tmbyi8lffQe6KXVPrW9cd87h5XoDd++0s7ToFIt82eNbrBT5/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741024204; c=relaxed/simple;
	bh=GOp4YfkYVDZqmlI0CEpDwTOTIEda1TulmEsijPs9LgM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QmI+GDT6eY3RiooHqh4SMFlxiPTFmK5I/Rmf/azNEXZhT6b2EHSv59jxu2CvV/m1A3/7l2VaWAFCfncTxKd+qIR3muAcyDEu5OY0Rm2rUhHE8ebpAjq4Ziawa1tDgI0NZRHgMMgvocw9qExSI8Lf75wrU1mvJuT3ByDSt69eeSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdTbOJHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 334DBC4CED6;
	Mon,  3 Mar 2025 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741024204;
	bh=GOp4YfkYVDZqmlI0CEpDwTOTIEda1TulmEsijPs9LgM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZdTbOJHwc8FIlPsKF3oDP9SfOA0Ts4uzSQPXZHwTkXv2If3eR7XrGhYHlhVtpczpQ
	 475ZU+V3sEbuzzzkKcZyYng8nvIpK0qrKl4AHIVaLlCuK8+IlYm1fU1tEgJsdrEfsa
	 UPpSH7dnx8VxL1ZMNrh9kDo1owYvaufnL9LDmBmm2HiqCL9koOJjP9+9Nlj/mgrmNR
	 TA8IKw3GoWdQlURJDXeNwPCm+FZ9AlA4pT3z6QeKT5eAtyCdLTYFsgyBuwOxERQorC
	 Y+IaTGDcsJ2rVOSc1kLcFHUbGESlcwsZaK8LLCecAiUYC6oC4O9wobCIn2DCWph574
	 vrkpdnCW8jX5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3462A3809A8F;
	Mon,  3 Mar 2025 17:50:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] client: add input validation to main()
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <174102423701.3666733.13771333873621886444.git-patchwork-notify@kernel.org>
Date: Mon, 03 Mar 2025 17:50:37 +0000
References: <20250303144844.60025-1-r.smirnov@omp.ru>
In-Reply-To: <20250303144844.60025-1-r.smirnov@omp.ru>
To: Roman Smirnov <r.smirnov@omp.ru>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 3 Mar 2025 17:48:43 +0300 you wrote:
> An error was found during fuzzing testing. When passing Unicode
> characters to bluetoothctl the application crashes in dbus:
> 
> dbus[5324]: arguments to dbus_message_iter_append_basic() were
> incorrect, assertion "_dbus_check_is_valid_utf8 (*string_p)"
> failed in file .../dbus-message.c line 2765.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] client: add input validation to main()
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=8479c279ea93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



