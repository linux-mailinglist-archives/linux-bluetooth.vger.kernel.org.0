Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6567D6481C9
	for <lists+linux-bluetooth@lfdr.de>; Fri,  9 Dec 2022 12:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiLILdA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Dec 2022 06:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiLILc6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Dec 2022 06:32:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8916A1E713
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Dec 2022 03:32:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 40600B82867
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Dec 2022 11:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02DC2C433F1
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Dec 2022 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670585575;
        bh=5fsjci0ANsEiLJuuDFQZY+md+nZz2g5iaob8nIBV+wQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BGD+TMsJ/qzk3ytrufAriLeqpp5K0O9JXgZDDJl+aHFJmIERUYxECH3MuTfcqviDj
         D+VGOQGZ7hBeHawLzLFssDlHJHJWKJutGwUTBpgdC1XkT//wnp4UoSE2YRulrFFbyo
         ItJRqYmslcSmwymH9kI885Pe46aQtPbqqJAGvSSah7UFp93hE2FubZmyWj0hN55hDq
         vfobCX4uoBpAWaAXhrsjeuksa5s+C8yTyt3wRIjJA9rVCuDDICUwIny1G6nk1O7BDw
         wERt/YVYkiTk6lIzjVzZ1MxPuXG6eZAqnHzqGQhe0oaIi1NaDBWKo2rGDN6iEjKhPu
         Pic8XnHxAzvjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0DD1C43143; Fri,  9 Dec 2022 11:32:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 215197] Memory leaks show up when using Edimax Wi-Fi N150
 Bluetooth/Wireless USB Adapter (RTL8XXXU)
Date:   Fri, 09 Dec 2022 11:32:54 +0000
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
Message-ID: <bug-215197-62941-qPIGgIZJfL@https.bugzilla.kernel.org/>
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

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Yes you can. And thanks for your work on the patch!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
