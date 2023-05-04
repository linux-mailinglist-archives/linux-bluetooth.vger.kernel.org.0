Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB1996F76F4
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 May 2023 22:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbjEDUZf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 May 2023 16:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjEDUZU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 May 2023 16:25:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258C929BDF;
        Thu,  4 May 2023 13:11:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E405637E0;
        Thu,  4 May 2023 19:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94368C433EF;
        Thu,  4 May 2023 19:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683229694;
        bh=CAdlU3Z26SdXFJkED29iRmn5fBKbSOBOXN5QDzuIAvE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tDIBBMoRJS/Oa72tECO8N9yPbfMwEgPx/wiIBac303vkzZhpVh4R2WWIOH8WeQFOX
         cKAYUt/fA3eHtGrxibwXbbNWymjxQ5oPmWZtuUagiPfUseUuZnDk8rx6/NtxujyyPR
         DFIqrGR53SpHYt9S/DH1uLisWXuioedmC+vB82qKnoe0w5PqFjt9Zabj1bpLWbMeck
         bZf3sjcwZvf6g1xTkner2ohUc9RmhPf+BQsbT4RAzR+RWKyExib96K3gdqwep/0la4
         Rz8+dff5vkTYa+isMZoKhfutOPYkmumZRuEd2MLKARiRwmqkWcqBGuoMIj84KFaMY9
         XYjdZW75GnBjw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Max Chou <max.chou@realtek.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Sasha Levin <sashal@kernel.org>, marcel@holtmann.org,
        johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 44/49] Bluetooth: btrtl: check for NULL in btrtl_set_quirks()
Date:   Thu,  4 May 2023 15:46:21 -0400
Message-Id: <20230504194626.3807438-44-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194626.3807438-1-sashal@kernel.org>
References: <20230504194626.3807438-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Max Chou <max.chou@realtek.com>

[ Upstream commit 253cf30e8d3d001850a95c4729d668f916b037ab ]

The btrtl_set_quirks() has accessed btrtl_dev->ic_info->lmp_subver since
b8e482d02513. However, if installing a Realtek Bluetooth controller
without the driver supported, it will hit the NULL point accessed.

Add a check for NULL to avoid the Kernel Oops.

Signed-off-by: Max Chou <max.chou@realtek.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btrtl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 6b3755345427a..88f8c604d70a2 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -882,6 +882,9 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
 		break;
 	}
 
+	if (!btrtl_dev->ic_info)
+		return;
+
 	switch (btrtl_dev->ic_info->lmp_subver) {
 	case RTL_ROM_LMP_8703B:
 		/* 8723CS reports two pages for local ext features,
-- 
2.39.2

