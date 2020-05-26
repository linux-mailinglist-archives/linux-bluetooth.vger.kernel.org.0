Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD78A1A1BCD
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 08:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbgDHGNl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Apr 2020 02:13:41 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43559 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgDHGNk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Apr 2020 02:13:40 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3E73BCECE0;
        Wed,  8 Apr 2020 08:23:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] Bluetooth: Configure controller address resolution if
 available
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CANFp7mVSQEOyT7GrOa4NhAGozt5SMx3yU_ma6tav5bJ8GXJn8w@mail.gmail.com>
Date:   Wed, 8 Apr 2020 08:13:38 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <1FE78D4A-E6EC-440C-B76E-82F75D615D92@holtmann.org>
References: <20200407205217.1002534-1-marcel@holtmann.org>
 <CANFp7mVSQEOyT7GrOa4NhAGozt5SMx3yU_ma6tav5bJ8GXJn8w@mail.gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

> This looks good to me.
> 
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

however it is not enough, we also have to enable address resolution before calling LE Create Connection. It is actually a bit tricky to enable / disable address resolution correctly.

Regards

Marcel

