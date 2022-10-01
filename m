Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9775F1D2A
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Oct 2022 17:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJAPN5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 1 Oct 2022 11:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiJAPN4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 1 Oct 2022 11:13:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F31C80D6
        for <linux-bluetooth@vger.kernel.org>; Sat,  1 Oct 2022 08:13:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B00060B4D
        for <linux-bluetooth@vger.kernel.org>; Sat,  1 Oct 2022 15:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD19FC433D6
        for <linux-bluetooth@vger.kernel.org>; Sat,  1 Oct 2022 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664637234;
        bh=pv8RAHAPKfDpSm/oraM2MzRgovWu3WH1r5Y0CbsqTDY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jItfu1g5W+npQY4xPoF/SMlkL0cQ66qE9Y+TZ13i6GFF6q8abihls4+CO7/CRx5R7
         +AnSlph5Qqe8AnC1uM4rwVnsckKK11khrFkuFxkve5NEP8qvDhSRZ+HkB2ruMljflj
         tKcbKssFFlqlDHdnbmoSGLfVWR4R9LVMcE1FkaNMO78ivEHYoVwP2gkI+dPX6RC9FC
         uqOSU0VAMDHyDegT4ntZmERONcsmZ/CJdGevqbkjKJ/dDWZthFcbOWC67YOpoc6Js8
         CeFZn8fViYIdSu0m9MZP7hg5grDnThR8hvmhUqiscMbj34137Tyd9+gxwFZR3aXvDm
         kJH/VOCGmnAuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A1801C433E6; Sat,  1 Oct 2022 15:13:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216532] openSUSE Tumbleweed, AX210, bluetooth, connection fails
Date:   Sat, 01 Oct 2022 15:13:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: epistemepromeneur@free.fr
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216532-62941-261alNFYJt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216532-62941@https.bugzilla.kernel.org/>
References: <bug-216532-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216532

--- Comment #10 from epistemepromeneur@free.fr ---
Steven G. (Intel Customer Support Technician) said
***************************************************************************=
*****
Due to the fact that you are using a wireless card designed by a third-party
manufacturer, and none of our drivers are being used, our best recommendati=
on
is to contact EDUP support for further assistance.


Please keep in mind that this thread will no longer be monitored by Intel.
Thank you for your understanding.=20
***************************************************************************=
*****

I don't understand the Intel support. The card is equipped with an Intel AX=
210
chipset and if I understand well, Linux uses the Intel wifi/bluetooth drive=
r of
the AX210. No ?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
