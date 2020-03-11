Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD4F181B20
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 15:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbgCKOZ7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 10:25:59 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59026 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgCKOZ7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 10:25:59 -0400
Received: from [172.20.10.2] (x59cc8a78.dyn.telefonica.de [89.204.138.120])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1DE7CCECDF;
        Wed, 11 Mar 2020 15:35:26 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] bluetooth: fix off by one in err_data_reporting cmd
 masks.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200311141857.197369-1-alainm@chromium.org>
Date:   Wed, 11 Mar 2020 15:25:56 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <BA4951AA-60F3-4FBE-BA51-ACBD78B5AD8A@holtmann.org>
References: <20200311141857.197369-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change fixes the off by one error in the erroneous command bit
> masks which can lead to the erroneous data commands being sent to a
> controller that doesn't support them.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/hci_core.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

