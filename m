Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC4D85258FF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 May 2022 02:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359744AbiEMAiN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 12 May 2022 20:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345691AbiEMAiM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 12 May 2022 20:38:12 -0400
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7895D5FC
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 May 2022 17:38:12 -0700 (PDT)
Received: from github.com (hubbernetes-node-12e74ca.ash1-iad.github.net [10.56.208.71])
        by smtp.github.com (Postfix) with ESMTPA id 7C9BB9006BC
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 May 2022 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1652402291;
        bh=vzQMwidj0hch6LsHe2zX0pufGRMe5KA5w1NpmqFAiSE=;
        h=Date:From:To:Subject:From;
        b=gQQzXz0IBf6aOsfO0KiMjDwXUz+E4QzlsZ3kpRVx5jyqhgWABR6uNo9SIP2uvgqEp
         iT5QDVi4UW/qrb7oGtKk9ORYA4ddUeyfdyPJPyeD3Ltqa9kkDvrE++s2g5k0QDXZur
         Uch1thi7uDc1ONnPOOZSG9fN7/fkbwLDQRaKIOLg=
Date:   Thu, 12 May 2022 17:38:11 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/4423d6-83497b@github.com>
Subject: [bluez/bluez] cd2471: service: Add initiator argument to
 service_accept
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
  Commit: cd24715bb22656539157a6fb09d70485ec5f5cdd
      https://github.com/bluez/bluez/commit/cd24715bb22656539157a6fb09d70485ec5f5cdd
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-05-12 (Thu, 12 May 2022)

  Changed paths:
    M src/device.c
    M src/service.c
    M src/service.h

  Log Message:
  -----------
  service: Add initiator argument to service_accept

This adds initiator argument to service_accept so profiles accepting
the connection can use btd_service_is_initiator to determine if the
connection was initiated locally (central) or remotely (peripheral).


  Commit: 83497bbb307fcc6eb7f11e996c9bfdbd97147a7e
      https://github.com/bluez/bluez/commit/83497bbb307fcc6eb7f11e996c9bfdbd97147a7e
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-05-12 (Thu, 12 May 2022)

  Changed paths:
    M src/shared/gatt-db.c

  Log Message:
  -----------
  gatt-db: Allow passing Characteristic Value to gatt_db_attribute_get_char_data

This makes gatt_db_attribute_get_char_data work with Characteristic
Value rather than only with Characteristic Declaration.


Compare: https://github.com/bluez/bluez/compare/4423d63a9634...83497bbb307f
