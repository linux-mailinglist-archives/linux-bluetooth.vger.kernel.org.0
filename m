Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DDF4EFD1A
	for <lists+linux-bluetooth@lfdr.de>; Sat,  2 Apr 2022 01:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348048AbiDAXhT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 19:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235236AbiDAXhR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 19:37:17 -0400
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51345AEE6
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 16:35:27 -0700 (PDT)
Received: from github.com (hubbernetes-node-b4e9ef3.ac4-iad.github.net [10.52.201.40])
        by smtp.github.com (Postfix) with ESMTPA id 39DBC600955
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 16:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1648856127;
        bh=V9zUaLWnfyn43qB29ACXlFJDQYkWszHYNxLDzGzu7F0=;
        h=Date:From:To:Subject:From;
        b=lChv7WY+LtG+ItEHQvjV1GVmhRc2qPYbkohkY4RpPU9RC7TlJYoVXxoAe+J9PgVol
         u3yg2IpyblAwqwI3KfVfi7hXDvggl9XSgIof7HHDskvElrp1KbJh4x/4mc7hvy4B+S
         aGJ20O88l+BClc39oQxTb+4u9tlZzsHJZY2mozX0=
Date:   Fri, 01 Apr 2022 16:35:27 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/ff35b1-234d60@github.com>
Subject: [bluez/bluez] 6d1531: btdev: Check parameter for CIG related commands
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
  Commit: 6d15315570a43375ab98fa01841e5d957de1724c
      https://github.com/bluez/bluez/commit/6d15315570a43375ab98fa01841e5d957de1724c
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-01 (Fri, 01 Apr 2022)

  Changed paths:
    M emulator/btdev.c

  Log Message:
  -----------
  btdev: Check parameter for CIG related commands

This checks if the parameters given to Set CIG Parameters and Remove CIG
are in the valid range.


  Commit: 234d60423c3b8186a27b31028d4c0acb847eedb1
      https://github.com/bluez/bluez/commit/234d60423c3b8186a27b31028d4c0acb847eedb1
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-01 (Fri, 01 Apr 2022)

  Changed paths:
    M src/shared/gatt-db.c

  Log Message:
  -----------
  shared/gatt-db: Fix gatt_db_attribute_get_index

gatt_db_attribute_get_index was calculating the index based on
attrib->handle - service->attributes[0]->handle which doesn't work when
there are gaps in between handles.

Fixes: https://github.com/bluez/bluez/issues/326


Compare: https://github.com/bluez/bluez/compare/ff35b1d2e97e...234d60423c3b
