Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B892141303D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Sep 2021 10:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhIUIk0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Sep 2021 04:40:26 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46898 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbhIUIk0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Sep 2021 04:40:26 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id F241ACED13;
        Tue, 21 Sep 2021 10:38:56 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: eir: Move EIR/Adv Data functions to its own
 file
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210920225937.1173013-1-luiz.dentz@gmail.com>
Date:   Tue, 21 Sep 2021 10:38:56 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <91445245-DB0A-49C3-9234-435A5FD9AB88@holtmann.org>
References: <20210920225937.1173013-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This moves functions manipulating EIR/Adv Data to its own file so it
> can be reused by other files.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci_core.h |  39 +--
> net/bluetooth/Makefile           |   3 +-
> net/bluetooth/eir.c              | 335 +++++++++++++++++++++++++
> net/bluetooth/eir.h              |  72 ++++++
> net/bluetooth/hci_core.c         |  54 ++++
> net/bluetooth/hci_event.c        |   1 +
> net/bluetooth/hci_request.c      | 416 ++-----------------------------
> net/bluetooth/hci_request.h      |  23 --
> net/bluetooth/mgmt.c             |   3 +-
> 9 files changed, 483 insertions(+), 463 deletions(-)
> create mode 100644 net/bluetooth/eir.c
> create mode 100644 net/bluetooth/eir.h

patch has been applied to bluetooth-next tree.

Regards

Marcel

