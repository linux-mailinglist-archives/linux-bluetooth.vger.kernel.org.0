Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B82307C55
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Jan 2021 18:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbhA1R0Q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 Jan 2021 12:26:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhA1RY1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 Jan 2021 12:24:27 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED38FC061573
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Jan 2021 09:23:29 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id k22so2233555ual.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Jan 2021 09:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SnPR19/gzlBLotwjYHs/jRrafI6MIgdRvVkQpJz5Kh0=;
        b=Wievzu6ba6wPFgathcUA8CGkMv5S8ztm2WnJlJnUDmKKiuayw/If75tUw+vEayUG7F
         2xz0Jz6EI8E/1DGLPGRIPHNq03snTSbFCwimjHUKS0Cc9J8jmjx9aybso5vjI6/e/N6J
         I0jMF7y6r106+7ese3b4SiICYXoVW+Z1R2sTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SnPR19/gzlBLotwjYHs/jRrafI6MIgdRvVkQpJz5Kh0=;
        b=n5WqTgdXLpBdzdfILrnBRSH/lRETxQK2JkpNULHhuNg6ctjCMyOvKcXHLMT8aBP6g8
         KX9Zesb9yHIPpWjGQmVSxkKr9ByQud3JpAJAllqnvVCI50Ayq1VojsyVIVkq7rH6lG5V
         +TzhDV8E12pz2dtkDbE1iVrimeHoHJwIvY9V53Lk11r4bvZIG99ZlxsHChwcdZrS/RKa
         AAr06Lj99dH767+3B8wYjJYlu0xrmhmeT2J7cvUHW2D9vz2elcDMK42zfDYGNZFArgOj
         WKLbXAADiDKszpdrWgeDqNl1y/6nRFSOIupKsWhsZji3vBVWCXTQY9mhMC6Y/YMs0ma7
         lKmg==
X-Gm-Message-State: AOAM532ppTUszXW/LB8sGP1LIoLHA60d4uwGharDokVZa5Ve3EoXYRbo
        KbxDT1fL2I2uowPv+5OVW4bsf1zk+ez+3oDCvXDOhX3b6Bw=
X-Google-Smtp-Source: ABdhPJyI6Z7mEpZ9y2erDWPX+dmZfvx1uy5nfo4KDc67MsYlxYgRMTpu3aJu+XzpacRPqnIxdTPyzn2c28h3mdiQsqA=
X-Received: by 2002:ab0:2052:: with SMTP id g18mr241720ual.60.1611854609091;
 Thu, 28 Jan 2021 09:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20210128163313.426404-1-hdegoede@redhat.com>
In-Reply-To: <20210128163313.426404-1-hdegoede@redhat.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 28 Jan 2021 09:23:16 -0800
Message-ID: <CANFp7mWKwF_ncnLn_ZTUL_fvorUQ33_-BPDWRfVafxr0OfrbxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Bluetooth: Add new HCI_QUIRK_NO_SUSPEND_NOTIFIER quirk
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Thu, Jan 28, 2021 at 8:34 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Some devices, e.g. the RTL8723BS bluetooth part, some USB attached devices,
> completely drop from the bus on a system-suspend. These devices will
> have their driver unbound and rebound on resume (when the dropping of
> the bus gets detected) and will show up as a new HCI after resume.
>
> These devices do not benefit from the suspend / resume handling work done
> by the hci_suspend_notifier. At best this unnecessarily adds some time to
> the suspend/resume time. But this may also actually cause problems, if the
> code doing the driver unbinding runs after the pm-notifier then the
> hci_suspend_notifier code will try to talk to a device which is now in
> an uninitialized state.
>
> This commit adds a new HCI_QUIRK_NO_SUSPEND_NOTIFIER quirk which allows
> drivers to opt-out of the hci_suspend_notifier when they know beforehand
> that their device will be fully re-initialized / reprobed on resume.
>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

This looks good to me.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
