Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745BE1E2435
	for <lists+linux-bluetooth@lfdr.de>; Tue, 26 May 2020 16:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgEZOgO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 26 May 2020 10:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgEZOgN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 26 May 2020 10:36:13 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2BFBC03E96D
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 May 2020 07:36:13 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c75so10167091pga.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 May 2020 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LCEV3ZrXlklac0YuhlpaCMA8dYsILo8515UKdP2YSxA=;
        b=bI9stRK1P5sIEX4p3T4jo4s2NukCBt55WkPrwWeInABvveTDCf+BMXiC4H/GbLM0Ep
         CX8tOPQ/koheTWuCz/RGa3UBcA/ZGpCIkOssNdd8Q3k4z0cCkjv9qyWdghLhMlYkaFah
         2jALXB+DX0UJVW/1p4SEQV5E8t7PjPi9VI1KqBo5BvYt6kJDlZ1jHy1MBKf/wb89B5lW
         jAo27x7fsm5uuaoYxEOLbm9JWax2aa2aisZAojBou+Jlu4eFn03B/Dh5B12xj7KReF0v
         11+jndyH+oqBwGj96uKWhN18iMrof9qLnOv+uyKiwvhp1fEkpq62Y9iKSPG+QlDGUZby
         RJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LCEV3ZrXlklac0YuhlpaCMA8dYsILo8515UKdP2YSxA=;
        b=CoEmkKQMPIjZQ0rm7N4Iam2Bc+sZi9dKpp9t/0A4TDdSh80Jk3Sep303IZr+9AafO4
         itIOXodmbY6l6Euomr4c0JhKLZE6Ampxs1FZNGlyUw7cyAQeHsdFav9hBJv4RjwgQivm
         4pXT53EcMlENR/yUujrwuhk0mpVZRtncDQg8HCvD9q/T0a337eYdEph8z4kBZZbOxgty
         dCCuWF4nahg515j29cvZVRo2DiiE+DAT8qepXiT/zg8d+DwGuavhoJnWJLM4i8q9X9Im
         7vA25YLGEEJX7SR6OnLhemQA0Gkga3BZaDLlvPfWQJvChFWeQ2S9GvHEvQvk74r3kkFo
         NnBA==
X-Gm-Message-State: AOAM530MvircwCteBJ6Y2jzGM82Op1Gg3XrCIezVIzRyVBZE2KkN0CqW
        Ws3k+Rnvw8uxGiOO4tiwGf3J9mwU0Y0I9iXjDKWEvYpb
X-Google-Smtp-Source: ABdhPJzYlFptKljrnyGPoRdtgdhXf+8aVFm3mstuoHR8SPtLymBadXhghH4rTiVyveXMEbk5FWyDCdpoCxbty/DhvQY=
X-Received: by 2002:a65:4487:: with SMTP id l7mr1367550pgq.221.1590503772808;
 Tue, 26 May 2020 07:36:12 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Batyiev <batyiev@gmail.com>
Date:   Tue, 26 May 2020 17:36:01 +0300
Message-ID: <CAEQQxWzHgiK6KHCE4kM4KepayNT5EihusKBmzaJLx6DkFDifBg@mail.gmail.com>
Subject: [BUG] bluez: impossible to start/stop discovery over dbus if the
 first discovery have failed
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello everyone,

There is an interesting bug that causes StartDiscovery dbus method to
permanently
per connected dbus client. The root cause of it is incorrect
processing of errors
in src/adapter.c:start_discovery_complete function.

Steps:
0. bluetooth adapter should be powered down
1. start bluetoothctl and issue 'power on'
2. in separate console issue 'hcitool inq' (or otherwise make adapter BUSY)
3. return back to bluetoothctl and issue 'scan on'
4. there would and error 'Failed to start discovery: org.bluez.Error.InProgress'
5. wait until 'hcitool inq' completes
6. issue 'scan on' again
7. there would be same error 'Failed to start discovery:
org.bluez.Error.InProgress'

Expected:
7. discovery should start

My investigation:
1. in src/adapter.c:start_discovery, there is specific check with comment
"Every client can only start one discovery"
2. src/adapter.c:start_discovery adds new client into 'adapter->discovery_list'
3. in src/adapter.c:start_discovery_complete, if 'status' is not
MGMT_STATUS_SUCCESS,
the 'btd_error_busy' is sent to client, but client is not removed from
discovery_list
4. apparently, it leads to a situation where bluez thinks that client
have started discovery,
but adapter is not discovering

Personally, I'm not sure how to fix this bug (should the client be
removed from discovery_list on error?).

Hope it helps to fix the bug.

Thanks,
    Andrey
