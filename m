Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2600A1A38F1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Apr 2020 19:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDIRc6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Apr 2020 13:32:58 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43129 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIRc6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Apr 2020 13:32:58 -0400
Received: by mail-ot1-f67.google.com with SMTP id n25so8658006otr.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Apr 2020 10:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mp9ron0QEbR+5PIC/6wd8mlHTQ3C2lOlQANEcm1kIPk=;
        b=LhxWNog6VVrgOvZOd6G3ZQJUpCHiuIk6yxEutecouJO6tGdNTsHulwM91owTqIFmwP
         EaLc+m4veWreX5at+Shm1YjJCHjf/9mO1338i0wUmlRtT2+UE6KywrnJx0THLhVzE+Ql
         LVaMQbvPW0YZAQe6YZGOfc/qV97n6E4QTclaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mp9ron0QEbR+5PIC/6wd8mlHTQ3C2lOlQANEcm1kIPk=;
        b=Nmxsod4V8qQPDTUzp6P1k3ThgHbcO0rVIc4NuKPS3ooMttSC87kPyMp5NIseWuGhx+
         Qt6gY/f4bYnJW84WhMW0rFCuu16KBWeFG919qf6aWxSI/o1xUwJf9XieK1YW1vdptXd8
         a67NnNxqOa/vEGUfqwyqIFQeeKE8baag/I1/QlYTbqN6Rs38cQr7nW9sUFHQz1BFoAXY
         VPaZJe9+jPZnUCkgoR6Jfd9sPlelB23wZ5fldtsuxqVHiUB41nuEup6XR2TuW1uxdcAN
         I5Lso80lK77OuT6bMbBDD5/l2q1Na52nFlovJFhc7R7yBUfq/KZN/ymoKcv6cbXo8kZQ
         TG+w==
X-Gm-Message-State: AGi0PubiCTsgDkZyoQx0LYvRQ2+wnS9doaSkP2A7ueAI8339VEY23Zgw
        12ZhF1pwdzSH+TfWPPiEHmut4NxtLICACini/HwrAbJZdKs=
X-Google-Smtp-Source: APiQypKnHP7JJ/UOIb1NWR+NfOlMqkd3p1ZIQezrHa0Qko3rdv4wDaUQCokFL88/t/g7xBGI58BoGwPTa3THk2T+axA=
X-Received: by 2002:ab0:3154:: with SMTP id e20mr160174uam.136.1586453077481;
 Thu, 09 Apr 2020 10:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200304010650.259961-1-abhishekpandit@chromium.org> <20200409170742.27865-1-youling257@gmail.com>
In-Reply-To: <20200409170742.27865-1-youling257@gmail.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 9 Apr 2020 10:24:25 -0700
Message-ID: <CANFp7mV_bTKwMPt44BpvkuUtnYz5yh2qhzprbgwhDaqwR8duvw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/5] Bluetooth: Handle system suspend gracefully
To:     youling257 <youling257@gmail.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, hdegoede@redhat.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

Could you collect more logs w/ dynamic debug and post on the bug?

Dyndebug instructions:
https://www.kernel.org/doc/html/latest/admin-guide/dynamic-debug-howto.html

Please enable debug for files hci_core.c, hci_request.c and hci_event.c:
(for example: echo 'file hci_core.c +p' > <debugfs>/dynamic_debug/control)

Thanks
Abhishek

On Thu, Apr 9, 2020 at 10:08 AM youling257 <youling257@gmail.com> wrote:
>
> This patch series cause a suspend problem on BYT/CHT device, https://bugzilla.kernel.org/show_bug.cgi?id=207169
