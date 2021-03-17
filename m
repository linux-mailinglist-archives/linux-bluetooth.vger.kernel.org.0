Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E706233EBA4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Mar 2021 09:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbhCQIiW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Mar 2021 04:38:22 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:43152 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbhCQIiD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Mar 2021 04:38:03 -0400
Received: from mac-pro.holtmann.net (p4fefcec1.dip0.t-ipconnect.de [79.239.206.193])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1BA95CECFD;
        Wed, 17 Mar 2021 09:45:39 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH BlueZ] build: Fix build with latest tree
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210316205838.2164464-1-luiz.dentz@gmail.com>
Date:   Wed, 17 Mar 2021 09:38:01 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <FD38AD5A-FADA-4EBB-AC7C-BD91F50EE248@holtmann.org>
References: <20210316205838.2164464-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Latest ell tree has introduced useful.h and main-private.h which are
> required to build:
> 
> ell/cert-crypto.c:35:10: fatal error: useful.h: No such file or
> directory
>   35 | #include "useful.h"
>         |          ^~~~~~~~~~
> ...
> ---
> Makefile.am | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile.am b/Makefile.am
> index ff0df2196..7fce2e7c0 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -135,7 +135,9 @@ ell_headers = ell/util.h \
> 			ell/asn1-private.h \
> 			ell/cert-private.h \
> 			ell/pem-private.h \
> -			ell/uuid.h
> +			ell/uuid.h \
> +			ell/useful.h \
> +			ell/main-private.h
> 

this is the wrong fix. It will break in the tarballs. ELL will not install ell/useful.h ever. So every tarball needs to ensure that ell/useful.h is included. Which means you need to follow the fix from iwd here.

Regards

Marcel

