Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907A3262C31
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Sep 2020 11:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730174AbgIIJnC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Sep 2020 05:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730022AbgIIJml (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Sep 2020 05:42:41 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322CDC061795
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Sep 2020 02:42:40 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so1676804pfd.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 09 Sep 2020 02:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cJ2b5yC6U6sZBSPpf2NMndA3c8MuYwyg/EbWONDGDEQ=;
        b=lRr0iV7jW0zq00Y+PI9+C7cOPYDyM1oIQtYgXGw2Jok5nCprEdhOZiwh5Vp+h7I5bK
         sDVm/tVXX/1Feq/Yn7thUALZCMh8wcsS13njzNpVOyy+NKgPOQxkgpwOHjheAOj5H8PN
         jPS12IkBQ5rM8aOk+DU5/JDyzG2RLZTleokG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cJ2b5yC6U6sZBSPpf2NMndA3c8MuYwyg/EbWONDGDEQ=;
        b=O8W/dnhycoOGBFZx3n/a7insUjUPIGTPapkacNEvuX3tQtAkkZ/npa6hh1s1rC1uyC
         yfpWpm+lsdere/S4fcweb5y8zi0qt5TdpO5kIOXCqM10fFeI9swvSc59W/8UPSdAAJbk
         xqDMtmf76nxb53Tk3SmoeHYJdPlLK3sY7XfK/uFom6oT5KSvzV1nhXnYrwCpgXQboeyX
         86wLKk2/Icisf5SozlWwTjxjfDNOBEXStSkbjoRWOgRmO6yyIThNV5CZJVRtvzcWxouv
         yapMKdkPsQkdFkdmCzaudE6qh6paf0Y8Yqv5LX6B721HBKqzoZG9lJ/jc/WSqN6Rtdcg
         mm3w==
X-Gm-Message-State: AOAM530RzVmDg2kXZ5/1sOOr0bdDxrbd/wzkvUfblojU4JA4umEm3QBj
        5btwsNv7Fiks6TsT/Ec5YgH3lgZ781mgh2bN
X-Google-Smtp-Source: ABdhPJy0kQhiImzPyvMTXIoe3S5XBcVzI1ubsHTbbUHt8tNPKWinvH0asFzNdG96HgDS858kUtEN9w==
X-Received: by 2002:a17:902:9349:b029:d0:cb2d:f26c with SMTP id g9-20020a1709029349b02900d0cb2df26cmr156960plp.5.1599644559530;
        Wed, 09 Sep 2020 02:42:39 -0700 (PDT)
Received: from josephsih-z840.tpe.corp.google.com ([2401:fa00:1:10:de4a:3eff:fe7d:ff5f])
        by smtp.gmail.com with ESMTPSA id a23sm1692275pgv.86.2020.09.09.02.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 02:42:39 -0700 (PDT)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org, josephsih@google.com,
        Joseph Hwang <josephsih@chromium.org>,
        Alain Michaud <alainm@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 2/2] Bluetooth: sco: expose WBS packet length in socket option
Date:   Wed,  9 Sep 2020 17:42:02 +0800
Message-Id: <20200909174129.v2.2.I03247d3813c6dcbcdbeab26d068f9fd765edb1f5@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200909094202.3863687-1-josephsih@chromium.org>
References: <20200909094202.3863687-1-josephsih@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

It is desirable to expose the wideband speech packet length via
a socket option to the user space so that the user space can set
the value correctly in configuring the sco connection.

Reviewed-by: Alain Michaud <alainm@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Joseph Hwang <josephsih@chromium.org>
---

(no changes since v1)

 net/bluetooth/sco.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index dcf7f96ff417e6..79ffcdef0b7ad5 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -1001,6 +1001,12 @@ static int sco_sock_getsockopt(struct socket *sock, int level, int optname,
 			err = -EFAULT;
 		break;
 
+	case BT_SNDMTU:
+	case BT_RCVMTU:
+		if (put_user(sco_pi(sk)->conn->mtu, (u32 __user *)optval))
+			err = -EFAULT;
+		break;
+
 	default:
 		err = -ENOPROTOOPT;
 		break;
-- 
2.28.0.526.ge36021eeef-goog

