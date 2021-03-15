Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9166F33C772
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Mar 2021 21:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhCOUJ3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Mar 2021 16:09:29 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52550 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbhCOUJV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Mar 2021 16:09:21 -0400
Received: from marcel-macbook.holtmann.net (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id AAB83CECE5;
        Mon, 15 Mar 2021 21:16:56 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] Bluetooth: L2CAP: Fix not checking for maximum number
 of DCID
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210315200437.1800434-1-luiz.dentz@gmail.com>
Date:   Mon, 15 Mar 2021 21:09:19 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <0BE392E6-430C-4F29-8C6D-F1A9568FAA85@holtmann.org>
References: <20210315200437.1800434-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> When receiving L2CAP_CREDIT_BASED_CONNECTION_REQ the remote may request
> more channels than allowed by the spec (10 octecs = 5 CIDs) so this
> checks if the number of channels is bigger than the maximum allowed and
> respond with an error.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> v2: Respond with an error instead of truncating the response with maximum
> allowed nunber of channels.
> 
> include/net/bluetooth/l2cap.h |  1 +
> net/bluetooth/l2cap_core.c    | 12 +++++++++---
> 2 files changed, 10 insertions(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

