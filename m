Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8BF6378FA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Nov 2022 13:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiKXMic (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Nov 2022 07:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKXMib (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Nov 2022 07:38:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6A6429A2
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Nov 2022 04:38:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CFEFB827BA
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Nov 2022 12:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CDFEC433D7
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Nov 2022 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669293508;
        bh=vUHw1ew5xiNOoG6tm4FV75HAb+vwofwG8bFGsaLgD5I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UNf2OlGmNf05V7T/obx3egFDUTFoBPr9O9/AR8qyeof6khWH2fcwi0cXsZSGm19Rc
         Ao0I6xHV1+ZZhHyvAlh8I1jEILm3Y7PMglTd6fg8ppkdMKudlgcalED6L86/xosCx+
         YOjszv2wdefFj0LjQ6jmlfcUoG3htPl9Dcpez3jTrGrjsZGlI867hKCkzExxbqFxLM
         PYDXYfs6LWHKbn6Xb6aPk8Yw3uuPLHidKIkwp7GHPa07zoGDJfL93eSvotetfz41QN
         vVpx146J3ikKrH128n77pWGkhvnojXX6xpDBZ3WTyY5JOLdA1M3yMeYehU44XWGUYD
         irlwEMwEF/LZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D16FFC433E7; Thu, 24 Nov 2022 12:38:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215197] Memory leaks show up when using Edimax Wi-Fi N150
 Bluetooth/Wireless USB Adapter (RTL8XXXU)
Date:   Thu, 24 Nov 2022 12:38:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: network-wireless
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215197-62941-sRrwItKXH4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215197-62941@https.bugzilla.kernel.org/>
References: <bug-215197-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215197

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Thanks! I can test in about 3 weeks and will report back. The machine & sti=
ck
in question are not at my place.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
