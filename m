Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205E3331286
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Mar 2021 16:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhCHPtM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Mar 2021 10:49:12 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:39087 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhCHPsp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Mar 2021 10:48:45 -0500
Received: from marcel-macbook.holtmann.net (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id D7FA4CED19;
        Mon,  8 Mar 2021 16:56:18 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v1] btintel: Fix offset calculation boot address parameter
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210308131601.5799-1-kiran.k@intel.com>
Date:   Mon, 8 Mar 2021 16:48:43 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <33EC9042-7EAC-497F-93FC-E9E7F426B566@holtmann.org>
References: <20210308131601.5799-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Boot address parameter was not getting updated properly
> due to wrong offset
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btintel.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

