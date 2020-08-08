Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF3A23F89D
	for <lists+linux-bluetooth@lfdr.de>; Sat,  8 Aug 2020 21:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHHTac (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 8 Aug 2020 15:30:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:49058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbgHHTaa (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 8 Aug 2020 15:30:30 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E3A42067D
        for <linux-bluetooth@vger.kernel.org>; Sat,  8 Aug 2020 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596915030;
        bh=7/IP/YeW1xDEX7TOnwwN4jstuz8IGkEV5kbaaX15IfM=;
        h=From:To:Subject:Date:From;
        b=kxObHKXmDWR+ZLRbfThBEoD0QCAQ6KV1ara53Y8k+vNekS7FBeKTBcnmdvj2xCD5R
         JLHWCPRmA7Bg0DEcSZrhdYdPruef6wY4HO4v6XMYXGS6QWHzhvaZCXXhUOmjvCTXNR
         87kX/ynP+aWioONxjOKqxeBjb81AyjN9egoljAg0=
Received: by pali.im (Postfix)
        id 7B73A5FD; Sat,  8 Aug 2020 21:30:28 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] sbcenc: Remove duplicate check for num of channels
Date:   Sat,  8 Aug 2020 21:30:26 +0200
Message-Id: <20200808193026.29007-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 src/sbcenc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/sbcenc.c b/src/sbcenc.c
index 2a4c240..6f8d794 100644
--- a/src/sbcenc.c
+++ b/src/sbcenc.c
@@ -142,7 +142,6 @@ static void encode(char *filename, int subbands, int bitpool, int joint,
 					blocks == 12 ? SBC_BLK_12 : SBC_BLK_16;
 	} else {
 		if (BE_INT(au_hdr.sample_rate) != 16000 ||
-				BE_INT(au_hdr.channels) != 1 ||
 				BE_INT(au_hdr.channels) != 1) {
 			fprintf(stderr, "mSBC requires 16 bits, 16kHz, mono "
 								"input\n");
-- 
2.20.1

