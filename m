Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B1B1D45FC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 May 2020 08:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgEOGge (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 May 2020 02:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726191AbgEOGgd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 May 2020 02:36:33 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87346C061A0C
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 23:36:33 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id z80so1546656qka.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=Qz5wgvH6cJ4AQwOulVfkfOFQ4gFPvRGGv7ymWz9cedI=;
        b=eJ/vDTB0gXi0/YYq5I+vxBj/j3xY9H7S/BI5hJEn08AqKp9dzGSE/vzv7uJAcViJDv
         EpdYSPqiqO5+SwWAde6UYSBpVRZ52pxnPn+jfWwUlO5q/7yfQ/3JLUw9OIV4cwXXxcWr
         yEmnoQ8mJqEOz/L3Nv2R0AQexjFnCfJqmA0doYIlVUH6B7zz98Jw4y2kmNvKwaF94fx8
         rZ2OnXnfjueGbk8MS4GyOYL58pUkSrxJEyRFKCNiEhgSIJkmm8zNtzZSfgVqNG1flwWm
         2OoynXC+ati6gT1UAr7cMJsDB8FvQ609wugOsKhIB4GPTXQk4wSjM7quIU/8IU+r4y3B
         mJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=Qz5wgvH6cJ4AQwOulVfkfOFQ4gFPvRGGv7ymWz9cedI=;
        b=YakDLfrb5lYRHPrtYXRCIPihCAU4icLraBZCr5MmALoPSECKev02DQ2WH7/8xDhKbj
         EUQ+1wd/E7v8RXQghvlgccSB6rz/RC+ylNFTgpDN7eC+uhnPTXDBSZ3ce+GkthcSb4sg
         /EhH4pLcyybyCMU7KxkmcyyXpLPfaE6/8Uc+v6NzOBBmjgFji9IQJ8/8+X2IRCx1Y3C+
         575F90uClMl7pvqfKWN8sZYNHFdRqarGu5tyXSLADPcJEAc03XieExdI3jvroItch4io
         OC6fuREvmKzTkkTVCG4iUs6zSpjlblXWSIqp58r9P7NS336JUj0SPNbvZMLnCrB5fioy
         oKsA==
X-Gm-Message-State: AOAM532NPSixdra0ZWeXsuKxxJXOaxCjoizK7jTeZmoBcyFPTkaj5m1c
        uO/krZf4JjfisWV/z+k80q7JvRg2
X-Google-Smtp-Source: ABdhPJwdw5HWTXDxFwdew5Wt3rsDZY4uUCcEzxyh3wkb2XVFldTeeS0PyMUvWJ68MkHO5EFkzKo5HQ==
X-Received: by 2002:a37:b3c7:: with SMTP id c190mr1862673qkf.466.1589524592525;
        Thu, 14 May 2020 23:36:32 -0700 (PDT)
Received: from [172.17.0.2] ([52.251.124.247])
        by smtp.gmail.com with ESMTPSA id c63sm909008qkf.131.2020.05.14.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 23:36:32 -0700 (PDT)
Message-ID: <5ebe3870.1c69fb81.ab852.5022@mx.google.com>
Date:   Thu, 14 May 2020 23:36:32 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============4687843731907174297=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, inga.stotland@intel.com
Subject: RE: [BlueZ] mesh: Fix segfault caused by re-enabling of HCI controller
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20200515061530.4983-1-inga.stotland@intel.com>
References: <20200515061530.4983-1-inga.stotland@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4687843731907174297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While we are preparing for reviewing the patches, we found the following
issue/warning.

Test Result:
checkpatch Failed

Outputs:
WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#14: 
0x00005618e6e12d9a in io_ready_callback (user_data=0x5618e75538a0, result=<optimized out>) at mesh/mesh.c:174

- total: 0 errors, 1 warnings, 101 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: Ignored message types: COMMIT_MESSAGE COMPLEX_MACRO CONST_STRUCT FILE_PATH_CHANGES MISSING_SIGN_OFF PREFER_PACKED SPLIT_STRING

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.



---
Regards,
Linux Bluetooth

--===============4687843731907174297==--
