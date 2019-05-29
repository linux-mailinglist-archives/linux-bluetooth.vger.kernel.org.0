Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF21E2E337
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 May 2019 19:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfE2R2g (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 May 2019 13:28:36 -0400
Received: from mga06.intel.com ([134.134.136.31]:64969 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfE2R2g (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 May 2019 13:28:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 10:28:34 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.255.231.30])
  by fmsmga006.fm.intel.com with ESMTP; 29 May 2019 10:28:33 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com, marcel@holtmann.org,
        johan.hedberg@gmail.com, denkenz@gmail.com
Subject: [PATCH BlueZ 0/1] mesh: Convert all crypto to ELL
Date:   Wed, 29 May 2019 10:28:17 -0700
Message-Id: <20190529172818.8844-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I am copying a larger than normal list of "interested parties" of this patch to (finally) convert the Bluetooth Mesh daemon to using the ELL cipher and checksum APIs.

This will have one major side effect in that it will no longer support kernels older than v4.9 (I am personally using v5.0.17).  I am told that (some?) Freescale platforms also will have problems regardless of kernel version.

This does not change any functionality in the mesh daemon otherwise.

Brian Gix (1):
  mesh: Convert crypto to use ELL wrappers

 Makefile.am   |   4 +
 mesh/crypto.c | 518 ++++++----------------------------------------------------
 2 files changed, 58 insertions(+), 464 deletions(-)

-- 
2.14.5

