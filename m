Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F8A62EA69
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Nov 2022 01:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240621AbiKRAhn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Nov 2022 19:37:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240440AbiKRAhk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Nov 2022 19:37:40 -0500
Received: from smtp.github.com (out-26.smtp.github.com [192.30.252.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFBA8432C
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Nov 2022 16:37:37 -0800 (PST)
Received: from github.com (hubbernetes-node-ccf0755.ash1-iad.github.net [10.56.201.107])
        by smtp.github.com (Postfix) with ESMTPA id 9E2215E04A7
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Nov 2022 16:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1668731856;
        bh=h5IdKocLWyDpCNgIC65LJyIEn0VbZ/3+qmMldkWMECE=;
        h=Date:From:To:Subject:From;
        b=tI9mVcbfJYNmRunFRoXyaEecSD9RF0OPFXcWdvOXWr/2ZMAnF/ZtxOrLaO5kupCv4
         uJ7K43iTvX96oFKp0kEsWOBH9F1cEHe/t+w8CmVNWM/wzZlvZ8gg0JjO3p7Ae3e7LB
         qsS/2/NUFL3V/XbKfpcoW8MDkC5tO60IpZzx4OKU=
Date:   Thu, 17 Nov 2022 16:37:36 -0800
From:   Brian Gix <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/e2b2b1-818adf@github.com>
Subject: [bluez/bluez] 818adf: tools: Use portable 64 bit data formats
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 818adf28e51877f32befab1a7faca314f89aa199
      https://github.com/bluez/bluez/commit/818adf28e51877f32befab1a7faca314f89aa199
  Author: Brian Gix <brian.gix@intel.com>
  Date:   2022-11-17 (Thu, 17 Nov 2022)

  Changed paths:
    M tools/isotest.c

  Log Message:
  -----------
  tools: Use portable 64 bit data formats

The isotest executable was using the non-portable %zd string formatter
for loging 64 bit integers. This replaces them with PRId64.


