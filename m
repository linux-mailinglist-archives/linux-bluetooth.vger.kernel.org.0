Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9C126D801
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Sep 2020 11:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgIQJrV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Sep 2020 05:47:21 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52592 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgIQJrU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Sep 2020 05:47:20 -0400
X-Greylist: delayed 2229 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 05:47:20 EDT
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 96A3C3A3028
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Sep 2020 08:56:29 +0000 (UTC)
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8C0F620010;
        Thu, 17 Sep 2020 08:56:06 +0000 (UTC)
Message-ID: <f1be58f4af1465d4790990b9b310ca394e63f2a9.camel@hadess.net>
Subject: Re: [PATCH BlueZ v2] sixaxis: Fix crash caused by return of
 udev_device_get_property_value
From:   Bastien Nocera <hadess@hadess.net>
To:     Sonny Sasaka <sonnysasaka@chromium.org>,
        linux-bluetooth@vger.kernel.org
Cc:     Miao-chen Chou <mcchou@chromium.org>,
        Yoni Shavit <yshavit@chromium.org>,
        Alain Michaud <alainm@chromium.org>
Date:   Thu, 17 Sep 2020 10:56:05 +0200
In-Reply-To: <20200916223453.22537-1-sonnysasaka@chromium.org>
References: <20200916223453.22537-1-sonnysasaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.37.90 (3.37.90-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2020-09-16 at 15:34 -0700, Sonny Sasaka wrote:
> From: Miao-chen Chou <mcchou@chromium.org>
> 
> This adds a NULL check before calling sscanf().
> 
> Reviewed-by: Yoni Shavit <yshavit@chromium.org>
> Reviewed-by: Alain Michaud <alainm@chromium.org>

Looks good.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

