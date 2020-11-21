Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D812BC067
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Nov 2020 17:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgKUQAh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 21 Nov 2020 11:00:37 -0500
Received: from hoster906.com ([192.252.156.27]:37792 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgKUQAg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 21 Nov 2020 11:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=to:cc
        :from:subject:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=dkim; bh=x2MeThxf4kQyrjXWItgQkrd09
        D6yalg27T1FVAsREl8=; b=NSoVyMeGAOiVztruyo8Wh1Prv5BAj7RdTxzeTsOKA
        pfDy0EXT0kxT/RSFZpQAI4wa+z8tuagSv1bP2+YhIcn5eZOpqb1QI/fRhqJWvTE+
        CyfHoMaqWYtIvWKLA1BSactfJo+YquCYPAO9m+k6HHXwBYw0FWjVtM3C3vd9gS1z
        N4=
Received: (qmail 6494 invoked by uid 503); 21 Nov 2020 16:00:35 -0000
Received: from unknown (HELO ?192.168.254.79?) (mike@mnmoran.org@40.134.89.129)
  by hoster906.com with ESMTPA; 21 Nov 2020 16:00:35 -0000
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Cc:     "Stotland, Inga" <inga.stotland@intel.com>,
        "Gix, Brian" <brian.gix@intel.com>
From:   "Michael N. Moran" <mike@mnmoran.org>
Subject: Mesh UpdateModelConfiguration not invoked
Message-ID: <10bbe715-fe62-2364-cd20-71c710424c87@mnmoran.org>
Date:   Sat, 21 Nov 2020 11:00:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Meshers,

I have a BlueZ Mesh application that implements some mesh client models.

When I use the Attach(), I receive all of the configuration for the node. Among other things, this includes AppKey bindings for the models as expected.

However, if I add/remove AppKey bindings from the provisioner/configuration application (e.g. mesh-cfgclient), I expect my client application to receive a org.bluez.mesh.Element1 UpdateModelConfiguration() with the new bindings. This does not happen.

Are my expectations wrong?

I'm running 'bluetooth-meshd --nodetach --debug --dbus-debug'.

I don't see any d-bus or other failures in the daemon output.

If I kill my client application and restart it (Attach), I then receive all of the correct/new bindings.

I have looked at the mesh daemon code and it seems to come down to the use of cfg_update_mod_bindings() and whether or not the node is an "External model" or an "Internal model". Obviously, my client application is classified as an "Internal model", which skips the cfg_update_mod_bindings().

I suspect that this is an oversight in the daemon, but I'm not sure how to proceed.

Thanks,

mike

-- 
Michael N. Moran           (h) 770 704 9751
218 Wilshire Terrace       (c) 678 521 5460
White, GA, USA 30184       http://mnmoran.org

