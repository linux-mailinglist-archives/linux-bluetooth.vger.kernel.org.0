Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D202172EE
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jul 2020 17:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgGGPrg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 11:47:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47902 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728133AbgGGPrg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 11:47:36 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1BE05CECED;
        Tue,  7 Jul 2020 17:57:31 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] Bluetooth: le_simult_central_peripheral experimental
 feature
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200707142555.397598-1-alainm@chromium.org>
Date:   Tue, 7 Jul 2020 17:47:34 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <EB5752C9-B3B2-424F-A4CB-B8DBF886AC6A@holtmann.org>
References: <20200707142555.397598-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch adds an le_simult_central_peripheral features which allows a
> clients to determine if the controller is able to support peripheral and
> central connections separately and at the same time.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> Changes in v4:
> - Wrapping the feature around an if (hdev) per Marcel's feedback.
> 
> Changes in v3:
> - Back to the original design of V1 and integrated Marcel's feedback.
> 
> Changes in v2:
> - Slight change of design based on offline feedback
> 
> net/bluetooth/mgmt.c | 26 ++++++++++++++++++++++++--
> 1 file changed, 24 insertions(+), 2 deletions(-)

I changed the code a little bit to make it simpler to read. See the modified v5 I just mailed to the mailing list.

Regards

Marcel

