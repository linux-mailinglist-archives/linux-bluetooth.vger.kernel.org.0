Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC2C5FA66B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Oct 2022 22:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiJJUhO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Oct 2022 16:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiJJUgk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Oct 2022 16:36:40 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E837DBF51
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Oct 2022 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665434134; x=1696970134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0sz9r/pAE+BRb15nd+4QZH7Cfu1rlGXnRZmwKYZeAcg=;
  b=RM/eGtbKzLAS4SDS5QDk2DeIHdrMJBqkldInvNQZUSPA4U6KCfFiATGQ
   Te4w8Hvjn+H48Zcf4ou0LEtc2Pmg/azL/FxNiui+A0mmNmjRmtCfRLP1f
   /Jc+zrl161wrXBbW4TiZBmo4AyqLSfOWmO6628zLmevQIq4C5+rv6XkrW
   ggaMbcfAPVAjmoMtRsKH7VA77rdvE7gbqefL6JpZJzsuW3OMc4/hTi8IC
   bfunc5Aou/YEPRgTv6JJ3B3T541R/TqM8Lt8cfPYFnqfYqWsZUCCIOuax
   QI+W5AN0+E3iWsVnNQAZnzyMPegXrm1fh/agrmzUBxm5eIKArm6wJDo2W
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="330802909"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="330802909"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 13:35:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="730696023"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="730696023"
Received: from yvasudev-mobl.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.209.135.7])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2022 13:35:30 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, brian.gix@intel.com,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [PATCH 2/2] Bluetooth: hci_sync: Fix not able to set force_static_address
Date:   Mon, 10 Oct 2022 13:35:22 -0700
Message-Id: <20221010203522.1251151-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010203522.1251151-1-brian.gix@intel.com>
References: <20221010203522.1251151-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

force_static_address shall be writable while hdev is initing but is not
considered powered yet since the static address is written only when
powered.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Tested-by: Brian Gix <brian.gix@intel.com>
---
 net/bluetooth/hci_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index 3f401ec5bb0c..b7f682922a16 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -757,7 +757,7 @@ static ssize_t force_static_address_write(struct file *file,
 	bool enable;
 	int err;
 
-	if (test_bit(HCI_UP, &hdev->flags))
+	if (hdev_is_powered(hdev))
 		return -EBUSY;
 
 	err = kstrtobool_from_user(user_buf, count, &enable);
-- 
2.37.3

