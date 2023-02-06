Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2456068BC48
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Feb 2023 13:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjBFMGe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Feb 2023 07:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjBFMGd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Feb 2023 07:06:33 -0500
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F5A22027
        for <linux-bluetooth@vger.kernel.org>; Mon,  6 Feb 2023 04:06:31 -0800 (PST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1pOydY-007zgU-U2; Mon, 06 Feb 2023 18:22:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 06 Feb 2023 18:22:12 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Mon, 06 Feb 2023 18:22:12 +0800
Subject: [PATCH 1/17] dm: Add scaffolding to change completion function signature
References: <Y+DUkqe1sagWaErA@gondor.apana.org.au>
To:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        Tyler Hicks <code@tyhicks.com>, ecryptfs@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Jon Maloy <jmaloy@redhat.com>,
        Ying Xue <ying.xue@windriver.com>,
        Boris Pismenny <borisp@nvidia.com>,
        John Fastabend <john.fastabend@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org
Message-Id: <E1pOydY-007zgU-U2@formenos.hmeau.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,PDS_RDNS_DYNAMIC_FP,
        RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds temporary scaffolding so that the Crypto API
completion function can take a void * instead of crypto_async_request.
Once affected users have been converted this can be removed.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 drivers/md/dm-crypt.c     |    8 +++-----
 drivers/md/dm-integrity.c |    4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 2653516bcdef..7609fe39ab8c 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1458,8 +1458,7 @@ static int crypt_convert_block_skcipher(struct crypt_config *cc,
 	return r;
 }
 
-static void kcryptd_async_done(struct crypto_async_request *async_req,
-			       int error);
+static void kcryptd_async_done(crypto_completion_data_t *async_req, int error);
 
 static int crypt_alloc_req_skcipher(struct crypt_config *cc,
 				     struct convert_context *ctx)
@@ -2147,10 +2146,9 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
 	crypt_dec_pending(io);
 }
 
-static void kcryptd_async_done(struct crypto_async_request *async_req,
-			       int error)
+static void kcryptd_async_done(crypto_completion_data_t *data, int error)
 {
-	struct dm_crypt_request *dmreq = async_req->data;
+	struct dm_crypt_request *dmreq = crypto_get_completion_data(data);
 	struct convert_context *ctx = dmreq->ctx;
 	struct dm_crypt_io *io = container_of(ctx, struct dm_crypt_io, ctx);
 	struct crypt_config *cc = io->cc;
diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 1388ee35571e..eefe25ed841e 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -955,9 +955,9 @@ static void xor_journal(struct dm_integrity_c *ic, bool encrypt, unsigned sectio
 	async_tx_issue_pending_all();
 }
 
-static void complete_journal_encrypt(struct crypto_async_request *req, int err)
+static void complete_journal_encrypt(crypto_completion_data_t *data, int err)
 {
-	struct journal_completion *comp = req->data;
+	struct journal_completion *comp = crypto_get_completion_data(data);
 	if (unlikely(err)) {
 		if (likely(err == -EINPROGRESS)) {
 			complete(&comp->ic->crypto_backoff);
