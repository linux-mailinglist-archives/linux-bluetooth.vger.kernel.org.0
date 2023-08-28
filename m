Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B487778B997
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Aug 2023 22:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjH1UeZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Aug 2023 16:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232619AbjH1UeY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Aug 2023 16:34:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE12AF9
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Aug 2023 13:34:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 868586411C
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Aug 2023 20:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9B30C433CA
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Aug 2023 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693254860;
        bh=D4R0wCFlewDDEt+rRWeGsioD1BeWj4HzVT/shGc8YY4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=i/TQIxjwyo9w7jS38x5mgiM2A8QuBjRfuesBfW5uNhoNJ26Ku9J7PmN4SS1ottZj6
         xrl6PvhAOc4Z1rXpqgW4gB+scyAOB0YAlC4vxiUhhsG7SyhojlC26bWxD9xuVz1BMw
         hY0qnv7pBmHx6BqDEfN/0ZKjKeW4U5sD+26gP/vjhHAk1vAK2JhLZcQn4OpGfVp95q
         qkFOsGgry3GV/aHgrlF29RKZftEE4Qn7k2EEPMEjhHIYqnhLV2+LSvbzz0wP8SkHy3
         wBcxkX4grPRXVHtylRUjfV6vk+RrQAnhuVqzNMoVcODfjRl6TJAPmsVFioRDHQmnKC
         P7s8kZnK+U80g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D39DAC53BD3; Mon, 28 Aug 2023 20:34:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 217651] BCM20702B0  Bluetooth device in MacBook no longer
 working
Date:   Mon, 28 Aug 2023 20:34:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexucu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217651-62941-WsLm2Lgmpx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217651-62941@https.bugzilla.kernel.org/>
References: <bug-217651-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217651

alexucu@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexucu@gmail.com

--- Comment #22 from alexucu@gmail.com ---
I can also confirm it's now working on my 2017 Intel Macbook Air. Thank you=
 all
for testing & fixing this so quickly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
