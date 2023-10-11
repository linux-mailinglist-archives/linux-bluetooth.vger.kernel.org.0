Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9109F7C4596
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Oct 2023 01:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344146AbjJJXhs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Oct 2023 19:37:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343880AbjJJXhr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Oct 2023 19:37:47 -0400
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85B893
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Oct 2023 16:37:46 -0700 (PDT)
Received: from github.com (hubbernetes-node-dbb145d.ash1-iad.github.net [10.56.159.35])
        by smtp.github.com (Postfix) with ESMTPA id 0E63E601068
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Oct 2023 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1696981066;
        bh=ptnYr/B2YJIZwq77VLe9+q/1/DSsgVb626ddUX3ds1I=;
        h=Date:From:To:Subject:From;
        b=bS+SI80wHVX6SUnvs8Glq74yqeQB0doBjeD503GK82/RH8a8GXYAIAcYhU/WFCpOF
         j+P0Qg1r92H2wT37Y9oEryMFa3qK7QAeKGLqczQ/OI0cst3A6sp0k2W7CD/0g6Ynmi
         dWKIOiJKULA+AZS4o5kuz8D2dIugAVin3ixOnUQw=
Date:   Tue, 10 Oct 2023 16:37:46 -0700
From:   maheshtalewad <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/ee2762-04f40b@github.com>
Subject: [bluez/bluez] 4ea09c: test-bass: Add unit tests for the SPE suite
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 4ea09cf6b9b1033628b2966004a9df5bf2347bf6
      https://github.com/bluez/bluez/commit/4ea09cf6b9b1033628b2966004a9df5bf2347bf6
  Author: Iulia Tanasescu <iulia.tanasescu@nxp.com>
  Date:   2023-10-10 (Tue, 10 Oct 2023)

  Changed paths:
    M unit/test-bass.c

  Log Message:
  -----------
  test-bass: Add unit tests for the SPE suite

This adds BASS unit tests for the Service Procedures Error
Handling suite.


  Commit: 04f40b747fe278bdddd564584525db265c0a17a7
      https://github.com/bluez/bluez/commit/04f40b747fe278bdddd564584525db265c0a17a7
  Author: Mahesh Talewad <mahesh.talewad@nxp.com>
  Date:   2023-10-10 (Tue, 10 Oct 2023)

  Changed paths:
    M Makefile.am
    A unit/test-vcp.c

  Log Message:
  -----------
  unit/test-vcp: VOCS unit test case implementation

This implements all(10) mandatory VOCS testcases as unit tests.


Compare: https://github.com/bluez/bluez/compare/ee27626c7a06...04f40b747fe2
