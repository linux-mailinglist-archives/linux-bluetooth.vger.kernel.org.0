Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACAA55FA629
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Oct 2022 22:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJJU2k (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Oct 2022 16:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiJJU2Q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Oct 2022 16:28:16 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 10 Oct 2022 13:26:41 PDT
Received: from o6.sgmail.github.com (o6.sgmail.github.com [192.254.113.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AD47E32F
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Oct 2022 13:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        h=from:subject:mime-version:content-type:content-transfer-encoding:to:
        cc;
        s=smtpapi; bh=E64VtMCat4pokZr4KvgcqFGgyxiqbW9diflAPgktFys=;
        b=x+BtmSZRFwFT/hVROffYy0sEfs9/d0hdkOFdGpDU2f39m4N+1efz0BLfSrSKYzjYXnOP
        iWs70sMXj3EYFZqf3bweUmvoKLwUG2XfFSPUfv+Xp5milH4E6A4J5otvc+TzEkxua0BW4T
        jC1cs+wZenfsA8m/5kYGfVxnV0ytQyy9c=
Received: by filterdrecv-7c78485bb8-w7bmg with SMTP id filterdrecv-7c78485bb8-w7bmg-1-63447F43-53
        2022-10-10 20:23:31.220298648 +0000 UTC m=+1118315.490977699
Received: from smtp.github.com (unknown)
        by geopod-ismtpd-3-5 (SG)
        with ESMTP id aS4yfKZUTcC8louUNOT6aQ
        for <linux-bluetooth@vger.kernel.org>;
        Mon, 10 Oct 2022 20:23:31.214 +0000 (UTC)
Received: from github.com (hubbernetes-node-910725f.ash1-iad.github.net [10.56.211.51])
        by smtp.github.com (Postfix) with ESMTPA id 02C975E04D5
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Oct 2022 13:22:50 -0700 (PDT)
Date:   Mon, 10 Oct 2022 20:23:31 +0000 (UTC)
From:   Abhay <noreply@github.com>
Message-ID: <bluez/bluez/push/refs/heads/master/dabf32-3da439@github.com>
Subject: [bluez/bluez] 3da439: shared/bap: Fixing memory overwrite during ASE
 Ena...
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-SG-EID: =?us-ascii?Q?wY6IQVjVwytEPOaatj6miTTVbtG1QvhTe3IAnAG=2FU50wLSf8mPjX4zYsbDQ5l1?=
 =?us-ascii?Q?QqUcl1oIRvBZvxD1xZ8tvMkz8rx8ODOyIZHxm1y?=
 =?us-ascii?Q?Os0HQ7w9Jj22kOCyv99CRBYNCtnsZ685zXIW6LO?=
 =?us-ascii?Q?P8V7pFam2974fdsu8uhX=2F+gy4KpVqgDrMQV4Amb?=
 =?us-ascii?Q?J15yFAGGiRh7LLe2wrYaRFqBsBTNe+h5sgenC5S?=
 =?us-ascii?Q?En8PUXF+EbmjidRXoFpd1=2F3M9eYJzSel5owN7i?=
To:     linux-bluetooth@vger.kernel.org
X-Entity-ID: /f+S0XqulHHajbNb6hGdxg==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 3da439ae3c76e5008d007c2c41f6e7e1828b7321
      https://github.com/bluez/bluez/commit/3da439ae3c76e5008d007c2c41f6e7e1828b7321
  Author: Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
  Date:   2022-10-10 (Mon, 10 Oct 2022)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Fixing memory overwrite during ASE Enable Operation

This fixes memory overwrite during ASE Enable operation handling.
It avoids crashing of bluetoothd if metadata of more than sizeo of
size_t is received.

This also fixes storing metadata to stream structure.


