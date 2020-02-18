Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C74A41633C4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 Feb 2020 22:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgBRVDa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Feb 2020 16:03:30 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34670 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgBRVDa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Feb 2020 16:03:30 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AD991CECC5;
        Tue, 18 Feb 2020 22:12:52 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] Bluetooth: Fix crash when using new BT_PHY option
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200218183320.22706-1-luiz.dentz@gmail.com>
Date:   Tue, 18 Feb 2020 22:03:27 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AF413186-5820-4743-93A3-4C7910FAB859@holtmann.org>
References: <20200218183320.22706-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This fixes the invalid check for connected socket which causes the
> following trace due to sco_pi(sk)->conn being NULL:
> 
> RIP: 0010:sco_sock_getsockopt+0x2ff/0x800 net/bluetooth/sco.c:966
> 
> L2CAP has also been fixed since it has the same problem.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_sock.c | 2 +-
> net/bluetooth/sco.c        | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

