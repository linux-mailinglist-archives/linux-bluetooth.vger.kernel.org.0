Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3AA82C8E10
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Nov 2020 20:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgK3T3I (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Nov 2020 14:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbgK3T3D (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Nov 2020 14:29:03 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D53C0613CF
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 11:28:23 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id b144so11932502qkc.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Nov 2020 11:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=1nGDJB0c4nW6McDJrTLsnUen8RSGbYyVK5k/XIbq8QU=;
        b=l+nbB4DbM4zYeUE9rUV8QobbQSAnAyI3xDEcQfVPt5s4lZb4OT8Bx+Dkd+6DLUYtee
         9DN9ALXutG/tO99BrTiX4wNv+jjw6R5sea4T+L2h1QrF3EUAEW8j8honARS2AmfC9TIN
         99oe2N0zDCr2U2PAsxwmeu83pbH5wkLawydzeIhz2t5nIhnrHNR6QzqMxW09D+BpxPG5
         vN2pVsQWcBOuqtnCNUaeTNqgizzFtivQPnZqlNfhO9jurw4KrflZf/WZoOD49iADqORj
         Rdwam9iGM8+4a53GthIDt11lK4mdIvSALdPGilnjty6fvbGrlfzajcwQd1PJvn0+iQhk
         3u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=1nGDJB0c4nW6McDJrTLsnUen8RSGbYyVK5k/XIbq8QU=;
        b=LBeoIARVK5BekH16dnKj89dlIPy/CP9jTbZ1IKlum6yMdgK7cNupGK09w3H6U+Z/LA
         qL6UzpTGJoJ3NY5iGiVv4adgjHreo23DV3ZuIahzvisfnc+I3r978yBQbzypnXPxJUM+
         fgB6hDlzQN/FabdvH12R20g4T5eq3ZIUcYuwNl8YRRaaIVrc+Ylk/hqdaHdRwqRvcaVv
         qLF1vhZq75dw5lWXKMvFM0wrOof03pP8acytr/NU0Tj2Rnhisflz6nie2FcnxStZEqEj
         hBSZOJwRaa3GIIQ5oqjzZA9ofOYnEv0NXFbchxbyl5ogmRp+ZMNMlC/KxQ8B/u9NGCpS
         wSuw==
X-Gm-Message-State: AOAM533DwOJ9F+uFMW95aOruD+jIsM2Pp1B0OiiPIBrftB6s/aOp4sTt
        YwBM6cbiypRdPxQpla0vboj7eGn1+pw=
X-Google-Smtp-Source: ABdhPJws3fNxzSrQK22rmbyi7KGqxh1T3GdCxtubhgcnnaKJWmhfQexYM8hbd2YDz0q39chsvGVrCA==
X-Received: by 2002:a05:620a:1123:: with SMTP id p3mr23765139qkk.48.1606764502150;
        Mon, 30 Nov 2020 11:28:22 -0800 (PST)
Received: from [172.17.0.2] ([13.77.93.178])
        by smtp.gmail.com with ESMTPSA id q31sm15979548qtd.23.2020.11.30.11.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:28:21 -0800 (PST)
Message-ID: <5fc547d5.1c69fb81.f4cc1.87c2@mx.google.com>
Date:   Mon, 30 Nov 2020 11:28:21 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============6290004192170548080=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ] a2dp: Fix crash if setup is freed while reconfiguring
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201130191749.1663518-1-luiz.dentz@gmail.com>
References: <20201130191749.1663518-1-luiz.dentz@gmail.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6290004192170548080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=393495

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


--===============6290004192170548080==--
