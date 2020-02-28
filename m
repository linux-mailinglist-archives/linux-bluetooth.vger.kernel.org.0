Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4883517322E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Feb 2020 08:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgB1H4J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Feb 2020 02:56:09 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42531 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgB1H4J (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Feb 2020 02:56:09 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 91431CECF5;
        Fri, 28 Feb 2020 09:05:34 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1 2/3] bluetooth: Support querying for WBS support
 through MGMT
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200227182938.110670-3-alainm@chromium.org>
Date:   Fri, 28 Feb 2020 08:56:07 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2F226B27-7F8F-4E70-AA80-24BE2DC89DA3@holtmann.org>
References: <20200227182938.110670-1-alainm@chromium.org>
 <20200227182938.110670-3-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch provides a mechanism for MGMT interface client to query the
> capability of the controller to support WBS.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> drivers/bluetooth/btusb.c    | 3 +++
> include/net/bluetooth/hci.h  | 9 +++++++++
> include/net/bluetooth/mgmt.h | 1 +
> net/bluetooth/mgmt.c         | 4 ++++
> 4 files changed, 17 insertions(+)

patch has been applied to bluetooth-next tree.

However ..

> +
> +	/* When this quirt is set, wide band speech is supported by
> +	 * the driver since no reliable mechanism exist to report
> +	 * this from the hardware, a driver flag is use to convey
> +	 * this support
> +	 *
> +	 * This quirk must be set before hci_register_dev is called.
> +	 */
> +	HCI_QUIRK_WIDE_BAND_SPEECH_SUPPORTED,
> };

quirt - a short-handled riding whip with a braided leather lash.

.. this totally made my day and I was tempted to leave this typo in the code, but I fixed it up in the end ;)

Regards

Marcel

