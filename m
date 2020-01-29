Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C201214C7CB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Jan 2020 10:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgA2JBe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Jan 2020 04:01:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:59289 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgA2JBe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Jan 2020 04:01:34 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6E5CFCECB0;
        Wed, 29 Jan 2020 10:10:53 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: bluetooth: If unknown option in L2CAP Configuration Request is a
 hint, Bluetooth stack responds with "Command Reject" instead of
 "Configuration Response"
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <308de3c58372c552ec9e170e3020f05bbe7f4908.camel@peiker-cee.de>
Date:   Wed, 29 Jan 2020 10:01:32 +0100
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <D622428A-4FE1-4D5A-A454-11753C5AE141@holtmann.org>
References: <3020b8d0c7d39428aec573153b3c3414213be7ce.camel@peiker-cee.de>
 <89F234DA-089E-4F45-9D32-7A09CC52E8CD@holtmann.org>
 <308de3c58372c552ec9e170e3020f05bbe7f4908.camel@peiker-cee.de>
To:     Konstantin Forostyan <konstantin.forostyan@peiker-cee.de>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Konstantin,

> Unfortunately, I don't have a possibility to test 5.5 kernel. As far as
> I can see, the most recent version available to the public via
> git.kernel.org is 5.3-rc3 and the problematic part in
> /net/bluetooth/l2cap_core.c file is the same for 4.20 and 5.3-rc3.
> Hence I suppose it will behave the same way as 4.20.

can you include the btmon trace for the PTS test case so that I see what PTS sends and what we are responding.

Regards

Marcel

