Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9983B89FCB
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Aug 2019 15:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbfHLNgq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Aug 2019 09:36:46 -0400
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net ([173.201.192.102]:36689
        "EHLO p3plsmtpa06-01.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726502AbfHLNgq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Aug 2019 09:36:46 -0400
Received: from JROmen ([199.48.138.4])
        by :SMTPAUTH: with ESMTPA
        id xAVBh07bGAihHxAVBhJM7R; Mon, 12 Aug 2019 06:36:46 -0700
From:   "John Rucker" <John.Rucker@Solar-Current.com>
To:     <linux-bluetooth@vger.kernel.org>
References: 
In-Reply-To: 
Subject: D-Bus API based peripheral need guidance on setting Advertising_Interval_Min and Advertising_Interval_Max
Date:   Mon, 12 Aug 2019 08:36:45 -0500
Message-ID: <004301d55112$fc557da0$f50078e0$@Solar-Current.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdVMTTlRUt+lQCh8RqCxvUgdLPGzbwExZoxw
Content-Language: en-us
X-CMAE-Envelope: MS4wfIMVEjrJ82xlEtGdv4yPZfwrTxI8mYNN9TA+Oqmbe/OJmreUgL6gSzctwIdJhf9TKdecsRgSCG7wZJgNCaQotkhHpofBW0aQgOCHpzXCszj7vDGuUE9h
 OXgqql9adzi11WGHz4rFvlJoOacfOir2kbDKYkCDxEYe5+dClPjjJngWpepvu7BUdcXoGUwTPQujog==
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I have a BLE peripheral running on top of Raspbian Buster, Kernel version
4.19 and BlueZ v 5.50.  I need to set the advertising interval from the
default 1.2 seconds to a much more aggressive setting say 200mS.  Can
someone please give my guidance on the best way to achieve this.   The only
way I can find to do this is to completely setup my advertising packet with
the HCI tool.  I have to be missing something. Is there a way to simply
change the default advertising interval?  

Thanks 
JR

