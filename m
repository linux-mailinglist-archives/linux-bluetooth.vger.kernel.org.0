Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B3126F14
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 21:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733212AbfEVTyi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 15:54:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:4235 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732422AbfEVTyh (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 15:54:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 12:54:37 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.78.4])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2019 12:54:36 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 0/5] mesh: Add App and Net Key Refresh keyring back-end
Date:   Wed, 22 May 2019 12:54:23 -0700
Message-Id: <20190522195428.1901-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Version 2 is a patchset with some pre-staging cleanup and breaking the
patches into functional sets.

Patches are order dependant (apply in composed order)

Brian Gix (5):
  mesh: Add new required method for Key Refresh proc
  mesh: Centralize definition of PRIMARY_NET_IDX
  mesh: Implement Net Key keyring storage handling
  mesh: Implement App Key keyring storage handling
  mesh: Implement Key Refresh Phasing in keyring

 doc/mesh-api.txt |  26 ++++++-
 mesh/manager.c   | 226 +++++++++++++++++++++++++++++++++++++++++++++++--------
 mesh/mesh-defs.h |   1 +
 mesh/node.c      |  12 ++-
 4 files changed, 227 insertions(+), 38 deletions(-)

-- 
2.14.5

