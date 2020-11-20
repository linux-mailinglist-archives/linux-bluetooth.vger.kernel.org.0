Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662292B9F81
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Nov 2020 02:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgKTBAE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Nov 2020 20:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgKTBAE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Nov 2020 20:00:04 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2578C0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Nov 2020 17:00:02 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id y197so7492742qkb.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Nov 2020 17:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=hqAiIqcAe4iXQ+0IZZKI5cXYZG31PB9q0H8JRdb19ns=;
        b=s6XsvECnZesznpuGuP9nuHtXN3lISUqWEM5lHnjCbpeZd/j67R8D+jjjTjFpv+RVk0
         6kvxSQAmrTLfHOL1zb6zY61tIDouT1+teMP9hxfhpRHnJ83INbEyvFk74SA91pF6/FoA
         eS6K06DN+w52a7J4uU1H6EE6cAYPXPnvGSvviGfkeL7Fvc/lz6eKuaclG1tmIUgsSsA5
         RuaW7hFqxXbLXK60RkoYytP2z0q+qyHNH6op9uRIgACpmdUixzoh2eT/BBw11SXl+rH5
         xb/AbJLVGhkrdQK67zEkZTDlvMzwnpBxrmx1QS/baelamtA7snhZ4UQbtZ0XtU6zM3ih
         TAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=hqAiIqcAe4iXQ+0IZZKI5cXYZG31PB9q0H8JRdb19ns=;
        b=KF+31z0Nn83ljwGx5pjah2eickMZkGOJdu0ehNFwfN+lvWHJFYVX949tH3k1+Hz43E
         XBmt1glXe73cUIffl/Hoe9V3A/fpRwYsPUJ5Q067EIvQRl4i3w+gYUG+8tFNsGp7goLI
         r29qB124PvRxVUo/frHJi6kUKmXfsv2WIB7hzi/UNYC1+fqhElYmW/TFEqkZ8pugnbsU
         h4vruz6V7t5yXXiYpGFMvjLC8mCJ/VdbXej9/Ds2YoWnxf/NxduU+B6Z4YeKyIaAzEQX
         cJuPAZVJjA6j/md9A4HkeRhvPuadY4Yg02QgZTWUvZ830CEU06cqdfXZCfFBqbh5qHaV
         s9qA==
X-Gm-Message-State: AOAM533nAsHrkZ1mCtArESIN/Z0x4eIi55fCQVJ14lR8Z4JRon/ljTg1
        nQKTmII8JQPgBf57pKABEvd+gYbxa4cKtg==
X-Google-Smtp-Source: ABdhPJxwevBtYqepnTG7wK+uXaRfhqDymLfw6pT8CXxhKY/4lDe2UEAfyTfxJTjDktH3imz009FXaw==
X-Received: by 2002:a37:9a07:: with SMTP id c7mr13245178qke.43.1605834001871;
        Thu, 19 Nov 2020 17:00:01 -0800 (PST)
Received: from [172.17.0.2] ([52.177.70.56])
        by smtp.gmail.com with ESMTPSA id m25sm1081615qka.107.2020.11.19.17.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 17:00:01 -0800 (PST)
Message-ID: <5fb71511.1c69fb81.c6c94.817c@mx.google.com>
Date:   Thu, 19 Nov 2020 17:00:01 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4245178048779141538=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, pavelm@google.com
Subject: RE: Fix duplicate free for GATT service includes
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201120002215.3946089-1-pavelm@google.com>
References: <20201120002215.3946089-1-pavelm@google.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4245178048779141538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=388009

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


--===============4245178048779141538==--
