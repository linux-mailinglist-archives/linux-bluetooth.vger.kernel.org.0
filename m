Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0119413064
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Sep 2021 10:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhIUIsM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Sep 2021 04:48:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55477 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhIUIsM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Sep 2021 04:48:12 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 95BEDCED13;
        Tue, 21 Sep 2021 10:46:42 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v6 1/4] Bluetooth: hci_sock: Add support for
 BT_{SND,RCV}BUF
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210916201049.114392-1-luiz.dentz@gmail.com>
Date:   Tue, 21 Sep 2021 10:46:42 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1F53E938-77D3-4520-B119-11F81C991D44@holtmann.org>
References: <20210916201049.114392-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds support for BT_{SND,RCV}BUF so userspace can set MTU based on
> the channel usage.
> 
> Fixes: https://github.com/bluez/bluez/issues/201
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_sock.c | 102 ++++++++++++++++++++++++++++++++++-----
> 1 file changed, 91 insertions(+), 11 deletions(-)

so I applied patches 1, 3 and 4 to bluetooth-next tree.

The patch 2 needs a more details review when I have time since I remember there were cases where the SKB copy was really needed.

Regards

Marcel

