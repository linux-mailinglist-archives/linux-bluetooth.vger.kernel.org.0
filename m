Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D43F94DD71A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Mar 2022 10:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbiCRJbs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Mar 2022 05:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbiCRJbs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Mar 2022 05:31:48 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD2112E711C
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Mar 2022 02:30:27 -0700 (PDT)
Received: from smtpclient.apple (p5b3d2183.dip0.t-ipconnect.de [91.61.33.131])
        by mail.holtmann.org (Postfix) with ESMTPSA id 971C9CED24;
        Fri, 18 Mar 2022 10:30:26 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH resend 1/1] Bluetooth: hci_bcm: Add the Asus TF103C to the
 bcm_broken_irq_dmi_table
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220228113841.476174-2-hdegoede@redhat.com>
Date:   Fri, 18 Mar 2022 10:30:26 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <51F73771-8EA5-4A2D-8B22-B74E5324F7CD@holtmann.org>
References: <20220228113841.476174-1-hdegoede@redhat.com>
 <20220228113841.476174-2-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hans,

> The DSDT for the Asus TF103C specifies a IOAPIC IRQ for the HCI -> host IRQ
> but this is not correct. Unlike the previous entries in the table, this
> time the correct GPIO to use instead is known; and the TF103C is battery
> powered making runtime-pm support more important.
> 
> Extend the bcm_broken_irq_dmi_table mechanism to allow specifying the right
> GPIO instead of just always disabling runtime-pm and add an entry to it for
> the Asus TF103C.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> drivers/bluetooth/hci_bcm.c | 44 ++++++++++++++++++++++++++++++-------
> 1 file changed, 36 insertions(+), 8 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

