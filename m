Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23D305274B2
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 May 2022 01:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbiENXmL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 14 May 2022 19:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiENXmJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 14 May 2022 19:42:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795FD64C1
        for <linux-bluetooth@vger.kernel.org>; Sat, 14 May 2022 16:42:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77EA460C6A
        for <linux-bluetooth@vger.kernel.org>; Sat, 14 May 2022 23:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C98D1C36AEF
        for <linux-bluetooth@vger.kernel.org>; Sat, 14 May 2022 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652571725;
        bh=tTD6C2UUDIynHy21R2fTyUYNderSeMex1P68/XIK6jk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mkaXJMeU/eBN6wHYgFqCStv7hu/DCqTFlEDTrznhCdMqTk2bl3EH0AJOQAH93fLXC
         Xj1p2sZBUceaRclsOmIGCdjEhcCqaUU4Ju7KGnAki5YXyhCTmKKPci4W6iDkai/+pl
         ZZsE1iiz9Dnt9PSP0LH2TXjLDV4aOzm9IUyTdhsOtQT1qCffAAw7l1xVUpC9+f4/i/
         CyGVt9FDip7/4kV0IyrnWmt7/kNAHTUr4hxi7dpzE1gih4v2KSGyFZfG4nQWGj7N78
         18kGzZgmZCme/5tiabfB0N2qAlaefBZcvBmGQuqLB9NR/QRGOWmmyoGRFpr1h29VVb
         NR1gGhcZpnNPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BB1CCC05FD0; Sat, 14 May 2022 23:42:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 200039] BT advertising packet wakes up the system from S3 and
 suspend-to-idle
Date:   Sat, 14 May 2022 23:42:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bernie@codewiz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-200039-62941-efY3L50qCr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200039-62941@https.bugzilla.kernel.org/>
References: <bug-200039-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D200039

--- Comment #41 from Bernie Innocenti (bernie@codewiz.org) ---
(In reply to Bernie Innocenti from comment #40)
> Not sure if I'm seeing the same bug, but my Lenovo X1 Gen7 wakes up
> immediately after entering S3 when a BT headphone is paired.

I found the same bug documented here:
https://wiki.archlinux.org/title/Lenovo_ThinkPad_X1_Carbon_(Gen_7)#S3_Suspe=
nd_Bug_with_Bluetooth_Devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
