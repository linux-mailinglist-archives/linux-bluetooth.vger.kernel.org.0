Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B491C6F43
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 13:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgEFLY3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 07:24:29 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51538 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgEFLY3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 07:24:29 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2F5E6CED03;
        Wed,  6 May 2020 13:34:09 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] build: Add option to disable battery profile
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200501215352.23858-1-sonnysasaka@chromium.org>
Date:   Wed, 6 May 2020 13:24:27 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <4A9E7F0B-4AB8-4330-BB2B-1A0EAA4EFDE8@holtmann.org>
References: <20200501215352.23858-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> Some clients may want to handle battery profile through the generic GATT
> interface rather than BlueZ's internal Battery interface.
> ---
> Makefile.plugins | 2 ++
> configure.ac     | 4 ++++
> 2 files changed, 6 insertions(+)
> 
> diff --git a/Makefile.plugins b/Makefile.plugins
> index 98eee9ec8..b9733d31c 100644
> --- a/Makefile.plugins
> +++ b/Makefile.plugins
> @@ -101,8 +101,10 @@ builtin_cppflags += $(ALSA_CFLAGS)
> builtin_ldadd += $(ALSA_LIBS)
> endif
> 
> +if BATTERY
> builtin_modules += battery
> builtin_sources += profiles/battery/battery.c
> +endif
> 
> if SIXAXIS
> plugin_LTLIBRARIES += plugins/sixaxis.la
> diff --git a/configure.ac b/configure.ac
> index 1433ace4a..d4fa862b5 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -181,6 +181,10 @@ AC_ARG_ENABLE(hog, AC_HELP_STRING([--disable-hog],
> 		[disable HoG profile]), [enable_hog=${enableval}])
> AM_CONDITIONAL(HOG, test "${enable_hog}" != "no")
> 
> +AC_ARG_ENABLE(battery, AC_HELP_STRING([--disable-battery],
> +		[disable battery profile]), [enable_battery=${enableval}])
> +AM_CONDITIONAL(BATTERY, test "${enable_battery}" != "no")
> +
> AC_ARG_ENABLE(health, AC_HELP_STRING([--enable-health],
> 		[enable health profiles]), [enable_health=${enableval}])
> AM_CONDITIONAL(HEALTH, test "${enable_health}" = "yes")

I have a little bit concern splitting this since battery service and HoG are kinda connected. Wouldn’t it be better we have a cleaner interface. Maybe we should actually integrate cleanly with /dev/upower or similar.

Regards

Marcel

