Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B293338E57D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 May 2021 13:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhEXLb7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 May 2021 07:31:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232110AbhEXLb7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 May 2021 07:31:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 43A1E611CD
        for <linux-bluetooth@vger.kernel.org>; Mon, 24 May 2021 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621855831;
        bh=52YOwVjZVzxWYgHUgVxKMy0PxkPV2Lap8Rn2zd/kFHY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=h2o1BEr6PnyR6HZi3gGde0qHJ9d+ittGNw0daLemGYafkxCa/nEO5zFZusJE0RioD
         SI7oNqlsz3GlTHCbWbEJu7UMaCqzp2nZ+nkHatjePLVUte6w2nW5ShFXvg1HmJKu/P
         6tUKsw9/nswWftVM8pV9/SnfpwhXKfLx8+oXCafaPZBrDjIhf/Y8QmIQ5P4IxWMSWM
         EHWzesUxHC1BF2qw+6Qc0fwYMzjApmZOvj+o1GDPQy064pQ40WhF147D79zq8pVCoZ
         ukNYIXpMY9AXle/anV/abZJWmoo2IxqHp7V3JkhUXZo3+uAjys9VWAdBIXGji1DMIq
         cCgTbvt4uZekQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 392DC61181; Mon, 24 May 2021 11:30:31 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 204629] Bluetooth headset auto connected but failed to
 recognize as audio device
Date:   Mon, 24 May 2021 11:30:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: juha-pekka.savolainen@unikie.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204629-62941-mlifp1evbP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204629-62941@https.bugzilla.kernel.org/>
References: <bug-204629-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204629

Juha-Pekka Savolainen (juha-pekka.savolainen@unikie.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |juha-pekka.savolainen@uniki
                   |                            |e.com

--- Comment #2 from Juha-Pekka Savolainen (juha-pekka.savolainen@unikie.com=
) ---
Can you provide relevant commit(s) in master branch? I'm facing similar loo=
king
issue but can not upgrade the BlueZ. I could however try by patching the
current version if pointed to correct commit(s).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
