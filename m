Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D335E173278
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Feb 2020 09:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgB1IL5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Feb 2020 03:11:57 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42997 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgB1IL5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Feb 2020 03:11:57 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id BEB92CECF6;
        Fri, 28 Feb 2020 09:21:21 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [BlueZ PATCH v2] Add controller wideband speech query capability
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200227192228.120076-1-alainm@chromium.org>
Date:   Fri, 28 Feb 2020 09:11:54 +0100
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <BDF9261E-5C2C-481A-B97B-B897F73F7733@holtmann.org>
References: <20200227192228.120076-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change allows higher level HFP implementations to query the local
> controller's support for wide band speech.
> 
> ---
> 
> doc/mgmt-api.txt | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
> index a5a98609d..1e2ac13ce 100644
> --- a/doc/mgmt-api.txt
> +++ b/doc/mgmt-api.txt
> @@ -308,6 +308,7 @@ Read Controller Information Command
> 		14	Controller Configuration
> 		15	Static Address
> 		16	Phy Configuration
> +		17	Wide Band Speech Supported

lets call this just Wide Band Speech and add an additional mgmt command to enable/disable it while the controller is powered off.

Regards

Marcel

