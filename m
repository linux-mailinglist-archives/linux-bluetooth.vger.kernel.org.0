Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9930717322F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Feb 2020 08:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgB1H4L (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Feb 2020 02:56:11 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57057 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgB1H4L (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Feb 2020 02:56:11 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1B699CECF6;
        Fri, 28 Feb 2020 09:05:36 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1 1/3] bluetooth: Add flag to define wideband speech
 capability
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200227182938.110670-2-alainm@chromium.org>
Date:   Fri, 28 Feb 2020 08:56:09 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <09CC6D4B-3A22-4D41-831F-C7F62FC92C15@holtmann.org>
References: <20200227182938.110670-1-alainm@chromium.org>
 <20200227182938.110670-2-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds a new flag to define a controller's wideband speech
> capability.  This is required since no reliable over HCI mechanism
> exists to query the controller and driver's compatibility with
> wideband speech.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> drivers/bluetooth/btusb.c | 19 +++++++++++++------
> 1 file changed, 13 insertions(+), 6 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

