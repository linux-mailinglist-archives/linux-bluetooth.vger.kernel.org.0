Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596BD27A852
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Sep 2020 09:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgI1HKE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Sep 2020 03:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1HKE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Sep 2020 03:10:04 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FFBC0613CE
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Sep 2020 00:10:03 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 34so28263pgo.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Sep 2020 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.ucsb.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=tLpFqGmONnM4XRMr6RIu8zu3ZNm8bEKVBTg/JYiEBOg=;
        b=RY61Te3Oa3hKqiGhQl3u7YY40GX1TudEWesMq6fuyL97osV8nF8XWL0bCla/yP0K5K
         w1s8AT44qXv2h10FlbJVz/1+N8sDrzHFbeHMUtk1QBvgh+DbLxgoxduhTsuyimKCh6uQ
         u9ZbatgIrCz3I2hQkMiLQ1tsoVaA8SocfMTv/uq5cZNDJ9sXytLvOm93p2KLyff51Okm
         vYr2qf6rIiGOCl4ntdRxezJCC7PiJwmr3C55Bqvb3ksaYQnRl4SeQKN7ySXO3SvymJAn
         Mguz6HIbmrl77D1eToQj0S+lomWSi3rPT7KvVZxPbllXp/f91yD4m34xZvNSiQVubh32
         W+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=tLpFqGmONnM4XRMr6RIu8zu3ZNm8bEKVBTg/JYiEBOg=;
        b=R0mj5o5lQlw9i2EjTSLbb8j7x+7Whb+nYI7agddjPj/Aq3mVN9VnsxuLRD9dEQK8lp
         CoatWKJXN5XWOnKWI/1BXk5PYSBJhdyX28Y/q1ONIvVmc0l/LuMLUe3inRjPkPmQi/nG
         59tGV3fABQTP5xgnPQtsfOc5ZhcgtakMhtHdME317NqHtwjWfqzv57rTa25J5q8k7bbK
         gLIapJMxH+XeCLbF4sckwFMyG2VZbWJXIUzFbkIUN1jE2hGUtkmFV6QC4uyvqUy4FB3U
         hKoH0jcCj+vnwdXxBQEBuf+gXc/yxSVfp7MryOqJfgW/luBphBTrJghRojQVsoxXtGM5
         j7Pg==
X-Gm-Message-State: AOAM5319JE7QUcC5FoHHmY6pWoYvW8SbGeBOgAynPWwhKw2g70qvMnVx
        RIyymPooiccE0wIdOfBJ4K/Da7/cTcQe3zE+giXA+vlmS6Q=
X-Google-Smtp-Source: ABdhPJz5jaeqFP8gFEfybRhUH2cl1IOU+afMfTw/ci4KbPOULgg0gjX83KSLvdkwaTmh0uFYMJW/1z2KCHdx+qnvmlw=
X-Received: by 2002:aa7:871a:0:b029:138:b052:3dc2 with SMTP id
 b26-20020aa7871a0000b0290138b0523dc2mr304920pfo.1.1601277003296; Mon, 28 Sep
 2020 00:10:03 -0700 (PDT)
MIME-Version: 1.0
From:   Aravind Machiry <machiry@cs.ucsb.edu>
Date:   Mon, 28 Sep 2020 00:09:52 -0700
Message-ID: <CANozA0iGDYLM9-Nm4eOxPr7TM=BYDrWRbaA4z6uB1-A3R16KfQ@mail.gmail.com>
Subject: Replacing malloc/memset with calloc
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

There are several places (at least in sdp.c) where `malloc` and
memset(,0,) pattern Is used. All these can be replaced with calloc for
efficiency.

Is there any specific reason why malloc/memset is preferred?

-Best,
Aravind
