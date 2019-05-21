Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C7924F4C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2019 14:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfEUMxD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 May 2019 08:53:03 -0400
Received: from mail-it1-f170.google.com ([209.85.166.170]:34996 "EHLO
        mail-it1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbfEUMxD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 May 2019 08:53:03 -0400
Received: by mail-it1-f170.google.com with SMTP id u186so4504962ith.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2019 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=zWHQ32VI1Y2R+luv2fNTT89KWnLaiAHxjRtX2t4MpbI=;
        b=B3uEbQQQ1DfhSwuf48asgHGGxQilFcacWxQRBSCY0t+ggO2+l+ktHEnFLYeieK+Ip6
         YtVxZjqN6WDDLlu3pT+erlr8jtVGFkGQ1XGOFo0tv2j9oQgbv8pHlkkJ6U5T63IYM3Po
         J4JNmykZdYMyfHkuQfvCWDGrJeYzCgmGx9ccRvrKVogEcFwPgtbsqt7siY4NssgjWzME
         67+FJ3BxJsnN9XZ+1fWbkGxdICk1a6MDV5RRwMWZcDi4j5Zr2BKmWB/pDx3iGf0C/+dS
         aOfI835jyiPndeG2AlkqSgsptgygfiygQlJbvz7ltava8RfGfmlc5B/LbCmVjgA2JiaB
         jwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zWHQ32VI1Y2R+luv2fNTT89KWnLaiAHxjRtX2t4MpbI=;
        b=Mfv0hTMQU1FynsHADvi8P1LbJA2kkB4EcEf19X21l7NlnNa0kl7FgVBgwxRDTP6zna
         8XWLrGq7qZpp94xK2jj9wm8zhwQHrvDRM18zd1k/9Vb/9oJTLoPmUxYeW3Mwtgu53VTt
         7F38ddZatFENGI8NTT+5zRC/vo/zySndoHYA8LsvQAFqa5KIZZE9sp7ASrhlAupqYh/1
         QIS4lrUIP0B8xKcaswBKquEpG2OuP0T+TJCMuMG1iX1mA3Y/CAxgFKA1DAxiSprkpbPa
         gCE7n303jB1wrGn7zDUY7ojKq7ch1qSVgFDAIUz6aFz+5j/Z0r7IY8fRlQegcKAgH88n
         JtEg==
X-Gm-Message-State: APjAAAWXum8YXQOMghCSnm/5WYwMTCDdd/T/LnAjzphWWztegK3DV/b1
        ZkI7Hz4it4PtnuD7oMMz3OTVsILci//PNYWLZ4z2UcBJDLQ=
X-Google-Smtp-Source: APXvYqxMVgkGPIYWySRoKGzCX3Ocho1bG17ZNth7npGCShqs8GMDawl3ZKCrN62HMr19NkZlB7znnZYeYjaAfWdEPiY=
X-Received: by 2002:a24:3a50:: with SMTP id m77mr3720898itm.110.1558443182115;
 Tue, 21 May 2019 05:53:02 -0700 (PDT)
MIME-Version: 1.0
From:   Roland Vet <vet.roland@gmail.com>
Date:   Tue, 21 May 2019 14:52:51 +0200
Message-ID: <CAJURbm_RGyMgYCAyzfpQ76q9YwsOjcOtM7PtZykWegaftb28DQ@mail.gmail.com>
Subject: Bluez does not recognise AAC codec for AKG Y500
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I was told it was best to report this here. I'm having issues using
the AAC codec and using `avinfo' bluez does not seem to recognise any
audio sink codec except SBC for my AKG Y500.

More info:
https://github.com/EHfive/pulseaudio-modules-bt/issues/57#issuecomment-493776263

Don't know what else to report, hope this is enough to be useful. If
there are any other useful logs to report please let me know.

Greetings.
