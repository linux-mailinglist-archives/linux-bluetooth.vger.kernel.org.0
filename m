Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80A65AA2C1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Sep 2022 00:19:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbiIAWTU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 18:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235012AbiIAWSp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 18:18:45 -0400
Received: from smtp.github.com (out-21.smtp.github.com [192.30.252.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA51061D66
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 15:18:14 -0700 (PDT)
Received: from github.com (hubbernetes-node-bba5da9.ac4-iad.github.net [10.52.207.54])
        by smtp.github.com (Postfix) with ESMTPA id 4E54B520292
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1662070693;
        bh=n0J0NWaH44PYk7omHQ1/53ftf2i+H8EqlKXC/o66J1A=;
        h=Date:From:To:Subject:From;
        b=n1B98/zErIYKnX8Ud2CcXVppC59zlEXtCPHbJJcNvYbLYcKwhmN4Gtbv821z3VFXw
         0qJtNDn1gQAfwUztud73pOcCkPdwHW6QZh5p/fPfQnHMjOSxtQRL+B9v53LB9bQkbt
         WmycXxtJH6hrbXIyesW0rfb1fYgI0vPZvWtMdzjE=
Date:   Thu, 01 Sep 2022 15:18:13 -0700
From:   Brian Gix <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/61f4f2-c96629@github.com>
Subject: [bluez/bluez] 4f452c: lib: Add mgmt opcodes and events for Mesh
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
  Commit: 4f452c7753da15f4805ec991434eec03c6bbcbeb
      https://github.com/bluez/bluez/commit/4f452c7753da15f4805ec991434eec03c6bbcbeb
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-09-01 (Thu, 01 Sep 2022)

  Changed paths:
    M lib/mgmt.h

  Log Message:
  -----------
  lib: Add mgmt opcodes and events for Mesh


  Commit: da4b654834b14941c931f44bf1b7af9a7fd5a80a
      https://github.com/bluez/bluez/commit/da4b654834b14941c931f44bf1b7af9a7fd5a80a
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-09-01 (Thu, 01 Sep 2022)

  Changed paths:
    M Makefile.tools
    A tools/mesh-tester.c
    M tools/test-runner.c

  Log Message:
  -----------
  tools: Add mesh-tester to test Kernel mesh support

Ever growing set of tests for Mesh kernel support


  Commit: c96629bedbae22ffd059b842a1454254f4cd3607
      https://github.com/bluez/bluez/commit/c96629bedbae22ffd059b842a1454254f4cd3607
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-09-01 (Thu, 01 Sep 2022)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: Adds turning on Mesh Experimental feature

Turns on experimental Mesh feature, and expects it in report when
querying which experimental features are supported and have been
enabled.


Compare: https://github.com/bluez/bluez/compare/61f4f2895882...c96629bedbae
