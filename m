Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28EBA1C770
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2019 13:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbfENLGE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 07:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfENLGD (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 07:06:03 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B3B221530
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 May 2019 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557831963;
        bh=Wy4e9xr+JP4/+KkfMsATBzPCwTahpHqmbeqPnfA8VlI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LKLqdvst2SU464o1VvM54VfrRqwho1PBiqLpMHeIY/ZlCV5VwyV3dwNVhLk4fjRDU
         JMWCI9rFluvr+1HU6ck4yoDm1f4o/NrWcz84VgPXSQV29hmgdzvhnF/1/2ax/sLweu
         vFSD57UssHGcKRK5RLUUlwhm3S8gEpZUsgXH0WOw=
Received: by mail-qk1-f177.google.com with SMTP id k189so10001353qkc.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 May 2019 04:06:03 -0700 (PDT)
X-Gm-Message-State: APjAAAUfz6HpEWJwlDsCZd76Idq72pZDctFgc3+j8LNTFDAZvciIqG2n
        h0U0k3MasOUF6frlGD1c+Tsu4dIulvFI9BGBelw=
X-Google-Smtp-Source: APXvYqzw4OiwVsCjFXbYcFwTRivJsf0gTwqq+sLuvQsFsJpCKpzULPV/qaTmgBEFGM9Oes42z8m6kuDDJWPyRdJzrkA=
X-Received: by 2002:a05:620a:1648:: with SMTP id c8mr20276112qko.186.1557831962332;
 Tue, 14 May 2019 04:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <1557296655-2164-1-git-send-email-amit.k.bag@intel.com>
In-Reply-To: <1557296655-2164-1-git-send-email-amit.k.bag@intel.com>
From:   Josh Boyer <jwboyer@kernel.org>
Date:   Tue, 14 May 2019 07:05:48 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4jbscsQjxBRPsg+h4eJ8D6KzydgjRoCCcYxMyAKYxueQ@mail.gmail.com>
Message-ID: <CA+5PVA4jbscsQjxBRPsg+h4eJ8D6KzydgjRoCCcYxMyAKYxueQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] linux-firmware: Update firmware file for Intel
 Bluetooth 22161
To:     Amit K Bag <amit.k.bag@intel.com>
Cc:     Linux Firmware <linux-firmware@kernel.org>,
        BlueZ development <linux-bluetooth@vger.kernel.org>,
        ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, May 8, 2019 at 2:28 AM Amit K Bag <amit.k.bag@intel.com> wrote:
>
> This patch adds new firmware file for Intel Bluetooth 22161
> Also it is known as Intel CyclonePeak (CcP).
>
> FW Build: REL0275
>
> Release Version: 21.10.0.6
>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
>  WHENCE               |   8 ++++----
>  intel/ibt-20-0-3.sfi | Bin 755276 -> 716180 bytes
>  intel/ibt-20-1-3.sfi | Bin 755276 -> 716180 bytes
>  3 files changed, 4 insertions(+), 4 deletions(-)

All 4 applied and pushed out.  Thanks.

josh
