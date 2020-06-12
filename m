Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293FF1F7892
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 15:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgFLNMG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 09:12:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56488 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLNMF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 09:12:05 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id 03240CED03;
        Fri, 12 Jun 2020 15:21:53 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v6] sco:Add support for BT_PKT_STATUS CMSG data
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200611195041.46839-1-alainm@chromium.org>
Date:   Fri, 12 Jun 2020 15:12:01 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CE137166-3D51-40C1-819C-D6CC91639439@holtmann.org>
References: <20200611195041.46839-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds support for reporting the BT_PKT_STATUS to the socket
> CMSG data to allow the implementation of a packet loss correction on
> erronous data received on the SCO socket.
> 
> The patch was partially developed by Marcel Holtmann and validated by
> Hsin-yu Chao.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> 
> ---
> 
> Changes in v6:
> - Fixing sparse errors.
> 
> Changes in v5:
> - reducing cmsg_mask to 8 bit
> - clarifying the public symbol usage versus internal CMSG flags.
> 
> Changes in v4:
> - Addressing feedback from Marcel
> 
> include/net/bluetooth/bluetooth.h | 10 ++++++++++
> include/net/bluetooth/sco.h       |  2 ++
> net/bluetooth/af_bluetooth.c      |  3 +++
> net/bluetooth/hci_core.c          |  1 +
> net/bluetooth/sco.c               | 32 +++++++++++++++++++++++++++++++
> 5 files changed, 48 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

