Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6EF1172AAD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Feb 2020 23:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbgB0WA4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Feb 2020 17:00:56 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42902 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729501AbgB0WA4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Feb 2020 17:00:56 -0500
Received: by mail-vs1-f68.google.com with SMTP id w142so682594vsw.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Feb 2020 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iYfl/nO4ZnXEHyd+jnu5r5om/coKJt3oLuyUf2gWc98=;
        b=jsEeD9RamC4m2udPQnQ+A01xEvAu0LQxCCCzO69nTi47Oucpc2n7Iln6XfUu1a4mh1
         N6ak+yS0GOUs8hrJQp/4OMBnD0HwfO5y2s6Vldg61zWjDCHeTIsZgI+A7KHTPTaNP6fR
         E2cqR7yTVFJYnNRGcMRekSpsatFqpNLfwv0QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iYfl/nO4ZnXEHyd+jnu5r5om/coKJt3oLuyUf2gWc98=;
        b=R7fZt76sgyl08TIeQlG3muMCbPTmb56hONUW939Pg575R2poby1ZRM/ywweOzAqtb8
         spD8QlTzwB2E/ZohSG8vQwtP/7DdOIwMU8QSJUXeCcpg2vcK9LS5ZfGE978VXek2aHLH
         nfn9vNo97kB2vxlN7GPqAKD0p3qbQY8iTLDltJVA/p5bbgYtM8cdytNn6fgSgF1vddpV
         gy2nD8LH4k/ZV7egpbPoFUoGVY8EwH7X7BbYim8TJLPUIpRQvX0tOR+sT2c0Jg46LHt0
         +SVwRIz/p4usc/OV87zgXD19Pzodke+n8DSwa7V16VbmEhK6rLIZ5JCujOCDcAvXcVyQ
         bGXA==
X-Gm-Message-State: ANhLgQ1A2CaIzdlJE1MgJPgzNatowaBkiBYDwc3h7Ru4kXjJfqkmvVq/
        EOeJvtPkZdu/vjiyhiB4h/r+4CGC3HQ=
X-Google-Smtp-Source: ADFU+vv2LVQxmzjeNWcFWCK+G8RHQDuWLKmUrok55dav+vKKE6lEzqkhbe2oJ680YJICING5H98kEg==
X-Received: by 2002:a67:b107:: with SMTP id w7mr1003130vsl.128.1582840853552;
        Thu, 27 Feb 2020 14:00:53 -0800 (PST)
Received: from alain.c.googlers.com.com (39.119.74.34.bc.googleusercontent.com. [34.74.119.39])
        by smtp.gmail.com with ESMTPSA id m19sm2473973vko.9.2020.02.27.14.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 14:00:53 -0800 (PST)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [PATCH] bluetooth: Fixing a few comment typos in the quirk definitions.
Date:   Thu, 27 Feb 2020 22:00:49 +0000
Message-Id: <20200227220049.148784-1-alainm@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This change simply fixes a few typos in the quirk definitions.

Signed-off-by: Alain Michaud <alainm@chromium.org>
---

 include/net/bluetooth/hci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 6293bdd7d862..3311322f5128 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -115,7 +115,7 @@ enum {
 	 * wrongly configured local features that will require forcing
 	 * them to enable this mode. Getting RSSI information with the
 	 * inquiry responses is preferred since it allows for a better
-	 * user expierence.
+	 * user experience.
 	 *
 	 * This quirk must be set before hci_register_dev is called.
 	 */
@@ -142,7 +142,7 @@ enum {
 
 	/* When this quirk is set, an external configuration step
 	 * is required and will be indicated with the controller
-	 * configuation.
+	 * configuration.
 	 *
 	 * This quirk can be set before hci_register_dev is called or
 	 * during the hdev->setup vendor callback.
-- 
2.25.1.481.gfbce0eb801-goog

