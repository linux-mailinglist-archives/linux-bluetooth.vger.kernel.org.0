Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F424B9C8E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Feb 2022 10:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238900AbiBQJ4F convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Feb 2022 04:56:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238925AbiBQJ4E (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Feb 2022 04:56:04 -0500
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6A772128DEB
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Feb 2022 01:55:50 -0800 (PST)
Received: from smtpclient.apple (p4fefcd07.dip0.t-ipconnect.de [79.239.205.7])
        by mail.holtmann.org (Postfix) with ESMTPSA id B2D6CCECDF;
        Thu, 17 Feb 2022 10:55:49 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [BlueZ PATCH] shared: Fix the incorrect type with bit shift
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220217063145.50497-1-hj.tedd.an@gmail.com>
Date:   Thu, 17 Feb 2022 10:55:49 +0100
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <9ADB9AF8-0F3F-4B49-BA89-1026920C591A@holtmann.org>
References: <20220217063145.50497-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> This patch fixes the following runtime error:
> 
> $ sudo ./monitor/btmon -w test.btsnoop
>  Bluetooth monitor ver 5.63
>  src/shared/btsnoop.c:339:18: runtime error: left shift of 65535 by 16 places cannot be represented in type 'int'

what compiler version is this? Or what warnings did you enable? Since this is weird, so while yes 0xffff can not be shifted, but we are also not shifting into an uint16_t. The fix is fine, I am just curious. There will be other places with the same problem.

Regards

Marcel

