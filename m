Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB2A217D2C9
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2020 10:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgCHJEB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Mar 2020 05:04:01 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57239 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgCHJEB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Mar 2020 05:04:01 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8D7F4CED16;
        Sun,  8 Mar 2020 10:13:28 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3 1/5] Bluetooth: L2CAP: Add definitions for Enhanced
 Credit Based Mode
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200303005623.18917-1-luiz.dentz@gmail.com>
Date:   Sun, 8 Mar 2020 10:04:00 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <01575BF3-B5CE-4A3C-811F-FBD734B8D2EA@holtmann.org>
References: <20200303005623.18917-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This introduces the definitions for the new L2CAP mode called Enhanced
> Credit Based Mode.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> v3: Move patch adding BT_MODE to last so others that don't expose any API to
> userspace can be applied first.
> v2: Make BT_MODE conditional to enable_ecred.
> 
> include/net/bluetooth/l2cap.h | 39 +++++++++++++++++++++++++++++++++++
> 1 file changed, 39 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

