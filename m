Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDEA1A6185
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Apr 2020 04:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727940AbgDMCc0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 12 Apr 2020 22:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgDMCcZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 12 Apr 2020 22:32:25 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AB9C0A3BE0
        for <linux-bluetooth@vger.kernel.org>; Sun, 12 Apr 2020 19:32:26 -0700 (PDT)
IronPort-SDR: Q3FLZ7K+GCSo6j1R1lD6imFDeB+hn+YCMKT/is2kZMqNILNQLluKMhGdnh4bU7MwCcCnzIJ+T/
 rKpqpKk7nP4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2020 19:32:25 -0700
IronPort-SDR: IC9tpqxHD4fD0v5WUk2ZFGxCiTK6U673iQcdDzDrWW/mdeAFqlxltRxJQmp+pi4lH+omyWhm7u
 OOP2Zk8LVkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; 
   d="scan'208";a="454076276"
Received: from sguggill-mobl.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.254.105.177])
  by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2020 19:32:24 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com, przemyslaw.fierek@silvair.com
Subject: [PATCH BlueZ v3 0/4] mesh: Always deliver tokens via JoinComplete
Date:   Sun, 12 Apr 2020 19:32:13 -0700
Message-Id: <20200413023217.20472-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset implements API change discussed in
https://marc.info/?l=linux-bluetooth&m=157660821400352&w=2

v3:
 - Add distribution independant timeout for JoinComplete() method calls
   such that a 30 second timeout of the call is treated as failure, so
   stale nodes clean up correctly

v2:
 - Fix mesh-cfgclient to send JoinComplete reply before calling Attach

Brian Gix (1):
  mesh: Add Time-outs to critical dbus send-with-replies

Michał Lowas-Rzechonek (1):
  doc/mesh: Change API to deliver tokens via JoinComplete

Przemysław Fierek (2):
  mesh: Change API to deliver tokens via JoinComplete
  tools/mesh-cfgclient: Add waiting for 'JoinComplete'

 doc/mesh-api.txt       | 22 ++++++++----
 mesh/dbus.c            | 43 +++++++++++++++++++++++
 mesh/dbus.h            |  6 ++++
 mesh/mesh.c            | 65 +++++++++++++++++++++++++++--------
 tools/mesh-cfgclient.c | 78 +++++++++++++++++++++++++-----------------
 5 files changed, 160 insertions(+), 54 deletions(-)

-- 
2.21.1

