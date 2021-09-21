Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53109412FDD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Sep 2021 10:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhIUIHy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Sep 2021 04:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbhIUIGh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Sep 2021 04:06:37 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1300C061575
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Sep 2021 01:04:58 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id b10so25767528ioq.9
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Sep 2021 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2mAzL3fxYyauWzUX2d7KD/Fn5B6pp4LbzkEVrTdUY4Y=;
        b=ZMoZFgkv5LDqTa9QKq1K3ge8MkFUJMIw4aVhe9f4++MDpKbh81Rhy+5lJz2bKQf61g
         uvDMlPZJmJKircOXnZxgR/f5/e8cGjyLXexmFfnUQYC2xcM8c/iX3zofQikOMY8BLJjX
         +Hrw+CA4uS3rYCoPIYI8dRYxBlTFN9ByJl7jJjWb9iUnhcTXUNz4UqFwIhxxfXw4Q56h
         uGCd+eXzwiOk3dr7W9v07vu5Qij8meJ5kOL2gbElM6809reAZ3cW4MYPI+y/fZKq6CH7
         XLIhR8PXFAYr3GbRY3syrxgB4ciscb5Q85VeZl3xl0lWVow67cfUliMPdXPf95aeCKXr
         NzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=2mAzL3fxYyauWzUX2d7KD/Fn5B6pp4LbzkEVrTdUY4Y=;
        b=1ZELrwsTkjzHXqPVIb2YHGpuo3bQNgEnObDV1xAxgRQLl1Y1qiaMvHLD2YcLDNuIKa
         eq7J/uERJ+a/SU4Zx7dRT3r1ihUOGHAGDSZvN2GyxNM91a4fFN1JFtCJv8DBct3lljTH
         9My1iArLPO8UCbCWLH2ZYWJNjvKT/oxrqcdNFWcb8PKp0aXuVsZn5WZMytcL0lqlkmIE
         xbdNeJlOit2RMioxGY4eFpNoc11oVdb1qIdgrkhzAFnwhTZGbpTWMZbqyMU5JB4p61JB
         Wvo9iiphlC0hdz7kHGfpDldhAUfmEN4nUemnOEM5k3oaaCcY3ZiJwKj4Zz0b/Um7nIJr
         zJWw==
X-Gm-Message-State: AOAM530HxS5A7Hw+s/+42kl+QqjnEF3kbwu2ztZqIGrd2rNq5wdDX35x
        VLaZpdeduGI11wONNnO6znIQg9L+oFNZkmZGdRg=
X-Google-Smtp-Source: ABdhPJx2OcE4uX/Oe98VHs1JK3NeciI+MruxYEKeAMzxN+bLh+p3GU8cFiYlwKAkrPom4pqQUlaEXBas+uAxMyIDiJU=
X-Received: by 2002:a05:6638:408f:: with SMTP id m15mr22594448jam.94.1632211498314;
 Tue, 21 Sep 2021 01:04:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:926:0:0:0:0 with HTTP; Tue, 21 Sep 2021 01:04:57
 -0700 (PDT)
Reply-To: michaelrachid7@gmail.com
From:   Michael Rachid <macarthuremmy@gmail.com>
Date:   Tue, 21 Sep 2021 09:04:57 +0100
Message-ID: <CA+v+582+Q9D-ZdzP6edspuK1yyStd1s3LggxjZ4_wrH49VCJ8Q@mail.gmail.com>
Subject: =?UTF-8?B?UHJvcG9zYWwgLSDYudix2LZlaXJk?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

2LXYr9mK2YLZiiDYp9mE2LnYstmK2LLYjA0KDQrYo9mD2KrYqCDYpdmE2YrZg9mFINmE2KXYqNmE
2KfYutmD2YUg2KjYp9mC2KrYsdin2K0g2LnZhdmEINmE2K/ZiiDZiNin2YTYsNmKINij2YjYryDY
p9mE2KrYudin2YXZhCDZhdi52Ycg2YXYudmDLg0K2K7Zhdiz2YjZhiDZhdmE2YrZiNmGINiv2YjZ
hNin2LEg2YXYqtmI2LHYty4g2YPZhiDZhdi32YXYptmG2YvYpyDYo9mGINmD2YQg2LTZitihINmC
2KfZhtmI2YbZiiDZiNiu2KfZhNmKINmF2YYg2KfZhNmF2K7Yp9i32LEuDQrZitix2KzZiSDYp9mE
2KXYtNin2LHYqSDYpdmE2Ykg2KfZh9iq2YXYp9mF2YMuDQoNCtmF2KfZitmD2YQg2LHYtNmK2K8u
DQpzYWRpcWkgYWxlYXppemEsDQonYWt0dWIgJ2lpbGF5a3VtIGxpJ2lpYmxhZ2hpa3VtIGJpYXF0
aXJhaCBlYW1hbCBsYWRheWEgd2FsYWRoaSAnYXdhZHUNCmFsdGFlYW11bCBtYWVhaCBtYWVraS4N
CmtoYW1zd3VuIG1pbHl1biBkdWxhciBtdXRhd2FyaXRpLiBrdW4gbXRteW5hbiAnYW5hIGt1bGEg
c2hheScgcWFudW5paW4NCndha2hhbGkgbWluIGFsbWFraGF0aXJpLg0KeXVyamFhIGFsJ2lpc2hh
cmF0ICdpaWxhYSBhaHRpbWFtaWthLg0KbWF5a2lsIHJhc2hpZC4NCg0KDQoNCkRlYXIgZnJpZW5k
LA0KDQpJIHdyaXRlIHRvIGluZm9ybSB5b3UgYWJvdXQgYSBidXNpbmVzcyBwcm9wb3NhbCBJIGhh
dmUgd2hpY2ggSSB3b3VsZA0KbGlrZSB0byBoYW5kbGUgd2l0aCB5b3UuDQpGaWZ0eSBtaWxsaW9u
IGRvbGxhcnMgaXMgaW52b2x2ZWQuIEJlIHJlc3QgYXNzdXJlZCB0aGF0IGV2ZXJ5dGhpbmcgaXMN
CmxlZ2FsIGFuZCByaXNrIGZyZWUuDQpLaW5kbHkgaW5kaWNhdGUgeW91ciBpbnRlcmVzdC4NCg0K
TWljaGFlbCBSYWNoaWQuDQo=
