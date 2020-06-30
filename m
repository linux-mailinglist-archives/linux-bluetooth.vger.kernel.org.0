Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111EB20F9EE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jun 2020 18:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387825AbgF3Qze (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Jun 2020 12:55:34 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36550 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389904AbgF3Qzd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Jun 2020 12:55:33 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id B3692CECED;
        Tue, 30 Jun 2020 19:05:27 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] Bluetooth: Adding a configurable autoconnect timeout
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200629161100.3070288-1-alainm@chromium.org>
Date:   Tue, 30 Jun 2020 18:55:33 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D3F4AF49-4DF9-4AA0-A688-22FE1C8DFE9D@holtmann.org>
References: <20200629161100.3070288-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch adds a configurable LE autoconnect timeout.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> Changes in v3:
> - Rebase onto master
> 
> Changes in v2:
> Fixing longer than 80 char line.
> 
> include/net/bluetooth/hci_core.h |  1 +
> net/bluetooth/hci_core.c         |  1 +
> net/bluetooth/hci_event.c        |  2 +-
> net/bluetooth/mgmt_config.c      | 13 +++++++++++++
> 4 files changed, 16 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

