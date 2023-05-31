Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8ED718B90
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 May 2023 23:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjEaVIC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 May 2023 17:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjEaVIA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 May 2023 17:08:00 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5666B3
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 14:07:56 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 1C5CA240108
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 May 2023 23:07:54 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QWhgD1Nztz9rxN;
        Wed, 31 May 2023 23:07:51 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH v2 0/4] LE Set CIG Parameters / Create CIS fixes
Date:   Wed, 31 May 2023 21:07:45 +0000
Message-Id: <cover.1685565568.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset fixes a few issues with emission of HCI Remove CIG, Set
CIG Parameters, Create CIS when multiple ISO sockets in the same CIG are
closed and reconnected rapidly.

v2: Dropped patches that added error checking in hci_le_set_cig_params,
    TBD separately later.  Returning errors there triggers some race
    condition in the emulator when it's cleaning up the connections, which
    needs some more looking.

    Simplified the Set CIG Parameters event parsing.

    The patches here now are enough to make the test suite pass, and
    enough to fix the race conditions encountered in BlueZ ISO ops.

Pauli Virtanen (4):
  Bluetooth: ISO: use hci_sync for setting CIG parameters
  Bluetooth: ISO: don't try to remove CIG if there are bound CIS left
  Bluetooth: ISO: use correct CIS order in Set CIG Parameters event
  Bluetooth: ISO: do not emit new LE Create CIS if previous is pending

 include/net/bluetooth/hci_core.h |   4 +-
 include/net/bluetooth/hci_sync.h |   2 +-
 net/bluetooth/hci_conn.c         | 123 ++++++++++++++++++-------------
 net/bluetooth/hci_event.c        |  72 +++++++++++++-----
 net/bluetooth/hci_sync.c         |  90 +++++++++++++++-------
 net/bluetooth/iso.c              |   2 +-
 6 files changed, 193 insertions(+), 100 deletions(-)

-- 
2.40.1

