Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D03E5F0762
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Sep 2022 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiI3JQy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Sep 2022 05:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiI3JQw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Sep 2022 05:16:52 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68CBE129354
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 02:16:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id BB0FFCE2488
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 09:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01C1EC433D7
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 09:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664529407;
        bh=w2MOlnjN9OTIjYl5hGem+0Nv9zk2Ojpz/UJwRHJj9jg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=j9rMjUu0gmyQCI1A6z/d49Emxj8Pig89aUVXUUvX24iymExtDvf+U+OKwfE+EyxlR
         oe9kQt8x4GWxve1gxd+r3ZqE3qdc2atjpqL8e2MBqxMVadBLa1zg2bzVxBKlyFfhL5
         /yQqnvBkfH+BVAB+/vxWCPuSXciNyFxUr64IBJLWnDVRWoZ0svx2OLKP9yliKP0G64
         37mAFTnRiKGaosv1HO1tD/BnBBzsddrI6O2K7FPR8vJA7FBaXb6Dad/I1i2ZiS1Ibi
         +ppscUIY9YraPdxiuiCFhgdVp0WhHeko9Q8waE/c4I2OjJfQvmFN5a6xkGogfCdnsr
         ChwEvPBpmf6uw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D7D06C433E4; Fri, 30 Sep 2022 09:16:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 216532] openSUSE Tumbleweed, AX210, bluetooth, connection fails
Date:   Fri, 30 Sep 2022 09:16:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216532-62941-8Ztcq2bcPZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216532-62941@https.bugzilla.kernel.org/>
References: <bug-216532-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216532

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please attach dmesg.

Would be great if you elucidated the steps to reproduce in an easy to
understand form.

If you don't know English well enough, please use deepl.com

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
