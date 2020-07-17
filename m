Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7BA224539
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jul 2020 22:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgGQUcn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jul 2020 16:32:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:2113 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726510AbgGQUcm (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jul 2020 16:32:42 -0400
IronPort-SDR: 7tO5FxpnGBEJmCtfVfz7C0jw+AMlBHKKxK8EEQuDTlyNZlRV27Of4CsumHgCOl0z7EOqsEEV2s
 G5JmUoQFObCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="148838010"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; 
   d="scan'208";a="148838010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 13:32:42 -0700
IronPort-SDR: jUqe6VIU5KO2Csf6fLCX273pxhcYanHtlVNrJLROxKK4V3ubSsWQv7GIQFTu4gGvd5HdFyrFaa
 r99teEklcoWA==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; 
   d="scan'208";a="325524639"
Received: from han1-mobl3.jf.intel.com ([10.254.113.127])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 13:32:42 -0700
Message-ID: <dac373c76940dbf30302a1420fceaf7a01e00397.camel@linux.intel.com>
Subject: Re: [BlueZ,1/5] shared/att: Fix possible crash on disconnect
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     "Von Dentz, Luiz" <luiz.von.dentz@intel.com>
Cc:     linux-bluetooth@vger.kernel.org
Date:   Fri, 17 Jul 2020 13:32:41 -0700
In-Reply-To: <5f11facb.1c69fb81.6f815.57f7@mx.google.com>
References: <20200717191515.220621-1-luiz.dentz@gmail.com>
         <5f11facb.1c69fb81.6f815.57f7@mx.google.com>
Organization: Intel Corporation
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

The failure is from test-gatt

DEBUG   :FAIL: unit/test-gatt

I will update the CI to include the test result.

Regards,
Tedd

On Fri, 2020-07-17 at 12:23 -0700, bluez.test.bot@gmail.com wrote:
> This is automated email and please do not reply to this email!
> 
> Dear submitter,
> 
> Thank you for submitting the patches to the linux bluetooth mailing list.
> While we are preparing for reviewing the patches, we found the following
> issue/warning.
> 
> Test Result:
> makecheck Failed
> 
> Outputs:
> ./test-driver: line 107: 14830 Bus error               (core dumped) "$@" >
> $log_file 2>&1
> make[3]: *** [Makefile:9726: test-suite.log] Error 1
> make[2]: *** [Makefile:9834: check-TESTS] Error 2
> make[1]: *** [Makefile:10228: check-am] Error 2
> make: *** [Makefile:10230: check] Error 2
> 
> 
> 
> ---
> Regards,
> Linux Bluetooth

