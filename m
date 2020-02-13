Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD39A15C974
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Feb 2020 18:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgBMReJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Feb 2020 12:34:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:43370 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727991AbgBMReI (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Feb 2020 12:34:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Feb 2020 09:34:08 -0800
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; 
   d="scan'208";a="238097267"
Received: from han1-mac01.jf.intel.com (HELO [10.7.201.134]) ([10.7.201.134])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Feb 2020 09:33:48 -0800
User-Agent: Microsoft-MacOutlook/10.22.0.200209
Date:   Thu, 13 Feb 2020 09:33:47 -0800
Subject: Re: [RFC v3] Bluetooth: Add debugfs option to enable runtime debug
 statements
From:   Tedd An <tedd.an@linux.intel.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Message-ID: <A923F940-6CAA-4D31-AAEF-28F5A2312676@linux.intel.com>
Thread-Topic: [RFC v3] Bluetooth: Add debugfs option to enable runtime debug
 statements
References: <20200203153603.61931-1-marcel@holtmann.org>
 <AF6B4197-8AFE-429A-ACFB-14500A7D500F@holtmann.org>
In-Reply-To: <AF6B4197-8AFE-429A-ACFB-14500A7D500F@holtmann.org>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: 8BIT
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,
    
I have some cycle today and tomorrow and I can run quick test.
Is there any procedure you want me to test other than enabling kernel config and enable via debugfs?
Let me know.
    
Regards,
Tedd

﻿On 2/12/20, 11:31 PM, "Marcel Holtmann" <linux-bluetooth-owner@vger.kernel.org on behalf of marcel@holtmann.org> wrote:

    Hi,
    
    > Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
    > ---
    > include/net/bluetooth/bluetooth.h | 10 +++++
    > net/bluetooth/Kconfig             |  7 +++
    > net/bluetooth/af_bluetooth.c      |  2 +
    > net/bluetooth/lib.c               | 73 +++++++++++++++++++++++++++++++
    > 4 files changed, 92 insertions(+)
    
    does anybody have any comments on this. It is not the final solution, but as an interim it might be a good start.
    
    I have not seen any kbuild issues popping up. However I like to get some Tested-By, Reviewed-By lines added to the patch and I can send a patch version with proper commit message if there is interest in getting this upstream.
    
    Regards
    
    Marcel
    
    


