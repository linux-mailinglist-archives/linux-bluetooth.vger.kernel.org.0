Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164A1107531
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Nov 2019 16:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfKVPuE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Nov 2019 10:50:04 -0500
Received: from jax4mhob12.myregisteredsite.com ([64.69.218.92]:58782 "EHLO
        jax4mhob12.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726546AbfKVPuE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Nov 2019 10:50:04 -0500
Received: from mailpod.hostingplatform.com (atl4qobmail01pod5.registeredsite.com [10.30.71.94])
        by jax4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id xAMFo2Lt027545
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Nov 2019 10:50:02 -0500
Received: (qmail 26583 invoked by uid 0); 22 Nov 2019 15:50:02 -0000
X-TCPREMOTEIP: 65.41.18.216
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@65.41.18.216)
  by 0 with ESMTPA; 22 Nov 2019 15:50:02 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 2A24F154053A;
        Fri, 22 Nov 2019 10:50:01 -0500 (EST)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8m5A20egTLyO; Fri, 22 Nov 2019 10:49:54 -0500 (EST)
Received: from nm-ws (unknown [192.168.2.3])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTPS id 4AB7C15402C2;
        Fri, 22 Nov 2019 10:49:54 -0500 (EST)
Message-ID: <6eadd7b2742ebb018c46d51c8d0588eda9321f47.camel@ewol.com>
Subject: Re: [PATCH BlueZ] tools/mesh-cfgclient: Fix signatures in agent
 methods
From:   Steve Brown <sbrown@ewol.com>
To:     Inga Stotland <inga.stotland@intel.com>,
        linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com
Date:   Fri, 22 Nov 2019 08:49:52 -0700
In-Reply-To: <20191122153816.8430-1-inga.stotland@intel.com>
References: <20191122153816.8430-1-inga.stotland@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Inga,

On Fri, 2019-11-22 at 07:38 -0800, Inga Stotland wrote:
> This removes an extra return parameter from PromptNumeric and
> PromptStatic
> method signatures. Also, style fixes.
> ---
>  tools/mesh-cfgclient.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Fixed my SIGSEGV issue.

Thanks,

Steve

