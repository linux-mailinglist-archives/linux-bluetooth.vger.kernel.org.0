Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451811C7A5E
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 21:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgEFTfC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 15:35:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgEFTfC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 15:35:02 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BF1520747;
        Wed,  6 May 2020 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588793702;
        bh=cgj82CcHMN/fJ6I1FD+RRR8TI2l6fREwhyG56P4SOVA=;
        h=From:To:Cc:Subject:Date:From;
        b=ryXQDBXG/MEsGYyuuV9937MUyY+zLIHGh473cDLdttLGl6gVeyHt3jWRGE/0o+6j9
         RXtNUw4t01xnqgztB1MPmTHPcwFxXs3uk+PYjdSs2USwVSzWudNm9+IRP/YSfJxGiV
         yds5KoLLCahj2vJp0xRWptdC0CuCa1n9BrYYWG5g=
Received: by pali.im (Postfix)
        id 0890089C; Wed,  6 May 2020 21:35:00 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: [PATCH] Install avinfo utility
Date:   Wed,  6 May 2020 21:34:35 +0200
Message-Id: <20200506193435.3746-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This utility is very useful for determining which A2DP codecs are supported
by remote side. So install it to system as part of bluez package.
---
 Makefile.tools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.tools b/Makefile.tools
index 9b9236609..d52721612 100644
--- a/Makefile.tools
+++ b/Makefile.tools
@@ -176,9 +176,9 @@ endif
 if TOOLS
 bin_PROGRAMS += tools/rctest tools/l2test tools/l2ping tools/bccmd \
 			tools/bluemoon tools/hex2hcd tools/mpris-proxy \
-			tools/btattach
+			tools/btattach tools/avinfo
 
-noinst_PROGRAMS += tools/bdaddr tools/avinfo tools/avtest \
+noinst_PROGRAMS += tools/bdaddr tools/avtest \
 			tools/scotest tools/amptest tools/hwdb \
 			tools/hcieventmask tools/hcisecfilter \
 			tools/btinfo tools/btconfig \
-- 
2.20.1

