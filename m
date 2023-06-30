Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B10743682
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jun 2023 10:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbjF3IHo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jun 2023 04:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjF3IHm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jun 2023 04:07:42 -0400
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F18C2D5B
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 01:07:40 -0700 (PDT)
Received: from github.com (hubbernetes-node-5ce7f90.ac4-iad.github.net [10.52.146.30])
        by smtp.github.com (Postfix) with ESMTPA id 90D9D5E10F2
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1688112459;
        bh=FJe9VLZ1GU9LLRrxM84iZTvzetQssdBRmZ9s87I44O8=;
        h=Date:From:To:Subject:From;
        b=JxbSiGpPsMg1czWRpo4FRa+eFfXwp3Ln4kUr7UQvnh3KNLy09gk67XeZ+GcgafH2o
         2gzXf+2SPEJ/vcx59S3+xX5H972AtPKWxBHMA3vWROsEZVVxqqBHAmP0BRvru6QQ8f
         VIsgX6zp5iWSiiUP27wr1BJ50LxTby0MEfW1ZWY4=
Date:   Fri, 30 Jun 2023 01:07:39 -0700
From:   Marcel Holtmann <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/ddfa40-58c08e@github.com>
Subject: [bluez/bluez] 8c760c: build: Update library version
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 8c760ce9a6134873320eecbd27736404c7967c41
      https://github.com/bluez/bluez/commit/8c760ce9a6134873320eecbd27736404c7967c41
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-06-30 (Fri, 30 Jun 2023)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  build: Update library version


  Commit: 2a1a3b4897bc1b2cb1a8ac46deea67d3517656fc
      https://github.com/bluez/bluez/commit/2a1a3b4897bc1b2cb1a8ac46deea67d3517656fc
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-06-30 (Fri, 30 Jun 2023)

  Changed paths:
    M configure.ac

  Log Message:
  -----------
  build: Use LT_INIT instead of AC_PROG_LIBTOOL


  Commit: 58c08ed19deb183cf7532ba8881450be9be1d93c
      https://github.com/bluez/bluez/commit/58c08ed19deb183cf7532ba8881450be9be1d93c
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2023-06-30 (Fri, 30 Jun 2023)

  Changed paths:
    M .gitignore

  Log Message:
  -----------
  build: Add generated manual pages and binaries to .gitignore


Compare: https://github.com/bluez/bluez/compare/ddfa40977c7e...58c08ed19deb
