Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F28A51BF4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Jun 2019 22:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbfFXUF3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Jun 2019 16:05:29 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45510 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfFXUF2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Jun 2019 16:05:28 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so13806783lje.12
        for <linux-bluetooth@vger.kernel.org>; Mon, 24 Jun 2019 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PjY7jxDzhUrLNNe9vhjGalsjUosrq1dppcupOFDfw8k=;
        b=nvCk40/8V3iRvabS9K1Q8wior1YA8AfTQIl6qI27GI8DRiq7NrTIM/XJcklRqOnR7H
         w8WJkVNaz8AgPgGvYSJp30XwJLB8oUbCtu64lGY+MwTUC1z2RqgEeUJSKs0NyRQwyIVO
         Pf+hi/WMdIqFwy/hD1MN6Yr88lu8yKGZZUdzE59rLXXMtPDaV58lmw3LDzeZRkmqDxXI
         uCqC8RQKUxYSKuMv1fGkBXjJZpxsPfgDe9n9/FonN5liZXW/UdHeGOQ+duikA6zwNs4k
         9OgKaUQdGmpVv2K7o5BPZOb/8Obtrwcc+ATmvpQ57BGUD+Hayd/GVnRd5/IQ573KPPzh
         cQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PjY7jxDzhUrLNNe9vhjGalsjUosrq1dppcupOFDfw8k=;
        b=kjrqimfB2DQfvkHE5VWBatljZHmWgkx+Ghb25DL9KbyqRSTCmGtogtYaO3h3zdYgwS
         q7StyC+Wht1Ww4OcQdYN9lqB9dctCcgf0CNmWCX5y9JMWR0CwlZ2zBFDawmI5sW2XE4u
         yJUhO9Xo0jtQSi1CFyu4XnxU2X0IHZsPi/ckKI/SztUOeUL72ip1d5hjoyzDy0YYdPH9
         YPQIUHMChJvNEI8o43kESa9oC/1QtAaQoHQqCNflHyBPgA+7yDLvcfHLIJbZV+ooA7aa
         CSd7bCmJvdY001jJjXYsHAnq4RVZ3hK8KIUHFMeVZFnGB7wPVeNqeFaoqV+AnR8knNAI
         zAsQ==
X-Gm-Message-State: APjAAAW1vN3FUStSRvDr+nwAXcGDYPJJIPYpT6HbAt0TRp8qcWamam7N
        r1s92xUcaQ3ZPIVPw2Rc73ML0mD7nko=
X-Google-Smtp-Source: APXvYqy43V8MjFrt3m8nyY4/0aWvjBevTE7nZmXZdL5Eh558i+Lf4Q/hL143I+VswYx+DR4ZY+V6fQ==
X-Received: by 2002:a2e:8802:: with SMTP id x2mr71535333ljh.200.1561406726449;
        Mon, 24 Jun 2019 13:05:26 -0700 (PDT)
Received: from kynes (apn-77-112-37-101.dynamic.gprs.plus.pl. [77.112.37.101])
        by smtp.gmail.com with ESMTPSA id k82sm1869094ljb.84.2019.06.24.13.05.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 13:05:25 -0700 (PDT)
Date:   Mon, 24 Jun 2019 22:05:23 +0200
From:   =?utf-8?Q?Micha=C5=82?= Lowas-Rzechonek 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Brian Gix <brian.gix@intel.com>
Subject: Re: [PATCH BlueZ v3 2/2] mesh: Added --io option
Message-ID: <20190624200523.cyfhtynm4zvfferu@kynes>
Mail-Followup-To: linux-bluetooth@vger.kernel.org,
        Brian Gix <brian.gix@intel.com>
References: <20190624073229.8652-1-michal.lowas-rzechonek@silvair.com>
 <20190624073229.8652-3-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190624073229.8652-3-michal.lowas-rzechonek@silvair.com>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Brian,

On 06/24, Michał Lowas-Rzechonek wrote:
> This allows specifying io type and options when invoking the daemon.
> 
> By default, meshd runs with MESH_IO_TYPE_GENERIC and tries to attach to
> the first available HCI interface.
> 
> Option "--index=<n>" is now just a shortcut for "--io=generic:<n>"

Thanks for applying the first patch, but how about this one? :)

cheers
-- 
Michał Lowas-Rzechonek <michal.lowas-rzechonek@silvair.com>
Silvair http://silvair.com
Jasnogórska 44, 31-358 Krakow, POLAND
