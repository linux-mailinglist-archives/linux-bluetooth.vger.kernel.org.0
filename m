Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7717C31A705
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Feb 2021 22:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbhBLVng (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Feb 2021 16:43:36 -0500
Received: from mga06.intel.com ([134.134.136.31]:54931 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhBLVnf (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Feb 2021 16:43:35 -0500
IronPort-SDR: JfASMa0vvyaaPNCNx+ReoluMG+qo8k2+rblkTxjV3YqeRyVu3FKqA3Cx6NOR0ffxXua+3BDqWJ
 buzPtJ0vfWHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="243967597"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="243967597"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 13:42:54 -0800
IronPort-SDR: K859zjVwJfJRvFRxOFNhC+Wc+YooiTikUXEMog5BZN6FAdh4FfF2uTZXxV7JjfFdww43VupopC
 I2AgcdAwIdWQ==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="416116341"
Received: from dmoore1-mobl2.amr.corp.intel.com (HELO istotlan-desk.intel.com) ([10.209.2.150])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 13:42:53 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, michal.lowas-rzechonek@silvair.com,
        Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v2 1/4] doc/mesh-api: Add notion of Device UUID compliance
Date:   Fri, 12 Feb 2021 13:42:41 -0800
Message-Id: <20210212214244.74995-2-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212214244.74995-1-inga.stotland@intel.com>
References: <20210212214244.74995-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add requirement that the value of Device UUID supplied in
CreateNetwork/Join/Import methods should be compliant with
RFC 4122.
---
 doc/mesh-api.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/doc/mesh-api.txt b/doc/mesh-api.txt
index 254ccbd7f..f2c6b9e5c 100644
--- a/doc/mesh-api.txt
+++ b/doc/mesh-api.txt
@@ -27,7 +27,8 @@ Methods:
 		The uuid parameter is a 16-byte array that contains Device UUID.
 		This UUID must be unique (at least from the daemon perspective),
 		therefore attempting to call this function using already
-		registered UUID results in an error.
+		registered UUID results in an error. The composition of the UUID
+		octets must be in compliance with RFC 4122.
 
 		When provisioning finishes, the daemon will call either
 		JoinComplete or JoinFailed method on object implementing
@@ -149,7 +150,8 @@ Methods:
 		The uuid parameter is a 16-byte array that contains Device UUID.
 		This UUID must be unique (at least from the daemon perspective),
 		therefore attempting to call this function using already
-		registered UUID results in an error.
+		registered UUID results in an error. The composition of the UUID
+		octets must be in compliance with RFC 4122.
 
 		The other information the bluetooth-meshd daemon will preserve
 		about the initial node, is to give it the initial primary
@@ -179,7 +181,8 @@ Methods:
 		The uuid parameter is a 16-byte array that contains Device UUID.
 		This UUID must be unique (at least from the daemon perspective),
 		therefore attempting to call this function using already
-		registered UUID results in an error.
+		registered UUID results in an error. The composition of the UUID
+		octets must be in compliance with RFC 4122.
 
 		The dev_key parameter is the 16-byte value of the dev key of
 		the imported mesh node.
-- 
2.26.2

