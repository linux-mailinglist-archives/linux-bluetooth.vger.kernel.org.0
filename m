Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86B08389534
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 May 2021 20:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbhESSXb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 May 2021 14:23:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:32191 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhESSXa (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 May 2021 14:23:30 -0400
IronPort-SDR: iwZNCdZkBuXf9nQsvg0byOYA3x5R1TOxi2pKIZ65lLqu/Bk4C5q9QR4W2Sv+mxmArq8H6kAC/z
 84Sj9l+QSUsA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="188175123"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="188175123"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 11:22:09 -0700
IronPort-SDR: fE2nuZavwADey3THaqNsxiLXjciPJ1mVCs2QqDAvZA4tIUaVA0PfbRtbdRmt2GK0ykrBnS3RIk
 66VFUQgdj6/w==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="439838650"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.212.229.7])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 11:22:09 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 2/5] nesh: Normalize endian of public/private ECC keys
Date:   Wed, 19 May 2021 11:21:47 -0700
Message-Id: <20210519182150.1680987-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210519182150.1680987-1-brian.gix@intel.com>
References: <20210519182150.1680987-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The Mesh profile specification defines a Mesh byte order of Big Endian
for Public keys used to calculate shared secrets. Further the
specification sample data also show this same byte order for Private
keys.  However, our internal ECDH shared secret calculation requires
Little Endian byte ordering. This fixes our DBus interface, and
debugging output to use Mesh Byte Ordering (Big Endian) for all human
readable input/output.
---
 mesh/prov-acceptor.c  | 8 +++++++-
 mesh/prov-initiator.c | 3 +++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/mesh/prov-acceptor.c b/mesh/prov-acceptor.c
index e806b12ef..0dbb84f50 100644
--- a/mesh/prov-acceptor.c
+++ b/mesh/prov-acceptor.c
@@ -223,7 +223,11 @@ static bool acp_credentials(struct mesh_prov_acceptor *prov)
 
 	print_packet("PublicKeyProv", prov->conf_inputs.prv_pub_key, 64);
 	print_packet("PublicKeyDev", prov->conf_inputs.dev_pub_key, 64);
+
+	/* Normalize for debug out -- No longer needed for calculations */
+	swap_u256_bytes(prov->private_key);
 	print_packet("PrivateKeyLocal", prov->private_key, 32);
+
 	print_packet("ConfirmationInputs", &prov->conf_inputs,
 						sizeof(prov->conf_inputs));
 	print_packet("ECDHSecret", prov->secret, 32);
@@ -307,11 +311,13 @@ static void priv_key_cb(void *user_data, int err, uint8_t *key, uint32_t len)
 		return;
 	}
 
+	/* API delivers Mesh byte order, switch to little endian */
+	swap_u256_bytes(key);
 	memcpy(prov->private_key, key, 32);
 	ecc_make_public_key(prov->private_key,
 			prov->conf_inputs.dev_pub_key);
 
-	/* Convert to Mesh byte order */
+	/* Convert Public key to Mesh byte order */
 	swap_u256_bytes(prov->conf_inputs.dev_pub_key);
 	swap_u256_bytes(prov->conf_inputs.dev_pub_key + 32);
 
diff --git a/mesh/prov-initiator.c b/mesh/prov-initiator.c
index ae9c646de..c62577523 100644
--- a/mesh/prov-initiator.c
+++ b/mesh/prov-initiator.c
@@ -222,6 +222,9 @@ static bool int_credentials(struct mesh_prov_initiator *prov)
 
 	print_packet("PublicKeyProv", prov->conf_inputs.prv_pub_key, 64);
 	print_packet("PublicKeyDev", prov->conf_inputs.dev_pub_key, 64);
+
+	/* Print DBG out in Mesh order */
+	swap_u256_bytes(prov->private_key);
 	print_packet("PrivateKeyLocal", prov->private_key, 32);
 	print_packet("ConfirmationInputs", &prov->conf_inputs,
 						sizeof(prov->conf_inputs));
-- 
2.25.4

