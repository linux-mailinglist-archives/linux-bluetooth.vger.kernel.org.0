Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47609259005
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Sep 2020 16:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgIAONE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Sep 2020 10:13:04 -0400
Received: from sender4-op-o11.zoho.com ([136.143.188.11]:17180 "EHLO
        sender4-op-o11.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgIALyn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Sep 2020 07:54:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1598961272; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=RfGUUsV0XdxEEMFtB9w2PjQgYRCY2Zifxyv+TF4Mkc237LI0/jbnNSlhLJsZfDc4EuVT8P7KTBEXWMvM91C7LiQjM9CvLfH7FxLOT2LJmJ7bUD3nd3pDNStssrmiszLLwRdbZ1dtuTWa7n3+hyPsQaNrNC3ESCCElvEnZQZQci8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1598961272; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=8GE8GX8wfUYkwmZsVMBYy3QaTa9zX1/ZjiY09VRuPTw=; 
        b=L3mxkcMC+XmtqaPigb9z52KqKG8WRsN4+fIyTqXAnOiO62HnHJXRgVikAOqC4d+4SukUHKEkpYXiXKxGsbOMl2BxHJiKB7CLZzWQlqrLaLoarxxB+TIwW2y594Dh+iNFpPZipH8NzuIFbxZpDfjiwieA3u73HCT2EPxuZJLri/0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=dptechnics.com;
        spf=pass  smtp.mailfrom=daan@dptechnics.com;
        dmarc=pass header.from=<daan@dptechnics.com> header.from=<daan@dptechnics.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1598961272;
        s=zoho; d=dptechnics.com; i=daan@dptechnics.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=8GE8GX8wfUYkwmZsVMBYy3QaTa9zX1/ZjiY09VRuPTw=;
        b=RKdqKQqFCcPkvxnmNNgExoyQ+ZWvJhoOEUCe4ijEW7BYG8HaZTsGJCCxwiaVB6X0
        EKycf1LK8U7OhOoQ9DjBubLlfGEiaRJ/Omd5jiXBlqmn8ItR6tMEylwA8HvhDH/z4/k
        SKyRg1sG/Nz3h2cEpAEAx+WwJmw8nvAzeXGWdics=
Received: from daan-devbox.dptechnics.local (178-116-74-88.access.telenet.be [178.116.74.88]) by mx.zohomail.com
        with SMTPS id 1598961269677786.0220243936628; Tue, 1 Sep 2020 04:54:29 -0700 (PDT)
From:   Daan Pape <daan@dptechnics.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Daan Pape <daan@dptechnics.com>
Message-ID: <20200901115418.82056-1-daan@dptechnics.com>
Subject: [PATCH BlueZ 0/1] Mesh: make SIG model header file locations more consistent
Date:   Tue,  1 Sep 2020 13:54:17 +0200
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The configuration model header was now in the tools/mesh directory while th=
e
Generic OnOff header was in the tools/mesh-gatt directory. In preparation o=
f=20
implementing the Generic OnOff client model in the mesh-cfgclient tool and=
=20
to make the structure more consistent I renamed and moved the header file o=
f
the Generic OnOff model to the tools/mesh directory.

Daan Pape (1):
  Mesh: make SIG model header file locations more consistent

 tools/mesh-gatt/onoff-model.c |  2 +-
 tools/mesh-gatt/onoff-model.h | 33 ---------------------------------
 tools/meshctl.c               |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 tools/mesh-gatt/onoff-model.h

--=20
2.25.1


