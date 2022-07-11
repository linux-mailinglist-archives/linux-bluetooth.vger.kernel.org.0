Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2D6562413
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jun 2022 22:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbiF3UWD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jun 2022 16:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiF3UWC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jun 2022 16:22:02 -0400
Received: from smtp.github.com (out-22.smtp.github.com [192.30.252.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B22828E19
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jun 2022 13:22:01 -0700 (PDT)
Received: from github.com (hubbernetes-node-d218dd9.ac4-iad.github.net [10.52.205.75])
        by smtp.github.com (Postfix) with ESMTPA id 93D2772054B
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jun 2022 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1656620520;
        bh=X1FQ0mksHZzCie9wUKV51o0tBvZstJu0zc8n3z7U2Fg=;
        h=Date:From:To:Subject:From;
        b=nRa6RTRWiv1S3LrqNoUu08nz2QMGXaoL5b01SPBDwtxXOm3xVwXel3kzRJk0URE23
         2eyuf6mezmsGXv3unQLhoFTo0WC9566GcgikKJkXp3Al+RI8XtpfngYQYByMUHnST8
         aVmbeqK3jNliE/5FEJ9oh4htNijy1MOGPU2R/Xfk=
Date:   Thu, 30 Jun 2022 13:22:00 -0700
From:   iwestin <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/1d6cfb-be7ebf@github.com>
Subject: [bluez/bluez] be7ebf: mesh: Use correct net_id for received CTL
 messages
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
  Commit: be7ebf29b370d298290f6a4eceb31b1d9c94081c
      https://github.com/bluez/bluez/commit/be7ebf29b370d298290f6a4eceb31b1d9c94081c
  Author: Isak Westin <isak.westin@hotmail.com>
  Date:   2022-06-30 (Thu, 30 Jun 2022)

  Changed paths:
    M mesh/net.c

  Log Message:
  -----------
  mesh: Use correct net_id for received CTL messages

For received CTL mesh messages, the wrong network ID variable was
passed to ctl_received. This patch changes to the correct variable.

Also, changed type of net_key_id argument in ctl_received function
to be consistent wich the whole call chain.


