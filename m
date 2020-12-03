Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFBA12CD859
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Dec 2020 15:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgLCOAc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Dec 2020 09:00:32 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:37112 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgLCOAc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Dec 2020 09:00:32 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 69D48CECFD;
        Thu,  3 Dec 2020 15:07:04 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v3 0/1] Bluetooth: btusb: Add workaround for Barrot
 8041a02 fake CSR controllers
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201203110944.49307-1-hdegoede@redhat.com>
Date:   Thu, 3 Dec 2020 14:59:49 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Ismael Ferreras Morezuelas <swyterzone@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3E5CD8EE-DB58-4900-BECA-CDEA3E03AD27@holtmann.org>
References: <20201203110944.49307-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hans,

> Here is a new version of my patch to make fake CSR controllers with a
> Barrot 8041a02 chip work under Linux.
> 
> Changes since the previous version:
> 
> - Post as a separate patch, instead of together with the unrelated fix
>  for a regression on some other fake CSR devices
> - Add info about which fake CSR chip this happens on to the commit message
>  and source code comment
> - Only apply the workaround on this specific chip

can you send the full series? The kbot seems to be complaining.

Regards

Marcel

