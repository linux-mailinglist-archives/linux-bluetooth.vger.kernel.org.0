Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CE9242922
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Aug 2020 14:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgHLMLY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Aug 2020 08:11:24 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46894 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgHLMLY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Aug 2020 08:11:24 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id D023CCECDC;
        Wed, 12 Aug 2020 14:21:27 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [Bluez PATCH v1] input: Don't browse SDP if HIDSDPDisable is set
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200812121946.Bluez.v1.1.I254123a1c85e8cb22739cbbb1ffa2f56ac41faa8@changeid>
Date:   Wed, 12 Aug 2020 14:11:22 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <DCC53118-15F0-47E1-9539-9484D32593E9@holtmann.org>
References: <20200812121946.Bluez.v1.1.I254123a1c85e8cb22739cbbb1ffa2f56ac41faa8@changeid>
To:     Archie Pusaka <apusaka@google.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

> According to the HID1.1 spec, part 5.3.4.9:
> The HIDSDPDisable attribute is a Boolean value, which indicates
> whether connection to the SDP channel and Control or Interrupt
> channels are mutually exclusive. This feature supports Bluetooth
> HID devices that have minimal resources, and multiplex those
> resources between servicing the initialization (SDP) and runtime
> (Control and Interrupt) channels.
> 
> However, Bluez still tries to connect SDP upon HID connection,
> regardless of the existence of the HIDSDPDisable attribute.
> 
> This patch prevents the connection of SDP after HID has been
> established, if the device has HIDSDPDisable attribute.

out of curiosity, is a qualification test failing or do you have devices that really enforce the Disable SDP part of the specification. A long long long time ago (we are talking 15+ years) some HID devices only allowed 2 L2CAP channels to be open at the same time. So the PSM 1 for SDP needed to be closed before opening the second HID data channel.

If this is failing devices, it would be good to include the btmon trace of failure in the commit message so that we archive this.

Regards

Marcel

