Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85AB36423D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Apr 2021 15:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbhDSNC2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Apr 2021 09:02:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40679 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbhDSNC0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Apr 2021 09:02:26 -0400
Received: from mac-pro.holtmann.net (p4ff9fbbb.dip0.t-ipconnect.de [79.249.251.187])
        by mail.holtmann.org (Postfix) with ESMTPSA id E3C8DCECF7;
        Mon, 19 Apr 2021 15:09:40 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [BlueZ v2] monitor: Add Intel read supported VS features command
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210417003446.628078-1-hj.tedd.an@gmail.com>
Date:   Mon, 19 Apr 2021 15:01:54 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <57388317-FF4B-460C-8399-C3C7CC58C393@holtmann.org>
References: <tedd.an@intel.com> <20210417003446.628078-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> < HCI Command: Intel Read Supported VS Features (0x3f|0x00a6) plen 1
>        Page: 0x01
>> HCI Event: Command Complete (0x0e) plen 22
>      Intel Read Supported VS Features (0x3f|0x00a6) ncmd 1
>        Status: Success (0x00)
>        Page: 0x01
>        Max Pages: 0x02
>        Supported Features:
>        1f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................

scrap the VS part of the name. I never used it since we prefix them with “Intel“ anyway.

Regards

Marcel

