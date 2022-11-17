Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66A9262E889
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Nov 2022 23:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbiKQWhX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Nov 2022 17:37:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234725AbiKQWhV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Nov 2022 17:37:21 -0500
Received: from smtp.github.com (out-22.smtp.github.com [192.30.252.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18C31B9C7
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Nov 2022 14:37:19 -0800 (PST)
Received: from github.com (hubbernetes-node-2c89f3b.ac4-iad.github.net [10.52.220.24])
        by smtp.github.com (Postfix) with ESMTPA id 15267720D20
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Nov 2022 14:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1668724639;
        bh=FlVpY7GRRKzsSEi1dy0ZKEIQ56VTn6VsU36/MWk7LDw=;
        h=Date:From:To:Subject:From;
        b=GLtOMA4oP5eQKDPN9O63T0TwC06sY8oxMpAXAmBpm8Je/PmV1DcnZ/dc9zHHFAgeW
         rDsmDmordN/A2egC9Z9pkGlSxKldY2MKEPhAachtt/+xGdHQL4SzuHGRFfVfK/RHUs
         9b90v3xavMCOlrkMremPT1xkgNIB6x6aE4bmcZe0=
Date:   Thu, 17 Nov 2022 14:37:19 -0800
From:   BluezTestBot <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/tags/5.66/000000-e96430@github.com>
Subject: [bluez/bluez]
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_50,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,TVD_SPACE_RATIO autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/tags/5.66
  Home:   https://github.com/bluez/bluez
