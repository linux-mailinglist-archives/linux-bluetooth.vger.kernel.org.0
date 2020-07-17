Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7F4D223808
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jul 2020 11:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGQJST (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jul 2020 05:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgGQJSL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jul 2020 05:18:11 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BABFC08C5DB
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jul 2020 02:18:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a21so10004713ejj.10
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jul 2020 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ABtoKcunWta1zPd9OAU4HivGakSrvH6t7PoGrVg1IHw=;
        b=xR7/TE9+zWjcsvx6d03jd1AgLl1RxCF+57iDGUw8QqO8NNJiU5y/1PDhMHyK6SBPD0
         Tu9kE2ltrVcgIGDsEFYeGOdvGGs9gXhWrY0fvfmRtJuRWzhuLiSsJxij8VwijPfHjTPS
         3aRzO2LOdNynO+M1Cxqg8LEaNT7+cWaMS9ZleuZy42uIKF7zbE+VVsfyNZHqDLg2WCO5
         2IhHaXOEiidwv/4zssU9rGm6ibTKTyOzBFUfh4ZlLc65xFj4ZNu5VWofuJadgyUIYj5C
         Y93p7sEtG5rh/7aWXf9IEREZyDETtvRRffJXB7kNBwNCJiHJc9kale3U3Oqjmxgbkhyq
         rtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ABtoKcunWta1zPd9OAU4HivGakSrvH6t7PoGrVg1IHw=;
        b=nobI79ooZ3eePO2Xp0mFxE/TOrCtTObZZbAEDjFaNFjdVFFe+PU+6hZ91P5VETwcRK
         Vff5JB75Mj6/EtG4SrfhzkWxf76/gbSu4bF/McZJ1bHjpUjmcaND8FfLIcZPuAGbn5ix
         0N74u82lZwa5ijrhNrcKkXkmkH3ulE116WsMX5cfQTKz0HrajTXVEBSn7O/df4TxSLJ6
         96F+jyYSd8Fy1YuBbbpGKYt7ncLWYi+FAu1NBo+oOl2vqaTu24xxqc7BzEI6JwAr+f3p
         1nUUARcR/0cqVfoEQv+assa/9HAh8AhxloLlQi3jupFjQVuT+ZnQTTB+hHAj1ki1t562
         sX/w==
X-Gm-Message-State: AOAM533aqoiByuz5aszaXDWkk46koO/4srzD0o5H8UIFg//KqgDZ9GeQ
        S0fQGIA5x7swvTDcTfABta1rQg==
X-Google-Smtp-Source: ABdhPJwKJni/XUuyRKR8S/sAchcIII3C/3Gdc/GCPUNVX6T8sPkuUFzqwgJFnhzYtCojkw18DlkE7Q==
X-Received: by 2002:a17:907:426c:: with SMTP id nx20mr7604495ejb.548.1594977490002;
        Fri, 17 Jul 2020 02:18:10 -0700 (PDT)
Received: from tsr-lap-08.nix.tessares.net ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id p4sm7541372eji.123.2020.07.17.02.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 02:18:08 -0700 (PDT)
Subject: Re: [MPTCP] [PATCH 05/22] net: remove
 compat_sock_common_{get,set}sockopt
To:     Christoph Hellwig <hch@lst.de>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Chas Williams <3chas3@gmail.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org, netfilter-devel@vger.kernel.org,
        linux-sctp@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, bridge@lists.linux-foundation.org,
        linux-can@vger.kernel.org, dccp@vger.kernel.org,
        linux-wpan@vger.kernel.org, mptcp@lists.01.org
References: <20200717062331.691152-1-hch@lst.de>
 <20200717062331.691152-6-hch@lst.de>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Message-ID: <203f5f41-1de0-575e-864b-53a9412d97f6@tessares.net>
Date:   Fri, 17 Jul 2020 11:18:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717062331.691152-6-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Christoph,

On 17/07/2020 08:23, Christoph Hellwig wrote:
> Add the compat handling to sock_common_{get,set}sockopt instead,
> keyed of in_compat_syscall().  This allow to remove the now unused
> ->compat_{get,set}sockopt methods from struct proto_ops.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   include/linux/net.h      |  6 ------
>   include/net/sock.h       |  4 ----
>   net/core/sock.c          | 30 ++++++------------------------
>   net/mptcp/protocol.c     |  6 ------

Thank you for looking at that!

For MPTCP-related code:

Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
