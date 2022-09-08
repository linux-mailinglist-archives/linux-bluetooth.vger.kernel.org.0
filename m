Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E6E5B28AD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  8 Sep 2022 23:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiIHVmp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 8 Sep 2022 17:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbiIHVmo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 8 Sep 2022 17:42:44 -0400
Received: from smtp.github.com (out-18.smtp.github.com [192.30.252.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A66B515D
        for <linux-bluetooth@vger.kernel.org>; Thu,  8 Sep 2022 14:42:43 -0700 (PDT)
Received: from github.com (hubbernetes-node-3db70e2.va3-iad.github.net [10.48.204.69])
        by smtp.github.com (Postfix) with ESMTPA id 6200F3408F0
        for <linux-bluetooth@vger.kernel.org>; Thu,  8 Sep 2022 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1662673362;
        bh=UdCzjEsUTiTryKcbsDNbL2dc4Vh+h3hj05D1NrsOCl8=;
        h=Date:From:To:Subject:From;
        b=MHnhZUzhpoWI7jsI6VRN1ABQ9+feyrvPbIKQfGDDtFjjpgxSX4FsnNJGXprO6CDhK
         ypAdh9ZBJvT6HZeJhtUtZ5RdqG6s8KMZiSktpoYMQIbI6mzR6WO1h/ga7IbnTtOQUV
         SDPSGwDc77b6SkyfuG8x326anB+jZZZCw4a2YYDw=
Date:   Thu, 08 Sep 2022 14:42:42 -0700
From:   Brian Gix <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/4c8a6b-9d8fd3@github.com>
Subject: [bluez/bluez] 0940cb: monitor: Add ADV Monitor events to btmon parser
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 0940cba00348632dc358b201a7f3b4a860951d41
      https://github.com/bluez/bluez/commit/0940cba00348632dc358b201a7f3b4a860951d41
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-09-08 (Thu, 08 Sep 2022)

  Changed paths:
    M monitor/packet.c

  Log Message:
  -----------
  monitor: Add ADV Monitor events to btmon parser

Add missing ADV Monitor MGMT events


  Commit: 9d8fd3c28bbf9517eb93c71ebadefcc5d0d6ca73
      https://github.com/bluez/bluez/commit/9d8fd3c28bbf9517eb93c71ebadefcc5d0d6ca73
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-09-08 (Thu, 08 Sep 2022)

  Changed paths:
    M monitor/packet.c

  Log Message:
  -----------
  monitor: Add mesh MGMT cmds/events to btmon parser

Sample Output:
@ MGMT Command: Read Mesh Features (0x0058) plen 0
@ MGMT Event: Command Complete (0x0001) plen 7
      Read Mesh Features (0x0058) plen 4
        Status: Success (0x00)
        Index: 0
        Max Handles: 3
        Used Handles: 0

@ MGMT Command: Set Mesh Receiver (0x0057) plen 9
        Enable: 1
        Window: 4096
        Period: 4096
        Num AD Types: 3
          AD Type: 42
          AD Type: 43
          AD Type: 41
@ MGMT Event: Command Complete (0x0001) plen 3
      Set Mesh Receiver (0x0057) plen 0
        Status: Success (0x00)

@ MGMT Command: Mesh Send (0x0059) plen 43
        Address: 00:00:00:00:00:00 (OUI 00-00-00)
        Addr Type: 2
        Instant: 0x0000000000000000
        Delay: 0
        Count: 1
        Data Length: 24
        Data: 172b01002dda0c2491537ae2000000009de2120a725038b2
@ MGMT Event: Command Complete (0x0001) plen 4
      Mesh Send (0x0059) plen 1
        Status: Success (0x00)
        Handle: 3

@ MGMT Event: Mesh Packet Complete (0x0032) plen 1
        Handle: 3


Compare: https://github.com/bluez/bluez/compare/4c8a6ba5ec7f...9d8fd3c28bbf
