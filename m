Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC99652A75
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Dec 2022 01:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbiLUA0q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Dec 2022 19:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiLUA0p (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Dec 2022 19:26:45 -0500
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3095AB7CF
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Dec 2022 16:26:43 -0800 (PST)
Received: from github.com (hubbernetes-node-853c499.va3-iad.github.net [10.48.221.45])
        by smtp.github.com (Postfix) with ESMTPA id 279C35C085E
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Dec 2022 16:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1671582403;
        bh=cEMslSjZFge/OFZwGjPbDXuLZK1VO+rluehdvUw8d4w=;
        h=Date:From:To:Subject:From;
        b=x/II9O1ORbelBtSX412xDslMjLZGoxXB5p1xI0c8Rnwp2K4kEGrQMaxw5uB24NWWj
         Gx3tUgiGl0w/naESXSuIfDFJHT7wwz1EcYQVQvuqzM7P5W+H76pZSH1lnjTjjmwYb2
         FuRGWmJwxITkU8gGkPwuEShxylrcqSgy2zGojRfs=
Date:   Tue, 20 Dec 2022 16:26:43 -0800
From:   Sathish Narasimman <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/da203f-90a662@github.com>
Subject: [bluez/bluez] 9a6b0e: shared/util: Update UUID database for Csip
 services
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
  Commit: 9a6b0e39a30f06f121f28f3e9e754d61f22ccdca
      https://github.com/bluez/bluez/commit/9a6b0e39a30f06f121f28f3e9e754d61f22ccdca
  Author: Sathish Narasimman <sathish.narasimman@intel.com>
  Date:   2022-12-20 (Tue, 20 Dec 2022)

  Changed paths:
    M src/shared/util.c

  Log Message:
  -----------
  shared/util: Update UUID database for Csip services

This updates UUID database with the values from assigned numbers for
co-ordinated set identification services.


  Commit: b709058c60081de91927b04c6603f223a4119265
      https://github.com/bluez/bluez/commit/b709058c60081de91927b04c6603f223a4119265
  Author: Sathish Narasimman <sathish.narasimman@intel.com>
  Date:   2022-12-20 (Tue, 20 Dec 2022)

  Changed paths:
    M lib/uuid.h

  Log Message:
  -----------
  lib/uuid: Add CSIS UUIDs

This adds Coordinated Set Identification Service UUIDs which will
be used by Coordinated Set Identification Profile.


  Commit: 90a662392c6e9dfc25308b883d47ff1e8578646b
      https://github.com/bluez/bluez/commit/90a662392c6e9dfc25308b883d47ff1e8578646b
  Author: Sathish Narasimman <sathish.narasimman@intel.com>
  Date:   2022-12-20 (Tue, 20 Dec 2022)

  Changed paths:
    M monitor/att.c

  Log Message:
  -----------
  monitor/att: Add decoding support for CSIP

This adds decoding support for CSIS attributes:

> ACL Data RX: Handle 3585 flags 0x02 dlen 7
      ATT: Read Request (0x0a) len 2
        Handle: 0x0017 Type: Set Identity Resolving Key (0x2b84)
< ACL Data TX: Handle 3585 flags 0x00 dlen 22
      ATT: Read Response (0x0b) len 17
        Value: 01761fae703ed681f0c50b34155b6434fb
        Handle: 0x0017 Type: Set Identity Resolving Key (0x2b84)
          SIRK: 01761fae703ed681f0c50b34155b6434fb
> ACL Data RX: Handle 3585 flags 0x02 dlen 7
      ATT: Read Request (0x0a) len 2
        Handle: 0x001b Type: Set Member Lock (0x2b86)
< ACL Data TX: Handle 3585 flags 0x00 dlen 6
      ATT: Read Response (0x0b) len 1
        Value: 01
        Handle: 0x001b Type: Set Member Lock (0x2b86)
            Locked (0x01)
> ACL Data RX: Handle 3585 flags 0x02 dlen 7
      ATT: Read Request (0x0a) len 2
        Handle: 0x001e Type: Set Member Rank (0x2b87)
< ACL Data TX: Handle 3585 flags 0x00 dlen 6
      ATT: Read Response (0x0b) len 1
        Value: 01
        Handle: 0x001e Type: Set Member Rank (0x2b87)
            Rank: 0x01


Compare: https://github.com/bluez/bluez/compare/da203f5dbc7e...90a662392c6e
