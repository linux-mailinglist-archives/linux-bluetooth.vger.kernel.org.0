Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D2323E587
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Aug 2020 03:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgHGBih (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 21:38:37 -0400
Received: from mga18.intel.com ([134.134.136.126]:43978 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgHGBih (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 21:38:37 -0400
IronPort-SDR: QyEwnpsYG57s9w9/JOM/uMQOAfNy2T47JOsVAKJskj0iNvV/CAAHej7WoesqRjVeB8mcCMiAGA
 m/i/b82SpDjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="140558035"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="scan'208";a="140558035"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 18:38:36 -0700
IronPort-SDR: PD8tttQWi2/Ra55aAh0VmpofO12MqFE/dKUDAD1IFfRk3S4ulJNgB0WMzhDHsuf2cTUq31n/bu
 P/noJS2AyUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="scan'208";a="397442060"
Received: from unknown (HELO ingas-nuc1.intel.com) ([10.254.119.50])
  by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2020 18:38:36 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ v5 00/10] Mesh Config Server clean up
Date:   Thu,  6 Aug 2020 18:38:24 -0700
Message-Id: <20200807013834.123263-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

v5 - addressed more of Brian's comments. Added missing range checking

*******************
v4 - Further fixes in handling Key Refresh Phase Set message

*******************
 v3 - address Brian's comments
 
*******************
This patch set groups functionality by config messages.
Also, fixes the cases where malformed messages should be  silently
ignored and the situations when incorrect error status
is sent in response.


Inga Stotland (10):
  mesh: Clean up handling of config subscription messages
  mesh: Clean up handling of config model binding messages
  mesh: Clean up handling of config node identity message
  mesh: Clean up handling of config publication messages
  mesh: Clean up handling of config net and app key messages
  mesh: Clean up handling of config relay messages
  mesh: Clean up handling of config poll timeout message
  mesh: Clean up handling of config net transmit messages
  mesh: Clean up handling of config KR phase messages
  mesh: Refactor heartbeat pub/sub

 mesh/cfgmod-server.c    | 1198 +++++++++++++++++----------------------
 mesh/cfgmod.h           |    2 +-
 mesh/mesh-config-json.c |   12 +-
 mesh/mesh-config.h      |    6 +-
 mesh/mesh-defs.h        |    6 +
 mesh/model.c            |  238 ++++----
 mesh/model.h            |   21 +-
 mesh/net.c              |  326 +++++++----
 mesh/net.h              |   54 +-
 mesh/node.h             |    4 -
 10 files changed, 924 insertions(+), 943 deletions(-)

-- 
2.26.2

