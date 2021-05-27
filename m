Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B063931E9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 May 2021 17:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235552AbhE0PMG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 May 2021 11:12:06 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42999 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236831AbhE0PL4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 May 2021 11:11:56 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id EBD3CCED34;
        Thu, 27 May 2021 17:18:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH V2] Bluetooth: mgmt: Fix the command returns garbage
 parameter value
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210526173622.444397-1-hj.tedd.an@gmail.com>
Date:   Thu, 27 May 2021 17:10:17 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Tedd Ho-Jeong An <tedd.an@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <CBEFDF39-E1DC-4F34-8A43-AD97E18E5EAC@holtmann.org>
References: <20210526173622.444397-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> When the Get Device Flags command fails, it returns the error status
> with the parameters filled with the garbage values. Although the
> parameters are not used, it is better to fill with zero than the random
> values.
> 
> Signed-off-by: Tedd Ho-Jeong An <tedd.an@intel.com>
> ---
> net/bluetooth/mgmt.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

