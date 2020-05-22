Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403531DF0EE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 May 2020 23:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731050AbgEVVNQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 May 2020 17:13:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:48185 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731021AbgEVVNP (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 May 2020 17:13:15 -0400
IronPort-SDR: dKqgQj0PZG74WLYwzdUPXWUGVPRR8h7zW74j4FDLT4ifEqAxap6vi1eFwzMEdmgzluEdpEYEiS
 l4+Lx9DvQyUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 14:13:15 -0700
IronPort-SDR: BlLiVe4ZXQT23RMO6zxrzNtKd9koF8Y5Opl7IEV5mmkBbtrKnQNqlIzq+OWxZDC8lKaSFZEgDu
 TcCsb1mVffww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,423,1583222400"; 
   d="scan'208";a="254372375"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.68.94])
  by fmsmga007.fm.intel.com with ESMTP; 22 May 2020 14:13:14 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 0/4] mesh: Static Analysis clean-up
Date:   Fri, 22 May 2020 14:13:05 -0700
Message-Id: <20200522211309.233824-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset fixes static analysis identified issues in the
mesh daemon.

v2: Clean-up PB-ADV queue


Brian Gix (4):
  mesh: Fix using uninitialized bytes
  mesh: Fix leaked mesh_net allocation
  mesh: Fix leaked message reference
  mesh: Destroy PB-ADV queue when provisioning done

 mesh/crypto.c  | 1 +
 mesh/manager.c | 3 ++-
 mesh/node.c    | 4 ++--
 mesh/pb-adv.c  | 5 +++++
 4 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.25.4

