Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128E01E3797
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 May 2020 07:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgE0FCf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 May 2020 01:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgE0FCe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 May 2020 01:02:34 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94ECC061A0F
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 May 2020 22:02:33 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id k15so23867005ybt.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 26 May 2020 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Zle/NVX3dvnV4RZJxOnq/mMDNekVvkyDFsqT999uDFc=;
        b=Urd6uMLcqDy4W2ZenZ0TkDkk9GgERGdRBf5MiN7R7V/lueM8R2fsjb8UmUPEzzKhlR
         HfZsLOmIMBOUBWiXXN6Gpa1TgRQ6o13TGRFibqQlyRdhqZehA9rYTQ0KyOHs/DPQUpYr
         WADoWW8WZXhajwpAB/5Bfi/fZy+U3rMRHKI2XI5KzC68p5QSwWHhyoauu4T06QFa86Uh
         fn0K6UPEERsyTg53aQhbi9X+AwxD33FkSamL+1gXv4ln+9e6RqC46DYu3VJuZfscruk8
         EdamuX6u6Z1jSY5Fay9JQYXi0PJU6UBab2TLfawYCsjTDgrplwsay0u7At7/Hw/hpvjj
         LSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Zle/NVX3dvnV4RZJxOnq/mMDNekVvkyDFsqT999uDFc=;
        b=czLwQgSfFfjnwE6wZYI8fxZxyQb0qum5EQl4nzF15ehCYpjtOLFo2/N3gT/IJpddoz
         aJXrKlhRWO+CuCUiMrPGr/YdVzFjqBtsSJHAMUd1ovWDDJlh3ML3AZwQvl6hs+bnwZjY
         ZhRTkF/DpT2p8/1qFm1XT5zfgL9l1ra/2rXX7kdBB+s/dcQcHYuutErJtPwVXWKxCKXY
         9hRxQKRdWH8Se1uWYP81K0YRajjD7fDMnwWglHLc8xBrA4lieAOP6bA5NT4HuE5JOHaV
         Tw3H+PrEJVppmFnn8yKdTRt3xrKZ/ETTfRXNRA6B6nUp7izfEY4Dz4pyEvamOGnr36Ae
         cjNw==
X-Gm-Message-State: AOAM532Ojrr2aK88D+fUT+RopF9mkwCTM9mCGx8ZBoVDSWBZ/eRCRQEO
        1eiNq0RZ8C26WWZcSisOWg+PBkqVvR1Pe6ExdeHJesuEuLxKuv2vM23MXuTCm9JrjqGay3hPS82
        UXwy03QOKz4s5KQ49MyAZCJgcZoDFUttmx9gM4C40XoDTkZLOsZvSb+oxwOeo2+5wAnJuefx6mQ
        ==
X-Google-Smtp-Source: ABdhPJxahbCTfhPU6S6Lz4IaBwJZpJNlqbd9c1wj2setU9frrYcS+aGN5waBv9gJzufUcIoRiKD0SoylrGI=
X-Received: by 2002:a25:bb01:: with SMTP id z1mr7057979ybg.140.1590555752759;
 Tue, 26 May 2020 22:02:32 -0700 (PDT)
Date:   Wed, 27 May 2020 13:02:28 +0800
Message-Id: <20200527050228.117532-1-stimim@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH] shared/shell: don't hook io_hup on non-interactive
From:   Stimim Chen <stimim@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Stimim Chen <stimim@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When we are in non-interactive mode (data.mode == 1), we should not
terminate the mainloop when stdin is disconnected.

For example, in bash, the following command would terminate immediately
without any output.

  : | btmgmt info

---
 src/shared/shell.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/shared/shell.c b/src/shared/shell.c
index 2e094b8f1..d58e2d7d1 100644
--- a/src/shared/shell.c
+++ b/src/shared/shell.c
@@ -1277,10 +1277,10 @@ bool bt_shell_attach(int fd)
 
 	io = io_new(fd);
 
-	if (!data.mode)
+	if (!data.mode) {
 		io_set_read_handler(io, input_read, NULL, NULL);
-
-	io_set_disconnect_handler(io, io_hup, NULL, NULL);
+		io_set_disconnect_handler(io, io_hup, NULL, NULL);
+	}
 
 	data.input = io;
 
-- 
2.27.0.rc0.183.gde8f92d652-goog

