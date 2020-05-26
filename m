Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD91F1C2B94
	for <lists+linux-bluetooth@lfdr.de>; Sun,  3 May 2020 13:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgECLL4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 3 May 2020 07:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:56188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728196AbgECLL4 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 3 May 2020 07:11:56 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 958102071C;
        Sun,  3 May 2020 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588504315;
        bh=4VcOYsAY9p3MtHzocsDUb1MNP6Et2z3i8KmjaPkK5Ho=;
        h=From:To:Cc:Subject:Date:From;
        b=c2qKylZtm2JED7oVfAEjLN+pi9uSL4Jrtpw2lOeJs1S6bPpdM7GSkk609RmKd3rZq
         Z6R5mYjMtVmj+Rce1w8SlFqAGwydFcvqDn32lSMw/7TIPLcrihRx/gQ0PCw3JvR34r
         n89dpLeIoxXxu4J4eyYKll1GovGWukZV9j/76NCw=
Received: by pali.im (Postfix)
        id E5F19A1E; Sun,  3 May 2020 13:11:53 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: [PATCH] doc: Update assigned-numbers.txt
Date:   Sun,  3 May 2020 13:11:48 +0200
Message-Id: <20200503111148.11412-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Define missing rfcomm channels specified in src/profile.c
---
 doc/assigned-numbers.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/doc/assigned-numbers.txt b/doc/assigned-numbers.txt
index ca171c4ff..cf481c15e 100644
--- a/doc/assigned-numbers.txt
+++ b/doc/assigned-numbers.txt
@@ -8,6 +8,8 @@ avoid conflicts.
 Profile		Channel
 -----------------------
 DUN		1
+SPP		3
+HSP HS		6
 HFP HF		7
 OPP		9
 FTP		10
-- 
2.20.1

