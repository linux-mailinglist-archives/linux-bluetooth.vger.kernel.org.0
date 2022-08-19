Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E394659A6FC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Aug 2022 22:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350450AbiHSUUB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Aug 2022 16:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350392AbiHSUT7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Aug 2022 16:19:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FA16106F9A
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 13:19:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A49A7616D4
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 20:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19566C433D6
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Aug 2022 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660940398;
        bh=exOrYCg5s2M0MRHh2TX4JOdvCqsXW+F1BkPN4OvvlVg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QWccIiI1QpPBN7uIGMdAvWrXMnorct39fgB96VPY+RNTq7Q25Dgne69fnjPlEMzYP
         7ZgkdhhdfLwmmK+J3hffIrtVhU+QW2sLDpwLOWszVgp3QsRyxSfwmzdAASUtGg5+YH
         9BLADc8SKWyvVUeaB9F4qew7kHrBsv3UMcXiMomLi+0E0o3c90Tvwrepd3FhxKnkje
         RLs1SEoi981v0SsaV2RkETw1giG3dYj5oQkGjqEjzy4MpMpCAHu3WVDShat4eSaP91
         aXU9Hl/rpIOwINkDAj6GnZwO8YfNmitGgo5LL3SKVHL6s+xqPxjvZyemiL5KH5yw8e
         6KImwiWoln6DQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 01A0AC433E7; Fri, 19 Aug 2022 20:19:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216382] [bisected][regression] mediatek bluetooth 13d3:3563
 (mt7921e) doesn't work with audio devices.
Date:   Fri, 19 Aug 2022 20:19:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arek.rusi@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216382-62941-DTekyuQYgN@https.bugzilla.kernel.org/>
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

--- Comment #3 from Arek Ru=C5=9Bniak (arek.rusi@gmail.com) ---
Created attachment 301609
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301609&action=3Dedit
btmon -w log # 5.19x

this is log for connected/worked device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
