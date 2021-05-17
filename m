Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E92386D29
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 May 2021 00:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbhEQWsN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 17 May 2021 18:48:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237094AbhEQWsM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 17 May 2021 18:48:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 05D966128E
        for <linux-bluetooth@vger.kernel.org>; Mon, 17 May 2021 22:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621291616;
        bh=6odDmGn++/b0y3CFEi9TKSD65Q77QhQskY0hmqxAcAE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=r/s8Pcmt1AluWtZk0YgBHLeLGkOZUoU/py43S2KqzCmKkfazOMHdvzSateX6pydvt
         K3r9KcPZQOcaq3cy1pc2Cupjyt5T7Yqo1tpLdyU0GQ1Vcfe/HIHPxSBWV/VPEpib8Y
         gjha0ei61sIyktWc+6il0bMijxJj1uHWvtDHHfrYLeXlywaB6G0zCsaE0UjN4OHYNJ
         T8jxM6pvXq1X1djStaYdFGUXCmWzW8qsntqiBxkhgLBbhWTos5XmTdavMx94IoTUcR
         dQwrdGp+Wrk9cQ4SH/SXKo+eR07j506X4/oxoQycbuvXySpyGVflOQmhpfZJc3NiCF
         2cuy4UvVIZYmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 02A6A61176; Mon, 17 May 2021 22:46:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Mon, 17 May 2021 22:46:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hurikhan77+bko@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-zWoh4zup3n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-60824-62941@https.bugzilla.kernel.org/>
References: <bug-60824-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D60824

--- Comment #182 from Kai Krakow (hurikhan77+bko@gmail.com) ---
Nevermind, I found out that it's in 5.10 already. My git foo didn't work as=
 I
expected, seems it appeared in 5.9.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
