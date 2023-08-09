Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5097E775316
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Aug 2023 08:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjHIGqD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Aug 2023 02:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbjHIGqC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Aug 2023 02:46:02 -0400
Received: from mail.svario.it (mail.svario.it [84.22.98.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9D41BF7
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Aug 2023 23:46:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-093-131-108-051.93.131.pool.telefonica.de [93.131.108.51])
        by mail.svario.it (Postfix) with ESMTPSA id 7EA6BDA0C6;
        Wed,  9 Aug 2023 08:46:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svario.it; s=201710;
        t=1691563560; bh=QSezI5hr+S6ol1gbGjH1wOmBmOE8Lw3z1P9cNtjhrKg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yyeixlzv9AxOc6t8m+mge82kkVZf4sITs/ikMtzfStShBv6XBbP3sX+PWMIqESZEW
         l/Jxd3PW/RmbeExtugxlJ0YHIljmQaG8SVEaNh1M63bzUaiD4uPyQKOq+vTosJflSu
         WXO/8OOZKRX6LAoAcxreO8nOwsDFL+pB3XDTxwD7cmLTKNwRtjTU/NmRJekBssDFDN
         n0YBPijf+nd5xAslyurhEOK6dBniWqrNUwTugFtDkuWIUj42O4p0d1Wn1Rx2Nu6jrD
         MRi31/nbGhM8IqI81893qZTO1fwWAAOJgSCx/ixpyiPensNKZkV+leh8T+DHrhmNVm
         5FR+M+5GAwu3A==
From:   Gioele Barabucci <gioele@svario.it>
To:     linux-bluetooth@vger.kernel.org
Cc:     Gioele Barabucci <gioele@svario.it>
Subject: [PATCH BlueZ v3 1/2] configure.ac: Bump minimum D-Bus version to 1.10
Date:   Wed,  9 Aug 2023 08:44:40 +0200
Message-Id: <20230809064441.2002194-2-gioele@svario.it>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809064441.2002194-1-gioele@svario.it>
References: <20230809064441.2002194-1-gioele@svario.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

D-Bus 1.10, released in 2015, is the first version that supports reading
policy files from `/usr/share/dbus-1` in addition to `/etc/dbus-1`.

The previous minimum version, 1.6, was released in 2012.
---
 configure.ac | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index bc7edfcd3..5348bf3c2 100644
--- a/configure.ac
+++ b/configure.ac
@@ -95,7 +95,7 @@ AC_ARG_WITH([dbusconfdir], AS_HELP_STRING([--with-dbusconfdir=DIR],
 					[path_dbusconfdir=${withval}])
 if (test -z "${path_dbusconfdir}"); then
 	AC_MSG_CHECKING([D-Bus configuration directory])
-	path_dbusconfdir="`$PKG_CONFIG --variable=sysconfdir dbus-1`"
+	path_dbusconfdir="`$PKG_CONFIG --variable=datadir dbus-1`"
 	if (test -z "${path_dbusconfdir}"); then
 		AC_MSG_ERROR([D-Bus configuration directory is required])
 	fi
-- 
2.39.2

