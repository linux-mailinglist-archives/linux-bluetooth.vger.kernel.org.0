Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59F35500EE
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jun 2022 01:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383715AbiFQXlT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jun 2022 19:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383800AbiFQXlI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jun 2022 19:41:08 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375A166FA1
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 16:41:04 -0700 (PDT)
Received: from github.com (hubbernetes-node-6f3c6fa.ash1-iad.github.net [10.56.226.39])
        by smtp.github.com (Postfix) with ESMTPA id 758988401B7
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655509263;
        bh=1etlVBKMNEwfphSEIVfMOHW0hqfFU+rY0Gbellz95Ho=;
        h=Date:From:To:Subject:From;
        b=facMd31zEK5O7XPwPyIwwZDmbM+9l6b9juAdlIY0egcAbI/V6eNgo8tJIJkrKWHxJ
         FAB1E0OAvJTARDuinZbhP2Eo7HPhBtd3oJ08gf72+HcULNMetI5Eh0ulACzjISD4ZY
         USGL3ehhgGaXh9LGQBztdaiktZxzs6ojO464Hagw=
Date:   Fri, 17 Jun 2022 16:41:03 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3075ff-19ad43@github.com>
Subject: [bluez/bluez] 19ad43: test-runner: Fix issues found by coverity
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

  Branch: refs/heads/master=0D
  Home:   https://github.com/bluez/bluez=0D
  Commit: 19ad4310c9b461783bc73a570be8efffd32b1e42=0D
      https://github.com/bluez/bluez/commit/19ad4310c9b461783bc73a570be8e=
fffd32b1e42=0D
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>=0D
  Date:   2022-06-17 (Fri, 17 Jun 2022)=0D
=0D
  Changed paths:=0D
    M tools/test-runner.c=0D
=0D
  Log Message:=0D
  -----------=0D
  test-runner: Fix issues found by coverity=0D
=0D
=0D
