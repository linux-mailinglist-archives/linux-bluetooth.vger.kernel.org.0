Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD7E33D350
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Mar 2021 12:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237456AbhCPLpe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Mar 2021 07:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237403AbhCPLpP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Mar 2021 07:45:15 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CE2C06174A
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Mar 2021 04:45:14 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a9so34760837qkn.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Mar 2021 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=LsGKCbqEALkXsQiQskcDE1ylzaIOBXZwyTP1SLPfCNU=;
        b=lU20Eia6CXhVvJ3tuaVSBeU83TCD5Z7HYUhagbg2DzQr+7vOglTznJiNdu4skP5gNh
         IfL7EzievlImbAVUMkIjwJYUgbfBDQCMXN6VVtieDnCs67PAaoLeYyqJxbXMUU1LYI0s
         agvLOXETeidHGzElRG5ovuUaWVrV11rmEaIeRU8/jeZdblT2Ecd9P5hlbD27CMVEgETi
         +edtq6DYTC6mckNMu/bpeIthJdqoGcS5STskKtSXLCXPITPX9GmdbqKcaF9dfZ5OC7s+
         uORSDy5mu6brfy/nz3ybj7IFHRECdnBHSMP5TZTzTAU49UqosvmMH8t2gu+y0MXfaRvQ
         KXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=LsGKCbqEALkXsQiQskcDE1ylzaIOBXZwyTP1SLPfCNU=;
        b=dY0oOHs4OQ8r3LJ6GqSv6BgwP9AxoYk99Sljao7DFGBV2fFvz1uqPVBUXWMXVA+FMl
         EAy494VA1tGt4skbFIcTTUwASt/rswWUbQwvorWwsguJWSCQ8xS4ZVD5JhRtMpQgEuJ4
         YUMqZS5y1uw7/bU1bUyaYWZBAYVlP3f1PRTarV3iDpeE62y0elirg4KEp1/w1lNLVAVr
         23lmpnuBL9rt3ubNU61sdTqNpcLDi77SQFeCyNoG+pEU05p/sQp73CZ7Y1dsQxTbKdC4
         vxcZPEEOQfQxhWYud7h5MpicdBDxPws7fEx3Y/p1ZcTJw+lvbKMQX7kOUL1NZPuX+b9+
         3saA==
X-Gm-Message-State: AOAM531B3zWZk1291UH/4PezhEZsiMmlJx6xcFNFFxGLk68A+cPD5ESP
        NYCOsxaRzJ1tIQWtiQUIpmdh5VH9PZAehg==
X-Google-Smtp-Source: ABdhPJxpFH9TZxE1mEOVbFz/aPZG0CN6q9RgdZfrp7UqXi4/imBkK7hCEn+UWkelqI/SYU0TM9SY7Q==
X-Received: by 2002:a05:620a:450f:: with SMTP id t15mr29140851qkp.323.1615895113601;
        Tue, 16 Mar 2021 04:45:13 -0700 (PDT)
Received: from [172.17.0.2] ([52.254.86.145])
        by smtp.gmail.com with ESMTPSA id k138sm14739470qke.60.2021.03.16.04.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 04:45:13 -0700 (PDT)
Message-ID: <60509a49.1c69fb81.16022.e82b@mx.google.com>
Date:   Tue, 16 Mar 2021 04:45:13 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6701915811425592952=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, ayush.garg@samsung.com
Subject: RE: [BlueZ] btmgmt: Fix typo in printing Set PHY Configuration command error
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210316105738.11560-1-ayush.garg@samsung.com>
References: <20210316105738.11560-1-ayush.garg@samsung.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6701915811425592952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=448991

---Test result---

##############################
Test: CheckPatch - PASS

##############################
Test: CheckGitLint - PASS

##############################
Test: CheckBuild - PASS

##############################
Test: MakeCheck - PASS



---
Regards,
Linux Bluetooth


--===============6701915811425592952==--
