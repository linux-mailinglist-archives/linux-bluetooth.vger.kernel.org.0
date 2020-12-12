Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6603B2D83B9
	for <lists+linux-bluetooth@lfdr.de>; Sat, 12 Dec 2020 02:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405263AbgLLBOP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Dec 2020 20:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgLLBOA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Dec 2020 20:14:00 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7613C0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Dec 2020 17:13:19 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id l14so5146235qvh.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Dec 2020 17:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=vvT/F774hiePYpznDIJ3RrwRRlQYe6C7ScQxJ5sUdSs=;
        b=hMVfrV5EtCQEWOpI6AJ1Mxbxcb7p1mydb1ApvjjGt07TV7v9X0iLxdc6L57WGw//aV
         TdFu4iNRDvW31/VqLykiHnAGnBGKXcIwfCjGACs3vM7m5WNXvHFKNjKPvz8oKUdsH7Wp
         xZz5EYnciQoMZ55Sjs+3X5AWeAEAi02VO4RTjPvY1GN/AUYDe5T8jPn/c8wJXhOysPeM
         A+PMAodS+4M/o+kKD5QUW3Dkb6LssDsbiynwtnDmrsjgY5cC+MWnEXizuzc1U4qMBK78
         OLaWwCH2uHOpYhlInHFFlAeOtqo6m2uaii1nWBuRsA2OpBrA9eAFytvJxJG4leam4z5m
         m9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=vvT/F774hiePYpznDIJ3RrwRRlQYe6C7ScQxJ5sUdSs=;
        b=olaufDo5YcIOaUe8DiLP4+bpysY12UpyccczLZzX05tdNPkGHmPAiQ869d8uYk54wO
         qoPgmF2Stw10JPzrOoydEkkyMiW82zcctqqkhUbj175HEkeNW7kNtZTfBXaKrOR9mh3D
         kdOE5mJf3G/LkgeWY7EPtOkYEW99hK6HPMKwfR35JVLXRXMHSPiM8oJYqhbJswo14oqy
         3/jGQucVQJhrTcjYFjJhwA7iD10foNo7YkGbN2V8YogWYBaHFLpb2pDdc+m64qbTye3r
         aeHtICGT9kGALCvMpFTD86GciXM9sxrFJspl1XzWesduVIqbI3IPvcZ0fU3849Y9DaBo
         sBQA==
X-Gm-Message-State: AOAM532z5Tsuj4VIMcFEaV5FHvnc0B8+5AIaOBuegIUv4EVaKMSfn7o4
        pvaDOeLXDoGgRi3AKesSP/M/u/NTVDsFWA==
X-Google-Smtp-Source: ABdhPJzYnVoLe/Ox9t2Y8HDBeU3aX63dPY3uznHhLZecxTgldvgOqMMhEjmVerT0/bJzW6OtJZ5QqA==
X-Received: by 2002:a05:6214:504:: with SMTP id v4mr6831530qvw.54.1607735598781;
        Fri, 11 Dec 2020 17:13:18 -0800 (PST)
Received: from [172.17.0.2] ([20.57.114.81])
        by smtp.gmail.com with ESMTPSA id d123sm5395445qke.95.2020.12.11.17.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 17:13:18 -0800 (PST)
Message-ID: <5fd4192e.1c69fb81.5ec18.711b@mx.google.com>
Date:   Fri, 11 Dec 2020 17:13:18 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============0995572848551400326=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, sonnysasaka@chromium.org
Subject: RE: [BlueZ,v2,1/2] Revert "input/hog: Remove HID device after HoG device disconnects"
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201211233047.108658-1-sonnysasaka@chromium.org>
References: <20201211233047.108658-1-sonnysasaka@chromium.org>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0995572848551400326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=400877

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


--===============0995572848551400326==--
