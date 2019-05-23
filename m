Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB1328247
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 May 2019 18:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731201AbfEWQNd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 May 2019 12:13:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:55828 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731093AbfEWQNd (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 May 2019 12:13:33 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 May 2019 09:13:32 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by orsmga002.jf.intel.com with ESMTP; 23 May 2019 09:13:32 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v3 0/6] mesh: Add App and Net Key Refresh keyring back-end
Date:   Thu, 23 May 2019 09:13:23 -0700
Message-Id: <20190523161329.13017-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is version 3 of the patch set that now implements the following:

On interface org.bluez.mesh.Management1:
    CreateSubnet()
    ImportSubnet()
    UpdateSubnet()
    DeleteSubnet()
    CreateAppKey()
    ImportAppKey()
    UpdateAppKey()
    DeleteAppKey()
    CompleteAppKeyUpdate()
    SetKeyPhase()
    ImportRemoteNode()
    DeleteRemoteNode()

Brian Gix (6):
  mesh: Add new method for Key Refresh procedure
  mesh: Centralize definition of PRIMARY_NET_IDX
  mesh: Implement Net Key keyring storage handling
  mesh: Implement App Key keyring storage handling
  mesh: Implement Key Refresh Phasing in keyring
  mesh: Implement remote dev key methods for keyring

 doc/mesh-api.txt |  66 ++++++++++----
 mesh/manager.c   | 264 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 mesh/mesh-defs.h |   1 +
 mesh/node.c      |  12 ++-
 4 files changed, 285 insertions(+), 58 deletions(-)

-- 
2.14.5

