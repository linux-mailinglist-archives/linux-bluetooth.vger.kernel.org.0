Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3263432ECB8
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Mar 2021 15:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhCEODv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Mar 2021 09:03:51 -0500
Received: from kawka.in.waw.pl ([178.62.225.244]:42126 "EHLO kawka.in.waw.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229740AbhCEOD2 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Mar 2021 09:03:28 -0500
Received: from zbyszek by kawka.in.waw.pl with local (Exim 4.84_2)
        (envelope-from <zbyszek@in.waw.pl>)
        id 1lIB28-0004ZA-LH; Fri, 05 Mar 2021 14:02:24 +0000
Date:   Fri, 5 Mar 2021 14:02:24 +0000
From:   Zbigniew =?utf-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: patch to fix conflict with unistd.h
Message-ID: <20210305140224.GM7348@in.waw.pl>
References: <20210303081942.GH7348@in.waw.pl>
 <CABBYNZLYiGwYCQcihs9x-AJ33jS5dmUoY45GM4sk0PbmQW-iLg@mail.gmail.com>
 <20210304185348.GL7348@in.waw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210304185348.GL7348@in.waw.pl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, Mar 04, 2021 at 06:53:48PM +0000, Zbigniew Jędrzejewski-Szmek wrote:
> On Thu, Mar 04, 2021 at 08:37:04AM -0800, Luiz Augusto von Dentz wrote:
> > Hi Zbigniew,
> > 
> > On Thu, Mar 4, 2021 at 1:02 AM Zbigniew Jędrzejewski-Szmek
> > <zbyszek@in.waw.pl> wrote:
> > >
> > 
> > Can you send it as a proper patch, look at HACKING if you don't know
> > how to send it using e.g. git send-patch.
> 
> Can you be more precise? What was wrong with the first version.

Anyway, the patch is here for anyone who wants to grab it:
https://src.fedoraproject.org/rpms/bluez/raw/fdda690e478cc1581c12265af16d043c757758dd/f/0005-media-rename-local-function-conflicting-with-pause-2.patch

Zbyszek
