Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE86154A1A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Feb 2020 18:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgBFRQG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Feb 2020 12:16:06 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:36680 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgBFRQG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Feb 2020 12:16:06 -0500
Received: by mail-lj1-f177.google.com with SMTP id r19so6944461ljg.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Feb 2020 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=nv2cx+jlMyJAJvM9ENXxF/zgRM4+tWvUSywJqIowGVc=;
        b=FWD5KrLS9Ttcvk5Wfe0APmXBvElbfP64Tswt4QqtJfyHuDc5ED6m3FunZ2QXpLLi3e
         atWEMYLVmeYHHli2Cm4L91gGqTLD/SqFe9VljZzpCfB8UfnjqJHLnKHlrNUwdvEk8ovt
         8oDkgYYCyqRoQVugXoNm/pFLod8USp2MQBOTUHtmGusqftjKxhuChQ+hiqE6Qv9u9nsE
         snMsA/c6mOIQQEJqwjBSMP/8istyBDhdcG2Bz8iQu+WHARH1vr3e1w1Bao5hAM1T+4jl
         jtPosBtT8mMeiA9a7/DmFvBizqwGLec2aXu2Zib4TQup1ihUrYlFWko+/vONlN99WhZ1
         KQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=nv2cx+jlMyJAJvM9ENXxF/zgRM4+tWvUSywJqIowGVc=;
        b=ghchrNAE/iGjWk1Eu1sgXd5NtLOvuVSA0OS4i+jq9q6vqBek5bXfzzXjrLwiBf87WE
         3lTr3u4qcOecRDHSvmQ/nozRvYiyKHKZOt1VFOvBswRhnUIUOYWhtnpl8OKnadGgYqOj
         rPxVPikHCP8OzKkG9Q7a/MCyJ7RTzXWDHNxRX7SSENcAcEyL35SyyblHcj+lDP8hiG5i
         UjS9TIPutmcGC9o/GqeyIGg92S9wvcifC5NlsT1BDUtrqR1RG9MjPFu033fGnU+Dp+Pv
         dNmnJVh3H2yG8oiHyqDQQIenCZyOZglP+KL5MQCRUt9PzFt9Q+qvsuxaZIqNtFK7QpvC
         FYkg==
X-Gm-Message-State: APjAAAXPafPR/EibQUQtH+NfnAXdN4YbBNV6qvg+9dfHMhMNnvAQctyK
        5/Zc1pe7K+gP4epSE8Ek3GpwKwUE9tGerw==
X-Google-Smtp-Source: APXvYqwHmEvmoJwf494nVZjPJa/A8vY4GgHaMlVYQHCutlwxdiCYZpCSQ3qIXXgBdbGmzhKfFuK9mg==
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr2695759ljg.292.1581009363342;
        Thu, 06 Feb 2020 09:16:03 -0800 (PST)
Received: from kynes (apn-31-1-137-240.dynamic.gprs.plus.pl. [31.1.137.240])
        by smtp.gmail.com with ESMTPSA id 14sm1650213ljj.32.2020.02.06.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 09:16:02 -0800 (PST)
From:   "=?utf-8?Q?Micha=C5=82?= Lowas-Rzechonek" 
        <michal.lowas-rzechonek@silvair.com>
X-Google-Original-From: =?utf-8?Q?Micha=C5=82?= Lowas-Rzechonek <khorne@kynes>
Date:   Thu, 6 Feb 2020 18:16:00 +0100
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: mesh: Missing API for delivering provisioning public key via OOB?
Message-ID: <20200206171600.227uzfonhepltydy@kynes>
Mail-Followup-To: linux-bluetooth@vger.kernel.org, brian.gix@intel.com,
        inga.stotland@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I have been playing with mesh-cfgclient, and I've noticed that
provisioning procedure gets stuck when node reports Public Key OOB
information available' in 'Public Key Type' field of Provisioning
Capabilities PDU.

While digging into the code and API, I think we have a missing feature
in the API between provisioner application and the daemon - while there
is an API to deliver OOB keys to the daemon when *the application* is
being provisioned, there doesn't seem to be a way to deliver provisioned
device's public key when is the application who does the provisioning.

Is my understanding correct, or is there something I've missed?

regards
-- 
Michał Lowas-Rzechonek <michal.lowas-rzechonek@silvair.com>
Silvair http://silvair.com
Jasnogórska 44, 31-358 Krakow, POLAND
