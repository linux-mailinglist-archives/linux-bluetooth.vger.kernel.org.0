Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328B638839E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 May 2021 02:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234581AbhESAMA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 May 2021 20:12:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:41857 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233582AbhESAL7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 May 2021 20:11:59 -0400
IronPort-SDR: uBA/9nqgMhuj+oZq4Zwc1YWrbcurG9oR2GD+CUKrrDlvZKxaneIskPglL2cynmxZe0ZtmxKHSC
 X/yS//kcofdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200900088"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="200900088"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 17:10:36 -0700
IronPort-SDR: 0TjUYylEL0Re7rpX61teXwRZ+rEcXnATUJBwRuFoShtMt0qPDsKjjJwgQZTpXUnnpDCoTyXD3b
 KeJX2ULSx6+A==
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="439707705"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.209.0.202])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 17:10:34 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ 0/4] OOB Authentication improvements
Date:   Tue, 18 May 2021 17:10:23 -0700
Message-Id: <20210519001027.1540720-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set fixes some minor bugs, and adds explicit support for all
currently supported Provisioning authentication methods.

Brian Gix (4):
  mesh: Fix delivery of PB-ACK to acceptors
  nesh: Normalize endian of public/private ECC keys
  tools/mesh: Add all supported OOB methods to cfgclient
  test/mesh: Add support for testing more OOB auth

 mesh/pb-adv.c          |  1 -
 mesh/prov-acceptor.c   |  8 +++++++-
 mesh/prov-initiator.c  |  3 +++
 test/agent.py          | 23 +++++++++++++++++++++++
 tools/mesh-cfgclient.c | 32 +++++++++++++++++++++++++++-----
 5 files changed, 60 insertions(+), 7 deletions(-)

-- 
2.25.4

