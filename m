Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1167B3A2BF9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Jun 2021 14:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFJMxs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Jun 2021 08:53:48 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42339 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhFJMxr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Jun 2021 08:53:47 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1A948E0018;
        Thu, 10 Jun 2021 12:51:49 +0000 (UTC)
Message-ID: <e2e0ef088416fdc37d240c2b7b3e348d8179db86.camel@hadess.net>
Subject: Re: [PATCH] rfkill: Fix reading from rfkill socket
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Berg <benjamin@sipsolutions.net>,
        linux-bluetooth@vger.kernel.org
Cc:     Benjamin Berg <bberg@redhat.com>
Date:   Thu, 10 Jun 2021 14:51:49 +0200
In-Reply-To: <fe5e3c7519a52aa59e33939c64e9aa4b7c5e30c3.camel@hadess.net>
References: <20210503131210.90066-1-benjamin@sipsolutions.net>
         <fe5e3c7519a52aa59e33939c64e9aa4b7c5e30c3.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2021-06-10 at 14:45 +0200, Bastien Nocera wrote:
> On Mon, 2021-05-03 at 15:12 +0200, Benjamin Berg wrote:
> > From: Benjamin Berg <bberg@redhat.com>
> > 
> > The kernel will always send exactly one event, but the size of the
> > passed struct will depend on the length of the submitted read() and
> > the
> > kernel version. i.e. the interface can be extended and we need to
> > expect
> > for a read to be longer than expected if we ask for it.
> > 
> > Fix this by only requesting the needed length and explicitly check
> > the
> > length against the V1 version of the structure to make the code a bit
> > more future proof in case the internal copy of the struct is updated
> > to
> > contain new fields.
> 
> This fixes a bug in GNOME where to enable Bluetooth, we removed a soft
> rfkill block on the Bluetooth interface.
> 
> Without this, the bluetooth rfkill gets unblocked, but bluetoothd
> doesn't see it as unblocked so never powers it on, causing the UI to
> appear broken, as we expect Bluetooth devices to be either blocked
> through rfkill, or powered on.
> 
> The equivalent gnome-settings-daemon fix (which deals with rfkill) was
> reviewed by Hans de Goede:
> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/234
> 
> Benjamin, it might be worth resending this with a better commit message
> explaining exactly what it fixes and referencing the gnome-bluetooth
> bug:
> https://gitlab.gnome.org/GNOME/gnome-bluetooth/-/issues/38

> 
It's also been pushed to Fedora rawhide and Fedora 34:
https://bodhi.fedoraproject.org/updates/FEDORA-2021-2cd83da751

