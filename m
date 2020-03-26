Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B15EE193A10
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Mar 2020 08:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgCZH7p (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Mar 2020 03:59:45 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:54448 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgCZH7o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Mar 2020 03:59:44 -0400
Received: by mail-pj1-f67.google.com with SMTP id np9so2116658pjb.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 26 Mar 2020 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtU4BZ4dCOTEVBRYZDldU0zbmhEySGDZD1xJ5Lrg31U=;
        b=jEFZL2sSgB3oTYcjRmCSd3cbOQ8ODOMKxCLFBZ/eVqVh03jXnGKQMM5wSK3usYfgW2
         YOtP/MXVLqOEcgJXBvYt1kPJhGTsd96ToM75m/URp6SRzC7z5Bgg8+byK1DbzrXfbzzh
         sJFlFPYwU0i1DkAUWTrobYNQjUyqksOnw06Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtU4BZ4dCOTEVBRYZDldU0zbmhEySGDZD1xJ5Lrg31U=;
        b=jATYTVoqjvuIVEntMaYRWStfF1K/Jl51LxgUDriFpHZ6UZiZJgWJk9upLfn6g6+9G8
         JSWAptvnRTt4CVpnaIeCmzeI5kJtQS1IA2bhxupVgQ33BKPrd7+9npzisZsGusxATMM4
         Bfc7t9IJH9ybhqYr03IDvM722GqV/7e9AeuKiO9QoHp+7senTaSippMyhiWkuX98tdOw
         8y6u+yyKSYs8fZqYubminx8byadnUb7aQfzmeA/uj2uDMGr7XBvP/ML4XJt47q10BJXs
         xfLfxZBuKtEeEEpxrwpq+2mL0tr49/40h4bnA3TU4aXyNZQAQfnGS4ej14uCzpodq8Zq
         nWDg==
X-Gm-Message-State: ANhLgQ1q6bQWhHjXXv+ZJr4qtURk8XsXhMCLmICNa3YU0/IQEwr/jJEp
        Ae7OjWxbb6TUjXv7lRZnVYzTAOb+VI8=
X-Google-Smtp-Source: ADFU+vtqZIsGCLABYNiME/GhQ8RqcB62mmcl6pfyfoQBzYkzBlMerk5B7oijurTrJSuvGqqdO+rK4Q==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr1759884pju.168.1585209582834;
        Thu, 26 Mar 2020 00:59:42 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:b46:ac84:1014:9555])
        by smtp.gmail.com with ESMTPSA id 8sm1036476pfv.65.2020.03.26.00.59.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Mar 2020 00:59:41 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Alain Michaud <alainm@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Miao-chen Chou <mcchou@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v3 0/2] btusb: Introduce the use of vendor extension(s)
Date:   Thu, 26 Mar 2020 00:59:36 -0700
Message-Id: <20200326075938.65053-1-mcchou@chromium.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel and Luiz,

The standard HCI does not provide commands/events regarding to
advertisement monitoring with content filter while there are few vendors
providing this feature. Chrome OS BT would like to introduce the use of
vendor specific features where Microsoft vendor extension is targeted at
this moment.

Chrome OS BT would like to utilize Microsoft vendor extension's
advertisement monitoring feature which is not yet a part of standard
Bluetooth specification. This series introduces the driver information for
Microsoft vendor extension, and this was verified with kernel 4.4 on Atlas
Chromebook.

Thanks
Miao

Changes in v3:
- Create net/bluetooth/msft.c with struct msft_vnd_ext defined internally
and change the hdev->msft_ext field to void*.
- Define and expose msft_vnd_ext_set_opcode() for btusb use.
- Init hdev->msft_ext in hci_alloc_dev() and deinit it in hci_free_dev().
- Introduce msft_vnd_ext_do_open() and msft_vnd_ext_do_close().

Miao-chen Chou (2):
  Bluetooth: btusb: Indicate Microsoft vendor extension for Intel
    9460/9560 and 9160/9260
  Bluetooth: btusb: Read the supported features of Microsoft vendor
    extension

 drivers/bluetooth/btusb.c        |  10 ++-
 include/net/bluetooth/hci_core.h |   4 ++
 net/bluetooth/hci_core.c         | 120 +++++++++++++++++++++++++++++++
 net/bluetooth/msft.c             |  52 ++++++++++++++
 4 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 net/bluetooth/msft.c

-- 
2.24.1

