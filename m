Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8815B79DB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Sep 2022 20:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiIMSmF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 13 Sep 2022 14:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbiIMSlo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 13 Sep 2022 14:41:44 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3811948C8E
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Sep 2022 11:11:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 19F4DCE12E7
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Sep 2022 18:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C320C433D7
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Sep 2022 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663092714;
        bh=rvh6y1pa7F3SjFkd5qkwdQdaGtfULVV/JJAdwHZPIJY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AmOVmgCf7tcwqqCOITOcGNUbECJCxIHGQiT7LSVPqU730hLwllYnEiy0MFgfeET9M
         8k9WRZYLH9fFfckKS6WOGElUPuikb4k+XtqzjrPuGkolssAj7i1+gDdlvK2jQqwwl9
         CBRUidCBlMf7LlfVG27A8pqTDbDXOdvtZA2cLfAt9ibZ6lJM6kl7LxY8xkYbZZs52k
         wQa+IZ463qX3WISlUc4xfwXTkTMtNObpQi0tWT05eOPT+x18+mglnBajcNp41yLbiE
         6dZimFtbePFiCYPqxLq2RmFKn8fmwQHi2I5V/HOIN//FX5meStVptSwxzCgyBSVulN
         cpWZdWbFgZkrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 40BFDC433E7; Tue, 13 Sep 2022 18:11:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216382] [bisected][regression] mediatek bluetooth 13d3:3563
 (mt7921e) doesn't work with audio devices.
Date:   Tue, 13 Sep 2022 18:11:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arek.rusi@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216382-62941-7wPDbu9U6A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216382-62941@https.bugzilla.kernel.org/>
References: <bug-216382-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216382

Arek Ru=C5=9Bniak (arek.rusi@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #6 from Arek Ru=C5=9Bniak (arek.rusi@gmail.com) ---
fixed in rc5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
