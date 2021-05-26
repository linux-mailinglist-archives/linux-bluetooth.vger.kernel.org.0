Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF143391B0C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 May 2021 17:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhEZPDg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 26 May 2021 11:03:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33281 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhEZPDf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 26 May 2021 11:03:35 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2CFD9CED1E;
        Wed, 26 May 2021 17:09:58 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: Fix get device flags command returns garbage
 parameter
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210526002816.413660-1-hj.tedd.an@gmail.com>
Date:   Wed, 26 May 2021 17:02:02 +0200
Cc:     linux-bluetooth@vger.kernel.org,
        Tedd Ho-Jeong An <tedd.an@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <34D9C8B2-2B39-4AFD-83F3-F99726EA6292@holtmann.org>
References: <20210526002816.413660-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> This patch memset the response parameter so it doesn't return the garbage
> value when the Get Device Flags command fails.
> 

please add a Fixes: tag here.

Regards

Marcel

