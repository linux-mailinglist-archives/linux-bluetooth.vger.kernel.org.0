Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623812A783A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Nov 2020 08:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgKEHsW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Nov 2020 02:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEHsV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Nov 2020 02:48:21 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E3FC0613CF
        for <linux-bluetooth@vger.kernel.org>; Wed,  4 Nov 2020 23:48:21 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id t13so569757ilp.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Nov 2020 23:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=ABtwQZhKzzhbat2s/xPmQpKCN232JkrpoydJRi2WA88=;
        b=lh07Q5pA4YUXK6WWDMclIc5ZQMNacuGjuaBRjgbChN6rMriomAzjAZBZouvWYE3RBp
         YXx1U4NxeytK+YiXLgDwRbUsa/ROduU1th5mRkGG8SJxbdtimSz/tK6B2/SCLwv9pN7J
         1vVC2wyOljiWsFeJkMmoL+ItOjlkC6IIcYUJWvxwtikh6z/ak2yLQFsk7F86xx6oKB92
         0Fa48rNE9PHZZzHn9jrK+canckO5loV+8/nIq/J+Ljzw4RWUsa1brtV/N1aGPgAVDtwX
         RoFvKzHePpqdctjiqaPZopsEH5EqGQJIQQof3kgDgx8JGO/yhR0o2DQvhwpl5ZPHau9+
         jjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=ABtwQZhKzzhbat2s/xPmQpKCN232JkrpoydJRi2WA88=;
        b=MlV7hz/DdltGrpJPA6smR2RGhrFXgXEhB71D8TX6Y05RN2PeiXnrf5JQepwCRERY/h
         ECsYb8yYJMLfbCQlxiNmAo8oZ+Bt7lqq8drB9dRnzxugkOIdSA4D2dH4u5d9Eq94FCSY
         zrlZiVapbKQcXM+ZBPJvGMWXI0DY4ZW+w/oaGTBaxkdNokRB0bpSS0BSHacjDttDsuMo
         XulWqqFXACjA4DVmbVcLLq0G3zDElJrrXTI7tXpiLDr6fScu05gOSDe0qACRPD3JbaHG
         ZOo9bSjZL7oNSfNdMzgOz0knMnXzVGikPGTSPRATneoeNFhMma2knEvv/GwiC5M1IQ8f
         LM/w==
X-Gm-Message-State: AOAM532KDXLaq3UUeW7jSi/cB7ov4Wyxh4akCv3K7cgEBcNynzcqKx9P
        5OtLSik2rzIyJHJxFgWGSA/CniZ1jXumjA==
X-Google-Smtp-Source: ABdhPJww30XKAZiatcuJ3dKEuLXdS+LLR+LS7B7LKapgQtUfyUVrt42Ds68mxwaRr30RCvIISI5lcw==
X-Received: by 2002:a92:9a90:: with SMTP id c16mr976077ill.171.1604562500929;
        Wed, 04 Nov 2020 23:48:20 -0800 (PST)
Received: from [172.17.0.2] ([52.184.188.48])
        by smtp.gmail.com with ESMTPSA id f1sm581778ils.23.2020.11.04.23.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 23:48:20 -0800 (PST)
Message-ID: <5fa3ae44.1c69fb81.bcf30.1dfd@mx.google.com>
Date:   Wed, 04 Nov 2020 23:48:20 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4298749858330648437=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, max.chou@realtek.com
Subject: RE: Bluetooth: btrtl: Refine the ic_id_table for clearer and more regular
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201104120414.12772-1-max.chou@realtek.com>
References: <20201104120414.12772-1-max.chou@realtek.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4298749858330648437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=377299

---Test result---

##############################
Test: CheckPatch - PASS

##############################
Test: CheckGitLint - PASS

##############################
Test: CheckBuildK - PASS



---
Regards,
Linux Bluetooth


--===============4298749858330648437==--
