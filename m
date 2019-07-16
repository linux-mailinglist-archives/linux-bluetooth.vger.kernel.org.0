Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 109676A0EC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jul 2019 05:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730750AbfGPDn4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Jul 2019 23:43:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:45202 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730311AbfGPDnz (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Jul 2019 23:43:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jul 2019 20:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,496,1557212400"; 
   d="scan'208";a="194745143"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2019 20:43:55 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 15 Jul 2019 20:43:55 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 15 Jul 2019 20:43:54 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.46]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.209]) with mapi id 14.03.0439.000;
 Tue, 16 Jul 2019 09:13:48 +0530
From:   "K, SpoorthiX" <spoorthix.k@intel.com>
To:     Marcel Holtmann <marcel@holtmann.org>
CC:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Panda, Bharat B" <bharat.b.panda@intel.com>
Subject: RE: [PATCH] v3 Fast Advertising Interval
Thread-Topic: [PATCH] v3 Fast Advertising Interval
Thread-Index: AQHVOzC21jT/WV5Po0ye7D/nfBvTLabMmohA
Date:   Tue, 16 Jul 2019 03:43:46 +0000
Message-ID: <6AFF54953E047B42BC60A96154D42C5CD472A6@BGSMSX101.gar.corp.intel.com>
References: <1563190522-23651-1-git-send-email-spoorthix.k@intel.com>
 <FBF9BD43-EE1B-4D20-853C-19301B5573A0@holtmann.org>
In-Reply-To: <FBF9BD43-EE1B-4D20-853C-19301B5573A0@holtmann.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

	Thank you for applying the patch.

Regards,
Spoorthi

-----Original Message-----
From: Marcel Holtmann [mailto:marcel@holtmann.org] 
Sent: Monday, July 15, 2019 10:44 PM
To: K, SpoorthiX <spoorthix.k@intel.com>
Cc: linux-bluetooth@vger.kernel.org; Panda, Bharat B <bharat.b.panda@intel.com>
Subject: Re: [PATCH] v3 Fast Advertising Interval

Hi Spoorthi,

> Changes made to add support for fast advertising interval as per core 
> 4.1 specification, section 9.3.11.2.
> 
> A peripheral device entering any of the following GAP modes and 
> sending either non-connectable advertising events or scannable 
> undirected advertising events should use adv_fast_interval2 (100ms - 
> 150ms) for adv_fast_period(30s).
> 
>         - Non-Discoverable Mode
>         - Non-Connectable Mode
>         - Limited Discoverable Mode
>         - General Discoverable Mode
> 
> Signed-off-by: Spoorthi Ravishankar Koppad <spoorthix.k@intel.com>
> ---
> include/net/bluetooth/hci_core.h |  2 ++
> net/bluetooth/hci_request.c      | 32 ++++++++++++++++++++++----------
> 2 files changed, 24 insertions(+), 10 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

