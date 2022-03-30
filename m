Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E221D4ECE66
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Mar 2022 23:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350915AbiC3Usn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Mar 2022 16:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232234AbiC3Usm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Mar 2022 16:48:42 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFB72DA9A
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Mar 2022 13:46:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so43925822ejb.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Mar 2022 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=liD2gfhyOXP3mhvUDL+XuWtoVfvWgJHIwpuC5U6JPEE=;
        b=BijS/zP6AymqxuQoR02gV+PGo+dpWfopPRZmJwkOHduRid3mu9hR4ccm61zJS6e+0w
         pBX6Lg4VW4dccyudcGx92+JDud0noTe+M3vSll95HuwhFPJP2QE8lYc2l4SBtqSZAen6
         AVLoEnPXLiDkTyUe4fxK2fBXaBOoYazUIfTr5z7zgG0S6A4oUgsgTeFoPwjms/sGxDVF
         VT9TAJB9uiwxDRh2NXQ//OsUBZcZ8Q8dw4IURN8s9oEsUaGQqNkte0BbFoPa3Hu2nJHA
         g8LBTVLzsLRUme/7SlUa7lrTunEr22AtHV/HXjJ+Smqg6cgk2TYdjln8jlKNAGVke/9/
         of2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=liD2gfhyOXP3mhvUDL+XuWtoVfvWgJHIwpuC5U6JPEE=;
        b=zXHke6RAQLHOH61ly7SqSn9H/mLY4VSyldy6VyA170TUeiBx8Rw6689pUtrjCW89Qr
         KOptScdvIJn48qT2ByuWPjc7WR3kFvzTuQ1P64ljMhNmPdp4Z/5nGOi9i2u3t75l+B6m
         aicJJbr1o3iHqu1NGcxaVvw1VQnNkA/AbYFNbOqR6U+iP/VFXHDCpBPlbNGH5VkCndUv
         rKGkecmcXqxVEwftk8LAKw0Yp0z26KSx3enbAJ6sLO5lCSYiZYuTyqe+PspIPdSrCLOV
         vKNJGdRka3C755E1OaGZWLsH3S2ikDAeJnlN+xfMqNDSR5oj9iazuJL/6m2plD/fzmBp
         0Sag==
X-Gm-Message-State: AOAM531MhbJdSZb8VwjAJUtRZgRz4z2aywN53CzEW8zQr4t8HVZGG89J
        rpAnq/kTp1j3LaUMxry5gbBOtfhHM4EAfm0xBXs=
X-Google-Smtp-Source: ABdhPJy3u2LlHi1bZ3Ou44ILnnhSIDpG885SrYRzSzOGzydktQZAsSTAjuIC0bwX2KLfu4DiWlM27UnAnbmYuOpvYQA=
X-Received: by 2002:a17:907:7ea6:b0:6db:ca53:9b0a with SMTP id
 qb38-20020a1709077ea600b006dbca539b0amr1499558ejc.763.1648673214545; Wed, 30
 Mar 2022 13:46:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:160e:0:0:0:0 with HTTP; Wed, 30 Mar 2022 13:46:53
 -0700 (PDT)
Reply-To: olejniczakk031@gmail.com
From:   Olejniczak Krzystof <amaandablessgod@gmail.com>
Date:   Wed, 30 Mar 2022 12:46:53 -0800
Message-ID: <CAPWLybxacdB6-UEGjzzHdNSwM+VrE-oiuqhEt+GZJY20xYpFSg@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello,

      I have a business proposal, kindly reply back for more details.

Regards

Olejniczak Krzystof Marek
