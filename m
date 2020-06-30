Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9272C20F9ED
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jun 2020 18:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389903AbgF3Qzd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Jun 2020 12:55:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60223 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389899AbgF3Qzc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Jun 2020 12:55:32 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id E7DEDCECED;
        Tue, 30 Jun 2020 19:05:25 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] Bluetooth: use configured default params for active
 scans
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200629170415.3227892-1-alainm@chromium.org>
Date:   Tue, 30 Jun 2020 18:55:31 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CDDEA1C8-EF15-46D5-B637-11B0E845C96B@holtmann.org>
References: <20200629170415.3227892-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch fixes active scans to use the configured default parameters.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> Changes in v2:
> - Rebase onto master
> 
> net/bluetooth/hci_request.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

