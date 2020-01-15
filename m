Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89D9113CDF1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 21:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgAOURD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 15:17:03 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45161 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729026AbgAOURD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 15:17:03 -0500
Received: by mail-oi1-f194.google.com with SMTP id n16so16678424oie.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jan 2020 12:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2myqp2GrpN0pfUan1rnrXmWGh+MWOgXmKRvJ9E5COqI=;
        b=jNz+e4uFwt2cnbb/h50TwqAFCmA6x3Ha3BXzP/tzSmcpdBj611hQrhWTP4icz2dd40
         L5SolyJiFEDVsBzNTFgkkM9Lms2zpllJHJDISH5ph9FGIqAC5byHn+MiZ7RQ21DxzSiI
         OUIaSaWw/6I6u+Z0JkWQKJRB0hWx8ERpihme++v4aLElD7j6VEJbGrpDVNUr6TuUWjii
         bmtywoKvZhNeb95v7eSvnuEXq5LCTd7xSG8Xcvir/xCqwPfZfr84hogN4ZySOea2/J47
         cnJbAFyrnavDBCTUaoFRpxjcEERZy3kwuF7HlMYrXvkYfonwl98TJaP3TIj2V64xYaYt
         ajww==
X-Gm-Message-State: APjAAAUMGxql4oEWuBK/B+2TcFSOtYQmjwMSPG6X8LCX5Ev+2wvv7D4j
        pj08+dJxb2WprIQDLKI2rSzmMu4=
X-Google-Smtp-Source: APXvYqyYTgOKKgfOKXuqR3DKE4/slBum6URubOZr63MHRvziihE3sS9OISH5YHjokv8t77wv6StxYA==
X-Received: by 2002:aca:d787:: with SMTP id o129mr1325333oig.75.1579119422572;
        Wed, 15 Jan 2020 12:17:02 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m3sm6896356otf.13.2020.01.15.12.17.00
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 12:17:01 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 22062a
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 14:17:00 -0600
Date:   Wed, 15 Jan 2020 14:17:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guillaume La Roque <glaroque@baylibre.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        johan@kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: Re: [PATCH v7 1/2] dt-bindings: net: bluetooth: add interrupts
 properties
Message-ID: <20200115201700.GA26654@bogus>
References: <20200115101243.17094-1-glaroque@baylibre.com>
 <20200115101243.17094-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115101243.17094-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 15 Jan 2020 11:12:42 +0100, Guillaume La Roque wrote:
> add interrupts and interrupt-names as optional properties
> to support host-wakeup by interrupt properties instead of
> host-wakeup-gpios.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
