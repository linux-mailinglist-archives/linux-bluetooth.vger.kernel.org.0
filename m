Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFC136919
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jun 2019 03:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFFBSg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Jun 2019 21:18:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:54825 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbfFFBSg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Jun 2019 21:18:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 18:18:36 -0700
X-ExtLoop1: 1
Received: from ingas-nuc1.sea.intel.com ([10.251.155.118])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2019 18:18:34 -0700
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ 0/2] Minor fixes and clean up
Date:   Wed,  5 Jun 2019 18:18:30 -0700
Message-Id: <20190606011832.18801-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Cleanup coding style. Don't check the return values of l_new() and l_queue_new().
Add check for the presense of "elements" property in node configuration
(it's mandatory) 

Inga Stotland (2):
  mesh: Make "elements" mandatory in node configuration
  mesh: Clean up style

 mesh/mesh-db.c | 23 +++++++++--------------
 mesh/model.c   | 25 +++++++++++++------------
 2 files changed, 22 insertions(+), 26 deletions(-)

-- 
2.21.0

