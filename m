Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B663FB885
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Aug 2021 16:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237240AbhH3Ouy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Aug 2021 10:50:54 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40285 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbhH3Oux (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Aug 2021 10:50:53 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 58D39CED40;
        Mon, 30 Aug 2021 16:49:58 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: Fix enabling advertising for central role
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210820234038.586979-1-luiz.dentz@gmail.com>
Date:   Mon, 30 Aug 2021 16:49:58 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E6093FDB-E85F-4DCC-98F5-B45E907679DC@holtmann.org>
References: <20210820234038.586979-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> When disconnecting the advertising shall be re-enabled only when the
> connection role is slave/peripheral as the central role use advertising
> to connect it could end up enabling the instance 0x00 if there are other
> advertising instances.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_event.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

