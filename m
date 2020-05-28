Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE2D1E5DB3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 May 2020 13:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388249AbgE1LCp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 May 2020 07:02:45 -0400
Received: from smtpbguseast2.qq.com ([54.204.34.130]:41946 "EHLO
        smtpbguseast2.qq.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388092AbgE1LCo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 May 2020 07:02:44 -0400
X-QQ-mid: bizesmtp20t1590663729t1beqogp
Received: from [10.37.48.241] (unknown [111.202.205.18])
        by esmtp6.qq.com (ESMTP) with SMTP id 0
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 May 2020 19:02:08 +0800 (CST)
X-QQ-SSF: 00400000002000H0ZG90B00A0000000
X-QQ-FEAT: LtVlJ5/o9GGbEWhQrxnGKf8mY1mhfSrpSpz7GAjeQCsYHDmlZXK1FefQOnMJx
        /cLtMkREeBJQeWX0A9V2rF2x9fQA0iYqqzCvqVtbXXK7TA+Jq251KUgHQqVKYmjPkgbYuPk
        d2zbNl42oH2IoXWJMrYEmcjLTePMSiInRcVp1RV3pLZ7rdFYxRqAgDA9La26igDw2XZR26K
        7Dw9LbFViGlylAfrZFu8CRkmI7WTQT7rdqsjZ8Ev3UnolwGf595etRSCnjwmm3E4X8HwoE+
        e0TPujNSPLT2xO/aSMuDuIe3am4Q2egkKzNrXm1DWAAxK3qUOZv9DvCGzqaZ0d8+UVOEmZr
        eXt9eto4Ba3SQifhcg=
X-QQ-GoodBg: 2
From:   Jiaquan He <jiaquan.he@9amtech.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Is it possible to parallelize mesh node provisioning?
Message-Id: <577A37D1-506F-44B7-A685-6E34FE26560E@9amtech.com>
Date:   Thu, 28 May 2020 19:02:08 +0800
To:     linux-bluetooth@vger.kernel.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:9amtech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi All,

I’m working on a bluetooth mesh node provisioner based on BlueZ 5.54, and expecting to provision a bunch of devices (mesh nodes).

I’m just simply calling org.bluez.mesh.Management1.AddNode multiple times, but it seems that we can have only one prov-initiator at a time.

So is there any way to have multiple provisioning sessions at the same time? Or does it make sense to provision multiple nodes at the same time?

Thank you.

Regards,
Jiaquan

