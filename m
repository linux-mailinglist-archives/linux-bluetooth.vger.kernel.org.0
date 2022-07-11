Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2A95708EC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Jul 2022 19:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiGKRdv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Jul 2022 13:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbiGKRde (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Jul 2022 13:33:34 -0400
Received: from smtp.github.com (out-26.smtp.github.com [192.30.252.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083D3CD0
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Jul 2022 10:33:32 -0700 (PDT)
Received: from github.com (hubbernetes-node-655f4a4.ash1-iad.github.net [10.56.14.49])
        by smtp.github.com (Postfix) with ESMTPA id EE9A05E03B6
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Jul 2022 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1657560812;
        bh=2qAXoQFDsrlZy5JSQXKABtgRQG/XhfgCee5QnrPNnvQ=;
        h=Date:From:To:Subject:From;
        b=O5yEZTzp/chv7RHfoMLEZHZL4oPdvfVotkA1rFJ7QHu/f59eexRlB1T8rsUy0UEOY
         /bEf7yrbE/Szv5T0QK+ozKjcfasRZHS8ivKNcS19OrKI1sQlgenlWNY0tzJXfbmEal
         zf03Eu3Ok9loa1BZ5ABunxcZOEvpQE1HXOblWg9U=
Date:   Mon, 11 Jul 2022 10:33:31 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/e681fa-163de8@github.com>
Subject: [bluez/bluez] 163de8: btdev: Fix not checking if a CIG has any active
 CIS
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 163de8e231e6e138ebfea710df8211f22d4b9b4e
      https://github.com/bluez/bluez/commit/163de8e231e6e138ebfea710df8211f22d4b9b4e
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-07-11 (Mon, 11 Jul 2022)

  Changed paths:
    M emulator/btdev.c

  Log Message:
  -----------
  btdev: Fix not checking if a CIG has any active CIS

Bluetooth Core specification says the CIG must be in configurable state
in order to accept the SetCIGParameters:

BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 4, Part E page 2553:

 'If the Host issues this command when the CIG is not in the
  configurable state, the Controller shall return the error
  code Command Disallowed (0x0C).'


