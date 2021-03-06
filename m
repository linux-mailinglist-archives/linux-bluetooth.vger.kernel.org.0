Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F55632FD7C
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Mar 2021 22:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhCFV0K (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Mar 2021 16:26:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCFV0B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Mar 2021 16:26:01 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49DEC06174A
        for <linux-bluetooth@vger.kernel.org>; Sat,  6 Mar 2021 13:26:00 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id q25so12638551lfc.8
        for <linux-bluetooth@vger.kernel.org>; Sat, 06 Mar 2021 13:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+lno9UFvf2wznFCPlIyAlXclQk6bNr2cpMxAvyFk0ik=;
        b=iYLB411PeR51VhvGeup2Eg0t5NCrR3dSIoU2oj5vm3E+cXdpGRYTBwtudQX219wPU+
         +84s3K7nY/xc7/NlYnHJObri39q+q7dxx0uHC+0ZqPVx0m0JBPcuwzU98MsIFMox4DVQ
         crwMFtDlaLhJya0JooXSwCAF5yZ5AeZxre9i445oJR7mus4DesBeOB/q5lgbmY36V2lp
         Gn2/4eS5PpNRIdQROX15i/8nYdoqJi249xoKBwTnU7oHZJJPicX+oqvpDKL03CXE9lEz
         EEptEuKZLMDRkhlAClwPOCOQSq2mfR+7I+zIkdLBtIr/phOvqYzklvD9Oa8X3x61Goz9
         6CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+lno9UFvf2wznFCPlIyAlXclQk6bNr2cpMxAvyFk0ik=;
        b=SAVEINk5FWt4NG2M8xsCdE4nJzU3SmWtJr7zUo2weePkwq0+Q8e6a7EERN3erohtdN
         +MrMdtJ+zypixR87KU2VmOxfoRcWUQrobYUCmoR2Dr1ARMNbRkVWPnzFuILhtUd9Od/9
         xgL+mdKI4Tj/S49V8cOBBahlNRIIBQnZU1DjuyWSfF2vPM8cZN8kAQJc0bc5JvQggpAF
         zqOewvs9bfUuhs8piRhRfQheNKEAFNgRkqaHYQ6wqh3Lz/eA1/eRUbehW6hERqhF2em0
         SwhJ+myjXCOiJqwVY9uFFWlhl7rkrefM2lTkFh4bLR1sFR50HazpxSCXMZSzpwpkHCqh
         C5Gg==
X-Gm-Message-State: AOAM5330XyNrJnORGuXBfaQu36AhZIAPfvO0/u4oUgu1dvO+emmhJqin
        SCb0MajBxuK+a3UeYVwPQphV78GYG7xQrR9hM3SnBYQlLNEt+w==
X-Google-Smtp-Source: ABdhPJxmvXvOb6eP/bUi1dZeb20VTcmKQ1qRwOHiXeDiqbZCDikgtPElfB7eiymol73KI0q5AfZbixQrT4ThJqP8vTs=
X-Received: by 2002:a19:548:: with SMTP id 69mr9652654lff.465.1615065959329;
 Sat, 06 Mar 2021 13:25:59 -0800 (PST)
MIME-Version: 1.0
References: <20210305183736.2123083-1-linus.walleij@linaro.org> <60428468.1c69fb81.b7418.13d3@mx.google.com>
In-Reply-To: <60428468.1c69fb81.b7418.13d3@mx.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 6 Mar 2021 22:25:47 +0100
Message-ID: <CACRpkdai0Z0mYq79ujVT=uFqFy4de06SXC4ECZpY_jRQFsjcwA@mail.gmail.com>
Subject: Re: [1/2,v3] Bluetooth: btbcm: Rewrite bindings in YAML and add reset
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, Mar 5, 2021 at 8:20 PM <bluez.test.bot@gmail.com> wrote:

>     Test: CheckPatch - FAIL
>     Bluetooth: btbcm: Rewrite bindings in YAML and add reset
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #21:
> deleted file mode 100644

This is irrelevant with YAML bindings that include a maintainer in the text.

> WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst
> WARNING: DT binding docs and includes should be a separate patch. See: Documentation/devicetree/bindings/submitting-patches.rst

I don't understand what the problem is here. Probably checkpatch
heuristics. This is a separate file.

Yours,
Linus Walleij
