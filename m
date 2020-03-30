Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F351197F81
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Mar 2020 17:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgC3PX6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 11:23:58 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39785 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgC3PX5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 11:23:57 -0400
Received: by mail-wm1-f67.google.com with SMTP id e9so10487444wme.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Mar 2020 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UsqAzlDYflhfFkfigCOnCqwRGTSK7Ye+bzhTUKxPkq0=;
        b=nxJ3C7pSZJMcm69IJxLWDsXyWb6FFFD1oFQWWYyK4FH5+Jzj66Zc8OE5rbPQRvLY5G
         T9xlS7q70nI48n/zwAN4IqC8N6u4ApOjbmrv1vIPomiRTwzSA8rKMVhWl2z3tEJSIMWi
         HH7Io4Agqt/ALW+ucTgSLRZVD4JbGwgYVEGA05i9zB69cIpvqxwORI11VFIegKN05VQJ
         8QDj7zObOWJr0iz0lQdO48PDIf/45HvgNbGZ2UR6lKN0nhk5TvbX00I2jGZK6o9ZCxbh
         1sF82yctvRdWY/86SksxDDo6Q8xbJBtu2qNA05nPv0d7924DGLG367Ol8sMgK4GcHTGw
         VP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=UsqAzlDYflhfFkfigCOnCqwRGTSK7Ye+bzhTUKxPkq0=;
        b=KdVHcNcJrtVJ7gWG+eFq5qnx+kGJaBUEKXx5lAiRVLax7RfQzS/1KD4EkKuQ8IOUUe
         G2lO8c6I8AzbCtE20Nrxye6+jKUhs/QQQr5aN8zNeYm41Y9hCuTm95hRIlXrRfZYuqa0
         4GxIFQZjQaSrrK74Le+RJcI6Nme1H4en5+tqHvlCkFSSJCXC5eObKK16qgB5pcZksrGa
         xhVOZlDazhCie4Fl3ou/U63qgIk0rKQCHs/PDgsL1lpnGSTwaRo4nw/owqJtRFYpXwXi
         7fTggqEB0Mnihe7lFHV+33+nkA2IEfHVrRJQjxWnPfVaaAUfqqvyeHCP0vh6xgGFUdUG
         LfiA==
X-Gm-Message-State: ANhLgQ3Hd47NZr9azYJsEwwG5MPEggo3NuydstCM8nBjOB02UvmgG+f8
        o1FxMFRsUnrRLkoCvjoMydLd00lN09QcHWBLzNE=
X-Google-Smtp-Source: ADFU+vshfGWrvzp8cZq8xWzQxNuJpqzVL85j8gEezLzgK7fwkY5gugmAHHPXy6r7ft+zDxWsVMecxMbyCYBYwE8RiRU=
X-Received: by 2002:a1c:2056:: with SMTP id g83mr13557052wmg.179.1585581834608;
 Mon, 30 Mar 2020 08:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:45c6:0:0:0:0:0 with HTTP; Mon, 30 Mar 2020 08:23:54
 -0700 (PDT)
Reply-To: aakkaavvii@gmail.com
From:   Abraham Morrison <mrbid001@gmail.com>
Date:   Mon, 30 Mar 2020 08:23:54 -0700
Message-ID: <CAJbTw5-spFWTO+QbPo87CptSPLbCwpcr_nq7iz1btBBTp5aN4w@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

RGVhciBGcmllbmQsDQpJIGFtIEJhcnJpc3RlciBBYnJhaGFtIE1vcnJpc29uLCBEaWQgeW91IHJl
Y2VpdmUgbXkgcHJldmlvdXMgbWVzc2FnZQ0KdG8geW91PyBJIGhhdmUgYW4gaW1wb3J0YW50IGlu
Zm9ybWF0aW9uIGZvciB5b3UgYWJvdXQgeW91ciBpbmhlcml0YW5jZQ0KZnVuZCB3b3J0aCBvZiAo
JDIwLDUwMCwwMDAuMDApIE1pbGxpb24gd2hpY2ggd2FzIGxlZnQgZm9yIHlvdSBieSB5b3VyDQps
YXRlIHJlbGF0aXZlLCBNci4gQ2FybG9zLiBTbyBpZiB5b3UgYXJlIGludGVyZXN0ZWQgZ2V0IGJh
Y2sgdG8gbWUgZm9yDQptb3JlIGRldGFpbHMuDQpUaGFuayB5b3UuDQpCYXJyaXN0ZXIgQWJyYWhh
bSBNb3JyaXNvbi4NCi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0K0JTQvtGA0L7Qs9C+0Lkg
0LTRgNGD0LMsDQrQryDQkdCw0YDRgNC40YHRgtC10YAg0JDQstGA0LDQsNC8INCc0L7RgNGA0LjR
gdC+0L0sINCS0Ysg0L/QvtC70YPRh9C40LvQuCDQvNC+0LUg0L/RgNC10LTRi9C00YPRidC10LUg
0YHQvtC+0LHRidC10L3QuNC1INC00LvRjw0K0LLQsNGBPyDQoyDQvNC10L3RjyDQtdGB0YLRjCDQ
tNC70Y8g0LLQsNGBINCy0LDQttC90LDRjyDQuNC90YTQvtGA0LzQsNGG0LjRjyDQviDQstCw0YjQ
tdC8INC90LDRgdC70LXQtNGB0YLQstC10L3QvdC+0LwNCtGE0L7QvdC00LUg0LIg0YDQsNC30LzQ
tdGA0LUgKDIwIDUwMCAwMDAsMDAg0LTQvtC70LvQsNGA0L7QsiDQodCo0JApLCDQutC+0YLQvtGA
0YvQuSDQvtGB0YLQsNCy0LjQuyDQstCw0Lwg0LLQsNGIDQrQv9C+0LrQvtC50L3Ri9C5INGA0L7Q
tNGB0YLQstC10L3QvdC40LosINC80LjRgdGC0LXRgCDQmtCw0YDQu9C+0YEuINCi0LDQuiDRh9GC
0L4sINC10YHQu9C4INCy0Ysg0LfQsNC40L3RgtC10YDQtdGB0L7QstCw0L3RiywNCtGB0LLRj9C2
0LjRgtC10YHRjCDRgdC+INC80L3QvtC5INC00LvRjyDQsdC+0LvQtdC1INC/0L7QtNGA0L7QsdC9
0L7QuSDQuNC90YTQvtGA0LzQsNGG0LjQuC4NCtCh0L/QsNGB0LjQsdC+Lg0K0JHQsNGA0YDQuNGB
0YLQtdGAINCQ0LLRgNCw0LDQvCDQnNC+0YDRgNC40YHQvtC9Lg0K
