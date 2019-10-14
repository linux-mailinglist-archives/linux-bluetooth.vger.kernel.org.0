Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC35D611B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Oct 2019 13:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbfJNLSg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Oct 2019 07:18:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbfJNLSg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Oct 2019 07:18:36 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1EC120873
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Oct 2019 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571051915;
        bh=mZ7ywerXfWQ+8X6JzsA4QloRE7UXwGio2MTqCf1vBis=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jZ4Jow5raMyCyIz7a0GIrfLJg6z8+KMeVsf1WNjwrGuODwMLzqN2TZU7Hm4mp0yyE
         YP9akFco5fOnpQxtJ6xl05fiHOV3VrUsARoXA97zKQmiRLAxfn3J2zdQ0ojJLqzXzP
         Ei5yZfT2UnjFOjcVDrf8brqT8dUhvt5BbwL2lNMQ=
Received: by mail-qk1-f171.google.com with SMTP id w2so15536669qkf.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Oct 2019 04:18:35 -0700 (PDT)
X-Gm-Message-State: APjAAAVYfrlgCg66Z1tDSzbw8lo8zZbag3s10yojEtTA0IbGJvbmxZBR
        cID35uIh5CslbGOLvp4wwcmJPTTQHas/7FNtYQs=
X-Google-Smtp-Source: APXvYqyiQbo96Rys8sE9+lzyCnwz3lkkAWemT2OrEvIXyAkPHPQK0GVgnel6KunNjheGpaWPVGOCBkIyNcAcWE15Z0w=
X-Received: by 2002:a05:620a:1497:: with SMTP id w23mr28248320qkj.302.1571051914762;
 Mon, 14 Oct 2019 04:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <1570680528-2518-1-git-send-email-amit.k.bag@intel.com> <1570680528-2518-4-git-send-email-amit.k.bag@intel.com>
In-Reply-To: <1570680528-2518-4-git-send-email-amit.k.bag@intel.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Mon, 14 Oct 2019 07:18:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA44LdMfdm4LJ0BWvPHGUa85yHWDbzyh+tvrtWb4E0vdiQ@mail.gmail.com>
Message-ID: <CA+5PVA44LdMfdm4LJ0BWvPHGUa85yHWDbzyh+tvrtWb4E0vdiQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] linux-firmware: Update firmware file for Intel
 Bluetooth AX200
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

On Thu, Oct 10, 2019 at 12:15 AM Amit K Bag <amit.k.bag@intel.com> wrote:
>
> This patch updates new firmware file for Intel Bluetooth AX200
> Also it is known as Intel CyclonePeak (CcP).
>
> FW Build: REL0333
>
> Release Version: 21.50.0.1
>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
>  WHENCE               |  12 ++++++------
>  intel/ibt-20-0-3.sfi | Bin 722132 -> 722536 bytes
>  intel/ibt-20-1-3.sfi | Bin 722132 -> 722536 bytes
>  intel/ibt-20-1-4.sfi | Bin 722132 -> 722132 bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied all 4 and pushed out.

josh
