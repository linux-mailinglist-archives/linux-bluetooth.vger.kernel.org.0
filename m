Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D223750FD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 May 2021 10:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhEFIju (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 May 2021 04:39:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233734AbhEFIju (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 May 2021 04:39:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 41E5C613E4
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 May 2021 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620290332;
        bh=Z3Vwo/YJBcQ+rjoT1chi49AnjnbeTthHr9hHzmZMLx0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=msWWP5mhCVo5IK/B/ZW8yyqukkdusw4nqu1DBklrDuuAXtolaSVP6Ss0051M5RCkU
         M05saKsUC76Wj1ibrWU03SG4RwlYoRpWo3dN33Zfd4e6gjhoNTeCQ2x33FG49m5JlA
         tRqpo1eSgIohPfCQmlViHtxOFEKm5tW9izlJjT7QmJ97L4XCBjylhJzkslheh+y5zG
         Dv6CiwkUN/acfrqeAbdwRbMACjh/2Ti0AQ+Wk6BZ/bEE2msw3pOYPvJ4aoFf+2O0mS
         HAJS0rIbxIdUlJCKSy4WcuVaWrA/KJDP65t04e9LwcEckBN8c+fSe94ft3W+Az22P8
         Bv80cmbwN5kew==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3E55B6129F; Thu,  6 May 2021 08:38:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Thu, 06 May 2021 08:38:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steeve.mccauley@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-60824-62941-akNtgpS5hD@https.bugzilla.kernel.org/>
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

--- Comment #175 from Steeve McCauley (steeve.mccauley@gmail.com) ---
(In reply to Diego Morais from comment #174)
> I have a CSR Dongle with the exact same problem on Debian 10. I am a new
> linux user, so my question is how to apply the patch suggested this comme=
nt
> (In reply to Gustavo Padovan from comment #6)
> > Created attachment 107379 [details]
> > mark Delete Stored Keys as non-critical failure
> >=20
> > Please apply this patch and check if it works. Also capture logs and se=
nd
> > them here.
> >=20
> > This is a modified version of a patch Johan Hedberg did some time ago.
>=20
>=20
>=20
> Thanks

Probably best to ask for debian advice in a debian forum.  I'm not a debian
user but I'd try updating the kernel, found this on google,

https://www.osradar.com/how-to-install-linux-kernel-5-10-debian-10/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
