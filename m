Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6406F4F8AA3
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Apr 2022 02:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbiDGXB0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 7 Apr 2022 19:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiDGXBZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 7 Apr 2022 19:01:25 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F495CEE0B
        for <linux-bluetooth@vger.kernel.org>; Thu,  7 Apr 2022 15:59:23 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id z33so12166058ybh.5
        for <linux-bluetooth@vger.kernel.org>; Thu, 07 Apr 2022 15:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=vtl03A/ykFlMjaIpafXHrGiE/kbHFHRYgZ8Q49Zgwes=;
        b=bfeAH6B1LbVJf0PaYH0QVxpfcP1e5zAVjTC4dnC0dMN68G2xhzmDyvfh+TOH1McHAX
         JImxFFmzpxSwB3DIuq/LApMMhhNsBbFbMRO5AdMbwEoB2hHlin8SKisOh9LKgSxBqMw4
         OsKn6n9zlj8N8YS6p4Dwyul9LMH8ZLgIdFgNzcrnMkSjrSgn/uomigc2f8cNgfsR+ZWQ
         qLJW3ieVogYB4PhYxjUqGMVBy/o69QoVGEDJ+16egcRLzOM/kEW2/3UBKStsLi1VqzKU
         Iak6EDT0VnPMwAgWtLRDHigUDiqlC8juFg4F89deMc+QRwode51pbFvq2d/XturwuHar
         sciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=vtl03A/ykFlMjaIpafXHrGiE/kbHFHRYgZ8Q49Zgwes=;
        b=y3cASRqXSZ2X6Seksi7WYYANQRRUbUFeebnKqPoHyKaexQJe/rRMftH2r8uoy00APv
         G5oNCmN1tiZzB9yqrw7jLggyeWV16RWNYOjfoS681NJsBGnyd8iViI44eS6R2/NmElSf
         qEO5fOCI9mud8f5daDevKO6ndCEbHvdbHgvCmVJ2aKE8dQsnVuixxF5Qc1jNz4YldJOU
         i9wO3UeJqUdF6dK9rL5pjiepsUjBnh9oaROnn+LRVkH2HHJ5J/HOCzQsf/vSwAp+Ox5e
         ifYSOZSDLHv+ZupGTJnyVcKsMH/Jl7gb+O66JTkoTz6UEkF22EIa1EpOGGdk/ihfwrin
         uHmg==
X-Gm-Message-State: AOAM5301DUaq9ibRDmqByPDnN3oAY79edc5ba7DiN+MqMXeV5+k6ESxl
        +Ip+nRgJS/3IOl+SIW1x3IZ8iJXIXkaTGGN68e0=
X-Google-Smtp-Source: ABdhPJwtqVJ35AUrCKA34kzBQq0u9B0KP17LRmj9E08IhVouv92eqeJqKrxfasqJhmaBWaNjedGqCV3AdHKLigzrT4k=
X-Received: by 2002:a05:6902:84:b0:63d:4a3d:eb5 with SMTP id
 h4-20020a056902008400b0063d4a3d0eb5mr11959887ybs.145.1649372362465; Thu, 07
 Apr 2022 15:59:22 -0700 (PDT)
MIME-Version: 1.0
Sender: hinderkaryn6@gmail.com
Received: by 2002:a05:7010:72d4:b0:23c:4456:9324 with HTTP; Thu, 7 Apr 2022
 15:59:22 -0700 (PDT)
From:   EVELYN SANCHEZ <evelynchez1@gmail.com>
Date:   Thu, 7 Apr 2022 23:59:22 +0100
X-Google-Sender-Auth: AiNsikL8woEHlq3vdNgRkBu94gg
Message-ID: <CAK+CA-1nzoWJgwNgAak-LrYGzwEgw9P6=gShfCJ2_-sE4uAiaQ@mail.gmail.com>
Subject: =?UTF-8?B?7JWI64WV7ZWY7IS47JqUICwgSGVsbG8gLA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

6rCA7J6lIOyCrOueke2VmOuKlCDsgqzrnowsDQrri7nsi6Dqs7wg64u57Iug7J2YIOqwgOyhseyd
gCDsmKTripgg7Ja065a76rKMIOyngOuCtOqzoCDsnojsirXri4jquYw/IOuqqOuToCDsnbwg7J6Y
IOuQmOq4uCDrsJTrnpg/DQrrgrTqsIAg67O064K4IOydtOuplOydvOyXkOyEnCDslrjsoJwg64u1
7J6l7J2EIOuwm+ydhCDsiJgg7J6I7Iq164uI6rmMPw0KDQpEZWFyZXN0IG9uZSwNCkhvdyBhcmUg
eW91IGFuZCB5b3VyIGZhbWlseSBkb2luZyB0b2RheT8gaSBob3BlIGFsbCBpcyB3ZWxsIHdpdGgg
eW91Pw0KUGxlYXNlIHdoZW4gd2lsbCBpIGdldCB5b3VyIHJlc3BvbnNlIGZyb20gdGhlIGVtYWls
IGkgc2VudCB0byB5b3U/DQo=
