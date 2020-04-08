Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6223F1A2A39
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 22:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbgDHUTX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Apr 2020 16:19:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47939 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgDHUTX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Apr 2020 16:19:23 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AE5EBCECEB;
        Wed,  8 Apr 2020 22:28:56 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] Bluetooth: Always request for user confirmation for
 Just Works (LE SC)
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200406180402.7782-1-sonnysasaka@chromium.org>
Date:   Wed, 8 Apr 2020 22:19:21 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <099E59E3-9EFC-4E8C-807A-E339E05AE4A9@holtmann.org>
References: <DB9E4FAE-C54D-4158-ACE3-45B62C85E2CB@holtmann.org>
 <20200406180402.7782-1-sonnysasaka@chromium.org>
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
> This patch is similar to the previous patch but applies for LE Secure
> Connections (SC).
> 
> Signed-off-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
> net/bluetooth/smp.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

