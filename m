Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1128C599
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Aug 2019 03:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNBoH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 13 Aug 2019 21:44:07 -0400
Received: from mga01.intel.com ([192.55.52.88]:58789 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfHNBoH (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 13 Aug 2019 21:44:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 18:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,382,1559545200"; 
   d="scan'208";a="176377779"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.104.160])
  by fmsmga008.fm.intel.com with ESMTP; 13 Aug 2019 18:44:06 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, brian.gix@intel.com,
        inga.stotland@intel.com, michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ 0/1] mesh: Add D-Bus Security for sensitive data
Date:   Tue, 13 Aug 2019 18:43:56 -0700
Message-Id: <20190814014357.32453-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

There are various "security sensitive" pieces of data that need to be
exchanged between Applications and the Bluetooth Mesh daemon.

The following items will be encrypted before sending over D-Bus:

token --  This is used by all nodes.

net_keys, app_keys, dev_keys -- These will only typically be needed by
Provisioner/Config Client nodes to extract the keys for purposes of
Cponfiguration Database transfer.

Methodology:
ECC Public/Private pairs, and key exchanges which are set up for each
Attach() Session, and a counting diversifier to be used as a Nonce.

The App and Daemon will each generate a single session ECC pair, and
will generate an ECDH Shared Secret, which will be used as the symetric
encription key, for AES-CCM.

For most nodes, these steps will be required only for Attaching, to
authenticate the application to the daemon while obscuring the token
from D-Bus sniffers.  ECC and AES-CCM are both already natively
supported by Mesh.

Brian Gix (1):
  doc: Add Pub/Private ECC shared secret to obscure sensitive data

 doc/mesh-api.txt | 102 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 11 deletions(-)

-- 
2.21.0

