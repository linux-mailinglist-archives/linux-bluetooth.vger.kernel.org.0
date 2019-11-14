Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7A40FC547
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Nov 2019 12:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfKNL16 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 Nov 2019 06:27:58 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39491 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfKNL16 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 Nov 2019 06:27:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id l7so6035254wrp.6
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 Nov 2019 03:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=uf+Ph9l3ns4WDn0YHPNdqvEhCpqX2/0+ik8Z9a9PA3Y=;
        b=m5MuIxU3NYYARir60Fwcl48LbuOL+abg885BgrmPQx2IMAtk7H4fRv2RRxtnb7ndwU
         SkA2YI781dqI8XkyZlmUneMjIIN9E3+1pdXqn9KaRR72OWNxSrlbVigisupbkdvurkJd
         NtNDxvY/mzxSRv8ba7SKktAzkjWxgb2sJbUoV/0aP2m+gLE23Fte72T06JDjKUbxBnGU
         Eti7OOqd+vidAylJE/OVM2LD+K1woTwaIZfBdloxMwPTD591sXECq8qixEJaw0qMq9xb
         opicDKnGFo5VAhqZIHTWIkV4oGQ9zVVT5EYvmZJztBDs8+E6a53rTBQiJ5es6JfNyF7D
         TpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=uf+Ph9l3ns4WDn0YHPNdqvEhCpqX2/0+ik8Z9a9PA3Y=;
        b=iNuWEsTD6ZYYEy/B0+KE9p6MkOfyH+6EaAPWCrseO+bRwHnviEoyUaQXS6brprHcLj
         cJ3PKGpIuNteuWY2FQWs/1QhdQ74ITgauQkjQ9n1hmZTEO9KW3OQp7suuV49yO/uQgpC
         NMubzg2qOFp4xp+RnnJEvWKoCr8cbU2fHbd3seXdvmOIVWYYB5BkyGQhT4HiubWiCjgT
         zZLCz9ErJssHj/ljf4DlJkb6S47/NSJO8otE9Y83ti3cDMJaKR6MC8ioI7tdzxyjZy8m
         zGGtNRa2q6JoTF2VlK5jvhtbPGjT0Jdn6lppqJa6jl8c2SepgppoGF+4im6XlgGGLp89
         uCfQ==
X-Gm-Message-State: APjAAAX8QFtkNnywoakQND5trjn/znOkq//7vnOV04NajX/F3wAjwyhk
        gdaE1KXt1VaVlzbeDfdCebTwuHCv
X-Google-Smtp-Source: APXvYqzyKt8tl6fcP0wbS7fj0n6QIsBODgTBg5pNjRwq2lmt7pAU7trJcKGXJQELpFmbnrMjquwhcg==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr7436543wru.195.1573730875849;
        Thu, 14 Nov 2019 03:27:55 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id m16sm5758142wml.47.2019.11.14.03.27.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 03:27:54 -0800 (PST)
Date:   Thu, 14 Nov 2019 12:27:53 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Pasi =?utf-8?B?S8Okcmtrw6RpbmVu?= <pasik@iki.fi>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH BlueZ 1/4] doc/media-api: Add RegisterApplication method
Message-ID: <20191114112753.4h7xifkvpjpzgm7x@pali>
References: <20190718100024.ii2igadxb2lmmitm@pali>
 <20190721155522.3vqt7vsprhpxflqf@pali>
 <CABBYNZK6cuz9n4Hu9uRCbQvn9uFEYkn9=mY8J5Fqu0u-D3B1EA@mail.gmail.com>
 <20190829125734.GH2840@reaktio.net>
 <20190829200513.6xnta5jx3trbmgxp@pali>
 <20191003181855.GF28704@reaktio.net>
 <20191006100503.fsbttcschr6wgsdq@pali>
 <CABBYNZLS4MMxJ=gQED-BVfn81D0bvx8aLw5OO3tNmXAnWeA57Q@mail.gmail.com>
 <20191006120245.tkrooh45q7irtm6l@pali>
 <20191009132040.tqnzfabp3llbg2g3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191009132040.tqnzfabp3llbg2g3@pali>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wednesday 09 October 2019 15:20:40 Pali Rohár wrote:
> On Sunday 06 October 2019 14:02:45 Pali Rohár wrote:
> > On Sunday 06 October 2019 13:53:37 Luiz Augusto von Dentz wrote:
> > > Hi Pali,
> > > 
> > > It is just another D-Bus method, the only difference is that it
> > > carries the entire object tree, btw I did add an example of how to
> > > register Endpoints in python:
> > > 
> > > https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/test/example-endpoint
> > 
> > This example uses undocumented property "DelayReporting". What it is doing?
> 
> And I would like to know what is that undocumented DelayReporting is
> doing? And to which value should I initialize it in pulseaudio?

Luiz, any comments on this?

-- 
Pali Rohár
pali.rohar@gmail.com
