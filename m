Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612831BB9DA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Apr 2020 11:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgD1J3g (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Apr 2020 05:29:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50225 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgD1J3g (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Apr 2020 05:29:36 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5B7A9CECEA;
        Tue, 28 Apr 2020 11:39:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 1/3] bluetooth:Adding driver and quirk defs for
 multi-role LE
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200423144328.82478-2-alainm@chromium.org>
Date:   Tue, 28 Apr 2020 11:29:34 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <D83F7440-10F0-4DF8-AE8C-8DC2EDDD39E6@holtmann.org>
References: <20200423144328.82478-1-alainm@chromium.org>
 <20200423144328.82478-2-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds the relevant driver and quirk to allow drivers to
> report the le_states as being trustworthy.
> 
> This has historically been disabled as controllers did not reliably
> support this. In particular, this will be used to relax this condition
> for controllers that have been well tested and reliable.
> 
> 	/* Most controller will fail if we try to create new connections
> 	 * while we have an existing one in slave role.
> 	 */
> 	if (hdev->conn_hash.le_num_slave > 0)
> 		return NULL;
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> drivers/bluetooth/btusb.c   | 2 +-
> include/net/bluetooth/hci.h | 9 +++++++++
> 2 files changed, 10 insertions(+), 1 deletion(-)

all 3 patches have been applied to bluetooth-next tree.

Regards

Marcel

