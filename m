Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4DAF514E32
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Apr 2022 16:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377917AbiD2Ow0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 Apr 2022 10:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377919AbiD2OwZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 Apr 2022 10:52:25 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B115939BB
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Apr 2022 07:49:04 -0700 (PDT)
Received: from smtpclient.apple (p5b3d2ea3.dip0.t-ipconnect.de [91.61.46.163])
        by mail.holtmann.org (Postfix) with ESMTPSA id E034FCED21;
        Fri, 29 Apr 2022 16:49:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] btusb: CSR chip hangs when unbound
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220429114113.356263-1-jtornosm@redhat.com>
Date:   Fri, 29 Apr 2022 16:49:03 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <B8BA4391-6F9D-4D3A-AF30-C2A3FC399D1D@holtmann.org>
References: <20220429114113.356263-1-jtornosm@redhat.com>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Jose,

> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by Trust)
> hang when they are unbound from 'unbind' sysfs entry and can not be bound
> again.
> 
> The reason is CSR chip hangs when usb configuration command with index 0 
> (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this command 
> for CSR chip when usb device is unbound. Besides, "skip_unconfigure"  sysfs 
> entry has been created for testing purposes with these or other devices.
> 
> Athough device is not unconfigured, it is better to avoid device hanging to
> be able to operate. Even bluetooth can be previously turned off.
> On the other hand, this is not important if usb device is going to be bound 
> again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> drivers/bluetooth/btusb.c  |  6 ++++++
> drivers/usb/core/generic.c |  2 +-
> drivers/usb/core/sysfs.c   | 36 ++++++++++++++++++++++++++++++++++++
> include/linux/usb.h        |  2 ++
> 4 files changed, 45 insertions(+), 1 deletion(-)

send this to the USB guys first and get their ACK.

Regards

Marcel

