Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85456DDE2E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 20 Oct 2019 13:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfJTLJM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 20 Oct 2019 07:09:12 -0400
Received: from mail-il1-f173.google.com ([209.85.166.173]:45943 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbfJTLJM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 20 Oct 2019 07:09:12 -0400
Received: by mail-il1-f173.google.com with SMTP id u1so9403245ilq.12
        for <linux-bluetooth@vger.kernel.org>; Sun, 20 Oct 2019 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orcam.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=smDFA4j45UX5KBReFwmWHdqP3clbYr+yo/uec9Ez1/c=;
        b=L/O8jcjdDc/V1hnDolyOsYZvRlvIMdkHCNxeehAeMiYdOJ7pAYRK+X2uMDNESPAKUm
         UzvjEpPwNYiPnJNi/YPMVK/lTaw59+FT6YoW9mLCsC/lMa+hHku69slRoVZspPtt3fSp
         C3m2O9wRbOsE60HAPdj472D0labgmBq+D+vFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=smDFA4j45UX5KBReFwmWHdqP3clbYr+yo/uec9Ez1/c=;
        b=CA46qpg06+nt69MTk1isTqlXv9UVCAKXxhXLJ0cvWLxJwJlnRkkblrCBE7OuMtX9/P
         F9pjYTKLbZ1da9PxQjSn8lT+Ya37oQjrE2tycbV4IYuQjZBzfa3EjI8IXrugXM+sQHlQ
         vbtPRfxvpTdEyNeOH9nCEWTVG1lkmYuYniP6URwVvmwOqU+QEOaxrcZVs9gfp3e8kK9r
         jtpP/u/zCuQDzaTA5jlq1BHsEM2V+WDhq8TJMCEwVlneYnPTH4eUqWTkJ0gKAjwORhG1
         pyhnIeTR9lVakvAjxAY0ILDBcqC+6qy5Dq09layapvib4ZVCXABGHiOn55AnCI+aCdvj
         dvUQ==
X-Gm-Message-State: APjAAAU/T5/l+TAAGD+S9u5X5d7YJU4xW/fYft/KJ/xI+hareKIcqIGh
        8gNVj+T/68ji/UrDNObLnXH1LW+yaxoN0lYfOk6SplEBRjA=
X-Google-Smtp-Source: APXvYqwSOY0P57g/UXtKngcz1ycunL3QICY4XQ0t1pngz6yo94FqWgqKpCSEhxoc/HLHGlxhvWsY20Z1OT1iwO0eFJc=
X-Received: by 2002:a92:dd12:: with SMTP id n18mr19269761ilm.124.1571569750960;
 Sun, 20 Oct 2019 04:09:10 -0700 (PDT)
MIME-Version: 1.0
From:   Ordit Gross <ordit.gross@orcam.com>
Date:   Sun, 20 Oct 2019 14:09:00 +0300
Message-ID: <CAB+bgRa-Lh0iR7nRe6kfFYqz_etHdYTjd+3MfWGWm8CRgTsa=w@mail.gmail.com>
Subject: mgmt_new_default sometimes fail
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hi all,
On our application we used the code sample btmgmt.c
which uses mgmt_new_default, this function will fail if
fd >127 (because mainloop_add_fd will fail in io_new function).

mgmt_new_default:
fd = socket(PF_BLUETOOTH, SOCK_RAW | SOCK_CLOEXEC | SOCK_NONBLOCK, BTPROTO_HCI);

what is the best way to workaround this issue assuming I have only
btmgmt.c code and would rather not change other files?

thanks in advance
Ordit
