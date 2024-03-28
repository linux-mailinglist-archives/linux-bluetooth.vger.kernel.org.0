Return-Path: <linux-bluetooth+bounces-2620-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 111168800F5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Mar 2024 16:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43731F21C53
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Mar 2024 15:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3096E81751;
	Tue, 19 Mar 2024 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bodD7nte"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF0651BB;
	Tue, 19 Mar 2024 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710863173; cv=none; b=UkAzK4qiCzxAFGjrdlExCbFVpxueN0Dan2+/3SZxnfPGebJ2TZ0GlZnET8vwCIMm8xRWFwTDi4XKv60iBt/7RPeyHLcO3lnDEA0WpHQMHbExfxU2nNW53u7GY2fxYlR9Gd8NGHPCVsBFNkBmdqeyKxpDKIZUdcmQUa3e6uLKJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710863173; c=relaxed/simple;
	bh=da+1hNRTyMVfcsK6G0HeO+cvAgOIHHK1/aJWC87nXEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UAM80J6ER0rw75770w2qngxMp8cUbhZ/PYc9E0nt1OVKeFrox9D4ZxjzP5MHZNLnmHU9yiQaCo5xMAq4oxrr6m1juyH7EFPlwf4jPJJZtaZ0v5Tqiu55A1j2CWjdOHZrtsIhDjDmrgUQ+0VhqpWBBy6iVluG9LrkX6Z32CB/PzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bodD7nte; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC4AC433C7;
	Tue, 19 Mar 2024 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710863173;
	bh=da+1hNRTyMVfcsK6G0HeO+cvAgOIHHK1/aJWC87nXEc=;
	h=From:To:Cc:Subject:Date:From;
	b=bodD7nte+cWTXLzKlp4OpxNchhZl1Z5lZKGTRvetAOgNT3xBADYx+Qqg0XtXc+q/a
	 11bjFRauPsJDMRgdZZEi7nF43811z3r5CIh3f4P2HHwb2y3YR90aicNnKjTa8OqoLa
	 +AmU4pVR3jGEl4El2H6yNuLOZHz34w28Fp2larTKRvRizXRkStFQl1xO5dvdsNBibr
	 YipGaBkgRgMVRSc7a0meuT/XubgB+ufe7lCYLDOd0z56E0ZisCT4xGHwmf+jmP2FiH
	 8a4iHzWL5/K4nsF0aFnhnDR/PDpFX+B7qBh+koc5rMn8XP3QSeUYQujm1uocd/IlLs
	 1pMyqjJPZWXDA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rmbfQ-000000000eT-15Pm;
	Tue, 19 Mar 2024 16:46:20 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zhengping Jiang <jiangzp@google.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] Bluetooth: qca: fix NULL-deref on non-serdev setup
Date: Tue, 19 Mar 2024 16:46:09 +0100
Message-ID: <20240319154611.2492-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm Bluetooth controllers can be registered either from a serdev
driver or from the Bluetooth line discipline. In the latter case, the
HCI UART serdev pointer is NULL, something which the driver needs to
handle without crashing.

This series fixes one such issue at setup() time which incidentally
masked a similar crash at suspend. Fix this in two separate patches so
that the latter issue is address in pre-6.2 stable kernels.

Johan


Johan Hovold (2):
  Bluetooth: qca: fix NULL-deref on non-serdev suspend
  Bluetooth: qca: fix NULL-deref on non-serdev setup

 drivers/bluetooth/hci_qca.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.2


