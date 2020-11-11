Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC672AE4F0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Nov 2020 01:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732235AbgKKAhk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Nov 2020 19:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732213AbgKKAhj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Nov 2020 19:37:39 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3D0C0613D1
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 16:37:38 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so468003pfn.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hRqRMyL+AzvEMmu5hr5eKBiDaSSQBxLBJXxmPAp2yE=;
        b=ObqqyTR74lUG1ZoeuL13SS0+REKbyD8yMSSSvf/2hKJ+dZbwfvy8DA8c1nxy5ZiSOu
         KiaNpe7O+kJ9RisFgJPv636YLTNjhXCnSwjIuzsGd/g2gCVH5Ayxzz7iecsBvTUYXXko
         4IXcXcLfotQanJ6T0PfSGbRs4i71zYoD4gx9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hRqRMyL+AzvEMmu5hr5eKBiDaSSQBxLBJXxmPAp2yE=;
        b=J73udS2yVOKuuPF6yn6Z7W1xLSv4djKCsrGpxlEfBmto28vVbIvSsj7PdKy2s08mzn
         cjfoGddhz3ODqgZ4RjyX6ebt82OpZzJdMbUTW2YR2o6oO7AJe1rgnLp+OwNwhesWXsHW
         rZ4H+VF1zIM5y03sTcwgC8JUx+qPl4jTJD+ZNz/MpNtoJXmdJtxgpm6w5QbFOa+u0upR
         lQZm5nxVPmepq+7FXrFZnc8Q2IxYBEuEIQOlQeP+m9fN3oH1IVsYoWUeKh+48nqlwmHz
         +SC1MQuInvTQsX7TZqbgPQJH4ViSnMqGPc5Ft893mx3yJLKuRCGrin7a8yV9CfK6Jzny
         zVoQ==
X-Gm-Message-State: AOAM532ReUZ4QLr/TzYh7xbT4Kc6Z+Clwqd/gdab8Wn905VaAyUC34UF
        PZ+hNShdWP2YXB/a42XpiNQ8egnu9hxZOw==
X-Google-Smtp-Source: ABdhPJx7juA+8hwZEs47c9hmAgPjYtk+o7SRwWHS1/0D8KAT9/MoES3UhmCKtcvogY5lgG2jHWs/eg==
X-Received: by 2002:a17:90b:784:: with SMTP id l4mr916731pjz.146.1605055057746;
        Tue, 10 Nov 2020 16:37:37 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id b16sm180655pju.16.2020.11.10.16.37.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 16:37:37 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>
Subject: [PATCH BlueZ 0/7] Battery Provider API
Date:   Tue, 10 Nov 2020 16:37:13 -0800
Message-Id: <20201111003720.1727-1-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi BlueZ Maintainers,

This is a patch series that introduces Battery Provider API, a means for
external clients to feed battery reporting to BlueZ if they can decode
it from a profile/protocol. A sample use case would be for HFP handlers
(e.g. pulseaudio commonly in Linux system or CRAS in Chrome OS) that has
the battery information reported via HFP extensions.

This patch series also refactors the existing battery API to be split
into internal API rather than GATT BAS specific. This way internal
plugins can also make use of convenient functions to reliable register
battery objects.

The battery information is then exposed via the existing Battery1 API.
Many UI components already consume this so they will be able to display
many Bluetooth peripherals' battery information via a unified BlueZ API.

Sonny Sasaka (7):
  battery: Add the internal Battery API
  profiles/battery: Refactor to use battery library
  battery: Add Source property to Battery API
  doc: Add Battery Provider API doc
  test: Add test app for Battery Provider API
  adapter: Add a public function to find a device by path
  battery: Implement Battery Provider API

 Makefile.am                   |   3 +-
 doc/battery-api.txt           |  55 ++++
 profiles/battery/battery.c    |  52 +--
 src/adapter.c                 |  44 ++-
 src/adapter.h                 |   2 +
 src/battery.c                 | 580 ++++++++++++++++++++++++++++++++++
 src/battery.h                 |  22 ++
 test/example-battery-provider | 230 ++++++++++++++
 8 files changed, 942 insertions(+), 46 deletions(-)
 create mode 100644 src/battery.c
 create mode 100644 src/battery.h
 create mode 100755 test/example-battery-provider

-- 
2.26.2

