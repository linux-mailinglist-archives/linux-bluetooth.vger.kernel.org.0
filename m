Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A52612A9F
	for <lists+linux-bluetooth@lfdr.de>; Sun, 30 Oct 2022 13:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJ3MxH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 30 Oct 2022 08:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3MxF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 30 Oct 2022 08:53:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D12DB7DB
        for <linux-bluetooth@vger.kernel.org>; Sun, 30 Oct 2022 05:53:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1DC11B80DA4
        for <linux-bluetooth@vger.kernel.org>; Sun, 30 Oct 2022 12:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1D02C43147
        for <linux-bluetooth@vger.kernel.org>; Sun, 30 Oct 2022 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667134381;
        bh=l9tuE10Y/W0Th3zlqiiOQezG0uWq3Kof6/kzW6TjDfQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=V/Caoj50J9OB62v/VAPSHOuKMaNSRry5Bx+Ao6aIbDMACRHgMThIUSU1OvOaRl4La
         t9V8Wx0ueEa3EUp/i9zIOKtQtuxsEcdPlxdMfHOGAclUirWL7g2oo6MjNiIXoXWsty
         S+uTwYLtedPUSjFt1Y3zekeN+vfUHqGpg6t0mpNDM/fZaTlWZBows/vUh+GLHtw/yg
         bNIZ/IJzLb1i+nHM6xesrI7Z4E+b16hSpx+fofxPtGTnZ/IwVuzvy3jIJURXtRsjGt
         sPsC2icIQCZpxvsWTF0NsQ8TCU6/R0ICQIOk1wLV7dvHj90MdrUtoM+Lnhbxp9w0he
         HFB8zdz5KNy2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 91CA7C433E9; Sun, 30 Oct 2022 12:53:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Sun, 30 Oct 2022 12:52:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: justanormaltinkerermihir@duck.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-0CPtb3vwNk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60824

--- Comment #247 from justanormaltinkerermihir@duck.com ---
Sorry Swyter! It seems I made a mistake while compiling. I am so sorry, the
patch works fine. Sorry for wasting your time

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
