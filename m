Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9C14B9404
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Feb 2022 23:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbiBPWuf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Feb 2022 17:50:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbiBPWue (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Feb 2022 17:50:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112EB135708
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Feb 2022 14:50:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A84DE61B90
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Feb 2022 22:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 136D9C340F1
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Feb 2022 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645051821;
        bh=0d2VESger+0/lqOzDmvg9g6vR5pxYfawQT0SHDWU+gg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UhCQa4tT7nFunWiyYgZtdf0HFOoYxwkrGJU8UhcwIdzABRFn4gMrvalgUcHR/TIuj
         KOd7a2++GS203gtnUwnZ3ChdQv0HeRW8vltljK9nnyKx9GPTcqiigqE8CQdO1eR1r+
         O0eQOPiSwZss8Dmb1XU6Lil/WsSNUUhVUSI75J5OXCNB514qIIbeDsxYAnlQJjSyCZ
         BAl+Eee1bAF9eOYOmxuwkUZjO63RhFY55pZm6MpnAZhgXrfB4MkfR4hsrLoftj9KYZ
         pIkSn48i8YXdPHNqKjRZOIYZPfdaO2LNk+odyGyPltOFvxNDF33YiKFPHsIyTs44mY
         gDoZGgeNklXeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F3678CAC6E2; Wed, 16 Feb 2022 22:50:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215528] Excessive logging from Intel Bluetooth "Bluetooth:
 hci0: sending frame failed" "hci0: urb 00000000xxxxxxxx submission failed
 (90)"
Date:   Wed, 16 Feb 2022 22:50:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215528-62941-Ky8EfhdrHa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215528-62941@https.bugzilla.kernel.org/>
References: <bug-215528-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215528

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #12 from Artem S. Tashkinov (aros@gmx.com) ---
Thank you.

I hope to see it in 5.15.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
