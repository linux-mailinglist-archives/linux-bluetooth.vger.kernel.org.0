Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6A015BA07
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Feb 2020 08:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgBMH1Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Feb 2020 02:27:24 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46878 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729735AbgBMH1Y (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Feb 2020 02:27:24 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 44F04CECD1
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Feb 2020 08:36:46 +0100 (CET)
From:   Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [RFC v3] Bluetooth: Add debugfs option to enable runtime debug
 statements
Date:   Thu, 13 Feb 2020 08:27:22 +0100
References: <20200203153603.61931-1-marcel@holtmann.org>
To:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
In-Reply-To: <20200203153603.61931-1-marcel@holtmann.org>
Message-Id: <AF6B4197-8AFE-429A-ACFB-14500A7D500F@holtmann.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
> include/net/bluetooth/bluetooth.h | 10 +++++
> net/bluetooth/Kconfig             |  7 +++
> net/bluetooth/af_bluetooth.c      |  2 +
> net/bluetooth/lib.c               | 73 +++++++++++++++++++++++++++++++
> 4 files changed, 92 insertions(+)

does anybody have any comments on this. It is not the final solution, but as an interim it might be a good start.

I have not seen any kbuild issues popping up. However I like to get some Tested-By, Reviewed-By lines added to the patch and I can send a patch version with proper commit message if there is interest in getting this upstream.

Regards

Marcel

