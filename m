Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA624CE244
	for <lists+linux-bluetooth@lfdr.de>; Sat,  5 Mar 2022 03:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbiCEC3N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 4 Mar 2022 21:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiCEC3M (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 4 Mar 2022 21:29:12 -0500
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C11C22B29
        for <linux-bluetooth@vger.kernel.org>; Fri,  4 Mar 2022 18:28:23 -0800 (PST)
Received: from [192.168.126.80] (ip98-164-213-246.oc.oc.cox.net [98.164.213.246])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4K9TD52VwMz3kyv;
        Fri,  4 Mar 2022 21:28:21 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
        t=1646447302; bh=rizAJh8wpE1RtvIagIYbY1FOI8xlFGbZ7fk9cI6bChI=;
        h=Date:From:Reply-To:To:cc:Subject:In-Reply-To:References;
        b=Izi4Uk0fXcjcIjPmmRaeu0pbVpaRpe3ihw7JOl11zb3004ViLj5QAv7RhI87GZHAj
         fbcIvUmO+RWXgcLAI9wQ0Iz94Bq7JnIESuXlavRS+RLC5dMjRbVUmSC7lcI/pjwsdg
         DxPRhjrYPmyUQqEHRsqVdKQceuptL9amNsVfiMgs=
Date:   Fri, 4 Mar 2022 18:28:20 -0800 (PST)
From:   "Kenneth R. Crudup" <kenny@panix.com>
Reply-To: "Kenneth R. Crudup" <kenny@panix.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
cc:     Luiz Augusto Von Dentz <luiz.von.dentz@intel.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        regressions@lists.linux.dev, Marcel Holtmann <marcel@holtmann.org>,
        "Kenneth R. Crudup" <kenny@panix.com>
Subject: Re: Commit ad383c2c6 ("Bluetooth: hci_sync: Enable advertising when
 LL privacy is enabled") breaks my MS ArcTouch mouse
In-Reply-To: <CABBYNZJiDPA=qfkkBHbi5kWFxgM3+RjBtjmryKBY2AEzyfBXFw@mail.gmail.com>
Message-ID: <07f16d7-9f11-b42c-1f86-195dca28dfd5@panix.com>
References: <4124ccb8-11f-21e9-982e-7fb07f23225@panix.com> <CABBYNZLt3GmBTmAADa+FF2bdEfzMg_9Horxk2pT85BC+LFgrMQ@mail.gmail.com> <91c1e9ef-4786-b9f5-8bb8-b93c84c0874b@panix.com> <CABBYNZ+t+L=G-X0qt=Cnn7vUpLu2s1=purmAESnCaRvK7XtmdQ@mail.gmail.com>
 <76f65c9-e031-3870-9dfb-49f8969534ae@panix.com> <6f3b9dbb-6ecf-cfea-2127-cb3360d78431@panix.com> <3bc9bbab-b3cd-4c52-cc33-5d723d973deb@panix.com> <28e1099-76a-3b8d-b6d2-84dbde9ab853@panix.com>
 <CABBYNZJiDPA=qfkkBHbi5kWFxgM3+RjBtjmryKBY2AEzyfBXFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


On Fri, 4 Mar 2022, Luiz Augusto von Dentz wrote:

> Have you tried with bluetooth.git tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/
> This was the latest one that fixes the MGMT commands not working:
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/commit/?h=for-net-2022-03-03&id=008ee9eb8a11bcabf12c91771dd4f470b082bd44

Yup, that seems to have fixed things! I've even merged that with Linus' current
master (which went in cleanly) and will look for these changes to me merged in.

Thanks to you and everyone else who helped find and fix this regression!

	-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange County CA
