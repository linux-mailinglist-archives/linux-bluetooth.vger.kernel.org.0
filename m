Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03803354F02
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 10:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244586AbhDFIu4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 04:50:56 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49011 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbhDFIu4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 04:50:56 -0400
Received: from marcel-macbook.holtmann.net (p4ff9fed5.dip0.t-ipconnect.de [79.249.254.213])
        by mail.holtmann.org (Postfix) with ESMTPSA id 96610CED1D;
        Tue,  6 Apr 2021 10:58:30 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 2/2] Bluetooth: LL privacy allow RPA
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210405143041.16168-1-sathish.narasimman@intel.com>
Date:   Tue, 6 Apr 2021 10:50:47 +0200
Cc:     linux-bluetooth@vger.kernel.org, chethan.tumkur.narayan@intel.com,
        ravishankar.srivatsa@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <E8950BAA-E9EA-4658-BD22-5BDA718191D5@holtmann.org>
References: <20210405143041.16168-1-sathish.narasimman@intel.com>
To:     Sathish Narasimman <sathish.narasimman@intel.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> allow RPA to add bd address to whitelist
> 
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> ---
> net/bluetooth/hci_request.c | 4 ++++
> 1 file changed, 4 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

