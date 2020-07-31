Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7127C23403C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Jul 2020 09:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731692AbgGaHmI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Jul 2020 03:42:08 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:39910 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgGaHmI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Jul 2020 03:42:08 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1k1Pfy-0001TP-Sl; Fri, 31 Jul 2020 17:42:00 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 31 Jul 2020 17:41:58 +1000
Date:   Fri, 31 Jul 2020 17:41:58 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Cc:     Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] Bluetooth: Remove CRYPTO_ALG_INTERNAL flag
Message-ID: <20200731074158.GA20263@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The flag CRYPTO_ALG_INTERNAL is not meant to be used outside of
the Crypto API.  It isn't needed here anyway.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/net/bluetooth/selftest.c b/net/bluetooth/selftest.c
index 03e3c89c3046..f71c6fa65fb3 100644
--- a/net/bluetooth/selftest.c
+++ b/net/bluetooth/selftest.c
@@ -205,7 +205,7 @@ static int __init test_ecdh(void)
 
 	calltime = ktime_get();
 
-	tfm = crypto_alloc_kpp("ecdh", CRYPTO_ALG_INTERNAL, 0);
+	tfm = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(tfm)) {
 		BT_ERR("Unable to create ECDH crypto context");
 		err = PTR_ERR(tfm);
diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index c2c5ab05fa7e..b0d7310b9d16 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -1387,7 +1387,7 @@ static struct smp_chan *smp_chan_create(struct l2cap_conn *conn)
 		goto zfree_smp;
 	}
 
-	smp->tfm_ecdh = crypto_alloc_kpp("ecdh", CRYPTO_ALG_INTERNAL, 0);
+	smp->tfm_ecdh = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(smp->tfm_ecdh)) {
 		BT_ERR("Unable to create ECDH crypto context");
 		goto free_shash;
@@ -3282,7 +3282,7 @@ static struct l2cap_chan *smp_add_cid(struct hci_dev *hdev, u16 cid)
 		return ERR_CAST(tfm_cmac);
 	}
 
-	tfm_ecdh = crypto_alloc_kpp("ecdh", CRYPTO_ALG_INTERNAL, 0);
+	tfm_ecdh = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(tfm_ecdh)) {
 		BT_ERR("Unable to create ECDH crypto context");
 		crypto_free_shash(tfm_cmac);
@@ -3847,7 +3847,7 @@ int __init bt_selftest_smp(void)
 		return PTR_ERR(tfm_cmac);
 	}
 
-	tfm_ecdh = crypto_alloc_kpp("ecdh", CRYPTO_ALG_INTERNAL, 0);
+	tfm_ecdh = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(tfm_ecdh)) {
 		BT_ERR("Unable to create ECDH crypto context");
 		crypto_free_shash(tfm_cmac);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
