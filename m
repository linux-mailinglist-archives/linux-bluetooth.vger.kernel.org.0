Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0FC8546965
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jun 2022 17:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbiFJPaD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 11:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239010AbiFJPaC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 11:30:02 -0400
Received: from sender4-op-o13.zoho.com (sender4-op-o13.zoho.com [136.143.188.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891F22647
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 08:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654874999; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=P6RvsE5kcwcRVd3hyj1q7fo3i+nGwwPqNdMMYoT1yX0bJu0TcFl+mMMJla0bkAif1CSIBwGZbLpkTDfgOsWT7TPed44uGG0m6Q9WSVYhFTkJ2FsLR5TK0Jvr1eIhCcp16/irVHBIgrWy4+/M2Pk+x0hkAD+9jNx/MfbUsPJRJ6c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1654874999; h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=HeDQ5FFPqDyGALW+z8Vp9Jrv8injh1Zvd9XWWpKx/4Y=; 
        b=ke/2kU9P/fzJA10zyjGUAGnBECXwsKUZLT0QSvkxIzB0fMqFPnutpsm25w4R0RxFOTS0e2njj0cRck062bogiazOyG2u4sqhIkxqYg5LgGe+GmceVpFukB21WOwTZwqD8Y43xg7HcCMu7VUnrTk/QUHuVnAX4d45sY1mztZX9xk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=dptechnics.com;
        spf=pass  smtp.mailfrom=jonas@dptechnics.com;
        dmarc=pass header.from=<jonas@dptechnics.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654874999;
        s=zoho; d=dptechnics.com; i=jonas@dptechnics.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
        bh=HeDQ5FFPqDyGALW+z8Vp9Jrv8injh1Zvd9XWWpKx/4Y=;
        b=KPf0vfepMPCxscTVf+sRJCMaaJOEWPdCygW2TpHDJNO8jaSnpl9/vGpXmAfj10Xx
        pVlyPZnMNrVoWwQOEWR8fZ5yvBMpMrHS7YUcpzAgm5Qw1R9OkHO7vjKozzg05HZvyFh
        FrSrWvwKGbVwREKMWUr5LYMyg+LCm4+C8vH4bSYc=
Received: from lilith.dptechnics.local (178-116-74-88.access.telenet.be [178.116.74.88]) by mx.zohomail.com
        with SMTPS id 1654874997551161.73023949776461; Fri, 10 Jun 2022 08:29:57 -0700 (PDT)
From:   Jonas Maes <jonas@dptechnics.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Jonas Maes <jonas@dptechnics.com>
Subject: [PATCH BlueZ 0/1] Fix bug where bluetooth-meshd stops sending
Date:   Fri, 10 Jun 2022 17:29:01 +0200
Message-Id: <20220610152902.21677-1-jonas@dptechnics.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch fixes a bug where bluetooth-meshd may stop invoking the tx
worker thread and hence stop broadcasting, accumulating all packets
in its tx_pkts queue instead.

Updated: long line split in 2 lines

Jonas Maes (1):
  Fix bug where bluetooth-meshd stops sending

 mesh/mesh-io-generic.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.35.1

