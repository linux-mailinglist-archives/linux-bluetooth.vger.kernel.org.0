Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6973DEDC8
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Aug 2021 14:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbhHCMU7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Aug 2021 08:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235573AbhHCMU6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Aug 2021 08:20:58 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD3EC06175F
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Aug 2021 05:20:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id nh14so17661414pjb.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 03 Aug 2021 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=S0uekF9h3D7pZJovoHrYAJpvb9GPM07lWTxjMvDOXE0=;
        b=NnblM+ASL0gl/2pGjWtm6iUMl3VCwmCCUUGY7qg6uaS8VqeBfocXig10nDzou0q6/H
         sYM1uZ3KH0EU0j4L9BJxN7ml/1aLZE7sVR+rx6Ie01BmhD1lr1jyEHmZPIT+vfBHLQbo
         mYUagNkElTDpB/yAk5kUkrJByd8H6x9SDHD9hla7+C5+rgeGzENPEiXuio+Pov0S7Cs+
         yYNbshBELZdf9ULpfUmHkbUov5RzG0GjNDdU7rOyeTzrQ5gboOwDMpMTiSEP0ADHmqYf
         djQCpyrOs4Xh4GOpdxHhl4oKajwlLYAsDIR7a1/DeqmJ2j7Z/43GgLbO32hbgMEWN+GC
         ldaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=S0uekF9h3D7pZJovoHrYAJpvb9GPM07lWTxjMvDOXE0=;
        b=ggjipgInRr2KUo5S09/LCZnSq4YkzahszC12cDAab8Xtji8MgUpUziR3ekuBvtRrjU
         +IMtgNVtSXMrNHEIlwyOUd9a6X3UGEBjYfAjDQeFi8o2aLPYlMnOpDPqcjW9/XWb2+ng
         Dp9c+9XV8IRAYVwjZVQWKEGBgQmGPfav5XlyDH4U+R1DJ+gLI5T9/bBlLubDIo4Du9TF
         HySLtErQ0bl+A1/Ij3z9d+R48mBqhDcEJKfb49w2eVjpsEX4jsQIN3xGd3eDzINazI5l
         mfac0Mz+jMTDXGATlMRcntzBxSopOLLa0UHMYFs96/y2IFTDFmEWBg5otvBIFA+30kkC
         mQLw==
X-Gm-Message-State: AOAM533nRJ5ZJfw1g7ecYYNJfpI9t5vMkpX5Ble0tuHpHt5VUmqG1SJk
        uB5NggXMjSgY9Raw5b/iP6Rb9PTGtrId3jjI7WA=
X-Google-Smtp-Source: ABdhPJxEDQ8xUEJRDGo1BKlhkhaHG6o4sJ1gbhlKxpfNwysAztls1h9q9DPzepBrcubhRQi8L+dfw67ylwuzFDFA0FU=
X-Received: by 2002:a05:6a00:1a09:b029:32c:7b3a:837 with SMTP id
 g9-20020a056a001a09b029032c7b3a0837mr21267743pfv.36.1627993246101; Tue, 03
 Aug 2021 05:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:712:0:0:0:0 with HTTP; Tue, 3 Aug 2021 05:20:45
 -0700 (PDT)
Reply-To: abdoulayehissenee1@gmail.com
From:   ABDOULAYE HISSENE <sandrineeed14@gmail.com>
Date:   Tue, 3 Aug 2021 05:20:45 -0700
Message-ID: <CABCcUmBno+WLiDiV8izOOy_eL=m22KoQn-YFAfBCR2o6+iJ8Jw@mail.gmail.com>
Subject: Re:bonjour
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Qm9uam91ciwNCkplwqBtJ2FwcGVsbGXCoEFiZG91bGF5ZcKgSGlzc2VuZcKgZXjCoE1pbmlzdHJl
wqBkZcKgbGHCoEpldW5lc3NlwqBldMKgZGVzDQpTcG9ydHPCoGVuwqBSw6lwdWJsaXF1ZQ0KwqBD
ZW50cmFmcmljYWluZcKgcMOocmXCoGRlwqAzwqBlbmZhbnRzwqBkb25jwqAywqBnYXLDp29uc8Kg
dW5lwqBmaWxsZcKgdG91c8KgZXhpbMOpcy4NCkplwqBkaXNwb3NlwqBkJ3VuwqB0csOoc8KgYm9u
wqBjYXBpdGFswqBhZmluwqBkJ2ludmVzdGlywqBkYW5zwqBwbHVzaWV1cnMNCmRvbWFpbmVzwqBy
ZW50YWJsZXPCoGV0wqBzdWlzwqDDoMKgbGENCsKgcmVjaGVyY2hlwqBkJ3VuwqBib27CoHBhcnRl
bmFpcmXCoGNlwqBxdWnCoG1lwqBwZXJtZXR0cmHCoGRlwqBtZcKgbGFuY2VywqBkYW5zDQpwbHVz
aWV1cnPCoGludmVzdGlzc2VtZW50cy4NClNlcmllei12b3VzwqBvdXZlcnTCoMOgwqB1bsKgw6lj
aGFuZ2XCoHTDqWzDqXBob25pcXVlwqBwb3VywqBtaWV1eMKgdm91c8KgcHLDqXNlbnRlcg0KbWHC
oHByb3Bvc2l0aW9uwqA/DQpTacKgdm91c8Kgw6p0ZXPCoGludMOpcmVzc8OpwqBkb25uZXotbW9p
wqB2b3PCoGNvb3Jkb25uw6llc8KgcXVpwqBzb250wqBsZXPCoHN1aXZhbnRzOg0KMcKgL8KgVm90
cmXCoG51bcOpcm/CoGRlwqB0w6lsw6lwaG9uZcKgcG9ydGFibGUNCjLCoC/CoFZvdHJlwqBub23C
oGV0wqBwcsOpbm9tDQpBdcKgcGxhaXNpcsKgZGXCoHZvdXPCoGxpcmUNCkNvcmRpYWxlbWVudA0K
TXLCoEFiZG91bGF5ZcKgSGlzc2VuZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQoNCkhlbGxvLA0KTXnCoG5hbWXCoGlzwqBNcsKgQWJkb3VsYXll
wqBIaXNzZW5lwqBleMKgTWluaXN0ZXLCoG9mwqBZb3V0aMKgYW5kwqBTcG9ydHPCoGluwqB0aGUN
CkNlbnRyYWzCoEFmcmljYW7CoFJlcHVibGljwqBmYXRoZXLCoMKgb2bCoDPCoGNoaWxkcmVuwqBz
b8KgMsKgYm95c8KgYcKgZ2lybMKgYWxsDQpleGlsZWQuScKgaGF2ZcKgYcKgdmVyecKgZ29vZMKg
Y2FwaXRhbMKgZmluYWxsecKgdG/CoGludmVzdMKgaW7CoHNldmVyYWwNCnByb2ZpdGFibGXCoGFy
ZWFzwqBhbmTCoGFtwqBsb29raW5nwqBmb3LCoGHCoGdvb2TCoHBhcnRuZXLCoHdoaWNowqB3aWxs
wqBhbGxvd8KgbWUNCnRvwqBlbWJhcmvCoG9uwqBzZXZlcmFswqBpbnZlc3RtZW50cy4NCldvdWxk
wqB5b3XCoGJlwqBvcGVuwqB0b8KgYcKgdGVsZXBob25lwqBleGNoYW5nZcKgdG/CoGJldHRlcsKg
cHJlc2VudMKgbXnCoHByb3Bvc2FswqB0b8KgeW91Pw0KSWbCoHlvdcKgYXJlwqBpbnRlcmVzdGVk
wqBnaXZlwqBtZcKgeW91csKgY29udGFjdMKgZGV0YWlsc8Kgd2hpY2jCoGFyZcKgYXPCoGZvbGxv
d3M6DQoxwqAvwqBZb3VywqBtb2JpbGXCoHBob25lwqBudW1iZXINCjLCoC/CoFlvdXLCoGZpcnN0
wqBhbmTCoGxhc3TCoG5hbWUNCkxvb2tpbmfCoGZvcndhcmTCoHRvwqByZWFkaW5nwqB5b3UNCmNv
cmRpYWxseQ0KTXLCoEFiZG91bGF5ZcKgSGlzc2VuZQ0K
