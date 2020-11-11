Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573732AEF0A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Nov 2020 11:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgKKK4o convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Nov 2020 05:56:44 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:56818 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgKKK4o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Nov 2020 05:56:44 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.201.106])
        by mail.holtmann.org (Postfix) with ESMTPSA id 192F8CECFC;
        Wed, 11 Nov 2020 12:03:52 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] Fix for Bluetooth SIG test L2CAP/COS/CFD/BV-14-C.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201102132733.GA77385@jimmy-ryzen-home>
Date:   Wed, 11 Nov 2020 11:56:42 +0100
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, kuba@kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <9A45D33C-94D3-4358-A791-CBB6D36B3735@holtmann.org>
References: <20201102132733.GA77385@jimmy-ryzen-home>
To:     Jimmy Wahlberg <jimmywa@spotify.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Jimmy,

> This test case is meant to verify that multiple
> unknown options is included in the response.
> 
> Unknown options shall be in the response if
> they are not hints according to Bluetooth Core
> Spec v5.2. See chapter 4.5 L2CAP_CONFIGURATION_RSP

please create a commit message that has extracts from the before and after of btmon trace.

Regards

Marcel

