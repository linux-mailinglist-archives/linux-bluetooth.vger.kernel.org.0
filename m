Return-Path: <linux-bluetooth+bounces-785-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0C881F821
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Dec 2023 13:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1244EB21350
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Dec 2023 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5C6748E;
	Thu, 28 Dec 2023 12:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlnJ6fLM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710057466;
	Thu, 28 Dec 2023 12:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71F2C433C8;
	Thu, 28 Dec 2023 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703765457;
	bh=gC2BNbPpsT8NBQuqVA/gwgYEvuw7NsOU5Nw1q+1sLtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlnJ6fLMKC+M7L6MuT6FYUKuSqH0fbr+u0SBvsa5rWauRKMtFMt+w3ATQHP5Hk0Cg
	 3SqcW5A33OeLeWbQ8hlH7oGJDwtIxne9C38wNjQmS3LkhAIty37+cuP20OsCnu3BcD
	 yfSDBZOmOxHE88e39ei8kJpahk9eZSYM7uaHVLu8U8DDPfMhiwmCXS30sbyk/i8b3M
	 yOtcGxoJIcGw+ozu4Pn/kItozA886UP1hosPmApYc3cgqDIVx0ZKEZaLFVI2go5A9e
	 +8jL60BTu5EetftSMfXNg/KtyzxMdQXDZDvK6CrUujHyi2hMONioowCDYv6V0lK9SY
	 +Qz6jVjvsvwkw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rIpDv-00046r-1D;
	Thu, 28 Dec 2023 13:10:52 +0100
Date: Thu, 28 Dec 2023 13:10:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Felix Zhang <mrman@mrman314.tech>,
	linux-bluetooth@vger.kernel.org, stable@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>, kekrby@gmail.com,
	admin@kodeit.net, Janne Grunau <j@jannau.net>,
	Aditya Garg <gargaditya08@live.com>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Bluetooth: Fix Bluetooth for BCM4377 on T2 Intel
 MacBooks
Message-ID: <ZY1ly_uB8huYl5jO@hovoldconsulting.com>
References: <AB87C916-9CF9-4B8C-AFF5-74CA4151C4FC@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB87C916-9CF9-4B8C-AFF5-74CA4151C4FC@svenpeter.dev>

On Thu, Dec 28, 2023 at 10:46:57AM +0100, Sven Peter wrote:

> > On Dec 27, 2023, at 11:30, Johan Hovold <johan@kernel.org> wrote:

> > The commit you tracked this down to restored the original semantics for
> > HCI_QUIRK_USE_BDADDR_PROPERTY, which means that it should only be set
> > for devices with an invalid address.
> > 
> > The Broadcom BCM4377 driver has so far been setting this flag
> > unconditionally which now potentially results in also valid addresses
> > being marked as invalid.
> > 
> > I've just sent a patch that makes sure to only mark invalid addresses as
> > invalid:
> > 
> > https://lore.kernel.org/lkml/20231227101003.10534-1-johan+linaro@kernel.org/
> > 
> > Note however that the flag still needs to be set in case your device
> > lacks storage for a unique device address so you cannot simply drop it
> > for some device classes as you do below (unless you are certain that
> > these devices will always have a valid address).

> We do know that though.
> 
> BCM4377 is present on Apple’s x86 Macs and always has internal storage
> for the address. If the board comes up without an address there’s nothing
> much we can do because the address isn’t provided by ACPI or anything
> else and setting the invalid address quirk for that situation seems appropriate.
> 
> BCM4378/4387 is present on Apple’s ARM Macs and never has internal storage.
> The address is always provided by our bootloader in the device tree.
> These should always unconditionally set HCI_QUIRK_USE_BDADDR_PROPERTY
> just like this patch does.

Ok, good, then this patch and the one I posted are mostly equivalent
assuming that the BCM4378/4387 return an invalid address during setup.

This patch may be preferred as it does not need to rely on such
assumptions, though.

Johan

