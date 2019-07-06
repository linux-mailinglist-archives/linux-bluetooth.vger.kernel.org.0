Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D938E610D9
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfGFNjb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:39:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45782 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfGFNja (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:39:30 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id 536E4CF12E;
        Sat,  6 Jul 2019 15:48:01 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC 1/2] Bluetooth: Use controller sets when available
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190603104843.26848-1-luiz.dentz@gmail.com>
Date:   Sat, 6 Jul 2019 15:39:28 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CB6C7B5E-7763-49BE-8CD2-3215AEBFF16D@holtmann.org>
References: <20190603104843.26848-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This makes use of controller sets when using Extended Advertising
> feature thus offloading the scheduling to the controller.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_conn.c    |  2 +-
> net/bluetooth/hci_core.c    |  3 ++-
> net/bluetooth/hci_request.c | 40 ++++++++++++++++++++++++++++++-------
> net/bluetooth/hci_request.h |  2 +-
> 4 files changed, 37 insertions(+), 10 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

