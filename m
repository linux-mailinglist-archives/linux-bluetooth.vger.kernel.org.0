Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88AF61E689E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 May 2020 19:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405557AbgE1RZb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 May 2020 13:25:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405539AbgE1RZ2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 May 2020 13:25:28 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD48C08C5C6
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 May 2020 10:25:28 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e11so12949138pfn.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 May 2020 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRNf3g0aaybUiuE5w1c4KF1fNLd5dCJGW6FPC9eQZFg=;
        b=W7joYmMEO++1j0WhcTRWOYcDCHKShEk/g8aVbuj75hqb0mkkkgd2L4XzmMdDBe4wAP
         BfsaHdJhod7kz0S+2nIfOCpMuroKhDQR+WZNYyqGnldET+vg92RNmmfPPE9aiFWhJDh0
         KmGkt+NDA/AbjzhRPgnMmHN7WCw4sjao319BI3qb0Bo20HwfmFFMM1ZUeoDUvrD1KcdL
         31l8Epz9Nmin/iZEe9tOgxS73VrlEQPx1qu3+CSeWTL7q+lmfAzV1JDtlbqVJ3FZ2eAO
         GjWG1JM6O1adzIBzQ/4dy8v5IcG+TwjJk7mmD43y3EzpB0iruYjnZ0whvgHizqco4DsF
         1ODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRNf3g0aaybUiuE5w1c4KF1fNLd5dCJGW6FPC9eQZFg=;
        b=mGqSTzrC5wX0wyRvwnzKl49OPyhISO9kalR6uYPoWTqHUT9O4Lq4LCPCO/k7O5nWW5
         GnUYEFwGIuF+X9zG6iEiu8vlDbnn9Xe9EyhzxUMmtUzCZtMvjUfSBgOeoqt0sMkf4e66
         ZbBeWsWm+hB1H1SHLNLUVX4RWHT/JORuARIWNETNeQBG53EOMHifVK6Jx374J/edqhVi
         46nDJMYqrRvhQFFq065iWg/oa/jlMf4S8yTHxkVNjxBhh3j+TyMjZcqoG7uKYEbRxiqX
         DE/OTbWffpSXuYggDAH8MpmIHOO4e2Wa1AX+FJzlCX6oDti1SEkxkf6aXG+N2Og7KDtl
         jNtA==
X-Gm-Message-State: AOAM530R0Ti1wl1tO75HKFR5333X1D2FGFJg9Eo+m85xNBDg5TUy7Wpp
        vwuOlUGq10P1zI/WGFiRCGvBZz83
X-Google-Smtp-Source: ABdhPJxrB5LHLTmoWvB+fZuR3IBvlkM/7b9JAk/oz4S4EJeBFsK2ZRdpeLhQRZoXogHuMSd7G4LiXQ==
X-Received: by 2002:a63:a84d:: with SMTP id i13mr3886249pgp.342.1590686727402;
        Thu, 28 May 2020 10:25:27 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id n5sm4481503pfa.168.2020.05.28.10.25.26
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 10:25:26 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 1/2] avrcp: Fix always requesting player settings for category 1
Date:   Thu, 28 May 2020 10:25:24 -0700
Message-Id: <20200528172525.216354-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Player Application settings is not mandatory for category 1 so instead
of always listing the settings the code now checks if
AVRCP_FEATURE_PLAYER_SETTINGS is enabled.
---
 profiles/audio/avrcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index 773ccdb60..75811bf98 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -3814,7 +3814,8 @@ static gboolean avrcp_get_capabilities_resp(struct avctp *conn, uint8_t code,
 	if (!session->controller || !session->controller->player)
 		return FALSE;
 
-	if (!(events & (1 << AVRCP_EVENT_SETTINGS_CHANGED)))
+	if ((session->controller->features & AVRCP_FEATURE_PLAYER_SETTINGS) &&
+			!(events & (1 << AVRCP_EVENT_SETTINGS_CHANGED)))
 		avrcp_list_player_attributes(session);
 
 	if (!(events & (1 << AVRCP_EVENT_STATUS_CHANGED)))
-- 
2.25.3

