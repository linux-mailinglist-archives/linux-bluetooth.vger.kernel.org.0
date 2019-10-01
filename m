Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFF0C35D6
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Oct 2019 15:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfJANgb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Oct 2019 09:36:31 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:43005 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfJANgb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Oct 2019 09:36:31 -0400
Received: by mail-io1-f52.google.com with SMTP id n197so47900697iod.9
        for <linux-bluetooth@vger.kernel.org>; Tue, 01 Oct 2019 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orcam.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=xptUfIg1LxhewXf6g2jzYGfx98LgHDphMvrOIVGHzKs=;
        b=BF/8aMUGhJRk9zoAs6Iu0bOsqdeVlngYDTABmHCd+2DuNnAcH4vEEtGdZIuXtNPGAm
         5HzAbqeVMgPowpMwnocxD+0ePn0cOeBS+09tP9WQtkcGAEptQmYP9QrEJ6Eah8DdcEGD
         pJwO2Ep29GSWpJiKLiW0a2NwPh2C8vy527ePk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xptUfIg1LxhewXf6g2jzYGfx98LgHDphMvrOIVGHzKs=;
        b=lPBLfvk5o/dIv9/wRrCCJTWqfEi646SdnQ0PDj70fHXgPSwRuMpDPau+8bx8AzGYzH
         2RhRlLuDu4YD0xINuwVcOyLqEPsZ/R8TnRKsICP0WP3Olj4Cbqm04LFJGYRsJnMC/zd6
         zIs4Me5Ywnf2ye2Znv5rTLQaepX3hqowzoguqo/HkY1GniqbpcMtGgzzITkm0YSDB3/R
         8NNhuxLoULwGLjda2cE3WtzhdTFgSCf8l2KoWY9MGJj+CrVESLt34MST7GhJT5iXYIwG
         OAey3DiOpMyggBzApXRBKr7aw6NonXZcQVZd3Wt50MadIR+UmBc2VGZZdjEENo6nXb/0
         zmEw==
X-Gm-Message-State: APjAAAUamKpOQzT9CS9wk9JvPJiNkoonpERSdC4DZknW7HSOOQv0pwoa
        sWlx/lNTdr6k/GcTQHw7Vc04LsMGvopLJO5kcHuA5AWR1cI=
X-Google-Smtp-Source: APXvYqyY8qT+uYCPKS+k1LJBun2LiOn0/qtYehgjwE3mIf1Z0smyxnPxcaNfWo+WCtnUTJ9OXMbURGZ2C/vVhskvjxU=
X-Received: by 2002:a5e:c241:: with SMTP id w1mr9634835iop.36.1569936990617;
 Tue, 01 Oct 2019 06:36:30 -0700 (PDT)
MIME-Version: 1.0
From:   Ordit Gross <ordit.gross@orcam.com>
Date:   Tue, 1 Oct 2019 16:36:19 +0300
Message-ID: <CAB+bgRaH+Vw1xDNQdOuG26v=QPvnporuo9waBeoxi7NTUE+8YA@mail.gmail.com>
Subject: recommended way to register on bluetooth event
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hi all,
I would like to register on encryption changed event.
As far as I could tell mgmt-api does not consist of such capability.
I think that reading from an HCI socket may enable me to read all
events (and the needed one as well).
is there a better way of registering on encryption changed event?

The reason I need this capability in the first place is that I want to
enable repairing if BLE Peripheral Removes Pairing keys.
currently, when the peripheral deletes his side of keys and attempt to
connect to master, the master will get  encryption changed event with
error  "PIN or Key Missing".
that's why I want to be notified on application that we got this
event, so I can delete my side of keys as well..

any suggestions?
thanks in advance!!
Ordit
