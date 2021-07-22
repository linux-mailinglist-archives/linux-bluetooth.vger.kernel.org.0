Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C933D2609
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jul 2021 16:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhGVODI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 22 Jul 2021 10:03:08 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56996 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhGVODI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 22 Jul 2021 10:03:08 -0400
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
        by mail.holtmann.org (Postfix) with ESMTPSA id 921E6CECDE;
        Thu, 22 Jul 2021 16:43:42 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 3/4] Bluetooth: Add support for sending LE PHY Update
 event over mgmt
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210722053843.6691-4-ayush.garg@samsung.com>
Date:   Thu, 22 Jul 2021 16:43:42 +0200
Cc:     linux-bluetooth@vger.kernel.org, anupam.r@samsung.com,
        nitin.j@samsung.com
Content-Transfer-Encoding: 8BIT
Message-Id: <D3F3C519-E295-4613-B02B-4E7AC801C685@holtmann.org>
References: <20210722053843.6691-1-ayush.garg@samsung.com>
 <CGME20210722053902epcas5p4a38e75d06dcebec336ac1b1743c1a540@epcas5p4.samsung.com>
 <20210722053843.6691-4-ayush.garg@samsung.com>
To:     Ayush Garg <ayush.garg@samsung.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ayush,

> The HCI_LE_PHY_Update_Complete event should be sent to
> upper layers in case of autonomous PHY update made by
> the controller or HCI_LE_SET_PHY command succeeded.
> This change will let user know immediately whenever
> controller change LE PHYs for a particular connection.
> 
>> HCI Event: LE Meta Event (0x3e) plen 6
> 	  LE PHY Update Complete (0x0c)
> 		Status: Success (0x00)
> 		Handle: 0
> 		TX PHY: LE 2M (0x02)
> 		RX PHY: LE 2M (0x02)
> @ MGMT Event: LE PHY Update Complete (0x002f) plen 12
> 		LE Address: 45:18:F8:CF:23:7E (Resolvable)
> 		Status: Success (0x00)
> 		Updated PHYs: 0x1800
> 		  LE 2M TX
> 		  LE 2M RX

I am not in favor of reporting this via mgmt. It is rather pointless to send this out here. I rather prefer that this is added via auxiliary CMSG data to the GATT and all other L2CAP sockets that opted in for wanting to know.

Regards

Marcel

