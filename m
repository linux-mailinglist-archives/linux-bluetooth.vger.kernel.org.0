Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6121C6EE6
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 13:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgEFLGc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 07:06:32 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56194 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgEFLGc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 07:06:32 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id B3E81CED02;
        Wed,  6 May 2020 13:16:12 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] build: Add an option to explicitly disable installing
 hid2hci
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200506005528.2897-1-sonnysasaka@chromium.org>
Date:   Wed, 6 May 2020 13:06:31 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <56F32068-E8EC-45DD-B233-DBDAFBFA0187@holtmann.org>
References: <20200506005528.2897-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> ---
> configure.ac | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 1433ace4a..ba9937a16 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -218,8 +218,11 @@ if (test "${enable_udev}" != "no" && test -z "${path_udevdir}"); then
> fi
> AC_SUBST(UDEV_DIR, [${path_udevdir}])
> 
> +AC_ARG_ENABLE(hid2hci, AC_HELP_STRING([--disable-hid2hci],
> +		[disable hid2hci tool]), [enable_hid2hci=${enableval}])
> AM_CONDITIONAL(HID2HCI, test "${enable_tools}" != "no" &&
> -						test "${enable_udev}" != "no")
> +					test "${enable_udev}" != "no" &&
> +					test "${enable_hid2hci}" != "no")

can you give me a bit of background why you need that. We did have that and I removed it in favor of putting everything behind udev. Mainly since we really don’t need most of these things anymore. Can’t you just disable udev support and get the same result?

Regards

Marcel

