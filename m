Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB79538C18
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 May 2022 09:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244559AbiEaHle (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 May 2022 03:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244560AbiEaHlc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 May 2022 03:41:32 -0400
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B64158CCEC
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 May 2022 00:41:29 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-dSd7LM1kMkinKNX4B8e6Ww-1; Tue, 31 May 2022 03:41:25 -0400
X-MC-Unique: dSd7LM1kMkinKNX4B8e6Ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A34A4185A7B2;
        Tue, 31 May 2022 07:41:24 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.64.242.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3147A1410DDB;
        Tue, 31 May 2022 07:41:21 +0000 (UTC)
From:   Gopal Tiwari <gopalkrishna.tiwari@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, gtiwari@redhat.com
Subject: [Bluez 00/13] Fixing memory leak, leaked_handle and use_after
Date:   Tue, 31 May 2022 13:11:04 +0530
Message-Id: <20220531074117.610321-1-gopalkrishna.tiwari@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_SOFTFAIL,SPOOFED_FREEMAIL,SPOOF_GMAIL_MID,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Gopal Tiwari <gtiwari@redhat.com>

Following fixes are reported by coverity tool.  

Gopal Tiwari (13):
  Fixing memory leak issue in gatt.c
  Fixing memory leakage in appkey.c
  Fixing memory leak in jlink.c
  Fixing memory leak in sixaxis.c
  Fixing leaked_handle in cltest.c
  Fixing leaked_handle in create-image.c
  Fixing leaked_handle in l2cap-tester.c
  Fixing resource leak in mesh/mesh-db.c
  Fixing leaked_handle in obex-client-tool.c
  Fixing use after free in src/device.c
  Fixing memory leak in pbap.c
  Fixing possible use_after_free in meshctl.c
  Fixing use_after_free in prov-db.c

 client/gatt.c             | 11 ++++++++---
 mesh/appkey.c             |  8 ++++++--
 monitor/jlink.c           |  5 ++++-
 obexd/client/pbap.c       |  5 +++--
 plugins/sixaxis.c         |  9 +++++++--
 src/device.c              |  1 +
 tools/cltest.c            |  1 +
 tools/create-image.c      |  7 +++----
 tools/l2cap-tester.c      |  1 +
 tools/mesh-gatt/prov-db.c |  3 ++-
 tools/mesh/mesh-db.c      |  2 ++
 tools/meshctl.c           |  1 -
 tools/obex-client-tool.c  |  1 +
 13 files changed, 39 insertions(+), 16 deletions(-)

-- 
2.26.2

