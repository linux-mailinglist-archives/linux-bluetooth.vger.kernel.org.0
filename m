Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C68B8685BE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Jul 2019 10:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbfGOIuU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Jul 2019 04:50:20 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43251 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfGOIuU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Jul 2019 04:50:20 -0400
Received: by mail-io1-f68.google.com with SMTP id k20so32792413ios.10
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 Jul 2019 01:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IYUqhgpFC30QVQuYJkQWgfGN757Y1TPbm8lGuFrNVMk=;
        b=W84k2qK7m9ZjxhSoGt+ywo938w1iMyET0Lygwr4m8iaEZWcS2qjDoUrICiyNxBNs4r
         Li8FCHqE1AXsFUUgaXedh9uHrcIQB0kO2zsH0kuPeF+lj6bPpn1lIL3agbXQ+Ni6HFiu
         vdsWt7oc3gZbX2/BaKhBGC+b8Oa2j64ZBHSFTG43ee72OTWiGhbhSVFPGJ49rv1gRbCE
         VQr2Ji85+6I9a0aLqeqeIfAbsa5M7EmfjDZLxc8J04F3dUbcthHe36XJ4dsLJvYq/soS
         Eo0vqDvIgc2gvJFGjwOOTwhhiHQQ9B0MnwXQIAXFTdNoJqq57Q3jSESxMK2bHHB68TxH
         YX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IYUqhgpFC30QVQuYJkQWgfGN757Y1TPbm8lGuFrNVMk=;
        b=llpw4V+f0jFQVeIw7YWAahaxpLrtsyj+yNcpS2jx1P+6+mjvERq9NfO0ttBq+rIW3r
         RAUmI4tJImruiU3/nnwoD/omcd98WwsxA+0aE+Wy5VyKUfeCEFuMQOSPzq55oGMwZ0L/
         mSVt5Rj60Y29mLywrEkCNi5XA1YH2zi0Qa8rr6DOwXT4Wk9efWVNvWHGXmoCNZa7//A9
         67TiPUcEU2DuL0T4Hnwn/eUyVx+FBnbPKh2DE44o40z42ozsGtivLydaJpOo0F7ooYb4
         9kM+spSNpbG+7wvnWot/CKBVNAnKHbVuaIhny3BvrBg/QE88fviAeavF89bdCo8h5d20
         DSDw==
X-Gm-Message-State: APjAAAVuE1aoeR9N1jlmU+KmRJwSYP/3mFxIv9KxeKonSd0bKZAjk00e
        Izj4q1BbuUA26EfVtjUp6A1rCoYWPcmqZXiO5YBgSXfV
X-Google-Smtp-Source: APXvYqzHVkJk15d4GXBF5FFOchik5K102h46NED27G/xKUISzxl8ZoZ8M462JSLJbCiltk/R2aOnOY+g4pjB1VovSBk=
X-Received: by 2002:a02:b68f:: with SMTP id i15mr26324026jam.107.1563180619292;
 Mon, 15 Jul 2019 01:50:19 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?B?6auY5qmL5rW3?= <www.carrotsoft@gmail.com>
Date:   Mon, 15 Jul 2019 17:50:07 +0900
Message-ID: <CAJpXGC1UU-u2o3O5usTAGQjudwoYqcdTtnAC=_MGF30P0wJQYQ@mail.gmail.com>
Subject: [PATCH BlueZ 0/1] tools/hciconfig: Check the length of device
 name(hci0 etc.).
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Currently, hciconfig.c implicitly assumes that the length of given
device name (hci0 etc.) is 4bytes or more. This can cause
access to invalid address when you run "hciconfig hc0 up" so
I added the code to check the length of device name.

Kai Takahashi (1):
  tools/hciconfig: Check device name (hci0 etc.) length.

 tools/hciconfig.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.17.1
