Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF9F7530AE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Jul 2023 06:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbjGNEr7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 Jul 2023 00:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjGNEr6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 Jul 2023 00:47:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9BC26B3
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Jul 2023 21:47:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69C4261BED
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 Jul 2023 04:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C553DC433CB
        for <linux-bluetooth@vger.kernel.org>; Fri, 14 Jul 2023 04:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689310076;
        bh=BmhMMjKmQmVbNkP4H9i7/p3TMEqn5zUmXIhd5fA5ZjM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uSgJ0gJVOume9NxkQRNhAl8bChd4rZZz4/lZwqIkD2lez9jEkdJnsxXS9oHEblP8+
         jAXB2PKq9hcbs8SwA1zYS7DMWU8ylPAQu80t7aOOz4g9P6rCsqx602oiGvHTG4G491
         LNd2w3n1X2wEX3306o1Kxk1ZdHjQoRZDAzPC8QVJXYFnMdZIiw1Ql3sthdtpetRto4
         IASw8+Eio+98wNUR1uDdw/NFcZYdckeHLKXA6m1E8GHDpYrVx212lbZBCR/KKg/DiT
         zVdxaczC/O1XTgNIYwtV+YbR694OBHYGRVyci7gilbXHXoGfcL6FHJQiBBCCoXG7dn
         hAEvMBGc2W7qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AE92AC53BD0; Fri, 14 Jul 2023 04:47:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 84521] Ralink RT3290 doesn't have a bluetooth driver
Date:   Fri, 14 Jul 2023 04:47:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aadeshsonawane307@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-84521-62941-dOa9xaAATa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-84521-62941@https.bugzilla.kernel.org/>
References: <bug-84521-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D84521

Aadesh Sonawane (aadeshsonawane307@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aadeshsonawane307@gmail.com

--- Comment #8 from Aadesh Sonawane (aadeshsonawane307@gmail.com) ---
I can report that this bluetooth driver https://github.com/loimu/rtbth-dkms
works well with 6.1.0-10-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.37-1
(2023-07-03).

It would be great if we could upstream that driver!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
