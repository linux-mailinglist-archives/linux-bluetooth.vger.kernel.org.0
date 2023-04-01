Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA86D328B
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Apr 2023 18:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjDAQSd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 1 Apr 2023 12:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjDAQSc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 1 Apr 2023 12:18:32 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BD32D5E
        for <linux-bluetooth@vger.kernel.org>; Sat,  1 Apr 2023 09:18:31 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so17231594wmq.4
        for <linux-bluetooth@vger.kernel.org>; Sat, 01 Apr 2023 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680365909;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps43Ql5Tjnd+rS8BdUE8H1PpwwGazEWm6mc1DzBYYUo=;
        b=clCiQyxFMc1IMo1zVOdGSzwTyiVrjBmFiMMbQWsut77PPQ5T8JqbuchUI+0u1C49/g
         6GdquIAUGemGGPPS9vy02GxrlG36K0f8w75tbXl019Qf8Cc0hx1RSmzEB6U+3v/PkdfA
         /qt+zZ630YAgSljRE8bVspHXTRRj4svBnythzwgzRPxOoWoiJjJHEsvaDGkAJbWqa7VI
         NlaR9NWznudbQc5ktDSJqs4Z/tL370eVeXSFN55sR8BWQMUXA8wwXZW9fXxVqGxdXlQA
         eFkDJgKbERkyvLzhfohRZXnW44nWyPPqfNS6ofT032QZEG9uqdfxYOUcrOOHCWnkHjuq
         Wgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680365909;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps43Ql5Tjnd+rS8BdUE8H1PpwwGazEWm6mc1DzBYYUo=;
        b=nccwl5vlxxAlz2iQFGfTVXk+fd0y2ryl8ED7+3JoRJdR19mCvCCCgqvVv/OQwPFpfN
         ZmDyelc7CW5AzmfpMzdS6a7Q1nMChTfXNBT5ogeI/v7cxnDbznnEZ0kqcxaUMOI6geAh
         hsWWoXbH+4fQx3EDR682lomY9c6xfPde7vTj2n3gnu/+H6gYVX5hTOjiuo+/cLAZBZ1p
         GmeBCGnQQW7ia4HsmeRD0q6LvLxrcEs2wgV9V9gxGoLs3z0OlX2Kj+xbA22W10FWuhIs
         2Q8Kow+ATU5qq2KRRjuXBFpDFeDCtJ/UFah160fY2GX/At8EaxtsX5qSbl9ZNX9mKn2z
         cBsg==
X-Gm-Message-State: AO0yUKXLMw7Gq+9UmhCAq6KWHS4qvO1PeEAsKhyuef1GjTalHLnqeLAl
        sZcvGra9S/Citiy6nq8vy5EifmPrPSyZOGfnrpQ=
X-Google-Smtp-Source: AK7set9so8npwppCo0ymgP4o+QxCbRH+oR9hue9PoNrJ35oTYN207M6IMCLuRDKRv2bzM9266/5/7fDy5OYMsotcCWc=
X-Received: by 2002:a7b:ca58:0:b0:3ed:d2fc:2fe7 with SMTP id
 m24-20020a7bca58000000b003edd2fc2fe7mr7111523wml.0.1680365909520; Sat, 01 Apr
 2023 09:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:680f:0:b0:2d6:b1c4:af13 with HTTP; Sat, 1 Apr 2023
 09:18:28 -0700 (PDT)
Reply-To: fiona.hill.2023@outlook.com
From:   Fiona Hill <sylviajones046@gmail.com>
Date:   Sat, 1 Apr 2023 09:18:28 -0700
Message-ID: <CAGH1ixvEKHOvPw7zuuAHrdcpLw0Y1NtgnB1Oy0L9qjr4oaYX-Q@mail.gmail.com>
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
Hello did you receive my message?
