Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014DC2C047D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Nov 2020 12:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgKWL0e (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 23 Nov 2020 06:26:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52848 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728509AbgKWL0e (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 23 Nov 2020 06:26:34 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7BEDECECCF;
        Mon, 23 Nov 2020 12:33:44 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH] Bluetooth: hci_h5: Add OBDA0623 ACPI HID
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201122103323.26116-1-hdegoede@redhat.com>
Date:   Mon, 23 Nov 2020 12:26:32 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8161E14C-50E7-41BB-BAE5-D8CDD533A9E4@holtmann.org>
References: <20201122103323.26116-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hans,

> Add OBDA0623 ACPI HID to the acpi_device_id table. This HID is used
> for the RTL8723BS Bluetooth part on the Acer Switch 10E SW3-016.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1665610
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> drivers/bluetooth/hci_h5.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

