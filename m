Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5845555B53F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Jun 2022 04:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbiF0Cbp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 26 Jun 2022 22:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiF0Cbo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 26 Jun 2022 22:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E60CB2BE9
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Jun 2022 19:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656297103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=NbmH8eeNH9GCNyJEMJVIoZ6jzBY1Wwznz8gCyxIKlQM=;
        b=DrjXV66dKehKrYyMP9VKK/gHV2fxQFOANue0FvsMbzaPQ0/i4hoX3NK27eON0WdAaR75IY
        V8vNHFpqncKhqMuJJBX3suBJpKsXTqTf0IaHo8vQujbnQR1G61csfm2+q6vnXEI19YfrEd
        CqmbYXGy5t0iVE15TLRZfC66bRoLXAE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-g9yryrwZN6uK2W9cPScnKw-1; Sun, 26 Jun 2022 22:31:41 -0400
X-MC-Unique: g9yryrwZN6uK2W9cPScnKw-1
Received: by mail-qk1-f198.google.com with SMTP id ay8-20020a05620a178800b006a76e584761so8916275qkb.13
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Jun 2022 19:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NbmH8eeNH9GCNyJEMJVIoZ6jzBY1Wwznz8gCyxIKlQM=;
        b=QJyC4nY3y9PVA2+eE2WeRsIRRcDbrhpQ9zLe0HI7J/fzBdolDiQ8CvXaPSYQPTv9DX
         YIif/TQviBb9eP6W8WOKYFcCidkW05qY/FjsftMuS+FKaouCXNEuZL1UzHAm+bkn7x73
         BgA18szzv3v6wErspewotv70X8JllaUD9VoSGLIOC0gqJomD6IXm+FzgpNI243wycVng
         8GK7qb/1B9YXC+jbZX3UPKZNYa9X88JND4ZsH65tcl/QspkpQycTGIGnkbeRwtghi7JK
         mDmnq038v8rNwWqAfvqNsoZfM0IAw+pMQ5BPghF1Y0ALnCdPpaZ5+sCOmOMKdi+mbj7S
         /TdQ==
X-Gm-Message-State: AJIora8qpdqIO2Na9tSeJ3rRh7fhE7VSaZxCzW17ZuREPU3R61kxsdwU
        OcFks5q+pMUZ16cft7/M7zgaZv7B7/qzxfv5+eTWfzntubZUwqFbTYX+n0S+zAOCHqvrXUeFSy+
        CAJYWsZfgXKB0rSSA8RIyELJjqsm7cZtEf/Xufcy8nKh0
X-Received: by 2002:a0c:dc83:0:b0:470:aa91:9ea5 with SMTP id n3-20020a0cdc83000000b00470aa919ea5mr5787255qvk.28.1656297101020;
        Sun, 26 Jun 2022 19:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sckSJl+2KxDYqzywLJ6Cgs+wC5jgXtSANOYX1ODyEpm+4+KD8q/ct4paXz1mgZ94SHRCAZ8XaT/QePmQ65Nnw=
X-Received: by 2002:a0c:dc83:0:b0:470:aa91:9ea5 with SMTP id
 n3-20020a0cdc83000000b00470aa919ea5mr5787245qvk.28.1656297100859; Sun, 26 Jun
 2022 19:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK-6q+g1jy-Q911SWTGVV1nw8GAbEAVYSAKqss54+8ehPw9RDA@mail.gmail.com>
 <e3efe652-eb22-4a3f-a121-be858fe2696b@datenfreihafen.org> <CAK-6q+h7497czku9rf9E4E=up5k5gm_NT0agPU2bUZr4ADKioQ@mail.gmail.com>
 <20220616093422.2e9ec948@kernel.org>
In-Reply-To: <20220616093422.2e9ec948@kernel.org>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Sun, 26 Jun 2022 22:31:29 -0400
Message-ID: <CAK-6q+hvw-3EtSoQA-01w+RPCZ1mUDtPEyw-um9a6ocOzW+ovg@mail.gmail.com>
Subject: Re: 6lowpan netlink
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Stefan Schmidt <stefan@datenfreihafen.org>,
        linux-wpan - ML <linux-wpan@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org,
        Network Development <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Thu, Jun 16, 2022 at 12:34 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 16 Jun 2022 09:00:08 -0400 Alexander Aring wrote:
> > > > I want to spread around that I started to work on some overdue
> > > > implementation, a netlink 6lowpan configuration interface, because
> > > > rtnetlink is not enough... it's for configuring very specific 6lowpan
> > > > device settings.
> > >
> > > Great, looking forward to it!
> >
> > I would like to trigger a discussion about rtnetlink or generic. I can
> > put a nested rtnetlink for some device specific settings but then the
> > whole iproute2 (as it's currently is) would maintain a specific
> > 6lowpan setting which maybe the user never wants...
> > I think we should follow this way when there is a strict ipv6 device
> > specific setting e.g. l2 neighbor information in ipv6 ndisc.
>
> Unless you'll have to repeat attributes which are already present
> in rtnetlink in an obvious way genetlink > rtnetlink.

I think this is not the case, I do not implement a new protocol
family... I just need to manipulate some 6lowpan stack settings that
aren't part of the current ipv6 protocol familty rtnetlink operations.

Thanks.

 - Alex

