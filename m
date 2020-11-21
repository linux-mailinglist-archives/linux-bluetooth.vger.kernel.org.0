Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79FF2BBB9B
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Nov 2020 02:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgKUBdz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Nov 2020 20:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbgKUBdy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Nov 2020 20:33:54 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2334DC0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Nov 2020 17:33:53 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id k4so10853399qko.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Nov 2020 17:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=uGo0pPR+TIJUIEpDy4Ch4yv3Mw2FC5NOT34y8cEfMKo=;
        b=VMrXM2ap2e020eoh99go0JbERQYd/3qjCy9c8mwI62f63E5X8iWItfMoH6FEnW3yhh
         7QvhDwpHvfCSKxPN0L/THeM7E+HZ3Jvbnx7pUTZF1JgmacfvLjVnDwp1C6dH0jQywLXZ
         DjfhoQNBtIiIZA3dx62W3NBSZBniDGVtcLuLD9dOveims76EZxQgHQXnw1m1QK8JWnTK
         vovZmaNCz0thuPyoMvPr3WujeqjLRG3lJ9R0LmIzArdM+WdnsOIVeDVTDqSwFue8+HQi
         YSOKNRM+uY+MTk3TonQrIw3mC+L91ulM4FUlN9Y0l695Y5s31QwLog280j182Zy3FS+0
         zazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=uGo0pPR+TIJUIEpDy4Ch4yv3Mw2FC5NOT34y8cEfMKo=;
        b=JIdpX/WNQdd6wwJ/tpLSqbhpY1V7gPGmztPAFBYRefATbwT1KV0U2b2ZS0g88vTC6t
         k4sH2R0ZLvHfnn5iyHd9loo/n+tz+w7AlMMRLNEPxFiCW2twRtW9VIJkvLcRjHaAcX7z
         000Q9UwOAXuUM0LcUn5jAYboXHumZGEdhxuHMOCtWHiRfcAdymYU6o48M76oQNu9sHn+
         Km2PIMAC6ZIbIOBIluVrzelDss44CE1h1fdk4Q7Pjb0iW4IUhtmUf7/KkIPaMpMbrffn
         qFT2DT5cqMH7nSraCKYj0a0ip7ngcdTtJCzH0eNc5nVYXt45foiqthZ0UwfQt7aJ/D6I
         AkZw==
X-Gm-Message-State: AOAM531CnwWHMPohPwo57UdLBjR85xtyl7kn0AkgjAF1k4P9Ta0Z8Jjk
        1pbaTMJaHXUoN++uydP/8zxyuzr//UKGfg==
X-Google-Smtp-Source: ABdhPJyDiMuAGY48Y2NRdfQ45Aq/N7RublzI8pWsA3SgbWo8vzV3sTR1dOW10CNph5qU8zeWDle0zA==
X-Received: by 2002:a37:65ca:: with SMTP id z193mr20908774qkb.329.1605922432287;
        Fri, 20 Nov 2020 17:33:52 -0800 (PST)
Received: from [172.17.0.2] ([20.39.53.49])
        by smtp.gmail.com with ESMTPSA id z88sm3339067qtd.46.2020.11.20.17.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 17:33:51 -0800 (PST)
Message-ID: <5fb86e7f.1c69fb81.6f2dc.668e@mx.google.com>
Date:   Fri, 20 Nov 2020 17:33:51 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7780546590402301578=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, abhishekpandit@chromium.org
Subject: RE: Bluetooth: Power down controller when suspending
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201118154349.1.I088e8a8c015ee9cc5fb5fc52c02ff4caf9a79031@changeid>
References: <20201118154349.1.I088e8a8c015ee9cc5fb5fc52c02ff4caf9a79031@changeid>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============7780546590402301578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=387155

---Test result---

##############################
Test: CheckPatch - FAIL
Output:
Bluetooth: btmrvl_sdio: Power down when suspending
WARNING: 'actived' may be misspelled - perhaps 'activated'?
#11: 
[ 4767.777920] Bluetooth: btmrvl_sdio_suspend() HS not actived, suspend failed!

total: 0 errors, 1 warnings, 22 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

"[PATCH] Bluetooth: btmrvl_sdio: Power down when suspending" has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


##############################
Test: CheckGitLint - PASS

##############################
Test: CheckBuildK - PASS



---
Regards,
Linux Bluetooth


--===============7780546590402301578==--
