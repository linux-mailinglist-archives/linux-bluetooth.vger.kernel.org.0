Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72559A3DFB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Aug 2019 20:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728221AbfH3Sw3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Aug 2019 14:52:29 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34661 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbfH3Sw2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Aug 2019 14:52:28 -0400
Received: from marcel-macbook.fritz.box (p4FEFC580.dip0.t-ipconnect.de [79.239.197.128])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3FA35CECE4;
        Fri, 30 Aug 2019 21:01:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH BlueZ] mesh: test AEAD at startup to check kernel support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190830182316.fo3nmzfvzk55rhnj@kynes>
Date:   Fri, 30 Aug 2019 20:52:26 +0200
Cc:     Brian Gix <brian.gix@intel.com>, linux-bluetooth@vger.kernel.org,
        inga.stotland@intel.com
Content-Transfer-Encoding: 8BIT
Message-Id: <3389022D-8306-4276-A715-C2906EB0D91F@holtmann.org>
References: <20190830173902.19953-1-brian.gix@intel.com>
 <20190830182316.fo3nmzfvzk55rhnj@kynes>
To:     =?utf-8?Q?Micha=C5=82_Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Michal,

>> One time test at startup to ensure either kernel version v4.9 or later,
>> *or* that required AES-CCM support has been back-ported. If support not
>> there, daemon will run without providing D-Bus service or attaching to
>> controllers (prevents systemd thrashing).
> 
> By the way - I have a patch that implements all required cryptographic
> operations using libcrypto, enabled by ./configure --with-openssl
> (disabled by default).
> 
> I know that last time we've talked about this, the consensus was that the
> vendor should patch meshd to work on older kernels, so we did exactly
> that - but maybe having this available in the mainline would be
> interesting?

we are not using anything from OpenSSL. That is a rabbit hole you are not getting back out of.

Regards

Marcel

