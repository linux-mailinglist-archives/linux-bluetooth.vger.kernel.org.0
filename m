Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F1F1CFF6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2019 21:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfENTcF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 15:32:05 -0400
Received: from atl4mhfb04.myregisteredsite.com ([209.17.115.120]:57560 "EHLO
        atl4mhfb04.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbfENTcF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 15:32:05 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 May 2019 15:32:04 EDT
Received: from atl4mhob21.registeredsite.com (atl4mhob21.registeredsite.com [209.17.115.115])
        by atl4mhfb04.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id x4EJPxE0031337
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 May 2019 15:25:59 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail01pod5.registeredsite.com [10.30.71.94])
        by atl4mhob21.registeredsite.com (8.14.4/8.14.4) with ESMTP id x4EJPvsI110078
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 May 2019 15:25:57 -0400
Received: (qmail 116332 invoked by uid 0); 14 May 2019 19:25:57 -0000
X-TCPREMOTEIP: 208.85.15.155
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@208.85.15.155)
  by 0 with ESMTPA; 14 May 2019 19:25:57 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id D2D1E15402FC;
        Tue, 14 May 2019 15:25:56 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BiW5Lh9aflFx; Tue, 14 May 2019 15:25:55 -0400 (EDT)
Received: from z230.lan (z230.lan [192.168.1.3])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id E3C7315401BE;
        Tue, 14 May 2019 15:25:54 -0400 (EDT)
Message-ID: <a133a8d46955c9c3d248cf06e52d445a82ed7621.camel@ewol.com>
Subject: Re: Issue with mesh provisioning.
From:   Steve Brown <sbrown@ewol.com>
To:     Shaik Mahaboob Nazeer <nazeer.m@phytec.in>,
        linux-bluetooth@vger.kernel.org
Cc:     Jonas Remmert <j.remmert@phytec.de>
Date:   Tue, 14 May 2019 15:25:54 -0400
In-Reply-To: <33a1f056-12c2-1aaa-4172-ea1fba341428@phytec.in>
References: <33a1f056-12c2-1aaa-4172-ea1fba341428@phytec.in>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, 2019-05-14 at 14:50 +0530, Shaik Mahaboob Nazeer wrote:
> hi,
> 
> -> We tried Zephyr Mesh onoff example on nrf52 eval kit to test the
> Mesh Functionality.For provisioning of the node
>    we are using meshctl, built from the latest current master of the
> bluez source.So during the provisioning of the node when we
>    start the "meshctl" and run the "discover-unprovisioned on" we are
> able to get the Device UUID for the provisioning.
> 
>    Later when we try to provision the node using the "provision
> <UUID>" command it initiate the provision and does not wait
>    for the user to enter OOB .You can find the log as below.
>    /*******************************************/
> 

--- snip ---

>   /**************************************/
> 
> Could you elaborate a little on the status of the current master of
> bluez in regards to BLE mesh, is it usable or should we look to older
> versions?
> 
> Do you know if there is a common issue while provisioning of the node
> with the current master and
> is there anything that need to be configured before provisioning? 
> 
I get the same results.

I check out 48a2c3db1ccff28a615fac56066ca7d721f98d0a

That was the last time I used meshctl.

It requests an oob string and completes provisioning.

Steve

