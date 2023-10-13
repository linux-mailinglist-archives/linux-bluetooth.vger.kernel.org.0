Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AB87C8ED2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Oct 2023 23:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjJMVOd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Oct 2023 17:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJMVOd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Oct 2023 17:14:33 -0400
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60E6B7
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Oct 2023 14:14:30 -0700 (PDT)
Received: from github.com (hubbernetes-node-7f7dd3c.ash1-iad.github.net [10.56.146.26])
        by smtp.github.com (Postfix) with ESMTPA id 2446C341204
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Oct 2023 14:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1697231670;
        bh=yDoh/ikswsEV04KypVJZ8hTHmaQgvOhohuZvsNVfqyU=;
        h=Date:From:To:Subject:From;
        b=b2UaFL2AE61tZxqXcWJ12YptS1i8KNqKSqfdbC4fdtKUEcH8s/xhbrNOH9etZUtfY
         KCxqBDJzsVBKsTzJnvUTculelAMVUSUzyK/DrIQt7R87QWsZd2hOiT+0NHBPZjBp8j
         UWVJF0wQImZ00YOUINpYMBMaCxonokL6PkE/2cjw=
Date:   Fri, 13 Oct 2023 14:14:30 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/e34779-66c41d@github.com>
Subject: [bluez/bluez] 66c41d: build: Fix manpage location for obex.Agent*(5)
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
  Commit: 66c41d78f86007ef9b534df498b7bb1355267c4f
      https://github.com/bluez/bluez/commit/66c41d78f86007ef9b534df498b7bb1355267c4f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-10-13 (Fri, 13 Oct 2023)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  build: Fix manpage location for obex.Agent*(5)

This fixes the location of obex.Agent*(5) manpages.


