Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A963EF192
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Aug 2021 20:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhHQSNr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Aug 2021 14:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhHQSNq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Aug 2021 14:13:46 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFF4C061764
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Aug 2021 11:13:13 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id u15so10332203plg.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Aug 2021 11:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=allthenticate.net; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=otCc8z/aEEvF+KNfFvzdmAaiNHfr5OLeVnhcXBgKijA=;
        b=xowC5hDScH4B37WUklf/SxgUMedVGqqx2ciN8uoLVJODQ0vaUtdILTsM1CHdqimnVq
         WQbsnT+ZBsXhR8wOiXE1oQSdIkBpnCoujCETs3NF97tTHZaiOweA4yA3lp4J1huHfGjp
         4Y/0vMnD/40mv0ULxxszAXDQu6p2qL3S+j5nBLXd7ysoWH6ak/FOaRWzmJWRIKuHuIV3
         EgbOhbh1Lt6G42+JxkEqTEyzR3Lf1FsPFDI7Wde4r8Ly2rttpODi62SQLYy5/d8CddCE
         xRVe7fvGxJwzM/+bTuzJ38XrH8kBMgvSJYFP+zg3NXaEFO7PXc1/+s8ekM5R5EvGxRiy
         MrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=otCc8z/aEEvF+KNfFvzdmAaiNHfr5OLeVnhcXBgKijA=;
        b=gTq7CO4WlHv9GsH+0/T09DIELwTc7sZcm7K5eG4WKPIAyv23slMFuSGLDdhNB16jBA
         J6z/frUdqYD5KqIkc/2Q33ouyNjiX3lX/Z2qUUUMLfpftK3gzEFW/+7fx8Fa+hxydBYp
         PSl7Z6AW+awDjcZowWeieo5YYRt/JKmQkXn0LrKGadsQijqckA5SOJtl5GIhWE/WX1vO
         Z8/Oc12EjA296cYEK3FFgGdl8PRSjGm4Lih9uK3dKz3SVnoV10jrp34dlayb0h9G4Y9X
         3dJwPPmMzrFPT2VFVTIBc2N6PwSVUtC+zJ2gP31DG8sEQb5/+ydGTFjOmvPo8LJErfBB
         4Rjw==
X-Gm-Message-State: AOAM532nJYv2SdbTig3K+Q8glC390gUCjSOq5Pg47j7qE8y3xqxRLkyj
        NEZHjY++9oqn2AAi3OHk1LqlFGBLlJYDN1uF
X-Google-Smtp-Source: ABdhPJxKIZRBpzM9GWDET34ZsdwSYXe3tUWBaexfbWwwiEMf9GoOzG8E/23DdWAd4PQfPt5aj2txXg==
X-Received: by 2002:a17:902:e84f:b0:12d:830c:97a1 with SMTP id t15-20020a170902e84f00b0012d830c97a1mr3825164plg.27.1629223992586;
        Tue, 17 Aug 2021 11:13:12 -0700 (PDT)
Received: from BernieDesktop.lan (wsip-72-222-70-2.sb.sd.cox.net. [72.222.70.2])
        by smtp.gmail.com with ESMTPSA id s22sm3291148pfu.52.2021.08.17.11.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:13:12 -0700 (PDT)
From:   Bernie Conrad <bernie@allthenticate.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Bernie Conrad <bernie@allthenticate.net>
Subject: [RFC PATCH BlueZ v2 0/1] method to notify/indicate to one device
Date:   Tue, 17 Aug 2021 11:12:59 -0700
Message-Id: <20210817181300.24479-1-bernie@allthenticate.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello maintainers,

This is an RFC for an added method to be called over dbus by an
application to be able to notify/indicate to one device rather than all
subscribed devices. 

This is motivated by similar functionality in the corebluetooth API with
CBPeripheralManager's updateValue() method as well as the Android API's
notifyCharacteristicChanged() method.

There is a prior patch I submitted with this feature (12439517) with
style issues that this RFC supersedes. There are some additions missing
from this RFC that I can add if this is a feature the maintainers are
interested in the form of added documentation and overall cleaning up
the added method.   

Bernie Conrad (1):
  Added GDBusMethod to notify one device of characteristic change

 src/gatt-database.c | 93 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.17.1

