Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC5826CD4E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Sep 2020 22:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgIPU5t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Sep 2020 16:57:49 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58377 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgIPQwW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Sep 2020 12:52:22 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5C907CED05;
        Wed, 16 Sep 2020 16:38:00 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1 1/2] Bluetooth: btintel: Add infrastructure to read
 controller information
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1600089906-9852-1-git-send-email-kiran.k@intel.com>
Date:   Wed, 16 Sep 2020 16:31:03 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        chethan.tumkur.narayan@intel.com, ravishankar.srivatsa@intel.com,
        Kiran K <kiran.k@intel.com>, Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <52CFB547-C5C4-4116-B163-4DBA50E6BB7E@holtmann.org>
References: <1600089906-9852-1-git-send-email-kiran.k@intel.com>
To:     Kiran K <kiraank@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> New generation Intel controllers returns version information in TLV
> format. This patch adds,
> 
> 1) Enums, structures for TLV
> 
> 2) function to read controller information, parse TLV data and populate
>   intel_version_tlv structure
> 
> 3) function to print version information
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> Signed-off-by: Raghuram Hegde <raghuram.hegde@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> drivers/bluetooth/btintel.c | 138 ++++++++++++++++++++++++++++++++++++++++++++
> drivers/bluetooth/btintel.h |  79 +++++++++++++++++++++++++
> 2 files changed, 217 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

