Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB1ACADFE
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Oct 2019 20:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbfJCSS6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Oct 2019 14:18:58 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:38594 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731890AbfJCSS5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Oct 2019 14:18:57 -0400
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id CB455B00CD;
        Thu,  3 Oct 2019 21:18:55 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
        id 81BB736C0F6; Thu,  3 Oct 2019 21:18:55 +0300 (EEST)
Date:   Thu, 3 Oct 2019 21:18:55 +0300
From:   Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH BlueZ 1/4] doc/media-api: Add RegisterApplication method
Message-ID: <20191003181855.GF28704@reaktio.net>
References: <20190712151329.11333-1-luiz.dentz@gmail.com>
 <CABBYNZLDFAJgkfAFWOOAAqqiX8mpi3KgirBkpwpnBFJ3TxPqyg@mail.gmail.com>
 <20190718100024.ii2igadxb2lmmitm@pali>
 <20190721155522.3vqt7vsprhpxflqf@pali>
 <CABBYNZK6cuz9n4Hu9uRCbQvn9uFEYkn9=mY8J5Fqu0u-D3B1EA@mail.gmail.com>
 <20190829125734.GH2840@reaktio.net>
 <20190829200513.6xnta5jx3trbmgxp@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190829200513.6xnta5jx3trbmgxp@pali>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Thu, Aug 29, 2019 at 10:05:13PM +0200, Pali Roh�r wrote:
> On Thursday 29 August 2019 15:57:34 Pasi K�rkk�inen wrote:
> > Pali: How does it look with porting the PA patches to use the new interfaces?
> 
> Hello, I have not had a time yet to play with these pulseaudio patches
> and porting to the new interface. I guess that I could have more free
> time in the last week of next month.
>

It seems BlueZ 5.51 has been released meanwhile (http://www.bluez.org/release-of-bluez-5-51/)
So now at least the new interfaces are in a released bluez version.


-- Pasi

> -- 
> Pali Roh�r
> pali.rohar@gmail.com

