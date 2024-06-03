Return-Path: <linux-bluetooth+bounces-5091-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF1C8D89EF
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 21:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494EF2897C6
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 19:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132181386B9;
	Mon,  3 Jun 2024 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sc83gI5X"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852982D94
	for <linux-bluetooth@vger.kernel.org>; Mon,  3 Jun 2024 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717442431; cv=none; b=FG1VEjFLTy33ff94OBJ+1QANW4A8MPYHZj3lxgOSYM9coJQsa1T/gswk8+9MWK5ac9peHJ0RX3FbBzsl3BlQBTw50J951VUvJZW7pizVa5VLtLZ3SgpMEWo8kAhd6ZMg+AuBZ5Bi/KirBblhQbnzjoKyJmOyQtIu9POjAhbawXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717442431; c=relaxed/simple;
	bh=v8CnxmBJTnahR8+54nScLOr8r4UhFXnQJe6mbfUaxAk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=no+7FUeSE+2i7AHAckkPZGdq/QDemA67IS8wCjCiquiVnxvnRpWyAdDaNbSqol9ijzJfePHoXhUSL2n45kgK6+fmw0RfmGAZdit33gxiTeq6+mdPMWfXVCwphnuIghRw36onG8c+Rkn1/KXh9czRznP2AY9VtSW3SiO9FtMFKpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sc83gI5X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58E6EC32782;
	Mon,  3 Jun 2024 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717442431;
	bh=v8CnxmBJTnahR8+54nScLOr8r4UhFXnQJe6mbfUaxAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sc83gI5Xxm37UtfanMic0LkROxZioTRGDxobj1kB+vTzKc9hw8dRRmcHvca14lvFv
	 6eq4miscYdAFdJE9Ns9WH1KQJluuTaqUF3nzCUh9Q4zIfO/rU2Vmh1Bjcqq7Jv6/tT
	 JXX4lDYupio6w49l5Mgzbc/jeOAV8FGDx38/ZEAMfnAvthTdXUbiWWvwlvySo3hCM4
	 3TAHF/BQ17JAFIDFyUmBl7NlfVc/u/0ldYhqqEW2QSpSUM/c6/NRLcCz0t/VW3nR/Y
	 /Apo5xOFu5i0s4W42J8szL9tuoqfzU5z/vOox8CXsK1aEtavy+VmlmNrlPWstB+xI6
	 qkcmJdikeWcgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C612CF21FD;
	Mon,  3 Jun 2024 19:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/1] Fix GLib deprecation warning in
 example-gatt-client/server
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <171744243130.17125.14523008723819707357.git-patchwork-notify@kernel.org>
Date: Mon, 03 Jun 2024 19:20:31 +0000
References: <20240531193622.1696328-1-me@prestonhunt.com>
In-Reply-To: <20240531193622.1696328-1-me@prestonhunt.com>
To: Preston Hunt <me@prestonhunt.com>
Cc: linux-bluetooth@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 31 May 2024 12:36:21 -0700 you wrote:
> Updates example-gatt-client and example-gatt-server sample applications
> in test/ directory to fix deprecation warning:
> 
>     PyGIDeprecationWarning: GObject.MainLoop is deprecated; use
>     GLib.MainLoop instead
> 
> Also, remove python2 import since the script is run with a python3
> shebang.
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/1] test/example-gatt: fix deprecation warning
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=684a17f7cc78

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



