Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174A6473914
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Dec 2021 00:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242754AbhLMX5o (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Dec 2021 18:57:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235661AbhLMX5n (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Dec 2021 18:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639439862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=itrWj/FNXzyg2IvEE5KBOWVxQH40piGIDy+/PNdSvak=;
        b=CTrwYzMHTo8GBeK+IGtCtBjtMsLskR/a4qBL+4C/FHmjstC5CCQdic6MuVO7Vdh2gGdZXl
        eteEGIgVa5x3aTBzqg6yvKrOl6YcsGL8a0uoF+sUacfCRdwOC7N6woBEOQNWAVHs9IfnX0
        2fGB8ELg0zxb0ddfJGa6vOuwR3f0O0c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-5M1Ljq3ZO5qs0SRwjUQXEw-1; Mon, 13 Dec 2021 18:57:41 -0500
X-MC-Unique: 5M1Ljq3ZO5qs0SRwjUQXEw-1
Received: by mail-wm1-f71.google.com with SMTP id 201-20020a1c04d2000000b003335bf8075fso10446147wme.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Dec 2021 15:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=itrWj/FNXzyg2IvEE5KBOWVxQH40piGIDy+/PNdSvak=;
        b=AbyQfVn04XPpY+UqBMZTqcIytmaiNwbPJTKdXQ7dGUWMYqw6YTfSDHyJ5c6qN1wNKi
         cTdbGW17h/v+TjIvwFrsgtXufWXUWaO93H5oqA5HOS4G3BS45XDj2cFNinzlzlbCloAk
         WXc3s3583wvamgqtEz5o1SW0PjuZJeWOA0V/SXy7duIb1pqe54y3MklFMSA4Aq2nCbv0
         qv1uOiteq3u3e9ObdzX7TmLFl6xgrQ8QWEheLJof0R5HLhSthdqwo6tjF8BMpK+WxcN1
         g6FraQ1P99ia8bNLxhmC9sFjYssrIE1cT50cgrW5cdSwSlrYqk+s6K2qAF0bc9KHAAjf
         jlyw==
X-Gm-Message-State: AOAM532kZUXdHj2PAfovRlDAn2CgJiC/2by5r20InoYA26up6kZ039p+
        W5gKc6c42J2wvCR4oRreMUY2wxVFS4gA+sBKrywYNlfvGJc1XzAERB4HOzmT8Cn7kLFUTjKL3xV
        UvamL8vP87rocTvTFtxoppQEDLce9
X-Received: by 2002:adf:e484:: with SMTP id i4mr1813514wrm.49.1639439860255;
        Mon, 13 Dec 2021 15:57:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/Pj4Z/yXyapvNcqdg05CqU9fiI6m5P/+rM1Krrug9bUUnGSeBImkdL/PcJ3lT1z6hNseTtw==
X-Received: by 2002:adf:e484:: with SMTP id i4mr1813502wrm.49.1639439860103;
        Mon, 13 Dec 2021 15:57:40 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207d:b931:2ce5:ef76:2d17:5466])
        by smtp.gmail.com with ESMTPSA id v9sm10203463wrb.107.2021.12.13.15.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 15:57:39 -0800 (PST)
Date:   Mon, 13 Dec 2021 18:57:35 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] Bluetooth: virtio_bt: fix device removal
Message-ID: <20211213185620-mutt-send-email-mst@kernel.org>
References: <20211125174200.133230-1-mst@redhat.com>
 <F52F65FE-6A07-486B-8E84-684ED85709E9@holtmann.org>
 <20211209162149-mutt-send-email-mst@kernel.org>
 <20211213054357-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211213054357-mutt-send-email-mst@kernel.org>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Dec 13, 2021 at 05:44:13AM -0500, Michael S. Tsirkin wrote:
> On Thu, Dec 09, 2021 at 04:22:58PM -0500, Michael S. Tsirkin wrote:
> > On Thu, Nov 25, 2021 at 09:02:01PM +0100, Marcel Holtmann wrote:
> > > Hi Michael,
> > > 
> > > > Device removal is clearly out of virtio spec: it attempts to remove
> > > > unused buffers from a VQ before invoking device reset. To fix, make
> > > > open/close NOPs and do all cleanup/setup in probe/remove.
> > > 
> > > so the virtbt_{open,close} as NOP is not really what a driver is suppose
> > > to be doing. These are transport enable/disable callbacks from the BT
> > > Core towards the driver. It maps to a device being enabled/disabled by
> > > something like bluetoothd for example. So if disabled, I expect that no
> > > resources/queues are in use.
> > > 
> > > Maybe I misunderstand the virtio spec in that regard, but I would like
> > > to keep this fundamental concept of a Bluetooth driver. It does work
> > > with all other transports like USB, SDIO, UART etc.
> > > 
> > > > The cost here is a single skb wasted on an unused bt device - which
> > > > seems modest.
> > > 
> > > There should be no buffer used if the device is powered off. We also don’t
> > > have any USB URBs in-flight if the transport is not active.
> > > 
> > > > NB: with this fix in place driver still suffers from a race condition if
> > > > an interrupt triggers while device is being reset. Work on a fix for
> > > > that issue is in progress.
> > > 
> > > In the virtbt_close() callback we should deactivate all interrupts.
> > > 
> > > Regards
> > > 
> > > Marcel
> > 
> > So Marcel, do I read it right that you are working on a fix
> > and I can drop this patch for now?
> 
> ping


If I don't hear otherwise I'll queue my version - it might not
be ideal but it at least does not violate the spec.
We can work on not allocating/freeing buffers later
as appropriate.

> > -- 
> > MST

