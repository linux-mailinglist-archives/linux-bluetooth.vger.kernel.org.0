Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB98B2DEB3D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Dec 2020 22:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgLRVoG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Dec 2020 16:44:06 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46708 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbgLRVoF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Dec 2020 16:44:05 -0500
Received: from marcel-macbook.holtmann.net (p4fefcdf9.dip0.t-ipconnect.de [79.239.205.249])
        by mail.holtmann.org (Postfix) with ESMTPSA id 92D3ACED31;
        Fri, 18 Dec 2020 22:50:41 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v1] Revert "Bluetooth: btintel: Fix endianness issue for
 TLV version information"
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201215234038.31975-1-kiran.k@intel.com>
Date:   Fri, 18 Dec 2020 22:43:24 +0100
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <3E47AC85-4F09-490F-9BDA-2D2B217B9BE5@holtmann.org>
References: <20201215234038.31975-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> This reverts commit a63f23c9d139377833a139b179793fea79ee198f.
> 
> get_unaligned_{le16|le32|le64}(p) is meant to replace code of the form
> le16_to_cpu(get_unaligned((__le16 *)p)). There is no need to explicitly
> do leXX_to_cpu() if get_unaligned_leXX() is used.
> 
> https://lwn.net/Articles/277779/
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btintel.c | 21 +++++++--------------
> 1 file changed, 7 insertions(+), 14 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

