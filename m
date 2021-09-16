Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B6940D09F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 Sep 2021 02:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhIPAJ7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Sep 2021 20:09:59 -0400
Received: from mga11.intel.com ([192.55.52.93]:51008 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232465AbhIPAJ6 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Sep 2021 20:09:58 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219267784"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="219267784"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 17:08:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="529864584"
Received: from vyellapa-mobl.amr.corp.intel.com ([10.209.32.240])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 17:08:37 -0700
Message-ID: <04b4f1b1310bb6db0aa7a4adfb49bda8dc49db2c.camel@linux.intel.com>
Subject: Re: [PATCH v4 4/4] Bluetooth: SCO: Fix sco_send_frame returning
 skb->len
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Date:   Wed, 15 Sep 2021 17:08:35 -0700
In-Reply-To: <20210915233600.4129808-4-luiz.dentz@gmail.com>
References: <20210915233600.4129808-1-luiz.dentz@gmail.com>
         <20210915233600.4129808-4-luiz.dentz@gmail.com>
Organization: Intel Corporation
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Wed, 2021-09-15 at 16:36 -0700, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The skb in modified by hci_send_sco which pushes SCO headers thus
> changing skb->len causing sco_sock_sendmsg to fail.
> 
> Fixes: 0771cbb3b97d ("Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Tested-by: Tedd Ho-Jeong An <tedd.an@intel.com>


