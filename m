Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49E42C0526
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Nov 2020 13:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbgKWMAr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 23 Nov 2020 07:00:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:49940 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbgKWMAr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 23 Nov 2020 07:00:47 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 875B4CECD0;
        Mon, 23 Nov 2020 13:07:57 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH 2/2] Bluetooth: Rename get_adv_instance_scan_rsp
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201114004434.3852104-2-luiz.dentz@gmail.com>
Date:   Mon, 23 Nov 2020 13:00:44 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1EBE2755-77EB-4389-AC8F-3262A6F6294D@holtmann.org>
References: <20201114004434.3852104-1-luiz.dentz@gmail.com>
 <20201114004434.3852104-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This renames get_adv_instance_scan_rsp to adv_instance_is_scannable and
> make it return a bool since it was not actually properly return the size
> of the scan response as one could expect.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_request.c | 32 +++++++++-----------------------
> 1 file changed, 9 insertions(+), 23 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

