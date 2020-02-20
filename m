Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAAE71658AA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Feb 2020 08:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgBTHrJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Feb 2020 02:47:09 -0500
Received: from mickerik.phytec.de ([195.145.39.210]:57528 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgBTHrJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Feb 2020 02:47:09 -0500
X-Greylist: delayed 900 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Feb 2020 02:47:07 EST
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.in; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.in; t=1582183926; x=1584775926;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GarEHcIJxeFfWZFCm6KeEMRfV/XtkQu9YBq/5vYvcr8=;
        b=KvqLG/vDeA6z1oDjGMHbgMEKVcKKn4tQXJSBauxXxLg/d6L+XbVOUcBaYSm7SkGT
        fQPxbx4E7e2kJpvdA7VzFFrWu8q05c1NDQifG1hV4IK3hFEm5YCDicjzNsPGGZm/
        Xg7DTzS0q97+yMr5o28rDMcUDUdZsvkLQdVeytHmMSI=;
X-AuditID: c39127d2-085ff70000001a8a-3a-5e4e35f6a157
Received: from tumirnix.phytec.de (tumirnix.phytec.de [172.16.0.38])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 55.82.06794.6F53E4E5; Thu, 20 Feb 2020 08:32:06 +0100 (CET)
X-Disclaimed: 1
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
Subject: mesh-cfgclient Node is not attached
From:   Mahaboob Nazeer SK <nazeer.m@phytec.in>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <OF2849A126.CB6B1F2C-ONC1258514.0028F058-C1258514.0028F05A@phytec.de>
Date:   Thu, 20 Feb 2020 08:27:09 +0100
X-Mailer: Lotus Domino Web Server Release 9.0.1FP7 August  17, 2016
X-MIMETrack: Serialize by http on Tumirnix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 20.02.2020 08:27:09,
        Serialize complete at 20.02.2020 08:27:09,
        Serialize by Router on Tumirnix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 20.02.2020 08:27:09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsWyRoBBTfebqV+cwd17AhZzrvUxOzB6fN4k
        F8AYxWWTkpqTWZZapG+XwJUx8+ZctoKfLBUHj+1gbGBsYuli5OCQEDCRaPkMZHJxCAnsZpSY
        8mAjUxcjJ1CcX+LTn1Y2EJtXQFDi5MwnLCC2sACvxKa3sxlBbE4BIYmOq52sEPViEhPW/WIG
        mckJVDPhnzVIWEiAR+LVhv2MEK06EmtWzQUbzyagK7HywkOwuIiAssSzfYeZIFYFSqy5fQBs
        LYuAqsSjU60sEOOdJRb/uQB2p4RAA5PErdmzwXYxC6hLrJ8nBFLDLKAtsWzha+YJjEKzkFw9
        C6FqFpKqBYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzECg/TwRPVLOxj75ngcYmTiYDzEKMHB
        rCTCq8bjFyfEm5JYWZValB9fVJqTWnyIUZqDRUmcdwNvSZiQQHpiSWp2ampBahFMlomDU6qB
        sZThwubT7jauR9YViM9kMlMXTo8zmiB9ee0f4Yd7Tbk0VedFqGmxF/1ZfLhb5MnFTexNGdtK
        Op+2ztKKMtY6Znx28ermJmOHpQy5v+/qzJQ5NbdcotKyo+727dDsa+av3nPK/lG6UR3bFMe+
        Sn9bmUrug3VGF4+uOdqw7nmaEmv61tScTx/ElViKMxINtZiLihMBM13Ba0ACAAA=
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I was trying to provision a node using a mesh-cfgclient.

I have successfully ran create and i was able to get configuration=20
files in the .config.

[mesh-cfgclient]# create=20
Mesh network configuration exists (/home/nazeer/.config/meshcfg/config=5Fdb=
.json)

After that i have tried to discover the unprovisioned node but i get=20
Node is not attached message.

[mesh-cfgclient]# discover-unprovisioned on
Node is not attached
[mesh-cfgclient]#

Could you please let me know if weather there are some=20
more steps involved to discover and provision a node or if am missing somet=
hings.

Thank you.
