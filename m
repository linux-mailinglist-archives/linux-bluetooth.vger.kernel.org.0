Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE476181C6
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 May 2019 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfEHVuK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 May 2019 17:50:10 -0400
Received: from mga01.intel.com ([192.55.52.88]:39553 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfEHVuJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 May 2019 17:50:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 May 2019 14:50:09 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.251.29.44])
  by fmsmga004.fm.intel.com with ESMTP; 08 May 2019 14:50:09 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/1 v2] mesh Create() method
Date:   Wed,  8 May 2019 14:50:07 -0700
Message-Id: <20190508215008.32403-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.17.2
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Rebased on top of bluez tip

Inga Stotland (1):
  mesh: Add CreateNetwork method() implementation

 mesh/mesh.c |  70 ++++++++++++++++-
 mesh/node.c | 218 ++++++++++++++++++++++++++++++++++------------------
 mesh/node.h |   8 +-
 3 files changed, 218 insertions(+), 78 deletions(-)

-- 
2.17.2

