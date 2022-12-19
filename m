Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 629C7651497
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Dec 2022 22:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbiLSVDU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Dec 2022 16:03:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbiLSVDT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Dec 2022 16:03:19 -0500
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D3AA44A
        for <linux-bluetooth@vger.kernel.org>; Mon, 19 Dec 2022 13:03:18 -0800 (PST)
Received: from github.com (hubbernetes-node-ec9f30c.ash1-iad.github.net [10.56.14.70])
        by smtp.github.com (Postfix) with ESMTPA id E18179004B3
        for <linux-bluetooth@vger.kernel.org>; Mon, 19 Dec 2022 13:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1671483797;
        bh=9j4p59V3VQcWY/TgDKhOiXGSPOw+NlPMhszTHmziRTc=;
        h=Date:From:To:Subject:From;
        b=xPJMyteLnGsAdi8eRWyxw/LuDhhbJvQXXOHxQKJKpmlAIs4ldzRMKr+AqGUiKi0b5
         JXJmSpwqU9HW+PMvSSUoXQa/IrxDooJrIMvqT1kJdUl5DI3CeCtZLPnOjLg0/iLih3
         z5YHGr/QCLg8nP/2dYJ/xJnbEyoy73zZOjwAnHag=
Date:   Mon, 19 Dec 2022 13:03:17 -0800
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/1270af-da203f@github.com>
Subject: [bluez/bluez] b91d92: shared/gatt-db: Add
 gatt_db_attribute_get_service
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
  Commit: b91d9213d951277896845830d0680061c7643828
      https://github.com/bluez/bluez/commit/b91d9213d951277896845830d0680061c7643828
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-16 (Fri, 16 Dec 2022)

  Changed paths:
    M src/shared/gatt-db.c
    M src/shared/gatt-db.h

  Log Message:
  -----------
  shared/gatt-db: Add gatt_db_attribute_get_service

This adds gatt_db_attribute_get_service which can be used to get the
service which the given attribute belongs to.


  Commit: da203f5dbc7edaa15b55d1efcea3fda5e43cfc2e
      https://github.com/bluez/bluez/commit/da203f5dbc7edaa15b55d1efcea3fda5e43cfc2e
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-12-16 (Fri, 16 Dec 2022)

  Changed paths:
    M src/shared/gatt-client.c

  Log Message:
  -----------
  shared/gatt-client: Fix not removing pending services

If there are no characteristics to discover, or for some reason
bt_gatt_discover_descriptors is skiped, or the last attribute is
actually a included service the service should be removed from
pending list as there will be no more attributes to be discovered.

Fixes: https://github.com/bluez/bluez/issues/438


Compare: https://github.com/bluez/bluez/compare/1270afa5aa1c...da203f5dbc7e
