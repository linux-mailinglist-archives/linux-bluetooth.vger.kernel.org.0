Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5582EF557
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Jan 2021 17:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbhAHQBh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 Jan 2021 11:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbhAHQBg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 Jan 2021 11:01:36 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79548C0612EA
        for <linux-bluetooth@vger.kernel.org>; Fri,  8 Jan 2021 08:00:56 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id b64so8761269qkc.12
        for <linux-bluetooth@vger.kernel.org>; Fri, 08 Jan 2021 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=VpA/rpQ5qi0dFR7Mowe5aGCpF9u7a1VmQn5q9ZZuQCrdDN5tZn6sXwU9XTDBXmdfYo
         GHrqoepeF5HsPEyz7s83Q2FgcvfAPgYumhvcRGiBVC2GK+C5XV14Ui++lS3so5pA2/iT
         1rfJS9pZ3rxyDmU9J33KM0ODd0VovMdrCXj4PDHLrX+mNc/gXoaOQ9JB4dQ8+Pi+t3Y5
         owDd0dhEIxx5inTgS9uv9USD9ua3iUgbE7ZeBpPZmm3e8Mr6fY26xd3tbIKjFdXg+Z5e
         HzKpZOj3j3xkWAI+2U0PJ6WCaJvaJp4eQ7JPK2DyyOLy9Is9PPJi0kyYoCvOmtdELPp9
         eESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=ik6B+6lkNc+iFrIPLOlH6nyfA0JsJ4cRGzVhof+Ll8w=;
        b=Mygx81bYONlDvQfs96yIi/D2dvqGMzqp8A97qw4RHKW56p6hr1dYvqTcBStSjvR6A4
         S8prJ83J8l5wc8I//GGZGO+WxfhXHvv7htF+ThAO+O/WmZWsXUSzZb2AcH67lcL0zwoP
         S2nP1lSGAp04TDmRuqI/ZaGtD6g533NBmxt6lcoaZsxYssb1RTLv82vUph/4JW5Jn69u
         3yqPyE7SnYmGDX3xHwrNkhZ2B9SYFlfE8VFJ1/KHAlRKZiFEkdtnTlwQwxVYvPMjKRb3
         +mJnysfy+iYJfWJ20jec4lHj+gC1KkVJTAeBoyb6IRAczGgxPFa7MwofYDFEsK242aPf
         m53A==
X-Gm-Message-State: AOAM531sPpH1/ds2/p6ESVhr2b0g2bwlQLg3sT+6Zw1PHyerInYQtGjL
        J4Jwqvwfk4xlIPq9ebImgnvKmcdGxsa71iVBfK8=
X-Google-Smtp-Source: ABdhPJy5DcDb2tpoN6hwwNxbrQ4+6iS7cEF5BYexkcUy5+hBuogz8U9cM9vP/oN0NUHGYqGpdQYDJc3bSIrriX19zaw=
X-Received: by 2002:a37:9f14:: with SMTP id i20mr4583418qke.321.1610121655742;
 Fri, 08 Jan 2021 08:00:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:148d:0:0:0:0 with HTTP; Fri, 8 Jan 2021 08:00:55
 -0800 (PST)
Reply-To: camillejackson021@gmail.com
In-Reply-To: <CAGCmbMQupVT-1ZX2--N7Bjf2eW4VuUQ4dE_hzd1qAGQuE_JBEQ@mail.gmail.com>
References: <CAGCmbMQupVT-1ZX2--N7Bjf2eW4VuUQ4dE_hzd1qAGQuE_JBEQ@mail.gmail.com>
From:   camille jackson <adamraouf78@gmail.com>
Date:   Fri, 8 Jan 2021 16:00:55 +0000
Message-ID: <CAGCmbMR9p4PyoggcTsQ1z8w+PCmEh+pd463ifnbWZyKw1o3FtQ@mail.gmail.com>
Subject: =?UTF-8?B?0JfQtNGA0LDQstGB0YLQstGD0LnRgtC1LA==?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

0J/RgNC40LLQtdGC0YHRgtCy0YPRjiDRgtC10LHRjywg0LzQvtC5INC00YDRg9CzLCDQvdCw0LTQ
tdGO0YHRjCwg0YLRiyDQsiDQv9C+0YDRj9C00LrQtSwg0L/QvtC20LDQu9GD0LnRgdGC0LAsINC+
0YLQstC10YLRjCDQvNC90LUNCtCx0LvQsNCz0L7QtNCw0YDRjywNCg==
