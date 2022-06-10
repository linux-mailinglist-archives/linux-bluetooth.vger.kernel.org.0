Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEF0546C43
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Jun 2022 20:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350378AbiFJSZr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 14:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350368AbiFJSZo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 14:25:44 -0400
Received: from smtp.github.com (out-25.smtp.github.com [192.30.252.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA4D2CC96
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 11:25:44 -0700 (PDT)
Received: from github.com (hubbernetes-node-8ce6a9d.ash1-iad.github.net [10.56.209.75])
        by smtp.github.com (Postfix) with ESMTPA id 9D4E7840930
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1654885543;
        bh=XdqIYfETOZ0yJYkO+8v7Xn4luczny1octcVcZbxf1ck=;
        h=Date:From:To:Subject:From;
        b=n+xaZyprfM18qQ1SAlsaDMlWoRiX50YqDmhsAARMbcf1PlzkXvAZq4qQjp3ChMfhF
         n00kUaXD+2wxmCx+ggmTnEbw0seLZLvHv/+Xvr8B4/QfavVckS7UguDjrVWlszAbyv
         3UzABw7kdTX+d6m8bL7s4uI1GtnlHoyXk0yrh+jg=
Date:   Fri, 10 Jun 2022 11:25:43 -0700
From:   Marcel Holtmann <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3c7413-60f18a@github.com>
Subject: [bluez/bluez] 60f18a: mesh: Fix issue with snprintf return value
 check a...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: 60f18a689474fa7d8a355d4318c22d9261ab29f3
      https://github.com/bluez/bluez/commit/60f18a689474fa7d8a355d4318c22d9261ab29f3
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2022-06-10 (Fri, 10 Jun 2022)

  Changed paths:
    M mesh/keyring.c

  Log Message:
  -----------
  mesh: Fix issue with snprintf return value check and format-truncation error


