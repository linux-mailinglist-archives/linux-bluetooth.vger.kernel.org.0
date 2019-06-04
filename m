Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8833469F
	for <lists+linux-bluetooth@lfdr.de>; Tue,  4 Jun 2019 14:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbfFDM0o (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 4 Jun 2019 08:26:44 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47429 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfFDM0o (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 4 Jun 2019 08:26:44 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 768CF20006;
        Tue,  4 Jun 2019 12:26:40 +0000 (UTC)
Message-ID: <eed1d21883c605b92abe2b13cf658454444c9d39.camel@hadess.net>
Subject: Re: [RFC] Bluetooth: Check key sizes only when Secure Simple
 Pairing is enabled
From:   Bastien Nocera <hadess@hadess.net>
To:     Vasily Khoruzhick <anarsoul@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>
Cc:     "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>
Date:   Tue, 04 Jun 2019 14:26:39 +0200
In-Reply-To: <CA+E=qVcW0aQ=D_0bvEbTL9VA5P_2iykbZpNr2xH8P-eHB3FSog@mail.gmail.com>
References: <20190522070540.48895-1-marcel@holtmann.org>
         <CA+E=qVcW0aQ=D_0bvEbTL9VA5P_2iykbZpNr2xH8P-eHB3FSog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2019-05-23 at 07:53 -0700, Vasily Khoruzhick wrote:
> On Wed, May 22, 2019 at 12:05 AM Marcel Holtmann <marcel@holtmann.org
> > wrote:
> > The encryption is only mandatory to be enforced when both sides are
> > using
> > Secure Simple Pairing and this means the key size check makes only
> > sense
> > in that case.
> > 
> > On legacy Bluetooth 2.0 and earlier devices like mice the
> > encryption was
> > optional and thus causing an issue if the key size check is not
> > bound to
> > using Secure Simple Pairing.
> > 
> > Fixes: d5bb334a8e17 ("Bluetooth: Align minimum encryption key size
> > for LE and BR/EDR connections")
> > Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> > Cc: stable@vger.kernel.org
> 
> Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>

I've asked for this patch to be included in the current Fedora release:
https://lists.fedoraproject.org/archives/list/kernel@lists.fedoraproject.org/thread/YE5OGFZRDJL2TFJK3RWU7AAWV3PFRMNB/

Hopefully, that means that it gets a bit more testing and gets merged upstream.

Cheers

