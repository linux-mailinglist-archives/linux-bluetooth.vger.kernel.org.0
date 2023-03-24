Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FAE6C7DB3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Mar 2023 13:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbjCXMGw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Mar 2023 08:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbjCXMGt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Mar 2023 08:06:49 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 003CE23C7A
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Mar 2023 05:06:46 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-17aceccdcf6so1490705fac.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Mar 2023 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679659606;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=IFTKXPgmH+JwUWSaNg6Lwhqmbh6HJwwViU9pzV0NYNicSmq1A0suSGWkJedmK1i6rw
         zdPMc2yhFhc0XnUBELU2t9weSI90m36Nu9+L+5A99ujJAYIaS3fSQazP1QAQlIGLenlz
         ftfXqxbaZiqWFcP4vR+k3yVeFzfXhmYtxmsiu3ijOe3tbHM6hxJIq0Mg3chco6xsUIeC
         kT5+t6o6F33PPF/aFMBKYHPfnpSfisKKwqqDYyDr1IagIe/KW8r2uFqQ0I+nuN1bU72Q
         KBK6fRbVwPy98grhixQf3aE+b9dZ3iyBvApsRlhcRpQHCJKbyUBPs1JIY7qVUmH+SQdk
         ButA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679659606;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBlRr9q265Nv8kRQVI2pIMY+89rTouQ4PH5QCVhBU8c=;
        b=SmmHu0NFTnL2iVyTwaS5l4ihLBabLnyfU8BdXKXIQGy+5wQmo94TlNkTFgvadxDrDA
         XZvVeIrFFRXjt/KsTTFmNCcpMjigjejg9kh+B8kjsWyrcbt8/odPro3lb+Rf0zHHyoZC
         5gYYKoRo2tTtSzgxBZtLdQiMezcb0dQIC9I/+R2rpeVbnvl35Dxvi8tvP5+qDtNtNLmc
         K3xmwUm+xVcVsUIdczEPu9iiMg/DwYm7mhrIDYzzNxJChbrlK0vMmG9fdBlFpJQkgKyf
         FcfrYx1mOyeC5mQbk3/BjVnCApPS22HOWwYZF7wVZN1tS1N1RTvAhlGhGRYVXpvBXPL2
         MYxQ==
X-Gm-Message-State: AAQBX9ezZTNHi/egoKzkQlMDFtwU5hSl2iPcgv5WfYyFnLPBIjO3eZQS
        Lrw21EY5U6wkbOLFWpMGK7s5DReSV3OF3Mdl1TY=
X-Google-Smtp-Source: AKy350agvYrD/JhcZHVQkU+kEEW/BIo1GkZ1QL2cnrjhUPpAPT7D5GuG9IgGLzIoQxgjwYsbk7/q73IymPKh5QN0200=
X-Received: by 2002:a05:6871:4d03:b0:17d:1287:1b5c with SMTP id
 ug3-20020a0568714d0300b0017d12871b5cmr933854oab.9.1679659606332; Fri, 24 Mar
 2023 05:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:1087:b0:eb:2721:599b with HTTP; Fri, 24 Mar 2023
 05:06:45 -0700 (PDT)
Reply-To: fionahill.2023@outlook.com
From:   Fiona Hill <hasanahmed62621@gmail.com>
Date:   Fri, 24 Mar 2023 05:06:45 -0700
Message-ID: <CALpxZtjacaNg872Tj83hTMZAd_xF9pn15DTLWzFoAgJv+ayESw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello friend did you recive my messsage i send to you?  ple get back to me
