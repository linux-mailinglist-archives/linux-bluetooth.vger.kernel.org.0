Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B31C1102
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Sep 2019 16:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfI1OPQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 28 Sep 2019 10:15:16 -0400
Received: from hoster906.com ([192.252.156.27]:42490 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbfI1OPQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 28 Sep 2019 10:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=from:to
        :cc:subject:date:message-id; s=dkim; bh=cfhjBsRFCmAvDUFp0PnZU9bB
        sZ+E+BAVz+tIJE4AEIo=; b=QOipZprK9R/eEA5VWg3emZc5KOPQNAIET5HH/TAZ
        SM53h8lUG5m5CzGdC3NMohih3Lt5rwMi9zPkB8DmxO3BmLWjlqdFpVsf/6hHJJiI
        40CtEER+9NzpDwG7Xd+OzP0aLFApSGOZfWupbAwV9qp3KeXscWSvVe5nsRo8urTS
        01o=
Received: (qmail 32408 invoked by uid 503); 28 Sep 2019 14:15:14 -0000
Received: from unknown (HELO lespaul.Home) (mike@mnmoran.org@50.96.104.71)
  by hoster906.com with ESMTPA; 28 Sep 2019 14:15:14 -0000
From:   "Michael N. Moran" <mike@mnmoran.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     "Michael N. Moran" <mike@mnmoran.org>
Subject: [PATCH BlueZ] meshctl truncates GATT MTU
Date:   Sat, 28 Sep 2019 10:14:02 -0400
Message-Id: <1569680043-2874-1-git-send-email-mike@mnmoran.org>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: "Michael N. Moran" <mike@mnmoran.org>

This patch fixes a bug in meshctl that causes the
GATT MTU to be truncated resulting in incorrect
segmentation when the MTU is greater than 259.

Michael N. Moran (1):
  The meshctl sock_write() max_len variable is declared as
    uint8_t, which causes the calculation of the GATT MTU
	to be truncated when the MTU (write_mtu) is greater
	than 259. This error causes incorrect segmentation.

 tools/mesh/gatt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1

