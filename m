Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2A218FC1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 May 2019 19:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfEIR6F (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 May 2019 13:58:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:5515 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbfEIR6E (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 May 2019 13:58:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 10:58:04 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.251.10.18])
  by fmsmga004.fm.intel.com with ESMTP; 09 May 2019 10:58:04 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v5 0/2] mesh: node dir Restructure, and keyring
Date:   Thu,  9 May 2019 10:57:37 -0700
Message-Id: <20190509175739.16891-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This version 5 of the keyring has been restructured to separate the
node filesystem rework for the keyring that requires it.

See the mesh/README file for the new directory layout of the node. Instead
runtime saving of full path of the node.json file, we save it's base path,
and use that to construct all the paths needed in realtime.  We also have
changed ownership of this path to node.c, and when we remove the node, we
recursively delete everything its entire tree.

Brian Gix (2):
  mesh: Reconfigure node storage tree
  mesh: Add key storage

 Makefile.mesh  |   1 +
 mesh/README    |  34 ++++++-
 mesh/keyring.c | 297 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/keyring.h |  49 ++++++++++
 mesh/node.c    |  16 ++--
 mesh/node.h    |   4 +-
 mesh/storage.c | 144 +++++++++++++++++-----------
 7 files changed, 478 insertions(+), 67 deletions(-)
 create mode 100644 mesh/keyring.c
 create mode 100644 mesh/keyring.h

-- 
2.14.5

