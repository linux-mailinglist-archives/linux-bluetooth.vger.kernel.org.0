Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BBF137B14
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jan 2020 03:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgAKCWZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jan 2020 21:22:25 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:52132 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgAKCWZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jan 2020 21:22:25 -0500
Received: by mail-pj1-f67.google.com with SMTP id d15so359734pjw.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jan 2020 18:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HGHqSmS/H24jXyYIiH8Dw8BZO8Ld4AD9qcBK9/ryLFo=;
        b=EjrPWlTEZmi9tHAxugjn94e89InRNY7BgD2G7czTG8zrldtMm6g4GhbKH8UnZ3C8lE
         33OGe9vb8EBmudEoY//IFy1dkPNpgO89lhbal4skUIFLlbF13xA+EADFLZisvQ8fTjtF
         JMhwp5LZx5UJLy6M4R0hJYwdwqLBym6sy1zQ+UM0Ln601TNQJweiJWKbAX+VlWekyYPT
         c6xLpJwz8VGiT7Otk0NJK1rnSZi5VBYKuvN+/LkAlFx3CEyVeuwN7xtMToeLtTsSrwlM
         tmVCmkE0Hly/NY/ygkentP44fWpswVPPWGsTLXxEkA8hgiWYYp+87yxsOGFciyDkPjbD
         3BuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HGHqSmS/H24jXyYIiH8Dw8BZO8Ld4AD9qcBK9/ryLFo=;
        b=gLDn4tXB3hE4b3VL+wumoH1rSOCccbowHn20zNv9it0hdYOvkyWDEoewT6dbpwc8Od
         6jhLgJVF4Z8GBzpIrxOXb5BWLiEYXClV8ENw2+Qu+njB0Do7+XhL7Qcb9A0sGSoQfsII
         sElnHGwePJNEN+Z0ZNo6ZA4TM4ugndbf+nC8O+RpGliWlJ7UqKA68Cm9FTO7eckmuqym
         12GRdjicw9Kr4EJLPLLY/rTV7f6kXJxgucUphlNO476vOH6yFgoJLHLQakGU+8zJw96B
         y9qRTkTcAq25K3mD8nRjWD/vwqo6KGO4mnGubdytf5DjtBHRTPCbTzJT5aKsZck+xNA+
         Nd6Q==
X-Gm-Message-State: APjAAAUvQcWlWz2/cWkP0fjUVWEx4ZF/Wm3h9p5dg3MuPBLJiL+nfdBl
        Y969cnnVbgrf61AcdXGhPVxuhUs2Ad0=
X-Google-Smtp-Source: APXvYqxRB8T616VNrZsMGMecKRC2lz8hIPoq8shFER2RZayHlvfrw6nnyvqM5V5joRJ4baefJJ6Qig==
X-Received: by 2002:a17:902:9a8e:: with SMTP id w14mr1959223plp.315.1578709344090;
        Fri, 10 Jan 2020 18:22:24 -0800 (PST)
Received: from vudentzs-t460s.amr.corp.intel.com ([2601:1c0:6800:1640::3287])
        by smtp.gmail.com with ESMTPSA id g22sm4158906pgk.85.2020.01.10.18.22.23
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 18:22:23 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 05/10] Bluetooth: hci_vhci: Add support for ISO packets
Date:   Fri, 10 Jan 2020 18:22:11 -0800
Message-Id: <20200111022216.30842-6-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200111022216.30842-1-luiz.dentz@gmail.com>
References: <20200111022216.30842-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This make virtual controllers to pass ISO packets around.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 drivers/bluetooth/hci_vhci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 65e41c1d760f..8ab26dec5f6e 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -178,6 +178,7 @@ static inline ssize_t vhci_get_user(struct vhci_data *data,
 	case HCI_EVENT_PKT:
 	case HCI_ACLDATA_PKT:
 	case HCI_SCODATA_PKT:
+	case HCI_ISODATA_PKT:
 		if (!data->hdev) {
 			kfree_skb(skb);
 			return -ENODEV;
-- 
2.21.0

