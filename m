Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B71613CEDE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 22:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbgAOVZl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 16:25:41 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57409 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOVZl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 16:25:41 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2FF67CECF4;
        Wed, 15 Jan 2020 22:34:58 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5 11/11] Bluetooth: btsdio: Check for valid packet type
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200115210221.13096-12-luiz.dentz@gmail.com>
Date:   Wed, 15 Jan 2020 22:25:40 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <40FE7680-6A18-4ECC-A3A2-767CB52724B0@holtmann.org>
References: <20200115210221.13096-1-luiz.dentz@gmail.com>
 <20200115210221.13096-12-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Check for valid packet type before calling hci_recv_frame which is
> inline with what other drivers are doing.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/btsdio.c | 19 ++++++++++++++-----
> 1 file changed, 14 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

