Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D551A42C5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Apr 2020 08:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgDJG5i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Apr 2020 02:57:38 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50977 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgDJG5i (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Apr 2020 02:57:38 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id BEE2ECED05;
        Fri, 10 Apr 2020 09:07:12 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/5] D-Bus API changes for managing SDP records
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAOxioNnBq3J_F63RNHZfQzKOcwSmVy2igJ6zCfgBH+zcL1kaCw@mail.gmail.com>
Date:   Fri, 10 Apr 2020 08:57:37 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Rahul Chaturvedi <rkc@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <C64E8BFB-F3B1-47AE-8CC7-6DAEFF255194@holtmann.org>
References: <20200401221434.12185-1-sonnysasaka@chromium.org>
 <ACB5D50F-BAD5-435A-AD1C-58A16878C310@holtmann.org>
 <CAOxioNnBq3J_F63RNHZfQzKOcwSmVy2igJ6zCfgBH+zcL1kaCw@mail.gmail.com>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> This was needed to support emulation of Android apps's Bluetooth API
> on top of BlueZ. Android expects to be able to access the SDP database
> of a remote device via its HAL interface
> (https://android.googlesource.com/platform/system/bt/+/master/include/hardware/bt_sdp.h#38).
> 
> Thanks for the feedback, we will revisit this and see if a redesign
> based on your suggestion is possible.

if you can get this done by using existing APIs and the Profile API, then that would be best. I would have to get myself a bit more familiar with the Android APIs. However in the worst case, we can introduce an Android specific D-Bus API as part of a plugin. It would be then disabled in standard Linux systems.

From BlueZ for Android project, we fundamentally took the Android HAL parts 1:1 and mapped them to a Unix based protocol. Then the Android bluetoothd had to do the rest of the work. A similar approach (and using D-Bus) might be most efficient here actually.

However as Luiz noted, we need to be careful that bluetoothd system services / profiles are not messed with. Meaning bluetoothd has to play guardian on what Android apps can do.

On a side note, I am going to remove the BlueZ for Android code from the tree. Let me know if you find parts of it still useful. It is git, so we can always bring it back, but if you already have some idea on how to utilize it, feel free to start with that right away.

Regards

Marcel

