Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9B4217359
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jul 2020 18:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgGGQJp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 12:09:45 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36672 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgGGQJp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 12:09:45 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 71B9ECECEE;
        Tue,  7 Jul 2020 18:19:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [RFC] Bluetooth: btusb: Add support for notifying the polling
 interval
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200702220558.3467870-1-luiz.dentz@gmail.com>
Date:   Tue, 7 Jul 2020 18:09:43 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <FEEBE4D6-F6C6-470D-95E6-FA20EAA1F862@holtmann.org>
References: <20200702220558.3467870-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This enables btusb to inform the polling interval used for receiving
> packets, the interval is then used wih rx_work which has been changed
> to be a delayed work.
> 
> The interval is then used as a time window where frames received from
> different endpoints are considered to be arrived at same time.
> 
> In order to resolve potential conflicts between endpoints a dedicated
> queue for events was introduced and it is now processed before the ACL
> packets.
> 
> It worth noting though that priorizing events over ACL data may result
> in inverting the order of the packets over the air, for instance there
> may be packets received before a disconnect event that will be
> discarded and unencrypted packets received before encryption change
> which would considered encrypted, because of these potential inversions
> the support for polling interval is not enabled by default so platforms
> have the following means to enable it:

we can not touch the core that impacts all transport layers even if they are not broken. So adding the second queue is not something that I think is a good idea. And again, we are just papering over a hole.

However if you want to queue within btusb driver before sending it to the core, then maybe.

Regards

Marcel

