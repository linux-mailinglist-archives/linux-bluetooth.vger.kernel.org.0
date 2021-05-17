Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620FB386D08
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 May 2021 00:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244375AbhEQWlR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 17 May 2021 18:41:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234833AbhEQWlQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 17 May 2021 18:41:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B646B61396
        for <linux-bluetooth@vger.kernel.org>; Mon, 17 May 2021 22:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621291199;
        bh=4aMGX0hzQgme0rNjkdcFmYvq9rXkVLcike70RJMtV48=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=W94YEB3bNI++46xTGNJqQZ8b87PqvwjfXB8C9+E/g15T1QcqXV5TFNfizoz49ntrA
         LhfI2tprccnGgBQ7GQHjcf+p3XT47zmqn47Glg3Mtw58Ib/s02GigTOYa1s1PnWCjN
         t714cLuxNlJdIzQiWsc3pjJyHvcdCKz21Vc7pkGRkRcZf9kcKKKAxb1BI7FSAyaTlI
         RuIDkZbkXOqE62hPIvWw5JcMDo24UUCnNzD6jeBGrw9jcEKX2lTqEX8BfDhJBvI277
         JYRl+aGgKu9TYjnkoltY/GJ34psAe43cFB8eVh0YhR9sq6xMxXGeP1XxHqM1SDG9+0
         LifjmJXgucZZw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B354761176; Mon, 17 May 2021 22:39:59 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-bluetooth@vger.kernel.org
Subject: [Bug 60824] [PATCH][regression] Cambridge Silicon Radio, Ltd
 Bluetooth Dongle unusable
Date:   Mon, 17 May 2021 22:39:56 +0000
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
Message-ID: <bug-60824-62941-zmNzGvgvaL@https.bugzilla.kernel.org/>
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

--- Comment #181 from Kai Krakow (hurikhan77+bko@gmail.com) ---
(In reply to Swyter from comment #180)
> Newer versions of the kernel should detect (most) fake CSR dongles and wa=
rn
> via dmesg

Oh nice, thanks for the info.

If I see this correctly, it's submitted for 5.13: Is that what you mean by
"newer kernels"? Will it be backported to stable?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
