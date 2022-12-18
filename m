Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B81B64FEE6
	for <lists+linux-bluetooth@lfdr.de>; Sun, 18 Dec 2022 13:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiLRM5j (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 18 Dec 2022 07:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiLRM5i (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 18 Dec 2022 07:57:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15DCFA183
        for <linux-bluetooth@vger.kernel.org>; Sun, 18 Dec 2022 04:57:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8328C60C2A
        for <linux-bluetooth@vger.kernel.org>; Sun, 18 Dec 2022 12:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3AE5C433D2
        for <linux-bluetooth@vger.kernel.org>; Sun, 18 Dec 2022 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671368255;
        bh=ZWTQM6lPCCUXisnWaC++H63jdyWfxEr0yHxUWwivHjo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H/k3uC34NX0ZJ46XNRRmwdnuib+x2z6Ex/TJN4uNdbqzZqCNdRXZh8M02Tj//rJP3
         knxtgs/Vk6yrXnX5fgx73qV2jmm6Nq14MgQcmMez+Ljw/y7EnAxqc6FpIpf4WYMn6B
         7fD6LQFLkYP57v/6RLEo7krtTSWbwBpbnaZHMhCPuhBcws4mvo4d/sOB8UaokYOOVp
         4hSI7CbxaVLLzbdlKQounkmt5PsVuo4TIGgM0S9aOVYrU/uIdcMr7aM5YsTIVwjF1F
         WJlBxj2SdJDRyYNIu0Td6dVMYWkauuYfx9bkOgii0jdJYXpYMLZYkNr7AoqsiZui0C
         Vjs1qDtR/CQOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A2DD5C43142; Sun, 18 Dec 2022 12:57:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216819] kernel detects Mediatek bluetooth does not work
Date:   Sun, 18 Dec 2022 12:57:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: baxooshi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-216819-62941-GZpHW4iTE1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216819-62941@https.bugzilla.kernel.org/>
References: <bug-216819-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216819

Hoshyar Karimi (baxooshi@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|kernel detects Mediatek     |kernel detects Mediatek
                   |bluetooth as Lite-On and    |bluetooth does not work
                   |not working                 |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
