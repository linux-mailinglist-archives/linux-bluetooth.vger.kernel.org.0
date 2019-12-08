Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9E0116433
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Dec 2019 00:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbfLHXse (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Dec 2019 18:48:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:49618 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLHXse (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Dec 2019 18:48:34 -0500
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6F338CED16;
        Mon,  9 Dec 2019 00:57:42 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 1/1] ARM: dts: rockchip: Add brcm bluetooth for
 rk3288-veyron
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191127223909.253873-2-abhishekpandit@chromium.org>
Date:   Mon, 9 Dec 2019 00:48:31 +0100
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Douglas Anderson <dianders@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        linux-rockchip@lists.infradead.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <61639BAF-5AA0-4264-906F-E24E2A30088D@holtmann.org>
References: <20191127223909.253873-1-abhishekpandit@chromium.org>
 <20191127223909.253873-2-abhishekpandit@chromium.org>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

> This enables the Broadcom uart bluetooth driver on uart0 and gives it
> ownership of its gpios. In order to use this, you must enable the
> following kconfig options:
> - CONFIG_BT_HCIUART_BCM
> - CONFIG_SERIAL_DEV
> 
> This is applicable to rk3288-veyron series boards that use the bcm43540
> wifi+bt chips.
> 
> As part of this change, also refactor the pinctrl across the various
> boards. All the boards using broadcom bluetooth shouldn't touch the
> bt_dev_wake pin.

so have these changes being merged?

Regards

Marcel

