Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAA41A091F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Aug 2019 19:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfH1R7S (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Aug 2019 13:59:18 -0400
Received: from mga06.intel.com ([134.134.136.31]:21186 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbfH1R7S (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Aug 2019 13:59:18 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 10:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; 
   d="scan'208";a="192679853"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga002.jf.intel.com with SMTP; 28 Aug 2019 10:59:14 -0700
Received: by stinkbox (sSMTP sendmail emulation); Wed, 28 Aug 2019 20:59:13 +0300
Date:   Wed, 28 Aug 2019 20:59:13 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Dan Streetman <dan.streetman@canonical.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Kay Sievers <kay.sievers@vrfy.org>,
        systemd-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
Subject: Re: Follow up on hid2hci: Fix udev rules for linux-4.14+
Message-ID: <20190828175913.GL7482@intel.com>
References: <CAOZ2QJOZStRYa=5fyod_AEJcJQw90_yX40dPYY3Dhvfso1e=RA@mail.gmail.com>
 <20190828175051.GK7482@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190828175051.GK7482@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Aug 28, 2019 at 08:50:51PM +0300, Ville Syrj�l� wrote:
> On Wed, Aug 28, 2019 at 01:34:07PM -0400, Dan Streetman wrote:
> > It looks like this patch got lost at some point:
> > https://lore.kernel.org/patchwork/patch/902126/#1138115
> > 
> > but it seems to still be a problem and I'd like to pull it into Ubuntu:
> > https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1759836
> > 
> > Ville, did you ever follow up with a v2 for that patch and/or do you
> > know if it will be accepted soon?
> 
> There's a more recent version of that somewhere on the mailing list.
> The problem is getting someone to actually apply it. Seems much harder
> than it should be...

https://lore.kernel.org/patchwork/patch/1021109/

> 
> And IIRC I also posted a few other fixes for hid2hci tool which didn't
> get any response from the crowd.

https://www.spinics.net/lists/linux-bluetooth/msg79803.html

-- 
Ville Syrj�l�
Intel
