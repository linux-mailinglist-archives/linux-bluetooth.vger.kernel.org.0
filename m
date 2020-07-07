Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EFD217319
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jul 2020 17:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgGGPyf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 11:54:35 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54568 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727793AbgGGPyf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 11:54:35 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6702DCECEF
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jul 2020 18:04:30 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v5] Bluetooth: le_simult_central_peripheral experimental
 feature
Date:   Tue, 7 Jul 2020 17:54:33 +0200
References: <20200707154606.52947-1-marcel@holtmann.org>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>
In-Reply-To: <20200707154606.52947-1-marcel@holtmann.org>
Message-Id: <6FF8C288-58E7-4010-AA12-9AA7831FB2BE@holtmann.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch adds an le_simult_central_peripheral features which allows a
> clients to determine if the controller is able to support peripheral and
> central connections separately and at the same time.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
> net/bluetooth/mgmt.c | 25 +++++++++++++++++++++++--
> 1 file changed, 23 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

