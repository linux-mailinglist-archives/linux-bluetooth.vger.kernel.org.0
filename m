Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C68F6136D3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Oct 2022 13:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231311AbiJaMrk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Oct 2022 08:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbiJaMrW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Oct 2022 08:47:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED644FD23
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Oct 2022 05:47:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4E183B81618
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Oct 2022 12:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02D25C43144
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Oct 2022 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667220437;
        bh=wsNsdP/5m2Y2W3uxfTHIkrKPCkoebSMZR1XqXPHbeLU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KyUP+mCE/aU72HjlmpgG/YbCAQvB+/c+ewgdU5shV27HUKoWHzzVPhHYjnvBB4gjS
         Fy/06a3RkCs7u/BfcjGJNlsJz+xSuOLCMJpmuJJ+xWyGyLOw0cUt2L6FhRO2zYOGtb
         H4aKjkAGWcHBfoSBt9QVdcaHTIBDPvnpBZlcjcZCAjYhi2FaLzvlcWT6FxWn28KZ95
         U/LpDn1qssKUqrd/rxo1rySDJesI8lJMAtHVHZrcTmFWuQutf2ER4ZqphvikM1/8SU
         4BIu/n3bjRdoiEHnzJ301UERbNWZQjGRDzEh1LSCpR17oKqQqPP61k/V9qnyn05a56
         Mfe3Y0lYpcgdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E98D1C433E4; Mon, 31 Oct 2022 12:47:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Mon, 31 Oct 2022 12:47:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quic_zijuhu@quicinc.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-YzXNWX0HeH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60824

--- Comment #251 from Zijun Hu (quic_zijuhu@quicinc.com) ---
Hi justanormaltinkerermihir

you can use below command to send HCI_Read_Default_-Erroneous_Data_Reporting
hcitool -i hci0 cmd 03 5a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
