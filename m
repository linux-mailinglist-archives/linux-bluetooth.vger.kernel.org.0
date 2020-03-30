Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D8B198753
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Mar 2020 00:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729467AbgC3WYb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 18:24:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57444 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729461AbgC3WYb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 18:24:31 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 865CCCECB0;
        Tue, 31 Mar 2020 00:34:02 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: Always request for user confirmation for Just
 Works
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200328003423.14079-1-sonnysasaka@chromium.org>
Date:   Tue, 31 Mar 2020 00:24:29 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Sonny Sasaka <sonnysasaka@gmail.com>
Content-Transfer-Encoding: 7bit
Message-Id: <CACE38CD-C394-4420-900A-3FF35932AE3D@holtmann.org>
References: <20200328003423.14079-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> To improve security, always give the user-space daemon a chance to
> accept or reject a Just Works pairing (LE). The daemon may decide to
> auto-accept based on the user's intent.
> 
> Signed-off-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
> net/bluetooth/smp.c | 12 ++++++++++--
> 1 file changed, 10 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

