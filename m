Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC81F15CFE3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Feb 2020 03:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgBNCW6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Feb 2020 21:22:58 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37310 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbgBNCW6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Feb 2020 21:22:58 -0500
Received: by mail-pj1-f66.google.com with SMTP id m13so3280604pjb.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Feb 2020 18:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qux6BbvWAe4p4P/wAZ0A+Tgsqzz5Ke6rXhlE3TNAZMo=;
        b=P8vKwe4xSe7pQWTLvaOXQ2q5lhGX0j40d4RSrt6o9LpHnxqiPRbA/zq73dX2t/4r/l
         Y+036nBLxx3FvWqRaXbp9aqDhnakRgcd6kkLBqsKEQFRYFD/DH97YduK36SuKZEH9rsm
         GoTs3CJ2/bT9pltuH6A81V3OT/M77eN42uY34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qux6BbvWAe4p4P/wAZ0A+Tgsqzz5Ke6rXhlE3TNAZMo=;
        b=QkoAcGDNvKe7Xb2n/evWkRO0/OpYJvX5TIudo2EFjnY8YJhjo1NNgcI+0KKxCB+R02
         Ro1pLtHztK8oXnb/aUZ9BfVgZt4ImZ9of6Olk+tOxbNDy7TI7EFvmXXLxPP0B/e29iAp
         dDFGcCu9VYxbfO12UzsMe63i3laCiEAeaHm5UwHMqFWc37RuNRh3+NOiZUxABTwz7T+C
         79rh/eh4PWpojzZDuiH7uyOKpZ3NFEK5LHYN58tX8rXHPjC0IR405w0M/v1+qVYbbfKl
         QKiuZRcNNBmA9UIYWZCQYuLVqbKXq6izrZ+wH+VE05OvP7qX+ctpekRMASllpgC+LgNQ
         Dp6A==
X-Gm-Message-State: APjAAAVnz/iZAOpT9UEDKiLdOSsRQwa2h3UHfGqMCu5DIJLKGyfZmAue
        ONGtE47OtV8VKiTGAGTDXBnyPg==
X-Google-Smtp-Source: APXvYqyJ/jvq2tN5ADG2mCUonP7BvFYO8jOQOL4ElMrE52UeGn5nCy1bOAxohojLnenru9dUsef8Qg==
X-Received: by 2002:a17:902:c693:: with SMTP id r19mr1018218plx.25.1581646977474;
        Thu, 13 Feb 2020 18:22:57 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id cx18sm4052762pjb.26.2020.02.13.18.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 18:22:56 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581609364-21824-1-git-send-email-gubbaven@codeaurora.org>
References: <1581609364-21824-1-git-send-email-gubbaven@codeaurora.org>
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Bug fixes while collecting controller memory dump
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, robh@kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, tientzu@chromium.org,
        seanpaul@chromium.org, rjliao@codeaurora.org, yshavit@google.com,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        johan.hedberg@gmail.com, marcel@holtmann.org
Date:   Thu, 13 Feb 2020 18:22:56 -0800
Message-ID: <158164697600.184098.7937205486686028830@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Quoting Venkata Lakshmi Narayana Gubba (2020-02-13 07:56:04)
> This patch will fix the below issues
>    1.Fixed race conditions while accessing memory dump state flags.

What sort of race condition?

>    2.Updated with actual context of timer in hci_memdump_timeout()

What does this mean?

>    3.Updated injecting hardware error event if the dumps failed to receiv=
e.
>    4.Once timeout is triggered, stopping the memory dump collections.
>=20
> Possible scenarios while collecting memory dump:
>=20
> Scenario 1:
>=20
> Memdump event from firmware
> Some number of memdump events with seq #
> Hw error event
> Reset
>=20
> Scenario 2:
>=20
> Memdump event from firmware
> Some number of memdump events with seq #
> Timeout schedules hw_error_event if hw error event is not received already
> hw_error_event clears the memdump activity
> reset
>=20
> Scenario 3:
>=20
> hw_error_event sends memdump command to firmware and waits for completion
> Some number of memdump events with seq #
> hw error event
> reset
>=20
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump =
during SSR")
> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
[...]
> @@ -1449,6 +1465,23 @@ static void qca_hw_error(struct hci_dev *hdev, u8 =
code)
>                 bt_dev_info(hdev, "waiting for dump to complete");
>                 qca_wait_for_dump_collection(hdev);
>         }
> +
> +       if (qca->memdump_state !=3D QCA_MEMDUMP_COLLECTED) {
> +               bt_dev_err(hu->hdev, "clearing allocated memory due to me=
mdump timeout");
> +               mutex_lock(&qca->hci_memdump_lock);

Why is a mutex needed? Are crashes happening in parallel? It would be
nice if the commit text mentioned why the mutex is added so that the
reader doesn't have to figure it out.

> +               if (qca_memdump)
> +                       memdump_buf =3D qca_memdump->memdump_buf_head;
