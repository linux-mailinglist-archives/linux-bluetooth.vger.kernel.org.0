Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B619F285424
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Oct 2020 23:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgJFVwI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Oct 2020 17:52:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbgJFVwG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Oct 2020 17:52:06 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF64C061755
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Oct 2020 14:52:06 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id u74so73914vsc.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 06 Oct 2020 14:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YeppZLiu9tLWSM88xn2T8mZXPgzIZZbq1gb5kP8VyQ=;
        b=D0CViFWicaJSRMBsvFS4k9lLoXmgiJv4f+Oe3aEX6L4BH+k+fQhTgdb9RxiwKym9Ty
         AkO2ovhUXu5tvyDDEePWlNObPVa79S2+YzukhMfrJ9jZf1XRLwO3+RjZXEfIgXAWezfA
         xLAB3c+qvgTS9/AFEvykcnXHHS93FRYNsfSFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YeppZLiu9tLWSM88xn2T8mZXPgzIZZbq1gb5kP8VyQ=;
        b=YpcKPJQ7WAGo+STc1d1X7vQxclSsrCuUbgtKUd9T4FsF+AkzooWDsrR5MM1FDyNfY7
         12nGmoTrSyafL+LiilzGBssC1PjE6GDAwLUBTJM2zRJi+3EI7C1qGrcG0aWago3ZaJgL
         jpTuZxNVriXv6MzJPo9s1ZuedPnbQJrKVI59sMGdD7PNE9IbjlzYHI31p+rK34zG513r
         PbIgk9Vvk57aC2TsgRwLif6E1SWOabVCFszfkC90OjMdbuUrlh5Tx5zhmpyN6/xQDDKY
         Wrl8/Kx1GzHjYyMJxCZe+ubGl/BPLsuXl7h01pgnoW9m/9yEQKDYNiEK8ypqOH7L2hZs
         W+iw==
X-Gm-Message-State: AOAM533XY219OvOY7FIE9q947j95ePa0k7U2/FaAMYNjbXNCjxijzbzT
        gpgTiCzCgiN6tAQVeSLownctPtJMqz8KYyrluDPfNA==
X-Google-Smtp-Source: ABdhPJzae7J4+h5AoXghKCrPweh+Hv6Ybexc6cVhxtGSicYb/I/1mNGUDtRerOoUkrWc9T1RPJH+P6YO7cOVFUSgGYE=
X-Received: by 2002:a67:8b45:: with SMTP id n66mr72042vsd.45.1602021125669;
 Tue, 06 Oct 2020 14:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <1601965767-18796-1-git-send-email-bgodavar@codeaurora.org>
In-Reply-To: <1601965767-18796-1-git-send-email-bgodavar@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 6 Oct 2020 14:51:54 -0700
Message-ID: <CANFp7mXYsK=+aAmHoNwTnE3+b0HbTa+k1NQb_1MD9FaLBYXdug@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enhance retry logic in qca_setup
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Hemantg <hemantg@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On Mon, Oct 5, 2020 at 11:33 PM Balakrishna Godavarthi
<bgodavar@codeaurora.org> wrote:
>
> Currently driver only retries to download FW if FW downloading
> is failed. Sometimes observed command timeout for version request
> command, if this happen on some platforms during boot time, then
> a reboot is needed to turn ON BT. Instead to avoid a reboot, now
> extended retry logic for version request command too.
>
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
