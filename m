Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0781258F8B3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Aug 2022 10:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbiHKIAR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Aug 2022 04:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234137AbiHKIAN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Aug 2022 04:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0D7A3CC
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Aug 2022 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660204810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lCmF/JYOXXlwKiezcK1qE0yFbX868q+mU1+AYkgPNXQ=;
        b=Mg805wI3ohD4iu6ysazQxVmmKku593EWcm6xndR3N9foHtAXJwU2Jc4WQblJVh7w2hFwo0
        bOtq2vmMCLB1km6OLwIRzSzsGZtC7erhYvMMf14SL9x6qKDmWZl9wR0cxlPCKGJ89OYvDv
        jXwIjsCiNVx/yYbWwSGi+0jDQIiubyc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-aAurtx6ONqeMhp6JANXNOA-1; Thu, 11 Aug 2022 04:00:08 -0400
X-MC-Unique: aAurtx6ONqeMhp6JANXNOA-1
Received: by mail-ej1-f72.google.com with SMTP id go15-20020a1709070d8f00b00730ab9dd8c6so5144545ejc.6
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Aug 2022 01:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=lCmF/JYOXXlwKiezcK1qE0yFbX868q+mU1+AYkgPNXQ=;
        b=IrF0J9zxiPEa3wdzHwEMP/tGtCJYyI3zmLV+Bcfj/mT3uJNGLSrwWQ/t7MNrlpfluT
         wHYFkEdOsp4Vh70lhqXBZVnyDwkxs3ApLyVyBRAkWVClIW5NvJdpvQEJxVBkE8nTAtPz
         nKEDS2V/r0Xj7CLuD6mp6gj5rPXAOedwG84NP4nb+Ihh6RGApD/gZn3okf00B4rhCkLg
         K8vZLj7ZmSOhF0e8Fu/7Z+fujdX7SDSO0WmBwEcZtrmgVPghEE4jwA+BR3Y1TSV8tL/6
         4oxb15FlNJFknBOsz3rPh5Cg5Zpz6qWuY+6CW0sttRIfVSdpMFsEI45WMw4bt2mRo1gG
         520g==
X-Gm-Message-State: ACgBeo3guW9kUY6XQDWJm0CdYSBdvXdHVhb6GXVHxTf48ZUx3PS8LGtx
        jeKikXxzvDsHySfHMvIQFeDAedLn10xIrTaUA3VO2CpRc2fx1GvH9BUmivG/ilIlVn8hi6DqxkV
        gyRk3NhWR0m+LacwP1f5ldw7xXp0T
X-Received: by 2002:a17:907:97d5:b0:733:1ce:9572 with SMTP id js21-20020a17090797d500b0073301ce9572mr6133105ejc.220.1660204807716;
        Thu, 11 Aug 2022 01:00:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uItR6QO/ODHWGYMDEVxIdnBWORx5KiS1xBdSWWxcZ030e6s/uS5ChGYBLMNqOoTPv8T8n7g==
X-Received: by 2002:a17:907:97d5:b0:733:1ce:9572 with SMTP id js21-20020a17090797d500b0073301ce9572mr6133089ejc.220.1660204807494;
        Thu, 11 Aug 2022 01:00:07 -0700 (PDT)
Received: from redhat.com ([2.52.152.113])
        by smtp.gmail.com with ESMTPSA id by23-20020a170906a2d700b00730979f568fsm3230336ejb.150.2022.08.11.01.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:00:06 -0700 (PDT)
Date:   Thu, 11 Aug 2022 04:00:02 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Igor Skalkin <igor.skalkin@opensynergy.com>
Cc:     Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, mgo@opensynergy.com
Subject: Re: [PATCH] virtio_bt: Fix alignment in configuration struct
Message-ID: <20220811035817-mutt-send-email-mst@kernel.org>
References: <20220807221152.38948-1-Igor.Skalkin@opensynergy.com>
 <20220807185846-mutt-send-email-mst@kernel.org>
 <02222fcb-eaba-617a-c51c-f939678e3d74@opensynergy.com>
 <20220808081054-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808081054-mutt-send-email-mst@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Aug 08, 2022 at 08:16:11AM -0400, Michael S. Tsirkin wrote:
> On Mon, Aug 08, 2022 at 02:04:43PM +0200, Igor Skalkin wrote:
> > On 8/8/22 01:00, Michael S. Tsirkin wrote:
> > 
> >     On Mon, Aug 08, 2022 at 12:11:52AM +0200, Igor Skalkin wrote:
> > 
> >         According to specification [1], "For the device-specific configuration
> >         space, the driver MUST use 8 bit wide accesses for 8 bit wide fields,
> >         16 bit wide and aligned accesses for 16 bit wide fields and 32 bit wide
> >         and aligned accesses for 32 and 64 bit wide fields.".
> > 
> >         Current version of the configuration structure:
> > 
> >             struct virtio_bt_config {
> >                 __u8  type;
> >                 __u16 vendor;
> >                 __u16 msft_opcode;
> >             } __attribute__((packed));
> > 
> >         has both 16bit fields non-aligned.
> > 
> >         This commit fixes it.
> > 
> >         [1] https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fdocs.oasis%2dopen.org%2fvirtio%2fvirtio%2fv1.1%2fvirtio%2dv1.1.pdf&umid=d1786ace-e8ea-40e8-9665-96c0949174e5&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-39b15885ceebe9fda9357320aec1ccbac416a470
> > 
> >         Signed-off-by: Igor Skalkin <Igor.Skalkin@opensynergy.com>
> > 
> >     This is all true enough, but the problem is
> >     1. changing uapi like this can't be done, will break userspace
> >     2. the driver has more issues and no one seems to want to
> >        maintain it.
> >     I posted a patch "Bluetooth: virtio_bt: mark broken" and intend
> >     to merge it for this release.
> > 
> > This is very sad. We already use this driver in our projects.
> 
> Really?  Can you step up to maintain it? Then we can fix the issues
> and it won't be broken.

Just a reminder that I'm waiting for a response on that.
I just don't know enough about bluetooth.

-- 
MST

