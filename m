Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB00A80CC
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Sep 2019 13:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbfIDLDH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Sep 2019 07:03:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727387AbfIDLDG (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Sep 2019 07:03:06 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAB202339D
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Sep 2019 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567594985;
        bh=yVM2fK10izAQq2VyphGOPbBfEV5PpavIEDbbL86vyAo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iKCtBgCKaGRPEPcd3Xp7wXJuq3vQDpNMvigI0zEmMkOyMGt+e4rNZGrWEqpmyiq1v
         g917ajaGA/NIK9ikDJu5wszxHeJVEkdGfhDdVqlaV8E0anGhcud+hlSrZj5yaMYlHL
         aICYGPmgmqst97maxHAUoVzGW8oDN9JRTIgN05Mc=
Received: by mail-qk1-f169.google.com with SMTP id x134so8993929qkb.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Sep 2019 04:03:05 -0700 (PDT)
X-Gm-Message-State: APjAAAWODFcGR8q2VwfLyzehtpeeZ/mS+3osxP9binmhF9HIdmKL0PJq
        3kQjgrPsHpxE5ujD+CyQWc6R7ZIHZXstUavrWK4=
X-Google-Smtp-Source: APXvYqzMlewEVlQuPYdLh4RZzfrrHcTNryNmL9sUGR3d+Zs2Up53bRvj3tODhTseqQLiPrRjzhoPT0jfYohHeRUa2+8=
X-Received: by 2002:a37:2784:: with SMTP id n126mr24490325qkn.302.1567594984968;
 Wed, 04 Sep 2019 04:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <1566984258-13480-1-git-send-email-amit.k.bag@intel.com>
In-Reply-To: <1566984258-13480-1-git-send-email-amit.k.bag@intel.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Wed, 4 Sep 2019 07:02:52 -0400
X-Gmail-Original-Message-ID: <CA+5PVA53ikg8AAmz39QTE9zU1FnkwEsqKE8XYto8Rk-UhDqOnw@mail.gmail.com>
Message-ID: <CA+5PVA53ikg8AAmz39QTE9zU1FnkwEsqKE8XYto8Rk-UhDqOnw@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: Add firmware file for Intel Bluetooth AX201
To:     Amit K Bag <amit.k.bag@intel.com>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        BlueZ development <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        chethan.tumkur.narayan@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Aug 28, 2019 at 5:30 AM Amit K Bag <amit.k.bag@intel.com> wrote:
>
> This patch adds new firmware file for Intel Bluetooth AX201
> Also it is known as Intel HarrisonPeak (HrP).
>
> FW Build: REL0318
>
> Release Version: 21.40.0.1
>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
>  WHENCE                |   4 ++++
>  intel/ibt-19-32-4.ddc | Bin 0 -> 70 bytes
>  intel/ibt-19-32-4.sfi | Bin 0 -> 743750 bytes
>  3 files changed, 4 insertions(+)
>  create mode 100644 intel/ibt-19-32-4.ddc
>  create mode 100644 intel/ibt-19-32-4.sfi

Applied and pushed out.

josh
