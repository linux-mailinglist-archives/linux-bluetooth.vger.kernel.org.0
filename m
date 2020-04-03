Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F7D19D803
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 15:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390938AbgDCNx1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 09:53:27 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51486 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390930AbgDCNx1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 09:53:27 -0400
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id B74C8CECFF;
        Fri,  3 Apr 2020 16:02:59 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] tools/hciattach_ath3k: Load BT board data based on
 country code
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200331003355.14614-1-sonnysasaka@chromium.org>
Date:   Fri, 3 Apr 2020 15:53:25 +0200
Cc:     linux-bluetooth@vger.kernel.org, yixiang@google.com,
        caiz@google.com
Content-Transfer-Encoding: 8BIT
Message-Id: <7CA6DAE1-09E7-4CEC-BA78-E8C4E104D92E@holtmann.org>
References: <20200331003355.14614-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> BT board data file PS_ASIC-<country-code>.pst is loaded based
> on country code. If not exist, default BT board data file
> PS_ASIC.pst would be loaded.
> 
> This patch doesn't define how to get the country code at the moment, but
> future patches can supply the country code in the region parameter of
> get_ps_file_name.
> ---
> tools/hciattach_ath3k.c | 32 +++++++++++++++++++++++---------
> 1 file changed, 23 insertions(+), 9 deletions(-)

while we can fix parts of hciattach, but I rather remove that tool at some point.

Do you still require it with serdev kernel support? I mean all UART based Bluetooth controllers should be handled via serdev.

Regards

Marcel

