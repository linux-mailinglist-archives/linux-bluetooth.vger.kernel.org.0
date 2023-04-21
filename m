Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011136EB377
	for <lists+linux-bluetooth@lfdr.de>; Fri, 21 Apr 2023 23:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232094AbjDUVOI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 21 Apr 2023 17:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232865AbjDUVOH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 21 Apr 2023 17:14:07 -0400
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A74273A
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 Apr 2023 14:13:52 -0700 (PDT)
Received: from github.com (hubbernetes-node-ba3d946.va3-iad.github.net [10.48.132.29])
        by smtp.github.com (Postfix) with ESMTPA id D41685C038F
        for <linux-bluetooth@vger.kernel.org>; Fri, 21 Apr 2023 14:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1682111631;
        bh=Pk/WVVZamKI18IKpNWPORVdduXQAZR4YPyK1yCu1P+4=;
        h=Date:From:To:Subject:From;
        b=I1VMVl4ZKPxIhWEIOBQxDV4d29c5xPAmghIhKrraMxzTQc6Uixi6yPDUEjMwwQPD6
         BE+BPMWGrV1h8rR0lzR20r8doH3MTCS56oMop4BdZgSp2Osy3em1rwNThbx3cYSuTH
         8oDGcTRe2SVAWVT52HKcNRBhv5O/Cf8Mvzn7UkaE=
Date:   Fri, 21 Apr 2023 14:13:51 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d36160-9a0acc@github.com>
Subject: [bluez/bluez] 9a0acc: obexd: agent: Use if-elseif instead of multi-if
 to...
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 9a0acc7984ef79e287ec9db70703405f64a79bee
      https://github.com/bluez/bluez/commit/9a0acc7984ef79e287ec9db70703405f64a79bee
  Author: Guiting Shen <aarongt.shen@gmail.com>
  Date:   2023-04-21 (Fri, 21 Apr 2023)

  Changed paths:
    M obexd/src/manager.c

  Log Message:
  -----------
  obexd: agent: Use if-elseif instead of multi-if to check error message

The obex agent will return only one error message at the same time.So
we should use if-elseif instead of multi-if to check error message which
maybe DEBUG_ERROR_NO_REPLY or OBEX_ERROR_REJECT in agent_reply().


