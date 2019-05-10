Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B967E19A2B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 May 2019 11:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfEJJBx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 May 2019 05:01:53 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43159 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfEJJBx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 May 2019 05:01:53 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CD0391C0013;
        Fri, 10 May 2019 09:01:51 +0000 (UTC)
Message-ID: <603f5710ed4711308901ff4322925b6a33cf0f71.camel@hadess.net>
Subject: Re: Build Warnings, BlueZ TIP, Fedora-30
From:   Bastien Nocera <hadess@hadess.net>
To:     "Gix, Brian" <brian.gix@intel.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Fri, 10 May 2019 11:01:50 +0200
In-Reply-To: <1557343285.14401.4.camel@intel.com>
References: <1557343285.14401.4.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 (3.32.1-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2019-05-08 at 19:21 +0000, Gix, Brian wrote:
> These 3 new build warnings showed up when I upgraded one of my
> devices to Fedora 30.
> 
> They are all in the Android subtree.

I sent patches for those to the list yesterday, would be nice if you
could test them. They were only compile-tested.

Cheers

