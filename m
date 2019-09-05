Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42EE5A9BF1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Sep 2019 09:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732043AbfIEHeX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Sep 2019 03:34:23 -0400
Received: from mail-lf1-f44.google.com ([209.85.167.44]:46073 "EHLO
        mail-lf1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731476AbfIEHeX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Sep 2019 03:34:23 -0400
Received: by mail-lf1-f44.google.com with SMTP id r134so1091965lff.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Sep 2019 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=EdvuQNnx5PsnuWbczGwA2cLzzdJbnjgoGW8nXXfWpFA=;
        b=tU6MU1l6ScPh031Uu+5ONgxQv+ou14RuuMbAK3gGAPyZKAxlBioGfC1cHp2d63hspE
         8pVLAX+6x7nISp5qWIrtr85hFGNOD5pepNbgMJQvb6IdLuKNwV81FuJku4G7ejm7GIwF
         WReTVNRDWVtA441/EreRXUWELI9XXBSsJVKsUXxYbMPpuh99o9BIAjJZsfl3l+WdB+7U
         VucxDM08rX1hcX8Rm75p7KJNlW8ZDx5Miiq2hzgHLqsqP/KXwJtiZyJ6EV4mMa+AcV14
         dV0cqp5aJu9sUiq3ICnvjGR1sM+KFz1SJygWs4+oyqjpT5kbqQIk+oKKgB6/8QFEVSTP
         NXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=EdvuQNnx5PsnuWbczGwA2cLzzdJbnjgoGW8nXXfWpFA=;
        b=m+axfvLwhNEAGcMPxBs4U0fADtqB0fxLch0+vFlg891uQkXWlMK0UBuM/27oix4en9
         jWxRQlGWNA5Jo7hPe3aAKk5wdPUQbfiy0/C1Xxo1sn9aECBl7JvT/QrNuZlbBt5D626x
         RSFRRVtS9m2ORbKN9fkw/r2HzM3Qj0xkcJ/nxovLNXt86u3LyH5CJdesBFpy1SxSaNDP
         Vwj8/c6xoXFxVJkPer7o1ZM+S6h1ae3aiKU+LGIPkaeXQlM50eulXSoE7zRIMsuuDBOk
         A7oF4krTxZf8pJgbOnwXzmsuQABmEgFGODYltt75Qppmgukp0T94HnDrM4u+OfHjcGWM
         mN2g==
X-Gm-Message-State: APjAAAWKDv7NpXB+WfraGXGs0sXuxKd4BKhj51Vlb4WLMTmo5kXhxDky
        MUYFLzt3cSZTNUVX3RlmT6eQHj2ObcM=
X-Google-Smtp-Source: APXvYqyVXLsugTiv5KZs6VE9yKGmxm9KZ+inw4PJ9iZxtRpukK5K2w2tq0GBgcXvUggT7m/HxT5C7A==
X-Received: by 2002:a19:644c:: with SMTP id b12mr1319072lfj.104.1567668860876;
        Thu, 05 Sep 2019 00:34:20 -0700 (PDT)
Received: from mlowasrzechonek2133 ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id o15sm269484lff.22.2019.09.05.00.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 00:34:20 -0700 (PDT)
Date:   Thu, 5 Sep 2019 09:34:19 +0200
From:   "michal.lowas-rzechonek@silvair.com" 
        <michal.lowas-rzechonek@silvair.com>
To:     "Gix, Brian" <brian.gix@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Stotland, Inga" <inga.stotland@intel.com>,
        "simon@silvair.com" <simon@silvair.com>
Subject: Re: mesh: org.bluez.mesh.Element.MessageReceived method does not
 provide destination address
Message-ID: <20190905073419.urwfdf5bbghkmj4k@mlowasrzechonek2133>
Mail-Followup-To: "Gix, Brian" <brian.gix@intel.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Stotland, Inga" <inga.stotland@intel.com>,
        "simon@silvair.com" <simon@silvair.com>
References: <20190830184301.zd3zaqrw7mv6r252@kynes>
 <20190904192525.2dqyihabxmigb54m@kynes>
 <20190904194808.nu2cy4vp6uh64m4z@kynes>
 <d79b733068e30cfa1cef106e44b7f9ee7c31526d.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d79b733068e30cfa1cef106e44b7f9ee7c31526d.camel@intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Brian,

On 09/04, Gix, Brian wrote:
> > Since PDO payloads are *not* self-describing (unlike mesh sensor
> > messages), the receiving party must be aware of the mapping in order to
> > parse the data.
> > 
> > In CANOpen, format is determined by the address - in mesh, it could very
> > well be a virtual label.
> 
> I think that this is an interesting use of Virtual Addresses, and in
> addition to this, Mesh Virtual Addresses have been suggested as a way
> of addressing IPv6 addressing as well...  However:
> 
> 1. There is already a way something like this could be used already:
>    A model could be created that gets subscribed to the Virtual
>    Addresses that require handling by the node.

But the whole idea is that the virtual labels and packing are configured
dynamically (by the commissioner) according to their specific needs.

If a model doesn't receive the *value* of the label, you would need a
separate model for each of the virtuals. This is problematic, because
composition data is immutable, so you wouldn't be able to reconfigure
these mappings without at least re-provisioning the whole network.

> In any case the ability to create simple mesh Apps with minimal
> complexity remains intact, and as an added bonus, the Open Source
> community (not to mention the Bluetooth Mesh Working Group and larger
> SIG) can weigh in on the preferred methodologies.

Aren't *we* the community? :P

-- 
Michał Lowas-Rzechonek <michal.lowas-rzechonek@silvair.com>
Silvair http://silvair.com
Jasnogórska 44, 31-358 Krakow, POLAND
