Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF7574C908
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Jul 2023 00:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjGIW5w (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 9 Jul 2023 18:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjGIW5v (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 9 Jul 2023 18:57:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06710E0
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 15:57:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C64860BEB
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 22:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F11BFC433C7
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Jul 2023 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688943470;
        bh=mzOrDGnoBF3SCuys5SkOTR7Vj/RI98AOwjylYVLF1C0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uKltvbc8JcFXty99guKrDsZMlz6Gjwa7q3OCF776cWqNs6rAVxXjnLGC7d/uqsmVE
         O07bm9kdHsT7Tp9IGl0II7ry6izadccIlI+zcinQEPDynUws/od4/sSFZEnPrZxAia
         xkxGJr/pw+2P10vyR0JxNLsyNDUBxu/iLKZSzkSYlkSISDvBUefdliS5FPAn9wnxsc
         0TZB5t0nxt5e8W+Va/DmhPFugU6UBGWQAfdf8Y+WCX6F/IIM0cjmhleDabXKAtlg/e
         obZdoJ8qG6kT2GAeAtU06q5kepvJDa6msXgTjZDQ8apWNKtHU6LmD2rszgzerd1jTu
         Q+AYYlrjpOXkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E211AC4332E; Sun,  9 Jul 2023 22:57:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 217651] BCM20702B0  Bluetooth device in MacBook no longer
 working
Date:   Sun, 09 Jul 2023 22:57:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johnbholland@icloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217651-62941-alLPNp31Qb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217651-62941@https.bugzilla.kernel.org/>
References: <bug-217651-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217651

--- Comment #1 from johnbholland@icloud.com ---
Based on using kernel supplied by arch Linux. 6.1 kernel finds the device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
