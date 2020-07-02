Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4592124A5
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Jul 2020 15:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgGBN1z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Jul 2020 09:27:55 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44468 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728893AbgGBN1y (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Jul 2020 09:27:54 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id C4182CED12;
        Thu,  2 Jul 2020 15:37:48 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 3/5] Bluetooth: btintel: Refactor firmware payload
 download code
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200702120315.26768-4-kiran.k@intel.com>
Date:   Thu, 2 Jul 2020 15:27:53 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        kiraank@gmail.com, Amit K Bag <amit.k.bag@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <D3F1B6F8-A35F-4A18-A460-89F0A7644644@holtmann.org>
References: <20200702120315.26768-1-kiran.k@intel.com>
 <20200702120315.26768-4-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Move firmware payload download code to a separate function to
> enhance readability and reusability

this patch is doing more than that. It also introduces an extra public function.

Regards

Marcel

