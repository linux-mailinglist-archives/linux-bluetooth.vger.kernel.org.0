Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5EE36BA145
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Mar 2023 22:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbjCNVPy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Mar 2023 17:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjCNVPx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Mar 2023 17:15:53 -0400
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7053BDA8
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Mar 2023 14:15:52 -0700 (PDT)
Received: from github.com (hubbernetes-node-26ca32b.va3-iad.github.net [10.48.144.25])
        by smtp.github.com (Postfix) with ESMTPA id 07218E0368
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Mar 2023 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1678828552;
        bh=RLpCkoKbtzSHPsRpZ4U5RLea8kqQSWnjHJD/lpSanl4=;
        h=Date:From:To:Subject:From;
        b=bYIUroC2BK0yKk/a81NWgTbVaAZQR3K897v/qKDZVLsnDXX0+jPm2Db4Mx3Jjm4Ei
         U91bja4oymlBkVxuaO9QfH4rw6q3o2SBRB3QceHR1hJRVSnzjjoNiFYVR91RtTyUzw
         A3obSiRRjCasaI94LTKuvsPtI/uc7mhs2c5tuym0=
Date:   Tue, 14 Mar 2023 14:15:52 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/6ae44c-857d9b@github.com>
Subject: [bluez/bluez] 857d9b: shared/gatt-client: Fix crash on
 bt_gatt_client_id...
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
  Commit: 857d9b96b38401ce5666172ddea115d37ad6af70
      https://github.com/bluez/bluez/commit/857d9b96b38401ce5666172ddea115d37ad6af70
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-03-14 (Tue, 14 Mar 2023)

  Changed paths:
    M src/shared/gatt-client.c

  Log Message:
  -----------
  shared/gatt-client: Fix crash on bt_gatt_client_idle_unregister

This fixes the following crash:

Invalid read of size 8
   at 0x1E1E0B: bt_gatt_client_idle_unregister (gatt-client.c:3812)
   by 0x1EB6BD: bt_bap_detach (bap.c:3821)
   by 0x1EB6BD: bt_bap_detach (bap.c:3808)
   by 0x1D5631: queue_foreach (queue.c:207)
   by 0x1DCAA3: disconnect_cb (att.c:713)
   by 0x1F4404: watch_callback (io-glib.c:157)
   by 0x48BBC7E: g_main_context_dispatch (in /usr/lib64/libglib-2.0.so.0.7400.6)
   by 0x4912117: ??? (in /usr/lib64/libglib-2.0.so.0.7400.6)
   by 0x48BB24E: g_main_loop_run (in /usr/lib64/libglib-2.0.so.0.7400.6)
   by 0x1F4A54: mainloop_run (mainloop-glib.c:66)
   by 0x1F4E21: mainloop_run_with_signal (mainloop-notify.c:188)
   by 0x1304B4: main (main.c:1428)
 Address 0x28 is not stack'd, malloc'd or (recently) free'd


