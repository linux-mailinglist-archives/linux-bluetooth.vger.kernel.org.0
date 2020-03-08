Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B831A17D2C8
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2020 10:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCHJEB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Mar 2020 05:04:01 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:53353 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCHJEB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Mar 2020 05:04:01 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9F29FCED15;
        Sun,  8 Mar 2020 10:13:27 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3 3/5] Bluetooth: L2CAP: Add module option to enable
 ECRED mode
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200303005623.18917-3-luiz.dentz@gmail.com>
Date:   Sun, 8 Mar 2020 10:03:59 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <793225F4-BFE0-4E5F-A721-C1ABB51AB977@holtmann.org>
References: <20200303005623.18917-1-luiz.dentz@gmail.com>
 <20200303005623.18917-3-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This should make it safe to have the code upstream without affecting
> stable systems since there are a few details not sort out with ECRED
> mode e.g: how to initiate multiple connections at once.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/l2cap.h |  1 +
> net/bluetooth/l2cap_core.c    | 15 +++++++++++++++
> net/bluetooth/l2cap_sock.c    |  5 +++++
> 3 files changed, 21 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

