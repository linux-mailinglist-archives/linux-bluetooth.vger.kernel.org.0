Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BB520FC4F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Jun 2020 20:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgF3S4U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Jun 2020 14:56:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:57132 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgF3S4T (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Jun 2020 14:56:19 -0400
IronPort-SDR: kBZjAsK7k+1S+EQEPzg2mXLjMwHjoERIqdZuuzFBHklp/sXHJlpQdyoHGVyjp7TBqcAfjtFUvI
 3XKSGwsVDY/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231222951"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="231222951"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2020 11:56:19 -0700
IronPort-SDR: t4lCX5bdzNGY2n6qKsUURRHzll4gyZzCU21OcFqodRPO2y3VNtsbYMBlBSQVbYV3u/jWUfMiAE
 qSYlksyx7+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; 
   d="scan'208";a="355864248"
Received: from mlindstr-mobl1.amr.corp.intel.com (HELO ingas-nuc1.sea.intel.com) ([10.254.108.27])
  by orsmga001.jf.intel.com with ESMTP; 30 Jun 2020 11:56:18 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 0/4] Add options to Models and VendorModels
Date:   Tue, 30 Jun 2020 11:56:13 -0700
Message-Id: <20200630185617.14755-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

v2:

Changes constaned to patch 0002:

- Fixed returned status in config pub/sub model calls
- Consistent use of pub_enabled & sub_enabled in the code

************
If a model does not support either subscription mechanism,
Config Server is supposed to return "Not a Subscribe Model" if a Config Client sends
a subscription add/overwrite message.

Similarly, if a model does not support publication, "Invalid Publish Parameters"
should be returned in response to Publication Set message.

Since config server is running even when an app is not attached, the only way to collect
these model capabilities is on Attach, Join, Create, Import methods when the
object manager collects app info.

To address this issue, signatures for properties "Models" and "VendorModels" on Element
interface change to include "options" dictionary:
    Models: signature change "aq" -> "a(qa{sv})"
    VendorModels: signature change "a(qq)" -> "a(qqa{sv})"
    
The defined keywords for the options dictionary are:
    "Publish" - indicates whether the model supports publication mechanism.
                If not present, publication is enabled.
    "Subscribe" - indicates whether the model supports subscription mechanism.
                If not present, subscriptions are enabled.

Inga Stotland (4):
  doc/mesh-api: Add dictionary to model properties
  mesh: Check app model settings of pub/sub support
  tools/mesh-cfgclient: Add options to "Models" property
  test/test-mesh: Add options to "Models" property

 doc/mesh-api.txt        |  40 ++++++++--
 mesh/mesh-config-json.c |  76 +++++++++++++++++-
 mesh/mesh-config.h      |   8 ++
 mesh/model.c            |  98 +++++++++++++++++++----
 mesh/model.h            |   6 ++
 mesh/node.c             | 168 ++++++++++++++++++++++++++++++++--------
 test/test-mesh          |  21 ++---
 tools/mesh-cfgclient.c  |  25 ++++--
 8 files changed, 374 insertions(+), 68 deletions(-)

-- 
2.26.2

