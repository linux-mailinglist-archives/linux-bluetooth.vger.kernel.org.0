Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81ADB1A1181
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Apr 2020 18:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgDGQfU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Apr 2020 12:35:20 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58633 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbgDGQfU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Apr 2020 12:35:20 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id EB200CECD8;
        Tue,  7 Apr 2020 18:44:52 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: Simplify / fix return values from tk_request
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200406185438.13576-1-sonnysasaka@chromium.org>
Date:   Tue, 7 Apr 2020 18:35:18 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 8BIT
Message-Id: <B002F0D0-77CA-4ED6-A810-9C8940D47A43@holtmann.org>
References: <20200406184523.GA49680@roeck-us.net>
 <20200406185438.13576-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> Some static checker run by 0day reports a variableScope warning.
> 
> net/bluetooth/smp.c:870:6: warning:
> 	The scope of the variable 'err' can be reduced. [variableScope]
> 
> There is no need for two separate variables holding return values.
> Stick with the existing variable. While at it, don't pre-initialize
> 'ret' because it is set in each code path.
> 
> tk_request() is supposed to return a negative error code on errors,
> not a bluetooth return code. The calling code converts the return
> value to SMP_UNSPECIFIED if needed.
> 
> Fixes: 92516cd97fd4 ("Bluetooth: Always request for user confirmation for Just Works")
> Cc: Sonny Sasaka <sonnysasaka@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
> net/bluetooth/smp.c | 9 ++++-----
> 1 file changed, 4 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

