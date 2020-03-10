Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E6517EFFB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Mar 2020 06:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgCJFYX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Mar 2020 01:24:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51115 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgCJFYX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Mar 2020 01:24:23 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6A652CECC8;
        Tue, 10 Mar 2020 06:33:50 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [BlueZ PATCH 0/2] HID and HOGP connections from non-bonded
 devices.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200310023516.209146-1-alainm@chromium.org>
Date:   Tue, 10 Mar 2020 06:24:21 +0100
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <87A4E633-63CF-4C71-9BF6-916894790EED@holtmann.org>
References: <20200310023516.209146-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> It was discovered that BlueZ's HID and HOGP profiles implementations
> don't specifically require bonding between the device and the host.
> 
> This creates an opportunity for an malicious device to connect to a
> target host to either impersonate an existing HID device without
> security or to cause an SDP or GATT service discovery to take place
> which would allow HID reports to be injected to the input subsystem from
> a non-bonded source.
> 
> This patch series addresses the issue by ensuring that only connections
> from devices that are bonded are accepted by the HID and HOGP profile
> implementation.
> 
> More information about the vulnerability is available here:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html
> 
> Alain Michaud (2):
>  HOGP must only accept data from bonded devices.
>  HID accepts bonded device connections only.
> 
> profiles/input/device.c   | 23 ++++++++++++++++++++++-
> profiles/input/device.h   |  1 +
> profiles/input/hog.c      |  4 ++++
> profiles/input/input.conf |  8 ++++++++
> profiles/input/manager.c  | 13 ++++++++++++-
> 5 files changed, 47 insertions(+), 2 deletions(-)

both patches have been applied.

However I changed BrBondedOnly configuration name into ClassicBondedOnly since that name seemed more obvious to me. The prefix Br has never been used and the Bluetooth SIG started calling it Classic a while back.

Regards

Marcel

