Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF65C21A45C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jul 2020 18:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgGIQGl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jul 2020 12:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726357AbgGIQGl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jul 2020 12:06:41 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4CFC08C5CE
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Jul 2020 09:06:41 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id g16so1999547pjz.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Jul 2020 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Y+kIbnGkHotm9lccHj/nLpbXHnZU4LZKnUryVen0AX4=;
        b=fbYJKts353khLfb+Q/WIRbn0JcADVkHtG3LnD05lA5wN9VzX5D4YX1ZXvuKurOUBNQ
         uC8WG5Avrv194R7bb+MOBFxw9NZklkPkbx3D6r6liEGwLJF1mDxMniixxQN4fpGffjoe
         7XuJGPIZpq0KzwzELCxfABIWqYvy9UXcANbx0ZaxLM2vu1IeeFwcJmkfmtS4cEYJJEVK
         YXd2P+uDeVLqmfjE6AsI2vUBeOWbri6PknX1GlRRETOdadln+zM7IZxIDXzoKeJ0Nnfc
         rBs0+zK8N/Lk9zmYqZgEZKxDwEGIQ5ni0kmGjudzF3JqbYkUo3BwGnUjSDQrgu0YNIfS
         lfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Y+kIbnGkHotm9lccHj/nLpbXHnZU4LZKnUryVen0AX4=;
        b=lcHBEz2dbQV2TjBk6sweUZ4ljxNlcfngeXA1+2+JsCma9Z04sTro/QVkRt8zyv/8Oo
         f2bvwEpHc/zYDozKv3MA54TVyVQmIVaN3RJkTgxEpQLEnaUfk+3dxbaSwmv6wLalUtGF
         sf2sBIOZKs477dalOo6ZnArzZr9XLv/7tzWEePGsTyrQVkf9eo0JmhXWcmjhM22TnXUq
         M2kfqWzAXqvVeBHh6FVSvpZ26Lr6TH9Vlcb84/m4rmGxwsYOyXyUr6xq93r3+Ht4XohO
         XJDTSaCMQWKGTqXrt7Du1/jxcBRZ4lxCf3TZFgZFNyTuW0Btpc64LbamKnuKx2YxGi4A
         AXlg==
X-Gm-Message-State: AOAM5306n+pR+CYDqRUX9nNmjVZunjm63kpXkuJy0FPeoFGA/S7jCAhH
        MzMAqlot6BhL1iVx3tN2Ysl0vtcPT731f/fWu/6fi60XiiNdcbpEpUnw/blgqqyk3BJTtela6y7
        k+HrJebhCflwbkJtl3M/E2YTqQaUkpgWv8N7d0swGAAUAz1RfViLTHEssMgLiReraHyOWunaYCC
        oL
X-Google-Smtp-Source: ABdhPJxWrGtk9geN/md/yQve8C/kI1We/jnmnzs55UKYX/6gx79TbpUBn/tO3WwooC6G4CgHaGOjdbkrD3bt
X-Received: by 2002:a17:902:be0e:: with SMTP id r14mr28892156pls.309.1594310800664;
 Thu, 09 Jul 2020 09:06:40 -0700 (PDT)
Date:   Thu,  9 Jul 2020 09:06:37 -0700
Message-Id: <20200709090631.Bluez.v1.1.I6aa22c6e425e5b19c321c0768f50ca3fc2c090da@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [Bluez PATCH v1] audio/media - Fix volume sync between media and transport
From:   Yu Liu <yudiliu@google.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Hsin-Yu Chao <hychao@chromium.org>, sonnysasaka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Hsin-Yu Chao <hychao@chromium.org>

A volume value is cached on the global media player object. And a
check was used to NOT update volume to each transport if this
value doesn't change. That is causing problem at disconnect then
reconnect when the new constructed transport never receive update
about the last used volume value.

Reviewed-by: sonnysasaka@chromium.org
Reviewed-by: hychao@chromium.org

---

Changes in v1:
- Initial change

 profiles/audio/media.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index 993ecb3b3..92e363de9 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -1204,9 +1204,6 @@ static void set_volume(uint8_t volume, struct btd_device *dev, void *user_data)
 	struct media_player *mp = user_data;
 	GSList *l;
 
-	if (mp->volume == volume)
-		return;
-
 	mp->volume = volume;
 
 	for (l = mp->adapter->endpoints; l; l = l->next) {
-- 
2.27.0.383.g050319c2ae-goog

