Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99DD220E30
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jul 2020 15:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbgGONcS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jul 2020 09:32:18 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46280 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731174AbgGONcS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jul 2020 09:32:18 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 51D37CECEE;
        Wed, 15 Jul 2020 15:42:15 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [RFC v2] Bluetooth: btusb: Add support for queuing during polling
 interval
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200714231200.690268-1-luiz.dentz@gmail.com>
Date:   Wed, 15 Jul 2020 15:32:16 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6FFBD209-BAFB-4E06-B767-FB7618C19CC6@holtmann.org>
References: <20200714231200.690268-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This makes btusb to queue ACL and events during a polling interval
> by using of a delayed work, with the interval working as a time window
> where frames received from different endpoints are considered to be
> arrived at same time and then attempt to resolve potential conflics by
> processing the events ahead of ACL packets.
> 
> It worth noting though that priorizing events over ACL data may result
> in inverting the order compared to how they appeared over the air, for
> instance there may be packets received before a disconnect event that
> will be discarded and unencrypted packets received before encryption
> change which would considered encrypted, because of these potential
> changes on the order the support for queuing during the polling
> interval is not enabled by default so platforms have the following
> means to enable it:
> 
> At build-time:
> 
>    CONFIG_BT_HCIBTUSB_INTERVAL=y
> 
> At runtime with use of module option:
> 
>    enable_interval

I like that this is confined into btusb.c, but now the question is if this is actually enough for handling this issue.

Regards

Marcel

