Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832681F78DC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 15:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFLNqg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 09:46:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58595 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgFLNqg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 09:46:36 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id 68A8BCED04;
        Fri, 12 Jun 2020 15:56:24 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/3] bluetooth:centralize default value initialization.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200611020157.70230-3-alainm@chromium.org>
Date:   Fri, 12 Jun 2020 15:46:33 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Transfer-Encoding: 7bit
Message-Id: <48F02BEA-45E3-4045-8A46-80F1B5130E5A@holtmann.org>
References: <20200611020157.70230-1-alainm@chromium.org>
 <20200611020157.70230-3-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

please use Bluetooth: as subject prefix.

> This patch centralized the initialization of default parameters.  This
> is required to allow clients to more easily customize the default
> system parameters.
> 
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Alain Michaud <alainm@chromium.org>

Other way around please.

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
> include/net/bluetooth/hci_core.h | 18 ++++++++++++++++++
> net/bluetooth/hci_conn.c         | 14 ++++----------
> net/bluetooth/hci_core.c         | 14 +++++++++++++-
> net/bluetooth/hci_request.c      | 15 +++++----------
> 4 files changed, 40 insertions(+), 21 deletions(-)

Patch has been applied to bluetooth-next tree.

Regards

Marcel

