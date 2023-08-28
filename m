Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706EC78B87B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Aug 2023 21:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjH1TfZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Aug 2023 15:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbjH1Tew (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Aug 2023 15:34:52 -0400
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8354E12D
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Aug 2023 12:34:50 -0700 (PDT)
Received: from github.com (hubbernetes-node-1c2c9f6.ac4-iad.github.net [10.52.138.38])
        by smtp.github.com (Postfix) with ESMTPA id 952B41E1095
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Aug 2023 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1693251289;
        bh=l6HhEqr5PPM1u/VE8ylDpTNmd19X4EeoP6w7lRLS3NA=;
        h=Date:From:To:Subject:From;
        b=hRT4eRoR+jBpKwacZtX54O8jz6fejEXoG2TIagTeXim64ck3dt+ndfIRPBG3xnIWi
         72DVkFODOnviA/G7YKHr0S2qAqFh9Z9p+GWO7WUsJxedGGjWwyDd+2vUiWp1MPt4TH
         rCkjICIjbpYojYD0xHuoOiVozivT6TEAose2hveY=
Date:   Mon, 28 Aug 2023 12:34:49 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/6a8f7c-670f0d@github.com>
Subject: [bluez/bluez] 670f0d: shared/gatt-client: Fix not sending
 confirmations
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 670f0d0f618d3f122e6d95c34de53f59a343a15f
      https://github.com/bluez/bluez/commit/670f0d0f618d3f122e6d95c34de53f59a343a15f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-28 (Mon, 28 Aug 2023)

  Changed paths:
    M src/shared/gatt-client.c

  Log Message:
  -----------
  shared/gatt-client: Fix not sending confirmations

Commit fde32ff9c9c0 ("shared/gatt-client: Allow registering with NULL
callback") added an early return to the notify_cb function when the
current client's notify_list is empty which prevents sending
confirmations to indications.

Reported-by: Javier de San Pedro <dev.git@javispedro.com>


