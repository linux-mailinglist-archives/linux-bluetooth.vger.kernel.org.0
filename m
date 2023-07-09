Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C96A374C147
	for <lists+linux-bluetooth@lfdr.de>; Sun,  9 Jul 2023 08:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbjGIGXt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 9 Jul 2023 02:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjGIGXs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 9 Jul 2023 02:23:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B4661BE
        for <linux-bluetooth@vger.kernel.org>; Sat,  8 Jul 2023 23:23:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A46B560BC2
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 06:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1864AC43215
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 06:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688883827;
        bh=RVkBEbTBO168A+UiYe18ezr5RSe9fYiR0iDRJ4LDUEk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=P+FtIGVIXzpKK+4Kpo3GAuWM1OC7oWmAXf6Tet1A/S6AtCAIMci4J6E6mJhNd/F6O
         brJiHjfH/4hWOwDuOr0xujXHpgCXpwcfZZk/2VEM7jzMYyyOiPQ335kXcsgNPvl4HT
         NfKz2yoflq/lMY255p/sjUogjtm+P1cmcw2d0lmHxZwS/ut9eZXzlz0nxEJDFXny53
         WIuqKbLyMEdQVIlELzi8VktzjJePPfa8whEZVCGjI5LkHIDbZ1loYKUclOm0BgxytG
         8AhketxJk/LdiAlpccdIsPZirBmHjumQcxLRyELPgFqBbq1iRTJeS53xn6qR8xoDgj
         4bXuyjv/qaVxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 094CCC53BD2; Sun,  9 Jul 2023 06:23:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215167] Bluetooth: hci0: command 0xfc05 tx timeout
Date:   Sun, 09 Jul 2023 06:23:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ht990332@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215167-62941-k1Yi0A0568@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215167-62941@https.bugzilla.kernel.org/>
References: <bug-215167-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215167

--- Comment #53 from Hussam Al-Tayeb (ht990332@gmx.com) ---
Another note. This also breaks after resuming from hibernate and not only a
shutdown.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
