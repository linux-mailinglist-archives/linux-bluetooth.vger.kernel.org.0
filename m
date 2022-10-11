Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 710BE5FBB53
	for <lists+linux-bluetooth@lfdr.de>; Tue, 11 Oct 2022 21:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiJKT0C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 11 Oct 2022 15:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiJKT0A (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 11 Oct 2022 15:26:00 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C0D37AC23
        for <linux-bluetooth@vger.kernel.org>; Tue, 11 Oct 2022 12:26:00 -0700 (PDT)
Received: from monolith.lan (91-152-121-49.elisa-laajakaista.fi [91.152.121.49])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pav)
        by meesny.iki.fi (Postfix) with ESMTPSA id 358672024F;
        Tue, 11 Oct 2022 22:25:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1665516358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TF264FTvXu/nt7mT4p4ZxfhpViFpdtFxPAgYEGdqnTo=;
        b=WDE50HLnjlk0UJxvpXEGOec6OylfR6WhFYQvIXr/ZWdnMnAdStb5osE0NbSoZiNonFc2x+
        HwfQkiK4B7yDyCN7RnAs91GoqQUYPpAWfbqtSr+pV5uy+HtWBRLfyLP11o/oR3/j7kG9zX
        Ulz2ucIR6Sjx3IMHWKStWS5XujGrHoQ=
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH v2 2/2] Bluetooth: hci_conn: use HCI dst_type values also for BIS
Date:   Tue, 11 Oct 2022 22:25:34 +0300
Message-Id: <20221011192534.16281-2-pav@iki.fi>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221009174216.17533-1-pav@iki.fi>
References: <20221009174216.17533-1-pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1665516358; a=rsa-sha256; cv=none;
        b=PVw0hNGWsMVBEi95NMyE5CN6NL72XpV1g8KsEOlR7QRbuYqjyD2GM9CkkGtLZwDYqeaqf/
        gbmYwVozF8IamwW8hKaCxqZLQe2fOfsJNQvUo5QVoTsOMNOq90iy0BxPKT6MzIkZqZ8Tww
        rYdXjlK2dg9OShNQvEpv6klIWUkzzQw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1665516358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TF264FTvXu/nt7mT4p4ZxfhpViFpdtFxPAgYEGdqnTo=;
        b=Uzev/qnFgnMYx8fCOzydMvzQfz0A0KIp47N04Bhc/OlyzM2OyjX49RGMUaCU91lfJJc7zq
        THGHn8AYqpNDUJwy4A2ag6uAtU1hYSA9bBg3eO4bRTb6krPs4h/YWMNhQL8zWTP2H+ZAw+
        IctLTmEMPSIdhHkD8Y7gSXKk9Rk+SwU=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

For ISO BIS related functions in hci_conn.c, make dst_type values be HCI
address type values, not ISO socket address type values.  This makes it
consistent with CIS functions.

Signed-off-by: Pauli Virtanen <pav@iki.fi>
---
 net/bluetooth/hci_conn.c | 6 ------
 net/bluetooth/iso.c      | 6 ++++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index f1263cdd71dd..09ed346923b4 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1977,12 +1977,6 @@ int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
 		return -ENOMEM;
 	}
 
-	/* Convert from ISO socket address type to HCI address type  */
-	if (dst_type == BDADDR_LE_PUBLIC)
-		dst_type = ADDR_LE_DEV_PUBLIC;
-	else
-		dst_type = ADDR_LE_DEV_RANDOM;
-
 	memset(cp, 0, sizeof(*cp));
 	cp->sid = sid;
 	cp->addr_type = dst_type;
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index f825857db6d0..75870c2d9680 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -270,7 +270,8 @@ static int iso_connect_bis(struct sock *sk)
 		goto done;
 	}
 
-	hcon = hci_connect_bis(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+	hcon = hci_connect_bis(hdev, &iso_pi(sk)->dst,
+			       le_addr_type(iso_pi(sk)->dst_type),
 			       &iso_pi(sk)->qos, iso_pi(sk)->base_len,
 			       iso_pi(sk)->base);
 	if (IS_ERR(hcon)) {
@@ -875,7 +876,8 @@ static int iso_listen_bis(struct sock *sk)
 
 	hci_dev_lock(hdev);
 
-	err = hci_pa_create_sync(hdev, &iso_pi(sk)->dst, iso_pi(sk)->dst_type,
+	err = hci_pa_create_sync(hdev, &iso_pi(sk)->dst,
+				 le_addr_type(iso_pi(sk)->dst_type),
 				 iso_pi(sk)->bc_sid);
 
 	hci_dev_unlock(hdev);
-- 
2.37.3

