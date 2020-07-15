Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B8B2216BD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jul 2020 23:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGOVDN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jul 2020 17:03:13 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:40369 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgGOVDN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jul 2020 17:03:13 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 365C540004;
        Wed, 15 Jul 2020 21:03:11 +0000 (UTC)
Message-ID: <bb693f5768e9d36f19000c0e303dbc8e9c9273d1.camel@hadess.net>
Subject: Re: [PATCH BlueZ 1/2] device: Add timer for removing temporary
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Date:   Wed, 15 Jul 2020 23:03:11 +0200
In-Reply-To: <20200715204635.755599-1-luiz.dentz@gmail.com>
References: <20200715204635.755599-1-luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2020-07-15 at 13:46 -0700, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds a timer for how long to keep temporary devices, it is
> updated
> everytime the device is seen so devices will be removed even during
> an
> active discovery session which means the discovering for a long
> period
> will no longer just grow without removing devices that disappeared.

Both patches look good to me.

Cheers

