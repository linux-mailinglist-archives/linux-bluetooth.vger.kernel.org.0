Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0812D2B8582
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Nov 2020 21:27:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgKRU1C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 18 Nov 2020 15:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgKRU1B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 18 Nov 2020 15:27:01 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5F1C0613D4
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 Nov 2020 12:27:01 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id y197so3169908qkb.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 Nov 2020 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=u3JOD8+mK0iuTbXz0YA5jQH0DXtkcY9Y0IGLQ5hz7sA=;
        b=eS1e/9IY7NcXGnKB2MEl43rENZkihMHNDwCIug3yJgImX60Vg4cviOuw5qycO0Ff01
         Z7NyjFJCBcJVTWIXDMq74sgeMSuQeo+m6N3rf3lnQQl5waw9FasT42i9fm8AF6WnBg1i
         HqGudiyqY+fK37dtdsCavZ43UzZxnsi2hEHTC2wcyoIRv7ccrtzWQmUsPlJJzycHJZ8W
         6gNpqWlP7OdaPEyQdov/Yt600PEAQbKbx7QmOcy/Ict52XlqXVP1qENnyfg6Qu8xAq4g
         FJnowqpk9EOkYU2WlSktWEGsrM3gtN9Rggmikp/fpVgOTyYwd7T/phAcrvowVrsENhqh
         xImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=u3JOD8+mK0iuTbXz0YA5jQH0DXtkcY9Y0IGLQ5hz7sA=;
        b=qrzWvub0EQDnFnRPRJSbM6BFZVuxzwSwxhNGTYihN3u2hM2R/ynBsmxvs0jIV3GSQ5
         1AlyvTsov0gHGQ4+kIscIHb5srKZ54kqus7B1wC15b3h/XSe4ArnKbsjEYniF+H1nIAo
         TE7b39gAYXqVu6CVM1rxD84ML7pUKoux5kpPyeH7fTEi4KUZyJD8iTD6mfBG4OfZHIxr
         FG9nctQbpYD/FZ9tIbhN3DZRn2TNfoZ1m/ZaPEVyGMZpTY/30vdp1VcJGMY9Y8orEfiV
         8muOiE+vP5be9Qo36ypFpM6HHoh1wSTYYG3hOCxxmvHBk3uyfmuUQvTVONHGnQMHwyDH
         T5Rg==
X-Gm-Message-State: AOAM531xnzlfj5t0UzeLaDkpaWORn4V1/3kMIMCno5DiNKloqisyD9AS
        fERz0nN2HoHUh4YrEKtKNPfbh4iwvjC59w==
X-Google-Smtp-Source: ABdhPJyi9JcIsuZjTS/GgzWxHScdJYGZGdqwUzdsS7RCmUyDnZq+iQEsqOUDkms86uxgXBfAYthwGQ==
X-Received: by 2002:a37:b204:: with SMTP id b4mr6908596qkf.217.1605731219522;
        Wed, 18 Nov 2020 12:26:59 -0800 (PST)
Received: from [172.17.0.2] ([52.251.54.44])
        by smtp.gmail.com with ESMTPSA id r55sm17457212qte.8.2020.11.18.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 12:26:58 -0800 (PST)
Message-ID: <5fb58392.1c69fb81.c6f6c.8c8c@mx.google.com>
Date:   Wed, 18 Nov 2020 12:26:58 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4492214734732275624=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, inga.stotland@intel.com
Subject: RE: [BlueZ] mesh: Fix regression error in HB subscription set
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201118195600.30267-1-inga.stotland@intel.com>
References: <20201118195600.30267-1-inga.stotland@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4492214734732275624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=387073

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


--===============4492214734732275624==--
