Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B86865CACE
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Jan 2023 01:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbjADA2P (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Jan 2023 19:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238221AbjADA2K (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Jan 2023 19:28:10 -0500
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BE7F1D
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Jan 2023 16:28:10 -0800 (PST)
Received: from github.com (hubbernetes-node-12c6c58.va3-iad.github.net [10.48.206.49])
        by smtp.github.com (Postfix) with ESMTPA id 6E93BE05A9
        for <linux-bluetooth@vger.kernel.org>; Tue,  3 Jan 2023 16:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1672792089;
        bh=tQpQiC6U+y0j3sKuOpJfWIaYNmWhbEV8qFAR/mbxa8o=;
        h=Date:From:To:Subject:From;
        b=pLXmw+0gXNNN4IMDy9SC8MSIse6JThP9MhLYk95BbetdHxYom4EyYjcTzeV9MonGA
         6VwuoKCbwZw6DWoEMq0bEpgQtGNTZ/b2EVYmw1VlR4HjCQYfNJg4ehuBjCHMmvjhfB
         k8fDgvnY4fskTtR+m7skdJzA8jzSJg8KP1mVJOrw=
Date:   Tue, 03 Jan 2023 16:28:09 -0800
From:   Abhay <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/7a32f2-4e2ae1@github.com>
Subject: [bluez/bluez] 441eeb: shared/bap: Fix handling for Company ID and
 Vendor...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 441eeb2a14482ec4d81a90eae5b42fa925371e97
      https://github.com/bluez/bluez/commit/441eeb2a14482ec4d81a90eae5b42fa925371e97
  Author: Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
  Date:   2023-01-03 (Tue, 03 Jan 2023)

  Changed paths:
    M src/shared/bap.c
    M src/shared/bap.h

  Log Message:
  -----------
  shared/bap: Fix handling for Company ID and Vendor Codec ID

This adds fixes for handing for Company ID and Vendor Codec ID
while adding PAC record to database and responding to Attribute
Read Request for Sink/Source PAC Characteristics.


  Commit: 4e2ae14ea31178ebbbcb0bc81dfe74bd56b4885f
      https://github.com/bluez/bluez/commit/4e2ae14ea31178ebbbcb0bc81dfe74bd56b4885f
  Author: Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
  Date:   2023-01-03 (Tue, 03 Jan 2023)

  Changed paths:
    M doc/media-api.txt

  Log Message:
  -----------
  media-api: Add Vendor and Metadata

This adds Vendor and Metadata properties to MediaEndpoint1.


Compare: https://github.com/bluez/bluez/compare/7a32f2918035...4e2ae14ea311
