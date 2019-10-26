Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8E3E58C1
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Oct 2019 07:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbfJZF3i (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Oct 2019 01:29:38 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52069 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfJZF3i (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Oct 2019 01:29:38 -0400
Received: from [172.20.19.11] (unknown [213.61.67.157])
        by mail.holtmann.org (Postfix) with ESMTPSA id AF0B5CED0E;
        Sat, 26 Oct 2019 07:38:38 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH 2/2] Bluetooth: Fix not using LE_ADV_NONCONN_IND for
 instance 0
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191024131543.10794-2-luiz.dentz@gmail.com>
Date:   Sat, 26 Oct 2019 07:29:37 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <49E02C86-FB77-4D85-AB2E-A2E8CEED80ED@holtmann.org>
References: <20191024131543.10794-1-luiz.dentz@gmail.com>
 <20191024131543.10794-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Instance 0 is controlled by stack itself and always set the local name
> in the scan response.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_request.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

