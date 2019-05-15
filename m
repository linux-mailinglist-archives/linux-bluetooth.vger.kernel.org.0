Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 575BB1EB90
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 May 2019 12:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbfEOKBm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 May 2019 06:01:42 -0400
Received: from atl4mhob22.registeredsite.com ([209.17.115.116]:48990 "EHLO
        atl4mhob22.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725966AbfEOKBm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 May 2019 06:01:42 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail02pod5.registeredsite.com [10.30.71.85])
        by atl4mhob22.registeredsite.com (8.14.4/8.14.4) with ESMTP id x4FA1dMZ136468
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 May 2019 06:01:39 -0400
Received: (qmail 57193 invoked by uid 0); 15 May 2019 10:01:39 -0000
X-TCPREMOTEIP: 208.85.15.155
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@208.85.15.155)
  by 0 with ESMTPA; 15 May 2019 10:01:39 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 2CB5D15402FC;
        Wed, 15 May 2019 06:01:38 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 23PWt_4G_nar; Wed, 15 May 2019 06:01:28 -0400 (EDT)
Received: from z230.lan (z230.lan [192.168.1.3])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 6673F1540278;
        Wed, 15 May 2019 06:01:28 -0400 (EDT)
Message-ID: <0ec70f654132923489ee2603fe9ac885ac547830.camel@ewol.com>
Subject: Re: Issue with mesh provisioning.
From:   Steve Brown <sbrown@ewol.com>
To:     Shaik Mahaboob Nazeer <nazeer.m@phytec.in>,
        linux-bluetooth@vger.kernel.org
Cc:     Jonas Remmert <j.remmert@phytec.de>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Date:   Wed, 15 May 2019 06:01:28 -0400
In-Reply-To: <a133a8d46955c9c3d248cf06e52d445a82ed7621.camel@ewol.com>
References: <33a1f056-12c2-1aaa-4172-ea1fba341428@phytec.in>
         <a133a8d46955c9c3d248cf06e52d445a82ed7621.camel@ewol.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, 2019-05-14 at 15:25 -0400, Steve Brown wrote:
> On Tue, 2019-05-14 at 14:50 +0530, Shaik Mahaboob Nazeer wrote:
> > hi,
> > 
> > -> We tried Zephyr Mesh onoff example on nrf52 eval kit to test the
> > Mesh Functionality.For provisioning of the node
> >    we are using meshctl, built from the latest current master of
> > the
> > bluez source.So during the provisioning of the node when we
> >    start the "meshctl" and run the "discover-unprovisioned on" we
> > are
> > able to get the Device UUID for the provisioning.
> > 
> >    Later when we try to provision the node using the "provision
> > <UUID>" command it initiate the provision and does not wait
> >    for the user to enter OOB .You can find the log as below.
> >    /*******************************************/
> > 
> 
> --- snip ---
> 
> >   /**************************************/
> > 
> > Could you elaborate a little on the status of the current master of
> > bluez in regards to BLE mesh, is it usable or should we look to
> > older
> > versions?
> > 
> > Do you know if there is a common issue while provisioning of the
> > node
> > with the current master and
> > is there anything that need to be configured before provisioning? 
> > 
> I get the same results.
> 
> I check out 48a2c3db1ccff28a615fac56066ca7d721f98d0a
> 
> That was the last time I used meshctl.
> 
> It requests an oob string and completes provisioning.
> 
> Steve
> 

I bisected to 

commit 91df85690cc1943e46ef90561dd1ac0d673ee3d7
Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Date:   Mon Nov 19 15:36:15 2018 +0200

    client: Switch from write to sendmsg for Acquire*
    
    Use sendmsg with MSG_NOSIGNAL to prevent crashes involving SIGPIPE.



