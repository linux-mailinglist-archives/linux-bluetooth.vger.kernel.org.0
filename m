Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7FB45F8A59
	for <lists+linux-bluetooth@lfdr.de>; Sun,  9 Oct 2022 11:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiJIJU3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 9 Oct 2022 05:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiJIJU0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 9 Oct 2022 05:20:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C582BB05
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Oct 2022 02:20:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC60560B39
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Oct 2022 09:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32752C433D6
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Oct 2022 09:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665307224;
        bh=wPuqvpsDOuhENqPI6GSgk+c/qV+lN5SoiLWhHVrMS78=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KosiBdVj94Z55WyrSMV/1O4KqQniNwppx8ZIckPvYMCM/VUvrpnaVIr88A4yJCL7O
         gMdjGNQ7fUR2jMrfz4xQHRM77UYPq+Tk9jam6omgbDXSUFcORLFk+EbREjkDZxt15h
         dclY78yxrUo+5kG6p6VqzdbgUkGyAojmud3tz2iOtC/eIyXpDFFqXknnw45osUqS/G
         EI/iz+6x2fVQoYVkFcu4LbqDhAs2gG0g385wTNEFWRER+CvVUzvZHC66DfKExw0Mga
         xXp/O91ulnMQ4x9Q3Tvm5F75dQWqWKjdeldwllBlz96oSjDdOc6u1nBBszoNW60uLW
         BI7th69IQ4GIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 21B4BC433E6; Sun,  9 Oct 2022 09:20:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216546] ( ID 1131:1001) Integrated System Solution Corp.
 KY-BT100 Bluetooth Adapter fails to Initialize.
Date:   Sun, 09 Oct 2022 09:20:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ivalin1996@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216546-62941-TV2CMyyTwm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216546-62941@https.bugzilla.kernel.org/>
References: <bug-216546-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216546

Zetta1 Reid0 (ivalin1996@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|CODE_FIX                    |---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
