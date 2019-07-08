Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6939261A52
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jul 2019 07:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbfGHFhK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jul 2019 01:37:10 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:41394 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfGHFhK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jul 2019 01:37:10 -0400
Received: by mail-io1-f52.google.com with SMTP id j5so13022343ioj.8
        for <linux-bluetooth@vger.kernel.org>; Sun, 07 Jul 2019 22:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orcam.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OAhvcCQaMh7H2QS0isqmwJnFxoeSY05Sn6R4RPHdl3k=;
        b=YekBBksMq2s9n4hsoAAe+H0d8fq2xsbkuogrR5hcw5VSLD43sHyaIc09GeXy7vT9w1
         fgA95SBsPzidWmOx1lbP0TMxlU/Y+d10Prqutv1BJUxtRxYHOEbrB25+A/sjw7MdpJmM
         C5c1Tb0IV8eDc4m3BjmcQgw+GUDbj1l11a30k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OAhvcCQaMh7H2QS0isqmwJnFxoeSY05Sn6R4RPHdl3k=;
        b=kM2K3yxBru/EHM0lsx6gMWwjOlo2ijEwZZdsbJZW/RKrZ0SWoo0OuZ9/zMxp53hmJo
         bCKbEqQgWVQ2h6YTw6jdBWGhCklUlUDtWQ9GdOWrkD9CE1Y4lrIwQYk+RjRBJbBYo2jy
         M1xuidRhmYYGmAPXiidwj/oDvUq1EqDvEvv6tp2nCYm83DEzXmWUGWTbhxAjsiOPbHGv
         NXbmg/GtbJtsNAgCUhft4xPkNCUk3ghxp0GO0cNshT22yztRIZmF9yewNhbLhAuNpd0u
         IIL3EXLBT11JPOEvbimgJRK7HPRtCBVDLs0/D5U5zfcUzjB6aaiwd0B/t/mQb5QbA9OR
         r9OQ==
X-Gm-Message-State: APjAAAU87Z20amRX7hr+YBZmXpEWoMU/T5QRe46zcG2Drlis8vEe57Qk
        Zct8192mGJCqAVyuEQIpi6GiDGemqqy2zUdoiaXjLaHqRdc=
X-Google-Smtp-Source: APXvYqyv8WqgtXBnPS8CrIzwtVlJQ00Bi3DDyWcmnrrr7VsQPoUC+rxd/qCYIQNypy8lM+WhuHblSx2o2+U7PBQwJI8=
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr10096292ioc.76.1562564229294;
 Sun, 07 Jul 2019 22:37:09 -0700 (PDT)
MIME-Version: 1.0
From:   Ordit Gross <ordit.gross@orcam.com>
Date:   Mon, 8 Jul 2019 08:36:58 +0300
Message-ID: <CAB+bgRbdnkuS0ZMOPP8VoQEcLXSj6sW9soC-9fjJU+wN0gMWGQ@mail.gmail.com>
Subject: Bluetoothctl scan question
To:     linux-bluetooth@vger.kernel.org
Cc:     Naama Paz <naama.paz@orcam.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hi,

I would like for  bluetoothctl scan on to have only "new" results for each scan.
I see in the src/adapter.c that the old devices which aren't bonded
are dropped via "remove_temp_devices" function.
how can I find bonded devices in scan?
I would like to be able to use connect function only if a device is
present (really found by scan- not  cached).
currently unable to since the scan is keeping the bonded devices in
the devices list.
how can I overcome this?

also, I understand from google that the suggested approach is to
remove_device, which isn't acceptable since the device would then be
unpaired..
* I could in theory remove_device then push keys into the kernel, but
wouldn't this cause other connections to drop?

thanks in advance
