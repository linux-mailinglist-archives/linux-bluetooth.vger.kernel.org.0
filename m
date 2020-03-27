Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4206C19586B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Mar 2020 14:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbgC0N4d (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Mar 2020 09:56:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58660 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgC0N4d (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Mar 2020 09:56:33 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id A4AABCECF1;
        Fri, 27 Mar 2020 15:06:03 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [Bluez PATCH v1] monitor:Adding missing settings descriptions in
 btmon.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200327135451.18972-1-alainm@chromium.org>
Date:   Fri, 27 Mar 2020 14:56:30 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <150F59EF-1F80-4456-BB33-7DCCF6326635@holtmann.org>
References: <20200327135451.18972-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds the missing settings descriptions from btmon.
> 
> ---
> 
> monitor/control.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/monitor/control.c b/monitor/control.c
> index 1e9054db3..4907c1c0a 100644
> --- a/monitor/control.c
> +++ b/monitor/control.c
> @@ -200,7 +200,7 @@ static const char *settings_str[] = {
> 	"powered", "connectable", "fast-connectable", "discoverable",
> 	"bondable", "link-security", "ssp", "br/edr", "hs", "le",
> 	"advertising", "secure-conn", "debug-keys", "privacy",
> -	"configuration", "static-addr",
> +	"configuration", "static-addr", "phy-configuration", "wbs"
> };

can you shortcut phy-configuration to just phy please.

Regards

Marcel

