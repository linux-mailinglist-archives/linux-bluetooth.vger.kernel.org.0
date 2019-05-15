Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CF61F352
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 May 2019 14:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728628AbfEOMNJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 May 2019 08:13:09 -0400
Received: from atl4mhob04.registeredsite.com ([209.17.115.42]:38592 "EHLO
        atl4mhob04.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726571AbfEOMNI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 May 2019 08:13:08 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail02pod5.registeredsite.com [10.30.71.85])
        by atl4mhob04.registeredsite.com (8.14.4/8.14.4) with ESMTP id x4FCD53m007455
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 May 2019 08:13:06 -0400
Received: (qmail 50749 invoked by uid 0); 15 May 2019 12:13:05 -0000
X-TCPREMOTEIP: 208.85.15.155
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@208.85.15.155)
  by 0 with ESMTPA; 15 May 2019 12:13:05 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 645021540278;
        Wed, 15 May 2019 08:13:04 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fquKLuDlD87q; Wed, 15 May 2019 08:12:58 -0400 (EDT)
Received: from z230.lan (z230.lan [192.168.1.3])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 1CF3215400CE;
        Wed, 15 May 2019 08:12:58 -0400 (EDT)
Message-ID: <4fa544fa04d907de54ab713eb0d0901593d2687e.camel@ewol.com>
Subject: Re: Issue with mesh provisioning.
From:   Steve Brown <sbrown@ewol.com>
To:     "Von Dentz, Luiz" <luiz.von.dentz@intel.com>
Cc:     Shaik Mahaboob Nazeer <nazeer.m@phytec.in>,
        linux-bluetooth@vger.kernel.org,
        Jonas Remmert <j.remmert@phytec.de>
Date:   Wed, 15 May 2019 08:12:58 -0400
In-Reply-To: <CACumGOKJckqHDsB==1MwNFOtZVtduRPZhTmtbQT-fTaztuv+dQ@mail.gmail.com>
References: <33a1f056-12c2-1aaa-4172-ea1fba341428@phytec.in>
         <a133a8d46955c9c3d248cf06e52d445a82ed7621.camel@ewol.com>
         <0ec70f654132923489ee2603fe9ac885ac547830.camel@ewol.com>
         <CACumGOKJckqHDsB==1MwNFOtZVtduRPZhTmtbQT-fTaztuv+dQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

Would this be an appropriate fix.

It seems to solve the problem.

diff --git a/tools/mesh/gatt.c b/tools/mesh/gatt.c
index 2269a20cf..0a942d4eb 100644
--- a/tools/mesh/gatt.c
+++ b/tools/mesh/gatt.c
@@ -415,8 +415,11 @@ static bool sock_read(struct io *io, bool prov, void *user_data)
 	msg.msg_iovlen = 1;
 
 	while ((len = recvmsg(fd, &msg, MSG_DONTWAIT))) {
-		if (len <= 0)
+		if (len <= 0) {
+			if (errno == EAGAIN)
+				break;
 			return false;
+		}
 
 		res = buf;
 		len_sar = mesh_gatt_sar(&res, len);

If so, I'll submit a patch.

Steve

On Wed, 2019-05-15 at 13:48 +0300, Von Dentz, Luiz wrote:
> Hi Steve,
> 
> That specific patch doesn't change the meshctl, the following one
> does:
> 
> commit d6eec1b67d6d9e3336b7e3cd8f655baf408d864a
> Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> Date:   Mon Nov 19 17:35:54 2018 +0200
> 
>     meshctl: Switch from write to sendmsg for Acquire*
> 
>     Use sendmsg with MSG_NOSIGNAL to prevent crashes involving
> SIGPIPE.
> 
> Not sure what is the problem with that since we just switch from a
> pipe to a socketpair.
> 
> On Wed, May 15, 2019 at 1:01 PM Steve Brown <sbrown@ewol.com> wrote:
> > On Tue, 2019-05-14 at 15:25 -0400, Steve Brown wrote:
> > > On Tue, 2019-05-14 at 14:50 +0530, Shaik Mahaboob Nazeer wrote:
> > > > hi,
> > > > 
> > > > -> We tried Zephyr Mesh onoff example on nrf52 eval kit to test
> > > > the
> > > > Mesh Functionality.For provisioning of the node
> > > >    we are using meshctl, built from the latest current master
> > > > of
> > > > the
> > > > bluez source.So during the provisioning of the node when we
> > > >    start the "meshctl" and run the "discover-unprovisioned on"
> > > > we
> > > > are
> > > > able to get the Device UUID for the provisioning.
> > > > 
> > > >    Later when we try to provision the node using the "provision
> > > > <UUID>" command it initiate the provision and does not wait
> > > >    for the user to enter OOB .You can find the log as below.
> > > >    /*******************************************/
> > > > 
> > > 
> > > --- snip ---
> > > 
> > > >   /**************************************/
> > > > 
> > > > Could you elaborate a little on the status of the current
> > > > master of
> > > > bluez in regards to BLE mesh, is it usable or should we look to
> > > > older
> > > > versions?
> > > > 
> > > > Do you know if there is a common issue while provisioning of
> > > > the
> > > > node
> > > > with the current master and
> > > > is there anything that need to be configured before
> > > > provisioning?
> > > > 
> > > I get the same results.
> > > 
> > > I check out 48a2c3db1ccff28a615fac56066ca7d721f98d0a
> > > 
> > > That was the last time I used meshctl.
> > > 
> > > It requests an oob string and completes provisioning.
> > > 
> > > Steve
> > > 
> > 
> > I bisected to
> > 
> > commit 91df85690cc1943e46ef90561dd1ac0d673ee3d7
> > Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > Date:   Mon Nov 19 15:36:15 2018 +0200
> > 
> >     client: Switch from write to sendmsg for Acquire*
> > 
> >     Use sendmsg with MSG_NOSIGNAL to prevent crashes involving
> > SIGPIPE.
> > 
> > 
> > 

