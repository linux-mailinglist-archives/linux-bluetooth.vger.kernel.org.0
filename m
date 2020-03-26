Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A31194550
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Mar 2020 18:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgCZRVD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Mar 2020 13:21:03 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38294 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgCZRVD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Mar 2020 13:21:03 -0400
Received: by mail-ot1-f68.google.com with SMTP id t28so6683756ott.5
        for <linux-bluetooth@vger.kernel.org>; Thu, 26 Mar 2020 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Dp8AfGEc4pG6IDCBSgLmlAKmq788PjytsmDxUXbv+RQ=;
        b=knAjWFigiD1eKn0q0cRkCcuMdCXdwW+HGRf2n/xFfbWSII2nKsQGLTzQ4K1Kp/NmAW
         TFAq8taWOyMrELrd110wrnV2b3KlRcC645r962vPWHvdT91+laWQqvwriSHtLg/G/QFU
         zkY0QeqWmnpgWPhbuQFBTSdJjBi8mLWPdCu5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Dp8AfGEc4pG6IDCBSgLmlAKmq788PjytsmDxUXbv+RQ=;
        b=uAq6hX2JG6a1XU8fCnZZPGtIpMqDYNSiZ9tisKItKJrfICLewSpTkGmMaItm5GAS3L
         2hzHUM0E4G7aCGxnBOASBhsQyLQCJKqaGAbDMQx5GASq4eSrlfig2d9EeRTp0ppzHFDQ
         4OYNWB1yZJG3M+sKudoyLPWYxMXGMjvlGEiadJJqTI1f/Q/TBkQJv5dfqYdbXnNIX0Dx
         CsQFVQ+d2PqLwKRU7capnOovzxZSEXhHpvOz+W39Zqs8UYfN6mmDDKBcyz2IBfKTcsgO
         fUacTibTJdH0l7nB94ExHUlwDuNHGiVzFWAd/dKSAQTyfSpFqpx1DWNQ+QPJ2ltlTgNx
         S3Lw==
X-Gm-Message-State: ANhLgQ124p8CmpZbrU2d4DCaFt4oPVtp0lWDIE+ARnZwKu1T07Nb3pXi
        Rt2IAfNEPj8+NnRRg7l7GJrd6ZyQhAv1CyL/frLNKSvC
X-Google-Smtp-Source: ADFU+vvY5TnIaN1zUlcyaN4iampRF7UgmPqmGv9NAhu58r+850BmINIkdCsYG4JS8H5X8MqFSYf+5uo12F3jzXNaQyY=
X-Received: by 2002:a9d:1b6d:: with SMTP id l100mr3538363otl.70.1585243260969;
 Thu, 26 Mar 2020 10:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOxioNmHcCTkc1MA6Zw8WTPBHCTpE9XZyzfOeuj97EP2NeBw=A@mail.gmail.com>
In-Reply-To: <CAOxioNmHcCTkc1MA6Zw8WTPBHCTpE9XZyzfOeuj97EP2NeBw=A@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Thu, 26 Mar 2020 10:20:48 -0700
Message-ID: <CAOxioN=7jGXxp+=c674Ai3bU5N3f-qRpd3zHDuOdSO93W3dnwQ@mail.gmail.com>
Subject: Re: [PATCH] autopair: Fix compiler warning
To:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi BlueZ maintainers,

Could you take a look at this fix? Thank you!

On Tue, Mar 24, 2020 at 12:49 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> With clang, comparing an array with NULL generates a warning because the
> value is always non-NULL. With maintainer mode enabled, this becomes a
> compilation error.
> ---
>  plugins/autopair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/plugins/autopair.c b/plugins/autopair.c
> index 043bd9b9d..3089430a8 100644
> --- a/plugins/autopair.c
> +++ b/plugins/autopair.c
> @@ -75,7 +75,7 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
>          btd_device_get_product (device));
>
>      /* The iCade shouldn't use random PINs like normal keyboards */
> -    if (name != NULL && strstr(name, "iCade") != NULL)
> +    if (strstr(name, "iCade") != NULL)
>          return 0;
>
>      /* This is a class-based pincode guesser. Ignore devices with an
> --
> 2.17.1
