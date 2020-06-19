Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C608201E45
	for <lists+linux-bluetooth@lfdr.de>; Sat, 20 Jun 2020 00:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgFSW4d (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Jun 2020 18:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729852AbgFSW43 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Jun 2020 18:56:29 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40569C06174E
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jun 2020 15:56:29 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 186so11579725yby.19
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Jun 2020 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=EQH9uXdHg+Er3hi2P7nVcLqpSBw/RcRSh4NTGrUyMw4=;
        b=qsksvM13mMQWcyMxhCnlYI3DPf0yDyBy1kXkVya56CtJGMm3pU5Zc635PcFVf8HZ5y
         TYgBycSpbhZgQ5PcvmJUJ2Dd/rIj+pIF/TzT9FDBoJNmHFVNPwj3uXcx1D4BXhg/ElMV
         ZAGpvdwZNCUZj2GO+vVGfB3mktpyHBJ51jS2Kkwo2FtdTn8jssfdLRUmGIkEOoYm4rkC
         +HapLh0xlwBXHPsjheFKWiKMGqReP+8wTDpeatDeNzUIAgAssFpJWPCvOfzyDkYKUDN7
         AkiXnmbVMzHpivlFU38WzJ71R6z+UmAHjDAHCp/Yj0DH/EKj41TgopeSfBW3AVaZj1hT
         JqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=EQH9uXdHg+Er3hi2P7nVcLqpSBw/RcRSh4NTGrUyMw4=;
        b=fLPpn+mYNWhgyaHZq7mBSaCwJhInjPz/KGScaNVBFcEZ0J+uaS5SqHQir07ZD66jNZ
         bviTGqW+luMQdUTa4cGLLSYt7cIxa4eWHiatdAUFrihlsloFUr/w5rZzbVCaPSRt1qpy
         6vAo+ZOLPwuJVsEiD9clZXGccS47Uin1Ass9Q1i1VOPWMXygywmSWitcrR9wZuZfVmf0
         nDOKR30iaRzeT+Dhw3QLcFKX8FmZjv8AAVrhIGF5/pay/GI6ZTBgzeavQjZrd7LqYpnJ
         lkWOHQiwB9PzCj8nfhbRWDcXAjnPEzZ+4NuDJfWvEt5u1YfKFyTCZx6jOsv67N+MUe20
         e2Hg==
X-Gm-Message-State: AOAM531siM5XpYiAuac7z0BzvYUehE8ltvJCSzIomzFKijdIMYaDfiLu
        pxmDUUVa+gZtFpszZtRbDOgISfNXm1VDUzrZeXUzRUP2bG2/hQMKtnH8QMbvMQvFuk5Sk8J/GjP
        GHaYpv42Ubor3YAFYLmh810Biu2NnbIuAq5YjiIYDrOUWmz0YE/smE/jCy3Lf1+S71eqlu51Pnr
        Vg3BjceWUdyyI=
X-Google-Smtp-Source: ABdhPJwYQJatiZj9Rh30djIccoaB04VLIiWqpxruAU1kqMabzbx2/VleuHqbVvRB/uVCd9XXNKvm1qScflvZ6vVxKA==
X-Received: by 2002:a25:587:: with SMTP id 129mr10158852ybf.438.1592607388411;
 Fri, 19 Jun 2020 15:56:28 -0700 (PDT)
Date:   Fri, 19 Jun 2020 15:56:20 -0700
Message-Id: <20200619225623.10200-1-michaelfsun@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [bluez PATCH v4 0/3] Add new commands in btmgmt to support adv monitor
From:   Michael Sun <michaelfsun@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.von.dentz@intel.com, mcchou@chromium.org,
        chromeos-bluetooth-upstreaming@chromium.org, alainm@chromium.org,
        Michael Sun <michaelfsun@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi linux-bluetooth,

This series of patches add support for new advertisement monitor mgmt
opcodes by introducing new btmgmt commands into a new submenu
'monitor'. The new commands are =E2=80=98features=E2=80=99, =E2=80=98add=E2=
=80=99, and =E2=80=98remove=E2=80=99. They
provide the ability for users to query supported advertisement
monitoring features and add/remove monitor filters through btmgmt
console.

Changes in v4:
- Fix endianness
- Use regular options instead of optget options per feedback, and fix
endianness

Changes in v3:
- Fix build errors

Changes in v2:
- Move features command into submenu and fix build warnings
- Move remove command into submenu and fix build warnings
- Move add command into submenu and fix build warnings

Michael Sun (3):
  btmgmt: Add "monitor" btmgmt submenu and command "features"
  btmgmt: Add command "remove" into "monitor" btmgmt submenu
  btmgmt: Add command "add" into "monitor" btmgmt submenu

 tools/btmgmt.c | 268 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 268 insertions(+)

--=20
2.27.0.111.gc72c7da667-goog

