Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CABBE11E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Apr 2019 13:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfD2LPF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 Apr 2019 07:15:05 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:41564 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfD2LPF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 Apr 2019 07:15:05 -0400
Received: by mail-ed1-f42.google.com with SMTP id m4so8751943edd.8
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Apr 2019 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=drWKJnw9pz0M4jvNhvI8FU4lmcWEc/dxj4DmlPNh52c=;
        b=Ay1vvEkGTzoYbvAF9CfYWa06nVIfsOqRd0ZU3tpZee19IbSz6m5mTQPuWSXwvHiSOq
         pJmfPdyF+jzVE1iOTykgGRf4/pDNnq4wjeHvO3niP9Z/ZyAuQ3X58Aa61ijdoWQ/Te/p
         nKWQ/CT5/RfvnNP13OjGbnujAOPcH3qsARixEGMXh+vk7079Ri2i3Eg7upk2YQSlP3Rc
         rmMGQj74aZmLrSzXc78hTaQ6pjxqJSSBJgsANlTKSBmROjb6zeuhe7V230JgcXlESu1F
         4HErhXvHrRfhIBZROnmh3LsWNzbYW1bGFRSaoIVrNZ6xo2YqVthBScH+j+8GYBALSckU
         JSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=drWKJnw9pz0M4jvNhvI8FU4lmcWEc/dxj4DmlPNh52c=;
        b=TMOK2xm+c94d0BU6pRTpbmqGASeRXEJDbSiEvXkaf/lQ9clKucbDtd5vO+gMgj3JyG
         VGX//Ehujx0mDhXFkCc70Lknz0BaIglEFepN3L+/JnI3ihsdmn/GdtrRf16KB47vFWQF
         /y4D2wtlwQWQpsF3iQ3nCn1oKoGDDvm0GTgPdKMgby0NZfTmFxDgoFG+4dXKWPz4ujJ6
         UN4pGMybKL1LiD6ByE/Xpi2VNTqO4qti1mp2wqJ8lDat1pmoL1DEPGGXQhG1pBH4lhcj
         4X2+DgofS361sOI78sG+bJi9YkzTi7/wkN87yF8epNdqkTq76frv++bktVpDPMQnABqR
         6kpw==
X-Gm-Message-State: APjAAAUszVc15irWo0GrjQVBQ8u4Xbkxri/7wBqFap+/cqUy722hmdQ8
        rGJTfyS4BWhXxevUR3zS4frqOcpome0=
X-Google-Smtp-Source: APXvYqzsSVNpplhFL2UDYqno6umXSZTFn74p4bxyqvmSN4EnymJ1qyuhKTfW0ZI4evWrGXyBUHSOow==
X-Received: by 2002:a50:a389:: with SMTP id s9mr1399347edb.113.1556536503526;
        Mon, 29 Apr 2019 04:15:03 -0700 (PDT)
Received: from bksv-VirtualBox.bkogc.com ([152.115.31.4])
        by smtp.gmail.com with ESMTPSA id s6sm1404786eji.13.2019.04.29.04.15.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 04:15:02 -0700 (PDT)
From:   Troels Dalsgaard Hoffmeyer <troels.d.hoffmeyer@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Troels Dalsgaard Hoffmeyer <troels.d.hoffmeyer@gmail.com>
Subject: [PATCH Bluez 1/1] advertising: Timeout of 0 should not fire a callback Setting a timeout of 0 on an advertisement should let the advertisement run forever. The client was released immediately after, although the advertisement was still in the air.
Date:   Mon, 29 Apr 2019 13:14:41 +0200
Message-Id: <20190429111441.20481-2-troels.d.hoffmeyer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429111441.20481-1-troels.d.hoffmeyer@gmail.com>
References: <20190429111441.20481-1-troels.d.hoffmeyer@gmail.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 src/advertising.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/src/advertising.c b/src/advertising.c
index 2f187edcf..26e24ee01 100644
--- a/src/advertising.c
+++ b/src/advertising.c
@@ -587,8 +587,10 @@ static bool parse_timeout(DBusMessageIter *iter,
 	if (client->to_id)
 		g_source_remove(client->to_id);
 
-	client->to_id = g_timeout_add_seconds(client->timeout, client_timeout,
-								client);
+	if(client->timeout > 0) {
+		client->to_id = g_timeout_add_seconds(client->timeout, client_timeout,
+																		client);
+	}
 
 	return true;
 }
-- 
2.17.1

