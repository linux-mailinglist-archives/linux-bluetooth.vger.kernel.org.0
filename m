Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55344E7C2E
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Mar 2022 01:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiCYT3A (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 25 Mar 2022 15:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiCYT2e (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 25 Mar 2022 15:28:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D9C2BE2D8
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Mar 2022 12:02:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7357BB829A4
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Mar 2022 18:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E115C340EE
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Mar 2022 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648232686;
        bh=9flt5WhvWQWUEOlEVa5+LNjvkixG3g/5q1WGyU7TncQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=L5h4RipeDwu3ud+9QbneR18BHnBIOP4+WI0GkENoPzgLZLpkqCFmOMKcnXCvRbM/w
         4BX9992mX1SsDxus0jNmRumrwKNsEySrBx2/50nn4Ljg/fO8z41x6wYUlZgAyaeSPi
         wuCJ/0SJ5Nns/0dBY9lWqWpmc+JFh0AHy81s+c/AdkcVUA947Hw2EtffX+em5Bv+/6
         VTYssMD+3osfAy76jZfOhOFTGVwfiFircs8SFuctAw2FvoSxEEXDix/X8iOQqiwDAW
         BA28Kj6/cyxqeghpnJuS8kPec2kPga0PFv7og28unuHXXtI2xchr5YGVt7O+B30Ew7
         tJSth1z/tubKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1609DCAC6E2; Fri, 25 Mar 2022 18:24:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215528] Excessive logging from Intel Bluetooth "Bluetooth:
 hci0: sending frame failed" "hci0: urb 00000000xxxxxxxx submission failed
 (90)"
Date:   Fri, 25 Mar 2022 18:24:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: luiz.dentz@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215528-62941-zMpaJevDDl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215528-62941@https.bugzilla.kernel.org/>
References: <bug-215528-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215528

--- Comment #14 from Luiz Von Dentz (luiz.dentz@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #12)
> Thank you.
>=20
> I hope to see it in 5.15.

afaik the changes that caused this issue were introduced in 5.17 so 5.15
shouldn't be affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
