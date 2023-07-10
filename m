Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3757F74D4F3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Jul 2023 14:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbjGJMKr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Jul 2023 08:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjGJMKq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Jul 2023 08:10:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEECFFE
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Jul 2023 05:10:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D0ED60FBD
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Jul 2023 12:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCC41C433C8
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Jul 2023 12:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688991038;
        bh=nBWlsFwbKCEK/5TiNUZF4/wf7xKLf2TVny9LloJqCdU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zo9laHKLdgjWD2sNarBPeqoVSLjj52FFGz7+GZG9WE/2s9F9A7GY5QjrrKEaFWtdD
         M65Mw/nvCzbn/UboqsoYfck3yprugdU9HuY+FNlTVFh6Eba7nAu81hZ2BSixzhaCKb
         Rk31luYceK/KzhY5JvzuaUt4pn8eDP0x9td0bPQea7hoA1UULDVo2D3pfFhyQ5l0gy
         D16t7xzSAnz/rUWmqiMBXbCglJgjxxHRkurVg2keovUF/AV2zAQds2NQJFWqHwdi4d
         ccXVyPSGUpkAqbv1d0MS5WBqV7Yl2zRxJlj1P7vfLEg6HplLUGE/ayPXh1oEAXveJk
         gzMzmiON+VCxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CBF42C4332E; Mon, 10 Jul 2023 12:10:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 217651] BCM20702B0  Bluetooth device in MacBook no longer
 working
Date:   Mon, 10 Jul 2023 12:10:38 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217651-62941-rEuGw3XRu6@https.bugzilla.kernel.org/>
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

--- Comment #6 from johnbholland@icloud.com ---
Created attachment 304587
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304587&action=3Dedit
dmesg from arch kernel 6.4.1

this is the first 6.4.1 kernel in the arch archive, and bluetooth doesn't w=
ork
with it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
