Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D56C641930
	for <lists+linux-bluetooth@lfdr.de>; Sat,  3 Dec 2022 22:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbiLCVSp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 3 Dec 2022 16:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiLCVSo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 3 Dec 2022 16:18:44 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2462A1A053
        for <linux-bluetooth@vger.kernel.org>; Sat,  3 Dec 2022 13:18:43 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so3505094pjb.0
        for <linux-bluetooth@vger.kernel.org>; Sat, 03 Dec 2022 13:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h168AaiDjF2PxjYcrauF4QKAoAcqNVRNnL32bHHefOo=;
        b=MYFaltxDnC8YJ/FTCaASiwwaz3glsjdGk0LFFUH1w8fJUIb96HIhbnqwIpQn33OrQm
         Ard4WOIznDh/Eb5fOUMeMQ9PtU4hRZTSAFF2rQ/zSjdXYIVP3VHVi6x8tekAZYBhFlZD
         VdAWntoB5CxbADnuNsiyinwc/+arktHw9RizVXlFqG0S6jaa1cqL0ZrOg0jwKyerSNVn
         A6zucknEIrHHIvjv25P8CD7Nl5KxC9Ff0TI7WNhzTHPmtM1bcmEcMSb2q98Dh0qhcnlp
         GN6rEmEVbxoYiTnME+GUNBJqr2KcTcJ42P7ynyuuHmreMQnjorpzMzDCFs0z0XVvKCca
         +PNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h168AaiDjF2PxjYcrauF4QKAoAcqNVRNnL32bHHefOo=;
        b=m7dvpgrCq8iYasx/QGZcoc7vV6Cq1uyseI+NkgxDdbWuJ29+DKAGyVgyFpsvQSfwwO
         CAGjJBmfRHicSdLtvRKP5OdnY//p2GvYXoQNjQJKirdizXpGY1NZdJ2tigQWWhTWpAVF
         Lmx5P1p4DMTTIUf3N+xaXKRPDal8l06FbIraFBiF5nxbz8rAjU7nCOsuOLbRy3XHpE2y
         yb3y8IBTN3svnRF2XZ4S1kUz3CHLey0SEbniLSSw43jJhYK0iRXH7YwYHlNUhUbL9/KJ
         cqbrPy9YS62dIaIrySBfQAIRG1Hx0EP67ewJheIXGZz4M04bmlzqyNztI4wl9IBf8dZX
         sXAA==
X-Gm-Message-State: ANoB5pmdh9T1kvrF7OxyiiKuKT+7hukA0BkZLl5Y5m4q1E5Dq/iPNZGS
        c7BmvDwU5ZzcLVoptBwN1doxvDfkQswKF/9j0mg=
X-Google-Smtp-Source: AA0mqf7yuKPXkZgmfZQoacF4LV2FS7iEa9EqNUMNm1dcfjoVwThvjf43YspC11Bq7vZRqbXOIJAv6EKJV7I1tVHbG2w=
X-Received: by 2002:a17:903:2112:b0:186:67b0:afab with SMTP id
 o18-20020a170903211200b0018667b0afabmr58714085ple.17.1670102322452; Sat, 03
 Dec 2022 13:18:42 -0800 (PST)
MIME-Version: 1.0
Sender: rabiuishaku1@gmail.com
Received: by 2002:a05:6a10:c64a:b0:360:f6fb:57cb with HTTP; Sat, 3 Dec 2022
 13:18:41 -0800 (PST)
From:   BARCLAYS INFO <nigelhiggins.md5@gmail.com>
Date:   Sat, 3 Dec 2022 22:18:41 +0100
X-Google-Sender-Auth: N48TDSrexluhJcAzUrNPYksX8g4
Message-ID: <CAOmZXYAzU+H9zhRS85zkgLYHWBCBtaYe03j_LjR5ZUBYZmr3_Q@mail.gmail.com>
Subject: Re Fund Payment Notification
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Dear Email User,

I am the Group Chairman of Barclays Bank Plc. This is to inform you
that our bank has been assigned by the world financial governing
authorities to pay selected pending inheritance and compensations and
your name appeared in the list. Get back for more details.

Yours sincerely,

Nigel Higgins, (Group Chairman),
Barclays Bank Plc,
Registered number: 1026167,
1 Churchill Place, London, ENG E14 5HP,
SWIFT Code: BARCGB21,
Direct Telephone: +44 770 000 8965,
WhatsApp, SMS Number: + 44 787 229 9022
www.barclays.co.uk
