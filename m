Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67F3D3EDA3F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Aug 2021 17:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236637AbhHPP4W (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Aug 2021 11:56:22 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41897 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbhHPP4H (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Aug 2021 11:56:07 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 688BBCECC8;
        Mon, 16 Aug 2021 17:55:35 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4 2/2] Bluetooth: Store advertising handle so it can be
 re-enabled
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210811232016.757154-2-luiz.dentz@gmail.com>
Date:   Mon, 16 Aug 2021 17:55:35 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <0E908A71-D18E-4B85-9CD3-CDF627A87010@holtmann.org>
References: <20210811232016.757154-1-luiz.dentz@gmail.com>
 <20210811232016.757154-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This stores the advertising handle/instance into hci_conn so it is
> accessible when re-enabling the advertising once disconnected.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci_core.h |  1 +
> net/bluetooth/hci_event.c        | 45 ++++++++++++++++++++------------
> 2 files changed, 30 insertions(+), 16 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

