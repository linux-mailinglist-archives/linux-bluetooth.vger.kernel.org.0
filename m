Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D383279798
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Sep 2020 09:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgIZHnZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Sep 2020 03:43:25 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42810 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZHnZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Sep 2020 03:43:25 -0400
Received: from [172.20.10.2] (dynamic-046-114-136-219.46.114.pool.telefonica.de [46.114.136.219])
        by mail.holtmann.org (Postfix) with ESMTPSA id 09E8BCECE8;
        Sat, 26 Sep 2020 09:50:22 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 3/4] Bluetooth: Disable High Speed by default
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200806181714.3216076-3-luiz.dentz@gmail.com>
Date:   Sat, 26 Sep 2020 09:43:23 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3DC89553-CC2B-4FAA-8AF8-C136E155B63C@holtmann.org>
References: <20200806181714.3216076-1-luiz.dentz@gmail.com>
 <20200806181714.3216076-3-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Bluetooth High Speed requires hardware support which is very uncommon
> nowadays since HS has not pickup interest by the industry.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/Kconfig | 1 -
> 1 file changed, 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

