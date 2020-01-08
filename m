Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 504DA134DDB
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 21:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726916AbgAHUqW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jan 2020 15:46:22 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42091 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgAHUqW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jan 2020 15:46:22 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 22AAACECFA;
        Wed,  8 Jan 2020 21:55:37 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Use vfree() instead of kfree()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200108035931.51209-1-weiyongjun1@huawei.com>
Date:   Wed, 8 Jan 2020 21:46:20 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <83175A35-B50A-4EB6-BF5B-ABF83F551102@holtmann.org>
References: <20200108035931.51209-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Wei,

> Use vfree() instead of kfree() to free vmalloc()
> allocated data.
> 
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> drivers/bluetooth/hci_qca.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

