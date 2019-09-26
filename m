Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58202BF71A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Sep 2019 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfIZQsR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Sep 2019 12:48:17 -0400
Received: from hoster906.com ([192.252.156.27]:44032 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfIZQsR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Sep 2019 12:48:17 -0400
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Sep 2019 12:48:16 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=to:from
        :subject:message-id:date:mime-version:content-type; s=dkim; bh=x
        AYE61VHFn2u0Zg0iFcrXKBzwe0hb2qE41uDqPoW0Zk=; b=eMNl8mdWU3bVqWMbm
        vAFkt/F3b3l3wUIysvt6By5hsNmpBgbJi/efpFsyX77Mu59CjtJK5F0IZwX+kVuq
        NOowHhHS3wgL3UXIZj1nUAxF3aZLD5cpN1GpjhuFlOjKPtvwBpY0rj6FrnGLYWWA
        sntkWM95CiOrepV0gvRiQHHSec=
Received: (qmail 18598 invoked by uid 503); 26 Sep 2019 16:41:36 -0000
Received: from unknown (HELO ?192.168.254.100?) (pop-before-smtp@50.96.104.71)
  by hoster906.com with ESMTPA; 26 Sep 2019 16:41:36 -0000
To:     linux-bluetooth@vger.kernel.org
From:   "Michael N. Moran" <mike@mnmoran.org>
Subject: Meshctl GATT MTU Patch
Message-ID: <44f46ff3-216f-7205-336a-2d0fb150818a@mnmoran.org>
Date:   Thu, 26 Sep 2019 12:41:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------936B522E3615FCC15D77EC08"
Content-Language: en-MW
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is a multi-part message in MIME format.
--------------936B522E3615FCC15D77EC08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The attached patch fixes a problem in the meshctl gatt 
provisioner where the GATT MTU is truncated.


-- 
Michael N. Moran           (h) 770 704 9751
218 Wilshire Terrace       (c) 678 521 5460
White, GA, USA 30184       http://mnmoran.org


--------------936B522E3615FCC15D77EC08
Content-Type: text/x-patch;
 name="bluez.mesh.mtu.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="bluez.mesh.mtu.patch"

Fix GATT MTU truncation in the max_len calculation.

diff --git a/tools/mesh/gatt.c b/tools/mesh/gatt.c
index 0a942d4..c9e789c 100644
--- a/tools/mesh/gatt.c
+++ b/tools/mesh/gatt.c
@@ -189,7 +189,7 @@ static bool sock_write(struct io *io, void *user_data)
 	struct write_data *data = user_data;
 	struct iovec iov[2];
 	uint8_t sar;
-	uint8_t max_len;
+	uint16_t max_len;
 
 	if (data == NULL)
 		return true;

--------------936B522E3615FCC15D77EC08--
