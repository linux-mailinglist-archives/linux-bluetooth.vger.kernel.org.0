Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7303121C429
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jul 2020 14:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgGKMXw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Jul 2020 08:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgGKMXv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Jul 2020 08:23:51 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09CFC08C5DD
        for <linux-bluetooth@vger.kernel.org>; Sat, 11 Jul 2020 05:23:51 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id o38so6566909qtf.6
        for <linux-bluetooth@vger.kernel.org>; Sat, 11 Jul 2020 05:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=lwN9yTLc2fy1rlFwfJDPPj5UeCfZ0TZdL4IUjNFX0kU=;
        b=LvkN1zjAu/qmwYYuAbHbAnomIYR3hC4ac5lqmnP6pP2iA0EPp6z+dxmJYYWWimFRIQ
         LmzUycTKRO0Nwv06QrbcwRrOXjYjL1P4p3lLg9BHcSHgL+3ZwjfCRFEU84QVbQ8PVRc+
         ClxB9v+DuktH7z17RetJ8MD9ANsFLxqRyx4/+eWv86bPsQF316mdbnB3k1YtW0f+TFgy
         BJl5UqCRPw5AJFBhpH8+azc0y7hxWbb2vmn829Az73uXlvdWwEPmymFrelNJAl6Qvfoc
         E9kHLB+xPrCMIZVPgv6j1+f3jxqQncAyZmL/c72tcXXIQKxS/K3dDi2qlr6DtIYImsxw
         QQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=lwN9yTLc2fy1rlFwfJDPPj5UeCfZ0TZdL4IUjNFX0kU=;
        b=HDabDXkoW0mxBNtN4IHCoXhpwp8v6Y7lFX19OzCzbqcW9nO6MTLkdWZIlhWlUkJya9
         /674AcEeRjvRdtZcRMs/ef5NcWN/GH8xalHfyoBiqrdQUmH+uvoNxs41dpa0902Lz1IA
         NqZsUBEKGhjYWScSf/2Tbyw2k7NhptrU8s1m5kb+w/hyFFcunk5uVOhZAW6dmd+iRW9v
         4EhGjPuBEjPoUPOwc1knErj7oWgeiXPA2r2HosD69442NY3n0TNTH/nX2yiLNNjDZqpq
         fHU4K78yhsMwJgBhapA+k03V5QYeRm5qfrZu5x4regT1xG1MeW7IbOCpNmW8vLD4fH7R
         X4LA==
X-Gm-Message-State: AOAM533L2CYyPhNmUEZhvJJvQITVtZAWbyF6/ZhYJOOG1+2V36hk35NY
        MtmhTQY/K5v23P2bsXTRlAF7/HbQxa8=
X-Google-Smtp-Source: ABdhPJw4YnpDil2vcHX6/HDWgIgUC7L4XzrN49GIu1RkgLH9dWsAJW4LToKPSu2quHgIFzt3/QAhQw==
X-Received: by 2002:aed:2569:: with SMTP id w38mr74912416qtc.3.1594470230922;
        Sat, 11 Jul 2020 05:23:50 -0700 (PDT)
Received: from [172.17.0.2] ([40.75.31.62])
        by smtp.gmail.com with ESMTPSA id w11sm11226796qtk.35.2020.07.11.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2020 05:23:50 -0700 (PDT)
Message-ID: <5f09af56.1c69fb81.d7950.b11d@mx.google.com>
Date:   Sat, 11 Jul 2020 05:23:50 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6647223998889505768=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, marijns95@gmail.com
Subject: RE: [BlueZ] audio/avrcp: Always update transport volume regardless of player
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20200711115031.123793-1-marijns95@gmail.com>
References: <20200711115031.123793-1-marijns95@gmail.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6647223998889505768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While we are preparing for reviewing the patches, we found the following
issue/warning.

Test Result:
checkgitlint Failed

Outputs:
39: B1 Line exceeds max length (96>80): "[2]: https://specifications.freedesktop.org/mpris-spec/2.2/Player_Interface.html#Property:Volume"



---
Regards,
Linux Bluetooth

--===============6647223998889505768==--
