Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC221458C9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jan 2020 16:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgAVP3G (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jan 2020 10:29:06 -0500
Received: from srv-mta-01.robart.cc ([80.123.245.229]:13419 "EHLO
        srv-mta-01.robart.cc" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVP3G (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jan 2020 10:29:06 -0500
X-Greylist: delayed 572 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Jan 2020 10:29:05 EST
Received: from localhost (localhost [127.0.0.1])
        by srv-mta-01.robart.cc (Postfix) with ESMTP id AA6C71C0F93;
        Wed, 22 Jan 2020 16:19:32 +0100 (CET)
Authentication-Results: srv-mta-01.robart.cc (amavisd-new); dkim=neutral
        reason="invalid (public key: not available)" header.d=robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
        by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 8H1kKsu6u2K2; Wed, 22 Jan 2020 16:19:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by srv-mta-01.robart.cc (Postfix) with ESMTP id 857951C10E2;
        Wed, 22 Jan 2020 16:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 857951C10E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
        s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1579706372;
        bh=7IBnvOhJ+Tvk6BgbwT5JHCfu5tPiFOlxvXbT+GX9EjI=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=H1BSCkEaGuaXjeJL+4ydnJBemEPzFwF6uq7vVWEj57J+DAY5sPgN71pNHI1O3beAs
         uFKX0yRdm5I+jRU90v/12I4f+54qJfOCVo7L9Va0lIZWTwFRgIaFsUieSwssKSsjku
         eHss9AqXrWrFefiUbgPbFW/ea715NdrDL+T4f8Izo2bLhR84Bo0v4/yppLjAy92771
         9tYBauoA67ztqkAJZRrDcMchtdhoQ3KgW8MpLsqmg6xJftiwTZrWxMWlij/4AJLFkO
         t2fDKAUOTUrZBW4VM8xD0YsCpLChiwLseCZUM8QYxcXffMQP6IA72GE+T3zVKgM1v+
         r3nk2HPckoOBg==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
        by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Yvp4pw6RK1be; Wed, 22 Jan 2020 16:19:32 +0100 (CET)
Received: from workbot3.intern.robart.cc (workbot3.intern.robart.cc [10.0.20.3])
        by srv-mta-01.robart.cc (Postfix) with ESMTPSA id 6BEFE1C0F93;
        Wed, 22 Jan 2020 16:19:32 +0100 (CET)
From:   Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
To:     linux-bluetooth@vger.kernel.org
Cc:     Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
Subject: [PATCH] Fixed bug in prep_write_cb(): missing arguments
Date:   Wed, 22 Jan 2020 16:19:24 +0100
Message-Id: <20200122151924.32697-1-roland.ruckerbauer@robart.cc>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

prep_write_cb() calls gatt_db_attribure_write(), but does not pass data
and data length.

Fixed by passing pdu as data, and skipping the first 4 bytes.
---
 src/shared/gatt-server.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
index 0d9bb07..a235552 100644
--- a/src/shared/gatt-server.c
+++ b/src/shared/gatt-server.c
@@ -1312,7 +1312,7 @@ static void prep_write_cb(uint8_t opcode, const voi=
d *pdu,
 	pwcd->length =3D length;
 	pwcd->server =3D server;
=20
-	status =3D gatt_db_attribute_write(attr, offset, NULL, 0,
+	status =3D gatt_db_attribute_write(attr, offset, pdu + 4, length - 4,
 						BT_ATT_OP_PREP_WRITE_REQ,
 						server->att,
 						prep_write_complete_cb, pwcd);
--=20
2.19.1

