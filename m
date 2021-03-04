Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C52132D4C6
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 15:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233875AbhCDOC7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 09:02:59 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51468 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234098AbhCDOCu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 09:02:50 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 0D0451F46436
Message-ID: <f6764fe94d45ff9211674c5799b193d15385a056.camel@collabora.com>
Subject: Bug caused by moving to BlueZ 5.56 (bytes stripped from HoG reports)
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Date:   Thu, 04 Mar 2021 15:02:01 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi all,

I discovered this fix https://github.com/bluez/bluez/commit/35a2c50 while
debugging a fwupd plugin for a HoG device that implements its FW upgrade
mechanism using vendor-specific HID reports (
https://github.com/fwupd/fwupd/blob/master/plugins/pixart-rf/fu-pxi-device.c).

Initially, the developers were using BlueZ versions prior to 5.56, which is the
first release that includes that fix, so their code was written with that
behavior in mind. After moving to 5.56 we found out it crashed and we needed to
adapt the code to the proper report format. I think this is the kind of issues
that Dean mentioned here 
https://marc.info/?l=linux-bluetooth&m=160590969013204&w=2

Have there been any more reports like this? Is this expected to have a greater
impact than initially thought?

Cheers,
Ricardo

