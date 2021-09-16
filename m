Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B32540D09E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 Sep 2021 02:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhIPAJL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Sep 2021 20:09:11 -0400
Received: from mga18.intel.com ([134.134.136.126]:19965 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233336AbhIPAJK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Sep 2021 20:09:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="209542649"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="209542649"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 17:07:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="434311780"
Received: from vyellapa-mobl.amr.corp.intel.com ([10.209.32.240])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 17:07:50 -0700
Message-ID: <43903e27cc9562b795eeeecc761dc2edec12f73d.camel@linux.intel.com>
Subject: Re: [PATCH v4 3/4] Bluetooth: Fix passing NULL to PTR_ERR
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Date:   Wed, 15 Sep 2021 17:07:50 -0700
In-Reply-To: <20210915233600.4129808-3-luiz.dentz@gmail.com>
References: <20210915233600.4129808-1-luiz.dentz@gmail.com>
         <20210915233600.4129808-3-luiz.dentz@gmail.com>
Organization: Intel Corporation
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

On Wed, 2021-09-15 at 16:35 -0700, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Passing NULL to PTR_ERR will result in 0 (success), also since the likes of
> bt_skb_sendmsg does never return NULL it is safe to replace the instances of
> IS_ERR_OR_NULL with IS_ERR when checking its return.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Tested-by: Tedd Ho-Jeong An <tedd.an@intel.com>


