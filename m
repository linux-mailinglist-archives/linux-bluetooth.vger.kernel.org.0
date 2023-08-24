Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0D3787661
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Aug 2023 19:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbjHXRJv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Aug 2023 13:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237548AbjHXRJq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Aug 2023 13:09:46 -0400
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18AF19A3
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 10:09:44 -0700 (PDT)
Received: from github.com (hubbernetes-node-1ca4720.va3-iad.github.net [10.48.221.45])
        by smtp.github.com (Postfix) with ESMTPA id 225749406A8
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Aug 2023 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1692896984;
        bh=dZLh10MFPPfP1nnP+e3hLh2FTBvmbmQls4L15xgwlhw=;
        h=Date:From:To:Subject:From;
        b=O3SkBgoQs8Zovz6Po9E9bxJ/cNhE1g2JsjD7CN5g4oCatqLZFZz2eMoSeNz7zJKij
         VLd9z01Zsj0p175+HWYdBxj/3mSpSOzTCWkBkixmNpcRSza4ipn9ml2Qz4BQZ4Efze
         MZZhcXLbnIwjGlZtlocfB+KNy2zVYL5MwRAyQc+k=
Date:   Thu, 24 Aug 2023 10:09:44 -0700
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/tags/5.69/000000-bbe411@github.com>
Subject: [bluez/bluez]
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_40,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/tags/5.69
  Home:   https://github.com/bluez/bluez
