Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6109832D9DB
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 20:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbhCDS7A (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Mar 2021 13:59:00 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54818 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbhCDS6e (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Mar 2021 13:58:34 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 750BE1F46638
Message-ID: <8ede2f3e7593cbbd78e5aa4d3b28257a75e17b63.camel@collabora.com>
Subject: Re: Bug caused by moving to BlueZ 5.56 (bytes stripped from HoG
 reports)
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Thu, 04 Mar 2021 19:57:48 +0100
In-Reply-To: <CABBYNZLp9pOopbEfONc=oOh=ODFi55YzA6BKoN4ABuSzuZdPbw@mail.gmail.com>
References: <f6764fe94d45ff9211674c5799b193d15385a056.camel@collabora.com>
         <CABBYNZLp9pOopbEfONc=oOh=ODFi55YzA6BKoN4ABuSzuZdPbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz

On Thu, 2021-03-04 at 10:44 -0800, Luiz Augusto von Dentz wrote:
> Nope, you are the first one to report a problem with this change, so
> chances are that what Dean stated probably still holds since the vast
> majority of devices didn't care about the report ID. So I suppose the
> following code shall take care of it or does it not?
> 
> 
https://github.com/fwupd/fwupd/blob/master/plugins/pixart-rf/fu-pxi-device.c#L170
> 

Yes, that's how we're dealing with it for now. It's a quick fix, a more general
solution would be to detect the BlueZ version and parse the reports accordingly.
By the way, is there a way to query the version of the running daemon other than
running it with '-v' and parsing the result?

I just wanted to let you know that this can actually happen so you're ready for
it, as there might be more code like this in other projects, although I don't
know how frequent it is for a device to use vendor-specific report IDs.

Cheers,
Ricardo

