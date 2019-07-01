Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9C645B5E2
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Jul 2019 09:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfGAHpx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Jul 2019 03:45:53 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46054 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbfGAHpu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Jul 2019 03:45:50 -0400
Received: by mail-qk1-f196.google.com with SMTP id s22so10229417qkj.12
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 Jul 2019 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+o+3A6MehkTrwlHzPltAkDqnU8gp0GmaahhvYz3RFyM=;
        b=UdrWy5ns7RKotFmMefez/oD/AycEJAzAu1LjvzFxXzIV4kW8lF6C5E/yvkt5ySrF2j
         VZDVpG1ExkBJNYT4TPy37N15aHPWJOKrG0nY9m4OjJLRSTfTGqcpMiJnTdMJsEmz+Wvp
         k9akBzRMejSTu+YvWpnerRXCUEi7t8r6qcHD8BX0XETVMQXi0yDhP7wJf3HiIxA7M11z
         l/qTa/6tXlTHU7hBV6uY0/UktA+siFSqUlbatFBKeu7DEyO7kMrEUwX12d0HM0dHm0MB
         Qe+bwPd7IUi30U/ZSU50pUaYEzBaHpIS4/QJE/CAxYsfIeyBM4LDj9P1KUP01THV2dp7
         pnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+o+3A6MehkTrwlHzPltAkDqnU8gp0GmaahhvYz3RFyM=;
        b=VDURiLUHHTB28AyGzpAqvbKZAs5bx2Fi5zeRcsuRY9s5jVaZIGad/S874RyA2GZFr/
         AruxqCL2SPIzeBPMBpmzmDntNHyiuv54Yfp8/mNcWgf9/Ge0BKQVynyl9SEPZ3G8Ifxt
         UAQxw2GySXnVmBCd8oPB9Dk0dv6elwk46nEoPnpfbF6HWYFEc+RCOwFaaBV7LFKh7e3y
         XXBaysMB/nfvpgNHPfa8uRTnGRGfseNf1k2rKW+f9j/eb/3nXru7inVbhFp1Lgp3yjmT
         9dLymvzD/iPYe4QdGJQGST842qJmRjMHHjlDoOQdqu+6zN5qBrh/5QuuOYKFkz99yrcX
         dlEg==
X-Gm-Message-State: APjAAAUaq2lYs7xExy9na58BptEUAYoYBVtRYYjjANJMrOIXxTfpw0GX
        EhxUJCcYhuvvBpE6y7z1e0cQ+z5fY16EYxyxSl0fSA==
X-Google-Smtp-Source: APXvYqyXMdwt3gy6gqvDfkjOmeiiPp0dk+UezJGobEGYLzx6o98gaaTwQAzlig0mzlY7lUACwRRaawq+a4PtpXv8WBg=
X-Received: by 2002:a37:6808:: with SMTP id d8mr18821969qkc.478.1561967149291;
 Mon, 01 Jul 2019 00:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <B8AD29F1-444A-4BB7-8C12-9C31EB974D11@holtmann.org> <20190625083051.7525-1-jian-hong@endlessm.com>
In-Reply-To: <20190625083051.7525-1-jian-hong@endlessm.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Mon, 1 Jul 2019 15:45:38 +0800
Message-ID: <CAD8Lp44ZZZGf58XKZ1PFJrC5UqdQ17v17-nnEYC-Ro0-G_u1=Q@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btrtl: HCI reset on close for Realtek BT chip
To:     Jian-Hong Pan <jian-hong@endlessm.com>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Linux Bluetooth mailing list 
        <linux-bluetooth@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Jun 25, 2019 at 4:32 PM Jian-Hong Pan <jian-hong@endlessm.com> wrote:
> Realtek RTL8822BE BT chip on ASUS X420FA cannot be turned on correctly
> after on-off several times. Bluetooth daemon sets BT mode failed when
> this issue happens. Scanning must be active while turning off for this
> bug to be hit.
>
> bluetoothd[1576]: Failed to set mode: Failed (0x03)
>
> If BT is turned off, then turned on again, it works correctly again.
>
> According to the vendor driver, the HCI_QUIRK_RESET_ON_CLOSE flag is set
> during probing. So, this patch makes Realtek's BT reset on close to fix
> this issue.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203429
> Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
