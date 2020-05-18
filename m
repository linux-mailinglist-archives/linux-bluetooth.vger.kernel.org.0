Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFAD1D724F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 May 2020 09:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgERHx6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 May 2020 03:53:58 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43379 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgERHx6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 May 2020 03:53:58 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id C7C2DCECE2;
        Mon, 18 May 2020 10:03:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] build: Add an option to explicitly enable hid2hci
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200513213812.23165-1-sonnysasaka@chromium.org>
Date:   Mon, 18 May 2020 09:53:56 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <BC34FA18-2DD5-4620-8224-4BDAEBB59651@holtmann.org>
References: <77B1AB20-C903-427C-A3BD-E10C79815EF9@holtmann.org>
 <20200513213812.23165-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> hid2hci is no longer a common use. This patch changes the default to not
> build and install hid2hci and provide a configure flag --enable-hid2hci
> to explicitly enable it.
> ---
> configure.ac | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

patch has been applied.

Regards

Marcel

