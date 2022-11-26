Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4E1639704
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Nov 2022 17:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKZQFk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Nov 2022 11:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiKZQFj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Nov 2022 11:05:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3BC1AF1B
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Nov 2022 08:05:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 242ADB811A1
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Nov 2022 16:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA0E3C433C1
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Nov 2022 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669478732;
        bh=Lt+pmsVJwctLPnYqQ/qlrRZXhUtlbpGKyVBeNip8YN4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c19uWPzK0DNV34od82OnnVRiv88zmh2gKSeLEaSJZUuW8+lkCDT9lnsMS1xYftT2o
         fSGM6ieyuPhfIBz5H6QYKDpJakRfxMzDLO/7jvskV8EtT5Mvhf5NrAvRnrJvWe20Sn
         k0OBGOdkJF4LlMKUFTZf8OUcfUL4lUFef0LazPYhasAR9RqHdxXZgRuOpy3oyyfcc6
         Iv2sa8E60iOtuW1fc3232YmDxcnGZwQTwGKkkudLcgdxjpaFjCfFpSb9eaqk+NKoWW
         Z2W8iVyyXjA7lbJtPG3Cl4OXTvklEoEhtROz8Q2t3TMu3f2MbADhsbR85uovi/BnS4
         GyHibt3d9UXiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B98A9C433E7; Sat, 26 Nov 2022 16:05:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216683] [REGRESSION] HCI_QUIRK_NO_SUSPEND_NOTIFIER causes
 kernel panic on fake CSR 5.0 clones
Date:   Sat, 26 Nov 2022 16:05:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: justanormaltinkerermihir@duck.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216683-62941-TlTrXzPpTJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216683-62941@https.bugzilla.kernel.org/>
References: <bug-216683-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216683

JustANormalTinkererMihir (justanormaltinkerermihir@duck.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #3 from JustANormalTinkererMihir (justanormaltinkerermihir@duck=
.com) ---
I'll resubmit this regression as it looks like it didn't go to the
https://lore.kernel.org/regressions/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
