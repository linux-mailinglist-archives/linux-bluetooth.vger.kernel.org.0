Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63CFCDF0CD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Oct 2019 17:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbfJUPFh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Oct 2019 11:05:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46145 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbfJUPFg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Oct 2019 11:05:36 -0400
Received: from marcel-macbook.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id 75FB9CECA3;
        Mon, 21 Oct 2019 17:14:33 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH V4 01/10] bluetooth: hci_bcm: Fix RTS handling during
 startup
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1570375708-26965-2-git-send-email-wahrenst@gmx.net>
Date:   Mon, 21 Oct 2019 17:05:32 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F722AF4D-B6C8-495E-B4F0-B4DD113C1938@holtmann.org>
References: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
 <1570375708-26965-2-git-send-email-wahrenst@gmx.net>
To:     Stefan Wahren <wahrenst@gmx.net>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Stefan,

> The RPi 4 uses the hardware handshake lines for CYW43455, but the chip
> doesn't react to HCI requests during DT probe. The reason is the inproper
> handling of the RTS line during startup. According to the startup
> signaling sequence in the CYW43455 datasheet, the hosts RTS line must
> be driven after BT_REG_ON and BT_HOST_WAKE.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
> drivers/bluetooth/hci_bcm.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

