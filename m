Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1791359E541
	for <lists+linux-bluetooth@lfdr.de>; Tue, 23 Aug 2022 16:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241048AbiHWOlr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 23 Aug 2022 10:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240022AbiHWOl3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 23 Aug 2022 10:41:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694182CF91A
        for <linux-bluetooth@vger.kernel.org>; Tue, 23 Aug 2022 04:59:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2C0756159D
        for <linux-bluetooth@vger.kernel.org>; Tue, 23 Aug 2022 11:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CBFDC43152
        for <linux-bluetooth@vger.kernel.org>; Tue, 23 Aug 2022 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661255928;
        bh=Z2e3YH9wBPgEtpdiNxEQyEiPKRmriGgRiZ+7Nij4OLw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kwtxHwQyPxzEs4efNenzNDwsIXFCOUnbFaLSgTr+Y0wKZOpaAQl06jgWSw4TVzeUc
         f134ACitZCcrGfu56AKHF/4EUzbgy2sKovNTkG/x2hLLsC3kBwJIYGOTUMe0eY5Cq8
         6M8kPy3DIhzi951yNn01oX6zoFcb8afPr3dQNOmkd07gESMW5nCBrpnqQpgMSvPBad
         24ulW7KYf1aMdNqMvIiSWBIYO2KAQZsVogdrlLrqc+9fo8Wqn+gnW8oz2+iL3kp1YM
         2mTYBM+gNZXeI1/oFtqrNZSqrxr1cEy1nn1KrDXyD3jwZLuPJFMUjJhUn/uscpqZ0j
         ox5rnPdR3u5ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7C731C433E4; Tue, 23 Aug 2022 11:58:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215768] Kernel 5.17 can't suspend while bluetooth is enabled.
Date:   Tue, 23 Aug 2022 11:58:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: damien.thebault@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215768-62941-eWmoGWIie0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215768-62941@https.bugzilla.kernel.org/>
References: <bug-215768-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215768

--- Comment #39 from Damien Th=C3=A9bault (damien.thebault@gmail.com) ---
I can confirm that on 5.19.2 I'm able to connect bluetooth devices after
wake-up without having to stop/start bluetooth.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
