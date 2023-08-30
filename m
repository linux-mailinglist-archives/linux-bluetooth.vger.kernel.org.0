Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD7C78E30C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 31 Aug 2023 01:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235783AbjH3XKX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Aug 2023 19:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjH3XKW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Aug 2023 19:10:22 -0400
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337C283
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Aug 2023 16:10:20 -0700 (PDT)
Received: from github.com (hubbernetes-node-9ead334.va3-iad.github.net [10.48.209.52])
        by smtp.github.com (Postfix) with ESMTPA id 69897940B8E
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Aug 2023 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1693437019;
        bh=IZJgI9+Os1drM7filgMUyoZkuDauCF9bgewqV9xuYRo=;
        h=Date:From:To:Subject:From;
        b=JvCjjehMCsXaVJW3SkFi91TF2eXv3yPlWGu8W8HVue315hFlLQu1W56GqYeSwM0gh
         CWI5BiJXsQzlCaRS1MHM4ETJnDv0SUyhG2T9fSQiS+Ddo6cxpzsR8sJB7/8RZHCmdz
         6lFKzGul5zDyDBWqeu36cUDSVVe2gBTgxtOLecF8=
Date:   Wed, 30 Aug 2023 16:10:19 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/670f0d-530afa@github.com>
Subject: [bluez/bluez] bc3547: bap: Remove duplicated code
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
  Commit: bc35476450af4256fd8284b1f5cfcbadcb90f8b6
      https://github.com/bluez/bluez/commit/bc35476450af4256fd8284b1f5cfcbadcb90f8b6
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-28 (Mon, 28 Aug 2023)

  Changed paths:
    M profiles/audio/bap.c

  Log Message:
  -----------
  bap: Remove duplicated code

bap_create_io already handle streams of differents types.


  Commit: 530afa43ec2920347c7092823bec8fd51b019280
      https://github.com/bluez/bluez/commit/530afa43ec2920347c7092823bec8fd51b019280
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-08-28 (Mon, 28 Aug 2023)

  Changed paths:
    M doc/media-api.txt

  Log Message:
  -----------
  media-api: Make QoS a single property

This moves QoS related properties to a single dictionary.


Compare: https://github.com/bluez/bluez/compare/670f0d0f618d...530afa43ec29
