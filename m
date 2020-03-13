Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 864ED184EF7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Mar 2020 19:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMSuq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Mar 2020 14:50:46 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39449 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMSup (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Mar 2020 14:50:45 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id C2870CED08;
        Fri, 13 Mar 2020 20:00:13 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3] Bluetooth: print fw build version in power-on boot
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200313051908.30815-1-amit.k.bag@intel.com>
Date:   Fri, 13 Mar 2020 19:50:44 +0100
Cc:     linux-firmware@kernel.org, linux-bluetooth@vger.kernel.org,
        ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        Sukumar Ghorai <sukumar.ghorai@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <3021AC7A-41EC-4002-B872-088AC2ACAA12@holtmann.org>
References: <20200313051908.30815-1-amit.k.bag@intel.com>
To:     Amit K Bag <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Amit,

> To determine the build version of Bluetooth firmware to ensure reported
> issue related to a particular release. This is very helpful for every fw
> downloaded to BT controller and issue reported from field test.
> 
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> Signed-off-by: Sukumar Ghorai <sukumar.ghorai@intel.com>
> ---
> drivers/bluetooth/btusb.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)

I have two v3 versions in my inbox. Please send me a clean v4 that is ready to be applied so that I don’t have to second guess.

Regards

Marcel

