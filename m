Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA2F6444A3
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Dec 2022 14:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbiLFNeV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Dec 2022 08:34:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbiLFNeT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Dec 2022 08:34:19 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FD125EB1
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Dec 2022 05:34:16 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3c21d6e2f3aso151459277b3.10
        for <linux-bluetooth@vger.kernel.org>; Tue, 06 Dec 2022 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=plIPv+lnMIRiOFIe1dV+2tGtFokN2PX8I8Vl98aLxQc9p4eid896+qqRiD3cj5lfhx
         z1hiGYil0vHTQsGiaUgsnmnfx7Jsn5jop25MSUm4B/gJqMPAdiI+jqYGT4X+agKLBheY
         M4kLaJ4VYCDPrPdHz+VgEOo7V/8+VLiplXwZ5AxhmuB3ZAIj06bRIm6vVBa+cxsfUC69
         p7oJjaq1f7uQyzM8lwAnIzamm5TXtetx0xVW4yZv8ZN22bVtgp/BSdTYcvwessuJv/HS
         +NRVIrLiepTygJiUKe8fSjaB2LODMLrNxWaYxbpkKlISbamBewTovVPI3Q2nv//3DE4C
         AORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=KazB1thJMautgGy38mLtqbj6pbjZVivBi+911nF5ZiwKSJUrCVXKaG9SFpY6p03kbN
         PVGTerEc7OTHaiFvK8N+mQuIf6ytXpetub51xBjw+Yky11UMhlh306dRENTWq3kaOBFM
         lNlEa1OqbkgVV460pWUvYkw7ZXe9Kdi8AGUzsxlXx1BIbzPgKeBPFXe5te5BWhNBdQqI
         +S7Gd1Jk1q1RUIDCpdKNWzLfmXbKITqTZ0Sn6cvoyKyqduOa5T9OfNCS7O2LW5T6t9iT
         toAZDwkYdduws0G8pP8KBV71btpcGE+7TB/ydXRHMFlw/TgsFNbzC7uAwLnPi/Mg5Q0X
         nNAw==
X-Gm-Message-State: ANoB5pkzvAOVwUyNnV2VdjrEYDauXrwPi7lGrgCDh8IiH2ErZd4BvUSE
        C/Ud48nYYojZSzXHG7y2b+70E/H6/3bHC2ORFVM=
X-Google-Smtp-Source: AA0mqf5LIFZdFA8gXtM15wCQVGRPhLW0DnkI1aVHz2d7yBbqXPecX+J2gwBesGTmYMSfngKxp/YLH/vq5s11h8+sSxc=
X-Received: by 2002:a81:5243:0:b0:3d2:2098:c5fb with SMTP id
 g64-20020a815243000000b003d22098c5fbmr31224498ywb.121.1670333655770; Tue, 06
 Dec 2022 05:34:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:a205:b0:314:d2a3:70a with HTTP; Tue, 6 Dec 2022
 05:34:15 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <mrkojofofone01@gmail.com>
Date:   Tue, 6 Dec 2022 13:34:15 +0000
Message-ID: <CACJtp8tgBjrWD7ywREfL1yUK0-utTuArETnYq7P42dWiPJKSBA@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
