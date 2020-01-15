Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 162B013CEDC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 22:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbgAOVZi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 16:25:38 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:36806 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOVZi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 16:25:38 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 51959CECF2;
        Wed, 15 Jan 2020 22:34:54 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5 01/11] Bluetooth: Add definitions for CIS connections
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200115210221.13096-2-luiz.dentz@gmail.com>
Date:   Wed, 15 Jan 2020 22:25:35 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <B5812645-5C20-4B2D-9D65-3CDA9180A1B1@holtmann.org>
References: <20200115210221.13096-1-luiz.dentz@gmail.com>
 <20200115210221.13096-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> These adds the HCI definitions for handling CIS connections along with
> ISO data packets.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci.h | 159 +++++++++++++++++++++++++++++++++++-
> 1 file changed, 158 insertions(+), 1 deletion(-)

Patch has been applied to bluetooth-next tree.

Regards

Marcel

