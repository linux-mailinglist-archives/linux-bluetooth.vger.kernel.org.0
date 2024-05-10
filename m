Return-Path: <linux-bluetooth+bounces-4474-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8262C8C24A1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 May 2024 14:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A08283365
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 May 2024 12:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA317089C;
	Fri, 10 May 2024 12:14:17 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB9A17084A
	for <linux-bluetooth@vger.kernel.org>; Fri, 10 May 2024 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715343257; cv=none; b=r3P2qo0J9s3Hq9AkcQ4oT7vI8PrTJ/KO8v5uCiduBvMNv14vD0k9GOcWjUzuS3mJ3tkHAGSCwg+2H9usz2jXwi7hlfNrSKx39CD+55fR1D9i37dGj8mAGjgYMXTi/NI1vJwOHjhCy9imqr6Xzq442ngwjmth/YlIEqcaACyutxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715343257; c=relaxed/simple;
	bh=Z4Ect0czkbLcBsbsoMl8fFiwHYkN+tVjcHoe1Tp/VkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwFRjltRV4PNItOHR+M9jR44iw9ka965oIE3zZJO01Cg32k0mWYthoxe8pNlAIaGigosHxDdQ8DFD8iHLjWzBp7OuTxl9Y8FXsBSZMjvmgAbUx85hYdMgbl/P69BxKXwqYPiA3j2vqMZZPN4SLOcrhtX+JdMRYfVqGQDeT0774E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5076360008;
	Fri, 10 May 2024 12:13:59 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>
Subject: [BlueZ v2 12/20] isotest: Fix error check after opening file
Date: Fri, 10 May 2024 14:10:22 +0200
Message-ID: <20240510121355.3241456-13-hadess@hadess.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510121355.3241456-1-hadess@hadess.net>
References: <20240510121355.3241456-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

Consider "0" to be a valid fd.
---
 tools/isotest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/isotest.c b/tools/isotest.c
index 810d15d2df2a..ddace0da3044 100644
--- a/tools/isotest.c
+++ b/tools/isotest.c
@@ -720,7 +720,7 @@ static int open_file(const char *filename)
 	syslog(LOG_INFO, "Opening %s ...", filename);
 
 	fd = open(filename, O_RDONLY);
-	if (fd <= 0) {
+	if (fd < 0) {
 		syslog(LOG_ERR, "Can't open file %s: %s\n",
 						filename, strerror(errno));
 	}
-- 
2.44.0


