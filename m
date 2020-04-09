Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2531A3973
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Apr 2020 19:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDIR7a (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Apr 2020 13:59:30 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51782 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIR7a (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Apr 2020 13:59:30 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id CDB47CECFD;
        Thu,  9 Apr 2020 20:09:04 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: log advertisement packet length if it gets
 corrected
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200409111829.9508-1-daniels@umanovskis.se>
Date:   Thu, 9 Apr 2020 19:59:29 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, Daniels Umanovskis <du@axentia.se>
Content-Transfer-Encoding: 7bit
Message-Id: <7ADF03D1-3DE0-40D7-B688-1280DBC68D8E@holtmann.org>
References: <20200409111829.9508-1-daniels@umanovskis.se>
To:     daniels@umanovskis.se
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Daniels,

> The error could indicate a problem with the Bluetooth device. It
> is easier to investigate if the packet's actual length gets logged,
> not just the fact that a discrepancy occurred.
> 
> Signed-off-by: Daniels Umanovskis <du@axentia.se>
> ---
> net/bluetooth/hci_event.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

