Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 369A074C145
	for <lists+linux-bluetooth@lfdr.de>; Sun,  9 Jul 2023 08:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbjGIGSG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 9 Jul 2023 02:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbjGIGSF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 9 Jul 2023 02:18:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9E1E4D
        for <linux-bluetooth@vger.kernel.org>; Sat,  8 Jul 2023 23:18:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 724B460BBC
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 06:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4D6EC43142
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688883483;
        bh=NN90zc+nZbIzu9OLXY/oFBB5tNKtXUdNiM6LAwq5VhA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=f/FE7PvARqsbMBJkHlasutXIcrz6O6dgVi9DHcFsYvQrDS+1nyixFIIDjHKs9rl7U
         icoYMklk6Kih4IjzUQzb8VwkDSQfT1UNTzv/DEhcimlno5Cnu3+kmvDQoqVE1iflSr
         gSjaDIxVXda1XfHvDKXzhaG42mPT/99EEtypmLPURXZ4agSBSqAnFOPeZscYUbFqTn
         whz/y5nizCwKpZ/JTnUejRRhtdyEDD1oxpd4IQbJSxBtp3pd5NmGx5N+Y4LMlftEWC
         078Fu/x0N0yylHtYYEaDGz/KJFqbtFgseOmMxRUEPn1lPu9gbFbTFL11sfpNZxP3ph
         E2kCP7vmj+5rw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C6CECC53BC6; Sun,  9 Jul 2023 06:18:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215167] Bluetooth: hci0: command 0xfc05 tx timeout
Date:   Sun, 09 Jul 2023 06:18:02 +0000
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
Message-ID: <bug-215167-62941-hGGHxSbZQy@https.bugzilla.kernel.org/>
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

--- Comment #52 from Hussam Al-Tayeb (ht990332@gmx.com) ---
For me, only a horrible modprobe -r xhci_pci && modprobe xhci_pci seems to =
make
it work against without a reboot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
