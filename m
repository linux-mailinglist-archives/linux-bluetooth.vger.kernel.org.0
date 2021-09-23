Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B05734155E9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Sep 2021 05:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239037AbhIWD2l (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Sep 2021 23:28:41 -0400
Received: from mga11.intel.com ([192.55.52.93]:16373 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235623AbhIWD2k (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Sep 2021 23:28:40 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="220555887"
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="220555887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 20:26:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,315,1624345200"; 
   d="scan'208";a="534072311"
Received: from jdudwadk-mobl.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.212.205.211])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 20:26:47 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 00/20] Mesh Configuration Database
Date:   Wed, 22 Sep 2021 20:25:43 -0700
Message-Id: <20210923032603.50536-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch set (I apologize for its size, but this cannot be helped)
implements support for the newly published Mesh Configuration Database
Profile.

The changes are mostly contained to tools/mesh-cfgclient.c and tools/mesh
subdirectory. The only exception is the introduction of a new D-Bus mesh
API method ExportKeys() on org.bluez.mesh.Management1 interface.

The new functionality allows to export a snapshot of mesh state
from the point of view of mesh provisioner/configuration manager in
a standard format that can be used for to transferring the "ownership"
of the mesh configuration to another provisioner/configuration manager.

The changes break backwards compatibility with for the previous
versions of config-db.json that were generated when using
mesh-cfgclient tool. This can be amended by manually correcting the
field names and property values.

Inga Stotland (20):
  tools/mesh-cfgclient: Save provisioner info
  tools/mesh-cfgclient: Add timestamp to config database
  tools/mesh-cfgclient: Update stored NetKey and AppKey
  tools/mesh-cfgclient: Keep track of updated keys
  tools/mesh: Add new info to stored remote nodes
  tools/mesh-cfgclient: Overwrite config values when adding new ones
  tools/mesh-cfgclient: Store remote node's model bindings
  tools/mesh-cfgclient: Store remote node's model subs
  tools/mesh-cfgclient: Disallow model commands w/o composition
  tools/mesh-cfgclient: Store remote's model publication info
  tools/mesh-cfgclient: Check the result of config save
  tools/mesh-cfgclient: Rename mesh-db APIs for consistency
  tools/mesh-cfgclient: Save remote node feature setting
  tools/mesh-cfgclient: Store remote's heartbeat sub/pub
  tools/mesh-cfgclient: Add group parent address for DB compliance
  doc/mesh-api: Add ExportKeys call
  mesh: Implement ExportKeys() method
  tools/mesh-cfgclient: Store UUIDs in standard format
  tools/mesh-cfgclient: Excluded addresses property
  tools/mesh-cfgclient: Export configuration database

 doc/mesh-api.txt       |   56 ++
 mesh/keyring.c         |  286 ++++++++-
 mesh/keyring.h         |    2 +
 mesh/manager.c         |   35 ++
 tools/mesh-cfgclient.c |  212 ++++++-
 tools/mesh/cfgcli.c    |  284 ++++++---
 tools/mesh/keys.c      |    4 +-
 tools/mesh/mesh-db.c   | 1260 +++++++++++++++++++++++++++++++++++++---
 tools/mesh/mesh-db.h   |   66 ++-
 tools/mesh/model.h     |   13 +-
 tools/mesh/remote.c    |  205 +++++--
 tools/mesh/remote.h    |   11 +-
 12 files changed, 2206 insertions(+), 228 deletions(-)

-- 
2.31.1

