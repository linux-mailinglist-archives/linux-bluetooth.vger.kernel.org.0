Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DA51BE779
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Apr 2020 21:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgD2Tfw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Apr 2020 15:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2Tfw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Apr 2020 15:35:52 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71ADC03C1AE
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Apr 2020 12:35:51 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id o10so2952202qtr.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Apr 2020 12:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:in-reply-to:references;
        bh=rodiy9WqfxfZ1YXMDCICxg1/IJGqrUoZh+t/Dl89RFw=;
        b=KYWBgSLogTgcQR9o+ClDNQiPxWFHfT+kXXBeViJmeefbqMimZa8VNBKrQhepJ/J3No
         Q1MwEI9HRe8237pbNnTmgK/9bXh1LUUCEgOXRR3ECyUIODcY+Ztjt4dFw029hGE1o7Im
         R0zNhRiR9SVkFAi3eUi35rWmvkYpI/NVVOJgT0UyEa9S1l1aYYPJgMHteFXf2adUBFtU
         W5H6FVRLYODc+FZ0qUG//1IRtoxBkEDkL0gEmNHpyXZ13oX6+VTNgzhN2h1KB7om4148
         +Fq+0CwUsMzHhMo07evBhGgrv1tmdAekXrlI2WbIghRvMxWU/8ZH9ivsICPJg0ZfJwwN
         VUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :in-reply-to:references;
        bh=rodiy9WqfxfZ1YXMDCICxg1/IJGqrUoZh+t/Dl89RFw=;
        b=bjxzj7kV5MMfjZ+PkFg3z1TE+9V/GUuduR0ady3AyEI24a4ajdtlsdzzA0CMbsRbA1
         gYIogoldXMKNgkeiV3eggeNLOOpue4sLkiHrAEdwnxqHnyTscLDklMtXBvRz4GhNFIdd
         DhwXDwV/HG7WQPwqe/tNwyUwlnbbX+vaJtlvldNNweLu+4AlQC43ZWtN15OEoC3Q7kqo
         kSMbzejWyBLdktqeD56AH3vE72xPWZr9awBw/P1mQFjYC4wRfsUTqvLncpA4u9IB/HfL
         rzNQNBnBjzTnMYjsMwyaeS9ydGwo1r8W7az4D/6uDejUwkytiuNx66WPQTNr9XX+H3/R
         uzFA==
X-Gm-Message-State: AGi0Puah9N89E4k6dyOMPj6SfgIs+Npv1wHavCS8H4sb+KkR4JjxOm62
        7omdI356Rydl6Ln/5pWJMiUP3Yk2BEc=
X-Google-Smtp-Source: APiQypJHdQRJD/4ghqExmNDRZGfYuFsHVIXOZ2tOujkeBqaHRdbf+fhvXouyaLArmfHkYW/q8QrTwQ==
X-Received: by 2002:ac8:6655:: with SMTP id j21mr35377806qtp.11.1588188950737;
        Wed, 29 Apr 2020 12:35:50 -0700 (PDT)
Received: from [172.17.0.2] ([20.186.71.41])
        by smtp.gmail.com with ESMTPSA id 63sm89397qkl.64.2020.04.29.12.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 12:35:50 -0700 (PDT)
Message-ID: <5ea9d716.1c69fb81.92030.0ba2@mx.google.com>
Date:   Wed, 29 Apr 2020 12:35:50 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7602051644256364583=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, pali@kernel.org
Subject: RE: a2dp: Check for valid SEP in a2dp_reconfigure
In-Reply-To: <20200429192645.31297-1-pali@kernel.org>
References: <20200429192645.31297-1-pali@kernel.org>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============7602051644256364583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While we are preparing for reviewing the patches, we found the following
issue/warning.


Test Result:
Checkpatch Failed

Patch Title:
a2dp: Check for valid SEP in a2dp_reconfigure

Output:
WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'a2dp_reconfigure', this function's name, in a string
#21: FILE: profiles/audio/a2dp.c:1183:
+		error("a2dp_reconfigure: no valid local SEP");

WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'a2dp_reconfigure', this function's name, in a string
#34: FILE: profiles/audio/a2dp.c:1197:
+		error("a2dp_reconfigure: unable to find remote SEP");

- total: 0 errors, 2 warnings, 24 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: Ignored message types: COMMIT_MESSAGE COMPLEX_MACRO CONST_STRUCT FILE_PATH_CHANGES MISSING_SIGN_OFF PREFER_PACKED SPLIT_STRING

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.



For more details about BlueZ coding style guide, please find it
in doc/coding-style.txt

---
Regards,
Linux Bluetooth

--===============7602051644256364583==--
