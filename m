Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7BA4C56C9
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Feb 2022 17:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiBZQVq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Feb 2022 11:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbiBZQVp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Feb 2022 11:21:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D231E7A6A
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Feb 2022 08:21:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 272F9B80834
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Feb 2022 16:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA8CFC340F3
        for <linux-bluetooth@vger.kernel.org>; Sat, 26 Feb 2022 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645892468;
        bh=PbSWRwkAXmqFYIf/SaEVpbezo3AV6KVa9et8WVx01ag=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y++Jx9z43vawoEF0rRkGd5biWr/M/uGrFqUSIwmCFu53iJs4xWz1yNgm8txKKDlmg
         2MRRpHQqnIYQsVvmiackR8e71+f9vIyBFrbvS/EFC6OvCNPVPzpjIlYEzF5Tx/ELs8
         pKtI6miMQlnglwnFS3a9TZq7xtX5P4f/VsUgzWD8XaaehiTmqLaWbkmaNzhWJ6CD98
         1qO/U8T4U/bCHeY1dC6jKkWhReIUL4NuLzlmW5ujF76w2EGhHxarjKNinHLNHNjOeO
         BBl5GVKAHlu5NfVoYx3SBIFjdISwTwbCcMIBtuXNTFoexAdY8Z6hxToMN6mHrMvl0/
         5u1hzQRPQOIQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 932C4C05FD2; Sat, 26 Feb 2022 16:21:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215576] HSP/HFP mSBC profile broken with QCA6174
Date:   Sat, 26 Feb 2022 16:21:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@mjones.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215576-62941-17zsB6vVHG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215576-62941@https.bugzilla.kernel.org/>
References: <bug-215576-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215576

--- Comment #7 from Mike Jones (mike@mjones.io) ---
Thanks for looking into this, Luiz, and thanks wavexx for your experiments!=
 I
can confirm the same results on my system: the first patch (codec.id =3D
BT_CODEC_MSBC) doesn't work, but wavexx's workaround to disable enhanced SCO
results in fully-functional mSBC.

I've managed to find a laptop with an Intel AX200, and here mSBC works fine=
 on
an unpatched v5.16.11 kernel. So this issue doesn't seem to affect all
adapters.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
