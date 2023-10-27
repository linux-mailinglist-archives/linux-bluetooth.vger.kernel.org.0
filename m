Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C062D7D9210
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Oct 2023 10:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345617AbjJ0Ik2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Oct 2023 04:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbjJ0IkI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Oct 2023 04:40:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA4C172D
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 01:40:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA4D6C433C7
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 08:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698396002;
        bh=N3hKsDV3F+YSe3Mlm7lagXijaDHRFU3DPnaEhX5lM5c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iyxOX1ISOewmyMbf/u5DM0mRyYznv0gkqPnDm6I2j7YXH8TkcTaYe5xfmxR5gbk9z
         zfgClQUqjR6SXdmB2MPVkxC48wLhIdMk8Z3JQMBpksTVPd/HjCC97/GvP6jAg7hnpv
         tFL7pGcD7vmDudyG8K16dnnJw7JBQZSu5hskCoQqiUryl5tVxeyBb60CgoVXK0UziZ
         2TUNwV09Bqd1oCqrgJyT7Ig7dpF9SsRIhVBKwzBD0IcdTVSgAXk9PyE8OTVpfYgIU/
         o/KVsnikmp4ikepMKPjhoIvywzJw3kdLQYYILncknpjRu8uGwqia/SonVIgAmDUtUC
         Co7oh29OPvMJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B5AFEC53BD0; Fri, 27 Oct 2023 08:40:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 80791] "Bluetooth: hci0: ACL packet for unknown connection
 handle" must be hidden behind "debug"
Date:   Fri, 27 Oct 2023 08:40:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-80791-62941-R9RnJrztn6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-80791-62941@https.bugzilla.kernel.org/>
References: <bug-80791-62941@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D80791

--- Comment #10 from Artem S. Tashkinov (aros@gmx.com) ---
Sorry for a flood of messages but I really want this issues to be attended.

Otherwise multiple people have a flood of useless messages in their kernel =
log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
