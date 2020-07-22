Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EFD22A0CD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jul 2020 22:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726685AbgGVUfG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jul 2020 16:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgGVUfG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jul 2020 16:35:06 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184DFC0619DC
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jul 2020 13:35:06 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so3055071oik.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Jul 2020 13:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=kIbGa1vclUuVgKVZJGdjVCXz2snjXal04BZ3OTVrcM0=;
        b=n0L+MCSTm2USDi0KGIOYXFAkRM8zL+XgUNvtV3GoOSt5Q+dCam0iDKzyHeMH8h2xnt
         Qs3f4MolMXyx9nnCR+dKoiG5VvjM4sBtkqoH/eSMP3QGiFdN55leu3qaEIoxIRcKARqv
         MR6ha+Uy5QG1la1Bs8FuMYCdcl5V9gdRtzZTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=kIbGa1vclUuVgKVZJGdjVCXz2snjXal04BZ3OTVrcM0=;
        b=cRF0Uo0TCxp2m5dhnTyKdOnJlQfEwPESm2O3+kDlHvl78A/82rJzy413tc5BLI4Kix
         Yc8W+B7NxzYKwdApcnL/ck5kf0WZAP9nU6tbNQ0++L0S8RRlSJcxKbW0xjBlCOtjYTgX
         zEAlyskJ033Er00IEWWf2H2ThS+6g4tIeACfusgVM6Asmix8hTmln2rm9TOZkXM7mchX
         89V4wjhUZoUx6N0dg4XiBFqSX/ZpqAGQ+3s5+j+P87yr0YbIt4IV98Lx8C+wmXjJ8Pyc
         CqfUFFlX0AlUZcR8mwXPl16XI2ZB1KOG3yZ/pP6X3Kgw0neatCq+9wP+1cnvPC1klSXG
         BNLg==
X-Gm-Message-State: AOAM530kXNcINWPAQQeFGJ9vBgOGzc9aU/2ppZHp9o83EXccP4TqAMsD
        /VlgYLbPkHbDlPEGmR4z17f8C0y6yRvKFEZkLFn0nYHoIQU=
X-Google-Smtp-Source: ABdhPJwxmEDU4PYWcgBb2mVbOyVZRxSty0hCqHq96QTzBKYdS9p7PedGWjjIDi3VxFrKBK5F2Tv3c9FJl6ulvJj2Od8=
X-Received: by 2002:aca:3043:: with SMTP id w64mr1191342oiw.27.1595450105052;
 Wed, 22 Jul 2020 13:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200717231404.240644-1-sonnysasaka@chromium.org>
In-Reply-To: <20200717231404.240644-1-sonnysasaka@chromium.org>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Wed, 22 Jul 2020 13:34:53 -0700
Message-ID: <CAOxioNnDkdKLUjbVfOy+b5C5h2F8Wn7PTeGO9Vq=pGUZsH7SEQ@mail.gmail.com>
Subject: Re: [PATCH BlueZ] Add a presubmit configuration file for Chromium OS repo
To:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Maintainers, could you take a look at this? We started using a mirror
of upstream in chromium repo, so we can not apply this PRESUBMIT.cfg
file as our own commit. It'd be great if this file can be submitted
upstream as well to help Chromium OS developers' workflow.

On Fri, Jul 17, 2020 at 4:14 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> Chromium OS developers use gerrit and repo in their workflow.
> (https://gerrit.googlesource.com/git-repo/). This configuration file
> makes it easier when uploading patches to gerrit with the repo tool.
>
> ---
>  PRESUBMIT.cfg | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 PRESUBMIT.cfg
>
> diff --git a/PRESUBMIT.cfg b/PRESUBMIT.cfg
> new file mode 100644
> index 000000000..10f89b741
> --- /dev/null
> +++ b/PRESUBMIT.cfg
> @@ -0,0 +1,8 @@
> +# This is a configuration for Chromium OS repo pre-upload hooks.
> +# repohooks doc: https://chromium.googlesource.com/chromiumos/repohooks/
> +# Chromium OS BlueZ git repo: https://chromium.googlesource.com/chromiumos/third_party/bluez/
> +
> +[Hook Overrides]
> +cros_license_check: false
> +tab_check: false
> +checkpatch_check: true
> --
> 2.26.2
>
