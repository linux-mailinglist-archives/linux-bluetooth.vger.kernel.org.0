Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AECD406797
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Sep 2021 09:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhIJH0y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Sep 2021 03:26:54 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60033 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhIJH0x (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Sep 2021 03:26:53 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id CCC41CED3D;
        Fri, 10 Sep 2021 09:25:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC BlueZ] mgmt-api: Introduce Test command
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210909214750.2683251-1-luiz.dentz@gmail.com>
Date:   Fri, 10 Sep 2021 09:25:41 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <68367042-2A8F-41AA-B9E0-CB422B8AC3DC@holtmann.org>
References: <20210909214750.2683251-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This introduces Test command which can be use to further extend the
> subcommands which are intented to test the behavior of the kernel
> outside the normal scope of Bluetooth subsystem (e.g. suspend, resume,
> etc).
> ---
> doc/mgmt-api.txt | 27 +++++++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
> 
> diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
> index 5355fedb0..164a0514d 100644
> --- a/doc/mgmt-api.txt
> +++ b/doc/mgmt-api.txt
> @@ -3856,6 +3856,33 @@ Add Advertisement Patterns Monitor With RSSI Threshold Command
> 				No Resources
> 				Invalid Parameters
> 
> +Test Command
> +============
> +	Command Code:		0xffff
> +	Controller Index:	<controller id>
> +	Command Parameters:	Subcommand code (1 Octet)
> +				Subcommand length (2 Octects)
> +	Return Parameters:      subcommand return (variable)
> +
> +	This command is meant for testing only, it shall not be used in
> +	production.
> +
> +	Possible subcommands:
> +
> +	Suspend
> +	-------
> +	Subcommand Code:	0x0001
> +	Subcommand Parameters:
> +	Subcommand Return Parameters:

I rather do this via debugfs.

Regards

Marcel

