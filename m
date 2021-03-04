Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52F932D7FB
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 17:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhCDQnc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 11:43:32 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:7953 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbhCDQnM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 11:43:12 -0500
X-Originating-IP: 78.199.60.242
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C36FC24000B;
        Thu,  4 Mar 2021 16:42:20 +0000 (UTC)
Message-ID: <78003e9ffc8aa7305116f05707b221b66bfa75bd.camel@hadess.net>
Subject: Re: patch to fix conflict with unistd.h
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Zbigniew =?UTF-8?Q?J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Thu, 04 Mar 2021 17:42:19 +0100
In-Reply-To: <CABBYNZLYiGwYCQcihs9x-AJ33jS5dmUoY45GM4sk0PbmQW-iLg@mail.gmail.com>
References: <20210303081942.GH7348@in.waw.pl>
         <CABBYNZLYiGwYCQcihs9x-AJ33jS5dmUoY45GM4sk0PbmQW-iLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2021-03-04 at 08:37 -0800, Luiz Augusto von Dentz wrote:
> Hi Zbigniew,
> 
> On Thu, Mar 4, 2021 at 1:02 AM Zbigniew Jędrzejewski-Szmek
> <zbyszek@in.waw.pl> wrote:
> > 
> 
> Can you send it as a proper patch, look at HACKING if you don't know
> how to send it using e.g. git send-patch.

Let me know if you want me to do it, I have all that already set up.

