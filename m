Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4392A9046
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Nov 2020 08:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgKFH0q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Nov 2020 02:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgKFH0q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Nov 2020 02:26:46 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2689C0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu,  5 Nov 2020 23:26:45 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id s10so508772ioe.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Nov 2020 23:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=f01fablFiiOL8UmdUe9Qt85fdCKUuFQOnHGdSR0VxK8=;
        b=Iz2IfIOi2oTGms4lhQEwV48KAOTudMeMwa7XlQShnoAhCcFhWAQkEwyAq4MzykP0OJ
         ny7tHNlHJS7ldndWXyNH0SvQ9gq/LlH8Qe+QhRVOzz4+rb6u1aFvn1NGX7wMrM7IrTXv
         p+DcV31v9XSRIR9t8wuuyQByH4NT01xoxPJh+KqPfCSjH5u7SN8ARwTQmLBAEf3zG4Je
         ayYwOvEXtBjGfJY/zTRlc+y9EyPogOwox+fy5xWq0vFfwT/McXToV96yjo43uJGKDkZf
         /wVu8C5zmVJbBdlNtdDU08IlYrb83/cy7eZj9tHccBg80HKpUNv0dRAJuZsdKN8Icsis
         KTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=f01fablFiiOL8UmdUe9Qt85fdCKUuFQOnHGdSR0VxK8=;
        b=t3cU9+Zdm2tAVgMEl7VA2RCANG6IBbG3GHblJ8JX7dW6rSPU1Ia7tpm2j5Hbt0v4+D
         jLQLROUIuCx/C9n8wdKDTsg/x9gNVJNo8IIXisWkVwrGsrEqMwp6e5NwDXlZEv6gizvT
         yCWD6yzLa0XKkQHWX+PFoJgjHb8uE/N92tOZKtvDluxrfIcJGPm0zB6E8JibGVA8sUoJ
         mhFX3h2+hOz+zziO1fvClSdZhw95n6TxCh8nbW/QQuLt39s6xhPrV5A6IubRYlicVP1V
         eAUUzdCEZLazqV2F7cN+BcmrlQfJ7zPSFXjd/GqBV4qhwPBECOQ1h3u7JbH9rIe/trp5
         9XJA==
X-Gm-Message-State: AOAM531nHx9U4wOrRqhv38kuce+7Kx84jYyBWf4DI4DfrEhmYh1pQ5CE
        Z1uPxasNknna+oK6C6IZzc2ShjdQ9n8=
X-Google-Smtp-Source: ABdhPJxcBVixEFKGZOIquk1jXOLDQo1S4nIkRMKkPZT4KA+PQ2MZ45qfydHtaTMGlWGoJbFvTHKyaQ==
X-Received: by 2002:a5d:9615:: with SMTP id w21mr539641iol.59.1604647604409;
        Thu, 05 Nov 2020 23:26:44 -0800 (PST)
Received: from [172.17.0.2] ([40.70.0.151])
        by smtp.gmail.com with ESMTPSA id x85sm489559ilk.64.2020.11.05.23.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 23:26:43 -0800 (PST)
Message-ID: <5fa4fab3.1c69fb81.cf6a0.1db2@mx.google.com>
Date:   Thu, 05 Nov 2020 23:26:43 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4076533351794930119=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, inga.stotland@intel.com
Subject: RE: [BlueZ] mesh: Fix errors found by static analysis
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201106071053.122820-1-inga.stotland@intel.com>
References: <20201106071053.122820-1-inga.stotland@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4076533351794930119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=378771

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


--===============4076533351794930119==--
