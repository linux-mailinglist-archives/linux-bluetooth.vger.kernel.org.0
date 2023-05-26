Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED171281F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 May 2023 16:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237404AbjEZORE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 May 2023 10:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236487AbjEZORD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 May 2023 10:17:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF942116
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 May 2023 07:17:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 472826502F
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 May 2023 14:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CD7C433EF;
        Fri, 26 May 2023 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685110621;
        bh=ghmE+AceXt0Obr0sUVqUs1EVg1wSN4+72y5g68kwRYk=;
        h=From:Date:Subject:To:Cc:From;
        b=IdiruQIKSVitp6UO2l4arFJwzNQH35l3M24Dsu/l9z99o2AD1bNrfcisTXVRG16lX
         slrjD9qKtdl8iAR+YFYfYbyOozwf5yiMpWt+3qJHdR74LjwtCG1ML1+hGVOY2xk7rb
         Xug7PuTkpQdZQ9A9a7lM5M+8exsS/pgZ7CMssCF+oxe4wOSZMfEeruMrtToyGJtjdY
         d17j6gBAaGHBc/58aKO/Zc2z/cfnHmxRQytTY9QnNt8RbWBEqFHUWQa6b19hrzlFvT
         j6+A67BguZoRm4uv2rRJp9PQF9h+8bIAG0hqmrC7oF4tGFA7G5Fr3VkqeJK9dTWb3a
         FcQhv33joWhyw==
From:   Simon Horman <horms@kernel.org>
Date:   Fri, 26 May 2023 16:16:54 +0200
Subject: [PATCH] Bluetooth: L2CAP: don't check for out-of-bounds value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-l2cap-16bit-v1-1-2cfb83dd28ee@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFW/cGQC/x2N0QqDMAwAf0XyvEDTTdH9yvChqVEDpZNWx0D89
 4U93sFxJ1QpKhWezQlFPlr1nQ3o1kBcQ14EdTIG7/zdtb7D5GPYkDrWHV1PDyZiN8wtWMGhCnI
 JOa7W5CMlk1uRWb//xWu8rh+CObr5cgAAAA==
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In l2cap_connect(), scid is an unsigned 16bit variable. Thus, it's
maximum value is L2CAP_CID_DYN_END (0xffff) and there is no need
to check for this value being exceeded.

Flagged by Smatch as:

  .../l2cap_core.c:4165 l2cap_connect() warn: impossible condition '(scid > 65535) => (0-u16max > u16max)'

Signed-off-by: Simon Horman <horms@kernel.org>
---
 net/bluetooth/l2cap_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index ae397c6819d9..a5d85a5f5930 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -4161,8 +4161,12 @@ static struct l2cap_chan *l2cap_connect(struct l2cap_conn *conn,
 
 	result = L2CAP_CR_NO_MEM;
 
-	/* Check for valid dynamic CID range (as per Erratum 3253) */
-	if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_DYN_END) {
+	/* Check for valid dynamic CID range (as per Erratum 3253).
+	 * As scid is an unsigned 16bit variable it's maximum
+	 * value is L2CAP_CID_DYN_END (0xffff): there is no need to check
+	 * if scid exceeds that value here.
+	 */
+	if (scid < L2CAP_CID_DYN_START) {
 		result = L2CAP_CR_INVALID_SCID;
 		goto response;
 	}

