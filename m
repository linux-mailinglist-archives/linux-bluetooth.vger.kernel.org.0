Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABF0741885
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jun 2023 21:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjF1TCO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 28 Jun 2023 15:02:14 -0400
Received: from out-21.smtp.github.com ([192.30.252.204]:41845 "EHLO
        out-21.smtp.github.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbjF1TBT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 28 Jun 2023 15:01:19 -0400
Received: from github.com (hubbernetes-node-013ee70.ac4-iad.github.net [10.52.130.31])
        by smtp.github.com (Postfix) with ESMTPA id CA867701213
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jun 2023 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1687978878;
        bh=jwEm6K8cZrJ+bZtL60/eQotDPPJPiAL3/mVi4c6mS10=;
        h=Date:From:To:Subject:From;
        b=InKlWiNh1+h5y4N6ChFQjLuoWwiafrtfHmUmc4PDPxMcJcVUKxQ2U2LEIJtDqIzYm
         VS/V40s/qY5ey7xSXRW9q6hC+DWo92iwBRCpyQYf9XD3DiXyKd+KV3hzmp32p615FN
         VC6C5b6j/wwyGUU9TZMEtGFFAymyqPk0j2PbT4xg=
Date:   Wed, 28 Jun 2023 12:01:18 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d6bfbd-ddfa40@github.com>
Subject: [bluez/bluez] ddfa40: shared/bap: Fix handling of codec fields
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: ddfa40977c7e7b8723fc3ba9389822631ddeeb5c
      https://github.com/bluez/bluez/commit/ddfa40977c7e7b8723fc3ba9389822631ddeeb5c
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-06-27 (Tue, 27 Jun 2023)

  Changed paths:
    M src/shared/bap.c

  Log Message:
  -----------
  shared/bap: Fix handling of codec fields

Codec fields needs to be converted when codec.id is 0xff as the host
endian may not always be little endian.


