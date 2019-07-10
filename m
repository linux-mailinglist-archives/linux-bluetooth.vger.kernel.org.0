Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3376364B10
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jul 2019 19:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfGJRAh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jul 2019 13:00:37 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41947 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727644AbfGJRAh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jul 2019 13:00:37 -0400
Received: by mail-lj1-f195.google.com with SMTP id d24so2813232ljg.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 Jul 2019 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=v9ttaGgh2Mxe26tCxyKZEEyvG5UZLnT6ovUVcqwJAiI=;
        b=XDLAmeDGg2YWFYrTe0XBTq8lzZlC7/ZmZjirnlk7Or0h8n+wtSvw0Agyq3+EtoOlE/
         SiC2n2hWnd+w8KiiUIpSmbArB8JjyqEAXiaNohEeJAjDtKJ1GFhJ5g8oskSdamamKNGc
         8fBbsrW0d8oveJuZtsx+SuBAAblVa8pJckzm+s83jdug+xrPg/pTVvc0AHYzuFnOLLrs
         BsKurpwijnHtLsXMo9RXcGbqzwb1lR1AXXNnA/h9PjVYD6ZqkZe05EIyhhd7OAJ/Bn69
         L2fVVhAS47fKkieyAemJsU1Nw46qMjX4nVRTewyhgRE/jMy+BK4TXmFmIVW8KMCqUswt
         Gu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=v9ttaGgh2Mxe26tCxyKZEEyvG5UZLnT6ovUVcqwJAiI=;
        b=A5MqXOvxAILaZGCkHZbprms1m01g90CHOrTHA8aXihhUQuzJ5u9V1Qq9clANCj+Rqv
         sjPlkgTuV2g/oEXnCZq24+FKuVzlhLb1Wac+QLoRpWeFFZ4+Sjo4ERUI2UyEQg5i/eVf
         n8WKPup+qwDkIgt+hmIjpLxZbPewyyD8qv3ywXn3p6tRMc9Eck9rUNPbqV7MCZ3/Aa67
         i4bQpPt9uFvko2mmAev+VLbICmnEh7AUyxf5FKZRNV02SSX6WLLax9nePu028jLrCjMT
         eyhDDNbTO0dUN/4oVUUxTeMudXY21j5KEs2RtzxN6sUUfo+5r7qzKQA6qngNIERM3wnp
         zWMA==
X-Gm-Message-State: APjAAAWRmBwmlskPFZvVJzJ0wUBpM2UrYHgKUG5bQ6PTPCTiUn+89bpV
        pgyW8VpyeHA49yIlZGbZ0KnAWCScsKQ=
X-Google-Smtp-Source: APXvYqyZFdVf8+yARPa0ydfaeRy0KX0JjnozTjSkecarron9ozU+gWvjgpoiLhXQtV1YmN1nVOi/uQ==
X-Received: by 2002:a2e:2411:: with SMTP id k17mr18408913ljk.136.1562778035061;
        Wed, 10 Jul 2019 10:00:35 -0700 (PDT)
Received: from kynes (apn-77-112-37-101.dynamic.gprs.plus.pl. [77.112.37.101])
        by smtp.gmail.com with ESMTPSA id w28sm553882ljd.12.2019.07.10.10.00.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 10:00:34 -0700 (PDT)
Date:   Wed, 10 Jul 2019 19:00:32 +0200
From:   "michal.lowas-rzechonek@silvair.com" 
        <michal.lowas-rzechonek@silvair.com>
To:     "Stotland, Inga" <inga.stotland@intel.com>
Cc:     "jakub.witowski@silvair.com" <jakub.witowski@silvair.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Gix, Brian" <brian.gix@intel.com>
Subject: Re: [PATCH BlueZ 6/9] mesh: Define storage format specific
 read/write routines
Message-ID: <20190710170032.nryfpavdr3yxd6pv@kynes>
Mail-Followup-To: "Stotland, Inga" <inga.stotland@intel.com>,
        "jakub.witowski@silvair.com" <jakub.witowski@silvair.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Gix, Brian" <brian.gix@intel.com>
References: <20190710050959.7321-1-inga.stotland@intel.com>
 <20190710050959.7321-7-inga.stotland@intel.com>
 <20190710075245.2koao3eyj22wbj7s@mlowasrzechonek2133>
 <e8479618084fb5056188c86939f911cf144f8be8.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8479618084fb5056188c86939f911cf144f8be8.camel@intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Inga,

On 07/10, Stotland, Inga wrote:
> If we do away with the notion that each node has its own directory,
> this means that entire node parsing procedure needs to be pushed into
> the corresponding mesh-config-<specific> implementation and storage.c
> becomes obsolete.

I know. Isn't that neat? ;)

-- 
Michał Lowas-Rzechonek <michal.lowas-rzechonek@silvair.com>
Silvair http://silvair.com
Jasnogórska 44, 31-358 Krakow, POLAND
