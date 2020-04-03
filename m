Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5199A19DD45
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 19:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgDCR6d convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 13:58:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60960 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbgDCR6d (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 13:58:33 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 29A1ECED02;
        Fri,  3 Apr 2020 20:08:05 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] tools/hciattach_ath3k: Load BT board data based on
 country code
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAOxioNnC-sC1SxcK-=VjMLQa8jmQ6DA-uKX3cLfGK=2zXN6PcA@mail.gmail.com>
Date:   Fri, 3 Apr 2020 19:58:31 +0200
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>, yixiang@google.com,
        Zhifeng Cai <caiz@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <7FDB98C0-49AB-4AD6-A997-7C04386B273E@holtmann.org>
References: <20200331003355.14614-1-sonnysasaka@chromium.org>
 <7CA6DAE1-09E7-4CEC-BA78-E8C4E104D92E@holtmann.org>
 <CAOxioNm27+wmWeCp+hoWCF-5W1=xm_gdvn3xWbDJVeYE=wmyiQ@mail.gmail.com>
 <CC80769E-941D-4AD9-AFB3-C24DD84E940D@holtmann.org>
 <CAOxioNnC-sC1SxcK-=VjMLQa8jmQ6DA-uKX3cLfGK=2zXN6PcA@mail.gmail.com>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> There is no need to apply the patch. I sent the patch because I didn't
> know of the deprecation plan. Thank you for the feedback.

actually I did apply the patch. I really dislike if distribution carry too many patches. Just remember that this tool will go away eventually. So make a plan to upgrade to serdev.

Regards

Marcel

