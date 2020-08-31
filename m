Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06222257E02
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Aug 2020 17:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgHaPvz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 11:51:55 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45686 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgHaPvy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 11:51:54 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id B9316CECCD;
        Mon, 31 Aug 2020 18:02:00 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [Bluez PATCH v1 3/3] advertising: Add adv SupportedFeatures to
 doc
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200826131610.Bluez.v1.3.Ieb6522963e3f54b0d63dd88ed3ce24a8942ed73e@changeid>
Date:   Mon, 31 Aug 2020 17:51:50 +0200
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Miao-chen Chou <mcchou@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <96B41EB6-D184-492E-84E7-1E3C4E8F6327@holtmann.org>
References: <20200826201715.1911816-1-danielwinkler@google.com>
 <20200826131610.Bluez.v1.3.Ieb6522963e3f54b0d63dd88ed3ce24a8942ed73e@changeid>
To:     Daniel Winkler <danielwinkler@google.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Daniel,

> Reviewed-by: Miao-chen Chou <mcchou@chromium.org>
> ---
> 
> doc/advertising-api.txt | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
> 
> diff --git a/doc/advertising-api.txt b/doc/advertising-api.txt
> index b0565eab2..0c07f349e 100644
> --- a/doc/advertising-api.txt
> +++ b/doc/advertising-api.txt
> @@ -209,3 +209,21 @@ Properties	byte ActiveInstances
> 			Possible values: "1M"
> 					 "2M"
> 					 "Coded"
> +
> +		array{string} SupportedFeatures [readonly, optional]
> +
> +			List of supported platform features. If no features
> +			are available on the platform, the SupportedFeatures
> +			endpoint will not be populated.

why not just an empty SupportedFeatures? So you can tell that at least the daemon has support for it, but the hardware does not.

Regards

Marcel

