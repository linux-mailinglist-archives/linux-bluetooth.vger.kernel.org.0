Return-Path: <linux-bluetooth+bounces-4213-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EECF8B8593
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 May 2024 08:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B699B218C9
	for <lists+linux-bluetooth@lfdr.de>; Wed,  1 May 2024 06:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE55F2233B;
	Wed,  1 May 2024 06:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVDPZamX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4147C623;
	Wed,  1 May 2024 06:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714545088; cv=none; b=aYtiCWHGkkVPSKGRFRmCQ6vlY1RE81o41jzZ2bbkNTTd0zsN+sb5eN9IRBb/8qJ4vc0x9+QjQg/FnlU5ZXuBilcXkFUC4mSg+zNuSOIr8t4b+P7eu83XwC1X3Kq8O1GMkoNrwD6cTyHV6EiIQqNfFKF1XoCZsswcsE+sd3FHd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714545088; c=relaxed/simple;
	bh=+NEw0zG256e9wBP7XNqQlXuEItB7kZVWlZ0f0b746fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcoCMs1yNMZmeQV+aLaW3W0cs12c5WReBlEdU4xvJCmWXw85Df10Md7t/JmvCZGdRdHn/ZVRc+7HWXpOwpafVmM/3TTWfdDUIqFbEa03f4Y0STCOTlACLmGzqROS83fqTEv+/bH+TMAKLbQOY0m25G5pgMuOEhC+TlOSOxJEjhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVDPZamX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC56BC113CC;
	Wed,  1 May 2024 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714545087;
	bh=+NEw0zG256e9wBP7XNqQlXuEItB7kZVWlZ0f0b746fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cVDPZamX2U6TvxlkPICFGVBeE5BIOdqC+6AFqRLPnGan8VMBHV08RoR6bGMmD3vVe
	 1JGkyKWr1Vevebd7JsXz+E7aF6EfwPPTbXbJ8aJGvGBqiI/07r+aTnVOPUQQXcZKVX
	 LRENOzCkQtIKpUBwCTeOX1C6YMxExq14ZIAbxrwkKJwokDb5/BzusaEqBg3IT+oNHX
	 vHBc9zsHxfWNr2zBKQx8Q0ZgAzPf4iQoA/HtgeKBuhsbof6oErSc2qwksM/FLAPzgO
	 PI6ungdBllGlRqq8O5Rxui1ZdagpQxThaiNxPRmI5W60SGC9SqKOcMl1ecAeU9qVSy
	 u9HRbFo4JSlnw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s23V3-000000008Gb-34AC;
	Wed, 01 May 2024 08:31:29 +0200
Date: Wed, 1 May 2024 08:31:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Bluetooth: qca: generalise device address check
Message-ID: <ZjHhwaGkDsy7lYwJ@hovoldconsulting.com>
References: <20240430170741.15742-1-johan+linaro@kernel.org>
 <20240430170741.15742-4-johan+linaro@kernel.org>
 <CAD=FV=XAF1_faO2uRzo0Sm0VOxWmqs7YCT0Ncw=Nv1iSndhBZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XAF1_faO2uRzo0Sm0VOxWmqs7YCT0Ncw=Nv1iSndhBZA@mail.gmail.com>

On Tue, Apr 30, 2024 at 02:21:47PM -0700, Doug Anderson wrote:
> On Tue, Apr 30, 2024 at 10:08 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > The default device address apparently comes from the NVM configuration
> > file and can differ quite a bit between controllers.
> >
> > Store the default address when parsing the configuration file and use it
> > to determine whether the controller has been provisioned with an
> > address.
> >
> > This makes sure that devices without a unique address start as
> > unconfigured unless a valid address has been provided in the devicetree.
> >
> > Fixes: 00567f70051a ("Bluetooth: qca: fix invalid device address check")
> > Cc: stable@vger.kernel.org      # 6.5
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

> I can confirm that my sc7180-trogdor-based devices manage to detect
> the default address after this series and thus still look to the
> device-tree for their address. Thus:
> 
> Tested-by: Douglas Anderson <dianders@chromium.org>

Thanks for testing, Doug.

> I'll continue to note that I still wish that detecting the default
> address wasn't important for trogdor. I still feel that the fact that
> they have a valid BT address stored in their device tree (populated by
> firmware) should take precedence. ...but I won't insist.

When I can find the time, I'll look into at least dropping the BD_ADDR
quirk in favour of always looking in the devicetree when we do not have
a valid address. That may be a good time to revisit the question whether
the devicetree should always override the controller's address too.

Johan

