Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20B2771986
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Aug 2023 07:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjHGFl6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 7 Aug 2023 01:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjHGFlu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 7 Aug 2023 01:41:50 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E81170B
        for <linux-bluetooth@vger.kernel.org>; Sun,  6 Aug 2023 22:41:47 -0700 (PDT)
Date:   Mon, 07 Aug 2023 05:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1691386905; x=1691646105;
        bh=XOmHwbwHVVyc+DANX8BBwYXVuiUZKcOYUbylXYRB7Rs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=V7Z4SPl1fcbQVw9ZKoVOYHFngTXl+EU+N93AnyER/0TZ+bJGeHRTOgPn6zzoSn0mW
         Aut+pZWN/yZ5aUHKDj6WJgX3nkEVupDyCIiG42wlZMG/TsaRnBwG9E/G366wOg0DRW
         j2HWEYw/XIiTMWJyiT+MeS2ODL/jw3K/aRd0THxMFBBj9LYlT63cjfcaCKL+PpetVd
         /XNwbv9mkXhNTlk18bGeEN1BVhk2hQKFbHnQfPMla5KnQ8w8uSuuDyZY/wBJyEwT0x
         w6phSl3R5CWGwAMIrBXrm6z6E6vy/ST/BuGk5UKQGDWSzCp+55Il9aMB8sX3vGenrm
         Pc8OlbUjIkckA==
To:     linux-bluetooth@vger.kernel.org
From:   Karl Bieber <karl.bieber@proton.me>
Cc:     Karl Bieber <karl.bieber@proton.me>
Subject: [PATCH BlueZ 1/1] main: Fix missing comma
Message-ID: <20230807054108.234233-2-karl.bieber@proton.me>
In-Reply-To: <20230807054108.234233-1-karl.bieber@proton.me>
References: <20230807054108.234233-1-karl.bieber@proton.me>
Feedback-ID: 51085399:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 src/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/main.c b/src/main.c
index 13501440b..2134fcf75 100644
--- a/src/main.c
+++ b/src/main.c
@@ -78,7 +78,7 @@ static const char *supported_options[] =3D {
 =09"NameResolving",
 =09"DebugKeys",
 =09"ControllerMode",
-=09"MaxControllers"
+=09"MaxControllers",
 =09"MultiProfile",
 =09"FastConnectable",
 =09"SecureConnections",
--=20
2.41.0


