Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B077193272
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Mar 2020 22:17:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCYVRF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Mar 2020 17:17:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41156 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbgCYVRF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Mar 2020 17:17:05 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id C37EECECD6;
        Wed, 25 Mar 2020 22:26:35 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v5 1/2] Bluetooth: L2CAP: Use DEFER_SETUP to group ECRED
 connections
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200325193754.13950-1-luiz.dentz@gmail.com>
Date:   Wed, 25 Mar 2020 22:17:03 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3DA3028D-7149-409B-B972-0B1099897C07@holtmann.org>
References: <20200325193754.13950-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This uses the DEFER_SETUP flag to group channels with
> L2CAP_CREDIT_BASED_CONNECTION_REQ.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/l2cap.h |   4 +
> net/bluetooth/l2cap_core.c    | 137 +++++++++++++++++++++++++++++++---
> 2 files changed, 131 insertions(+), 10 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

