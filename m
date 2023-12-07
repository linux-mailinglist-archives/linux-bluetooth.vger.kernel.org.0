Return-Path: <linux-bluetooth+bounces-437-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A86808C1D
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 16:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDF15B20BEC
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 15:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F353B4596C;
	Thu,  7 Dec 2023 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com header.b="AzTU2PFB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57F510E7
	for <linux-bluetooth@vger.kernel.org>; Thu,  7 Dec 2023 07:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=To:Date:Message-Id:Subject:
	Content-Transfer-Encoding:Content-Type:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ye/tJeOtIYmEeSd8JLXj7cZatN232/Ir/pfSZvI06kM=; b=AzTU2PFB9LaPvzMNqqHfq9xKZo
	b0Ek0tCUCT2pjPz/KY/i5OlSfbbb5ulOawu+/7lKJyEM3jPqRBS66ChaNlx4iDlS162Peh8Xkepos
	EZpx+zvHauBrJKCVTIzsB4YR3xkgbLnz3s83RHR8SoK6MZYFkDJCRV+Ba8+faYFXLUuNDUbOkB2Xk
	UJwqYwyv27xjb2pwwjGo2N6J1k9Bs4XKwfqdt49h0yK/LOVFr8IOnn5rN+R6COnFamiKgDX11l5Sb
	6S+vcUJeaMTX0ckyH1QYhMVFZsQye/f33kZLJqiLk7V3DWqJWZjmXCiTpVIdoJwJqbNZaSiwR/AHz
	8wADH4yg==;
Received: from cpc159311-cmbg20-2-0-cust374.5-4.cable.virginm.net ([82.5.237.119] helo=smtpclient.apple)
	by email.metanate.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <stu@metanate.com>)
	id 1rBGYo-0005qL-1D
	for linux-bluetooth@vger.kernel.org;
	Thu, 07 Dec 2023 15:45:10 +0000
From: Northfield Stuart <stu@metanate.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: [PATCH BlueZ] Fix ad_clear_data() to clear correct structure
Message-Id: <92D4BD44-91B2-4D0A-9A43-AEAE5DEAA963@metanate.com>
Date: Thu, 7 Dec 2023 15:44:59 +0000
To: linux-bluetooth@vger.kernel.org
X-Mailer: Apple Mail (2.3731.700.6)
X-Authenticated: YES

---
 client/advertising.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/client/advertising.c b/client/advertising.c
index a7474d6a2..b8e3f4ab3 100644
--- a/client/advertising.c
+++ b/client/advertising.c
@@ -757,7 +757,7 @@ void ad_disable_manufacturer(DBusConnection *conn)
 
 static void ad_clear_data(void)
 {
-       memset(&ad.manufacturer, 0, sizeof(ad.manufacturer));
+       memset(&ad.data, 0, sizeof(ad.data));
 
        return bt_shell_noninteractive_quit(EXIT_SUCCESS);
 }
-- 
2.39.2 (Apple Git-143)


