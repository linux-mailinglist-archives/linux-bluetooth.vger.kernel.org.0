Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECDA5F79D1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Oct 2022 16:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJGOku (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Oct 2022 10:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiJGOks (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Oct 2022 10:40:48 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C00196A4BE
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Oct 2022 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665153647; x=1696689647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bOjtAwQ5V8eaHEjWBuruqsPG5L3kS8aI9Zp4JJ6V5FY=;
  b=AGjywgD3/BfYjiPih+9EZG0oUj1+U9fuLRPOSwe1OnFMLUri3TIvm6aM
   qySVDtjpIH7KlLaCsjgVM372NiOQjcN4fAqqQz9H64cSRZpn8JiLRhCQu
   XK2C8v6cE8FwfLmhzf25lcFpWSz+iR8jrzWOLUEIyY31U04hsX285P4U+
   6wfxVOP1JSUh6bkMeC+erFRW95ZqLhuP2UuyAUnWHEOtHg4GfXcetTxlw
   pqINglkWAUt+3MWt2aJIv/I173x58ny9nG/mIWfzvEP5bU7WaHbm4CDbW
   0E6AHt1RQveDQquECI9X353bBpujSASK1RCVpbH8urNZ9FAVEVBumRm2u
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="302470063"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="302470063"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2022 07:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="714294743"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; 
   d="scan'208";a="714294743"
Received: from tester-latitude-7480.iind.intel.com ([10.224.186.120])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2022 07:40:46 -0700
From:   Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
Subject: [PATCH BlueZ 0/1] Bug Fix for Memory overwrite
Date:   Fri,  7 Oct 2022 20:29:19 +0530
Message-Id: <20221007145920.20966-1-abhay.maheshbhai.maheta@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Fix to avoid memory overwrite during ASE stream enable operation.

Abhay Maheta (1):
  shared/bap: Fix handling memory overwrite during ASE Enable Operation

 src/shared/bap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1

