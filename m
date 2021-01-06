Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED97F2EB921
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Jan 2021 06:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbhAFE7x (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Jan 2021 23:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbhAFE7x (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Jan 2021 23:59:53 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC29C06134D
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Jan 2021 20:59:06 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id hk16so969197pjb.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Jan 2021 20:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o9pp+81pD9V5ZO1oudtV3NEzkiSbh9CAEsR5KS2cLrU=;
        b=eecW6ub0INs2zUQFbDtOijjrADBxTQ3+KIkXXktPtIhMY4WJDpJmz0G5PKyEtAnAOG
         F6w7KCIFkmpvy4e/XxRw5OcTQBFEY/ab7e80X2jhXlOP8PGphYT4txY9uInjvz5ap7zF
         P2wEo7r5E9ROHFOBRSe7i3t7ORS80205tjCUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o9pp+81pD9V5ZO1oudtV3NEzkiSbh9CAEsR5KS2cLrU=;
        b=pF9yHamJmcPMybrVUUz/c+m8tpbdqGTN/2xbuY4exBbMnxiqS812In/UmnhBw1I+QK
         9OC03mDYyUwCYmk5s+Yxi2kL4GMRufhDovSzMTnBaS8UBX9sGBcaWYyDpiUHkYLzc9gf
         iVM9r97VbNJF078an9QgwYGtEqypgjyRzh2fakmOuDgSXnF379s9XmB4cJp6iKH0gcMj
         SGhNM29PWwNHZix9AqABnbde6oVLPk9zpEQw6LbnlYf+GLoCPnnvX3HspvKL8aUQLzIM
         8kaBF9UkIv6RDVXNn+PpvnSe/WOLsA6+fde63DJPitiBlIQIYNNXmxV5cHHXpZbG84iS
         suTQ==
X-Gm-Message-State: AOAM531rj5dCeUwGo/+HT75opJmOqqEXW14sqCTGf/ZkQkRVa+YJRwD/
        FW2iJGzSVs98J+hh+3ZYKSkTfw==
X-Google-Smtp-Source: ABdhPJwW59FjnNZUcdiKcpwcD/EYzFYWrPrpARJWVZMP+JxOv4bVf7mNf2em3OdX4BWmsvOZRXSSVQ==
X-Received: by 2002:a17:90b:68d:: with SMTP id m13mr2468477pjz.164.1609909145953;
        Tue, 05 Jan 2021 20:59:05 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:7220:84ff:fe09:2b94])
        by smtp.gmail.com with ESMTPSA id 22sm743287pjw.19.2021.01.05.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 20:59:05 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        linux-bluetooth@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Daniel Winkler <danielwinkler@google.com>,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: [PATCH v2] Bluetooth: btrtl: Add null check in setup
Date:   Tue,  5 Jan 2021 20:58:58 -0800
Message-Id: <20210105205855.v2.1.I9438ef1f79fa1132e74c67b489123291080b9a8c@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

btrtl_dev->ic_info is only available from the controller on cold boot
(the lmp subversion matches the device model and this is used to look up
the ic_info). On warm boots (firmware already loaded),
btrtl_dev->ic_info is null.

Fixes: 05672a2c14a4 (Bluetooth: btrtl: Enable central-peripheral role)
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v2:
- Added nullcheck with goto done

 drivers/bluetooth/btrtl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 1abf6a4d6727..24f03a1f8d57 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -719,6 +719,9 @@ int btrtl_setup_realtek(struct hci_dev *hdev)
 	 */
 	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 
+	if (!btrtl_dev->ic_info)
+		goto done;
+
 	/* Enable central-peripheral role (able to create new connections with
 	 * an existing connection in slave role).
 	 */
@@ -731,6 +734,7 @@ int btrtl_setup_realtek(struct hci_dev *hdev)
 		break;
 	}
 
+done:
 	btrtl_free(btrtl_dev);
 	return ret;
 }
-- 
2.29.2.729.g45daf8777d-goog

