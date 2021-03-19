Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 156A0342737
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Mar 2021 21:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhCSUx7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Mar 2021 16:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhCSUxv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Mar 2021 16:53:51 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27BD4C06175F
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Mar 2021 13:53:51 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id y18so4373940qky.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 Mar 2021 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=NmAbtaBbjrjzzS5ODS+34aLl1ybe7bg0dW86qpQxte8=;
        b=K7101il1xFB3RyF14Ve/1uYPdm3gLrzMoatdvW20/s+r3drYc573jmxZsbBHtCJ4Ss
         2Juhy557MhlO1ji+tpyeT+OAKg9/Dj6ENZtPtdg9gCjMDCfLc2ws+9Ns73sWCRkDmWKG
         K9cNKTnPeSj+MN1c3FlHRazV3T6tBQDJNGQm8n+mLubcLKefFff+is6nSA4I9Y4Mx3LH
         5iKzzmSIcRxtjwjjzOvuJs1GyowDKDrxRBcR/9u6mneCl19Z4kRgPYHjVxM3l92Z2mRV
         t55BvEfw8DMsgZyPNXhYxE8Aor2XQTrKJw+dvcvBZcCFpFI1pqBShSXT6bCJzY/pPMSE
         6UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=NmAbtaBbjrjzzS5ODS+34aLl1ybe7bg0dW86qpQxte8=;
        b=suFpkwr0M4KR/wtX7bDhP1HY9jpKkMmUrCTWtyXK1uzCWscIxwNmHcb9QGkOdesO3B
         3uNx+qXCwQE+aefc+iLmvnVRuOgtuOSgY7R38+FiEwrDoqhGuQfhFtFhSUTM2L+QsAJc
         G+iO6LTyBTIprsKfNKK7XN9pETs2XY0GQwO+uEHC1Yeq7u9eRM17Desj+T6zElvSJob8
         RJq0h5Z39n/5TKmjsFFZ+rVeOFs1A8Bo3xBuUVFT89vEwI12Cf+l5BB7e0IYz/cwYpm1
         ZCxBnhQ4aZXOCfkj7EWYJWIEChfQOuAMQYWh4cRXbGUqBK0qFBDdhLN9scU7t3ShseZv
         +ySA==
X-Gm-Message-State: AOAM532cgvopQA3m7Smqilg+VE6v4nFdOL+44tXqxqOgd6tC2xLByWN7
        TDE7yorDPPflYdl+x1xjVI7lmzZVe7r0fg==
X-Google-Smtp-Source: ABdhPJzZKN6jBI8JgyQpY6ktOkttfh2iSIQQDm1dHxnF2NFz8slXsCzeocNAempvcWU2mbt9TPkL1g==
X-Received: by 2002:a05:620a:906:: with SMTP id v6mr525420qkv.28.1616187229824;
        Fri, 19 Mar 2021 13:53:49 -0700 (PDT)
Received: from [172.17.0.2] ([20.49.19.242])
        by smtp.gmail.com with ESMTPSA id m17sm5525625qkh.82.2021.03.19.13.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 13:53:49 -0700 (PDT)
Message-ID: <60550f5d.1c69fb81.e1b1a.21f0@mx.google.com>
Date:   Fri, 19 Mar 2021 13:53:49 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2567999211574220278=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, inga.stotland@intel.com
Subject: RE: Framework for non-interactive mesh test
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210319203825.459070-2-inga.stotland@intel.com>
References: <20210319203825.459070-2-inga.stotland@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============2567999211574220278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9NDUxODc1CgotLS1U
ZXN0IHJlc3VsdC0tLQoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNr
UGF0Y2ggLSBQQVNTCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tH
aXRMaW50IC0gUEFTUwoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNr
QnVpbGQgLSBGQUlMCk91dHB1dDoKdG9vbHMvbWVzaC1jZmd0ZXN0LmM6IEluIGZ1bmN0aW9uIOKA
mGluaXRfY29udGludWXigJk6CnRvb2xzL21lc2gtY2ZndGVzdC5jOjM1Njo3OiBlcnJvcjogdmFy
aWFibGUg4oCYc3RhZ2XigJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKICAz
NTYgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0
ZXIpOwogICAgICB8ICAgICAgIF5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjM1
NjozMDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGxfdGVzdGVy
X2dldF9zdGFnZeKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAz
NTYgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0
ZXIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjM1NjoyMjogZXJyb3I6IHN0b3JhZ2Ugc2l6ZSBvZiDi
gJhzdGFnZeKAmSBpc27igJl0IGtub3duCiAgMzU2IHwgIGVudW0gbF90ZXN0ZXJfc3RhZ2Ugc3Rh
Z2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICBefn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzozNTk6MTU6IGVycm9yOiDigJhMX1RFU1RF
Ul9TVEFHRV9QUkVfU0VUVVDigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pCiAgMzU5IHwgICAgICBzdGFnZSA9PSBMX1RFU1RFUl9TVEFHRV9QUkVfU0VUVVApIHsKICAg
ICAgfCAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNm
Z3Rlc3QuYzozNTk6MTU6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9y
dGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCnRvb2xzL21lc2gt
Y2ZndGVzdC5jOjM2MDozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
4oCYbF90ZXN0ZXJfcHJlX3NldHVwX2NvbXBsZXRl4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0
aW9uLWRlY2xhcmF0aW9uXQogIDM2MCB8ICAgbF90ZXN0ZXJfcHJlX3NldHVwX2NvbXBsZXRlKHRl
c3Rlcik7CiAgICAgIHwgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvbWVzaC1j
Zmd0ZXN0LmM6MzU2OjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmHN0YWdl4oCZIFstV2Vy
cm9yPXVudXNlZC12YXJpYWJsZV0KICAzNTYgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFnZSA9
IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X3N1Y2Nlc3Pi
gJk6CnRvb2xzL21lc2gtY2ZndGVzdC5jOjM3MjoyOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRp
b24gb2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfdGVzdF9wYXNzZWTigJkgWy1XZXJyb3I9aW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgMzcyIHwgIGxfdGVzdGVyX3Rlc3RfcGFzc2VkKHRl
c3Rlcik7CiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5j
OiBJbiBmdW5jdGlvbiDigJh0ZXN0X2ZhaWzigJk6CnRvb2xzL21lc2gtY2ZndGVzdC5jOjM3Nzoy
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfdGVz
dF9mYWlsZWTigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgMzc3
IHwgIGxfdGVzdGVyX3Rlc3RfZmFpbGVkKHRlc3Rlcik7CiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOiBJbiBmdW5jdGlvbiDigJhjcmVhdGVfYXBwa2V5
X3JlcGx54oCZOgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo0ODA6NzogZXJyb3I6IHZhcmlhYmxlIOKA
mHN0YWdl4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCiAgNDgwIHwgIGVu
dW0gbF90ZXN0ZXJfc3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAg
ICAgfCAgICAgICBefn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo0ODA6MjI6IGVy
cm9yOiBzdG9yYWdlIHNpemUgb2Yg4oCYc3RhZ2XigJkgaXNu4oCZdCBrbm93bgogIDQ4MCB8ICBl
bnVtIGxfdGVzdGVyX3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6NDg4
OjE2OiBlcnJvcjog4oCYTF9URVNURVJfU1RBR0VfUFJFX1NFVFVQ4oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogIDQ4OCB8ICAgaWYgKHN0YWdlID09IExfVEVTVEVS
X1NUQUdFX1BSRV9TRVRVUCkgewogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo0OTA6NDogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGxfdGVzdGVyX3ByZV9zZXR1cF9mYWlsZWTigJkgWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgNDkwIHwgICAgbF90ZXN0ZXJf
cHJlX3NldHVwX2ZhaWxlZCh0ZXN0ZXIpOwogICAgICB8ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6NDkyOjQ6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhsX3Rlc3Rlcl9zZXR1cF9mYWlsZWTigJkgWy1XZXJyb3I9aW1w
bGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgNDkyIHwgICAgbF90ZXN0ZXJfc2V0dXBfZmFp
bGVkKHRlc3Rlcik7CiAgICAgIHwgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gt
Y2ZndGVzdC5jOjQ5Nzo0OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
4oCYbF90ZXN0ZXJfc2V0dXBfY29tcGxldGXigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCiAgNDk3IHwgICAgbF90ZXN0ZXJfc2V0dXBfY29tcGxldGUodGVzdGVyKTsK
ICAgICAgfCAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo0
ODA6MjI6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCYc3RhZ2XigJkgWy1XZXJyb3I9dW51c2Vk
LXZhcmlhYmxlXQogIDQ4MCB8ICBlbnVtIGxfdGVzdGVyX3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJf
Z2V0X3N0YWdlKHRlc3Rlcik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KdG9v
bHMvbWVzaC1jZmd0ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGltcG9ydF9yZW1vdGVfcmVwbHnigJk6
CnRvb2xzL21lc2gtY2ZndGVzdC5jOjUyNzo3OiBlcnJvcjogdmFyaWFibGUg4oCYc3RhZ2XigJkg
aGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKICA1MjcgfCAgZW51bSBsX3Rlc3Rl
cl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAgICAg
IF5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjUyNzoyMjogZXJyb3I6IHN0b3Jh
Z2Ugc2l6ZSBvZiDigJhzdGFnZeKAmSBpc27igJl0IGtub3duCiAgNTI3IHwgIGVudW0gbF90ZXN0
ZXJfc3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICBefn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo1MzU6MTY6IGVycm9y
OiDigJhMX1RFU1RFUl9TVEFHRV9QUkVfU0VUVVDigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGlu
IHRoaXMgZnVuY3Rpb24pCiAgNTM1IHwgICBpZiAoc3RhZ2UgPT0gTF9URVNURVJfU1RBR0VfUFJF
X1NFVFVQKSB7CiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CnRvb2xzL21lc2gtY2ZndGVzdC5jOjU0NjozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfdGVzdF9hYm9ydOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KICA1NDYgfCAgIGxfdGVzdGVyX3Rlc3RfYWJvcnQodGVzdGVy
KTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6NTI3
OjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmHN0YWdl4oCZIFstV2Vycm9yPXVudXNlZC12
YXJpYWJsZV0KICA1MjcgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dl
dF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+fn5+CnRvb2xz
L21lc2gtY2ZndGVzdC5jOiBJbiBmdW5jdGlvbiDigJhpbXBvcnRfc3VibmV0X3JlcGx54oCZOgp0
b29scy9tZXNoLWNmZ3Rlc3QuYzo1Nzk6NzogZXJyb3I6IHZhcmlhYmxlIOKAmHN0YWdl4oCZIGhh
cyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCiAgNTc5IHwgIGVudW0gbF90ZXN0ZXJf
c3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAgICAgfCAgICAgICBe
fn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo1Nzk6MjI6IGVycm9yOiBzdG9yYWdl
IHNpemUgb2Yg4oCYc3RhZ2XigJkgaXNu4oCZdCBrbm93bgogIDU3OSB8ICBlbnVtIGxfdGVzdGVy
X3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6NTgxOjE1OiBlcnJvcjog
4oCYTF9URVNURVJfU1RBR0VfUFJFX1NFVFVQ4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0
aGlzIGZ1bmN0aW9uKQogIDU4MSB8ICBpZiAoc3RhZ2UgIT0gTF9URVNURVJfU1RBR0VfUFJFX1NF
VFVQKQogICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xz
L21lc2gtY2ZndGVzdC5jOjU5MToxMDogZXJyb3I6IOKAmHJldHVybuKAmSB3aXRoIGEgdmFsdWUs
IGluIGZ1bmN0aW9uIHJldHVybmluZyB2b2lkIFstV2Vycm9yPXJldHVybi10eXBlXQogIDU5MSB8
ICAgcmV0dXJuIGxfdGVzdGVyX3ByZV9zZXR1cF9mYWlsZWQodGVzdGVyKTsKICAgICAgfCAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0
LmM6NTc2OjEzOiBub3RlOiBkZWNsYXJlZCBoZXJlCiAgNTc2IHwgc3RhdGljIHZvaWQgaW1wb3J0
X3N1Ym5ldF9yZXBseShzdHJ1Y3QgbF9kYnVzX3Byb3h5ICpwcm94eSwKICAgICAgfCAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjU3OToyMjogZXJy
b3I6IHVudXNlZCB2YXJpYWJsZSDigJhzdGFnZeKAmSBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVd
CiAgNTc5IHwgIGVudW0gbF90ZXN0ZXJfc3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2Uo
dGVzdGVyKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICBefn5+fgp0b29scy9tZXNoLWNm
Z3Rlc3QuYzogSW4gZnVuY3Rpb24g4oCYYXR0YWNoX25vZGVfcmVwbHnigJk6CnRvb2xzL21lc2gt
Y2ZndGVzdC5jOjYzMDo3OiBlcnJvcjogdmFyaWFibGUg4oCYc3RhZ2XigJkgaGFzIGluaXRpYWxp
emVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKICA2MzAgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFn
ZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAgICAgIF5+fn5+fn5+fn5+
fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjYzMDoyMjogZXJyb3I6IHN0b3JhZ2Ugc2l6ZSBvZiDi
gJhzdGFnZeKAmSBpc27igJl0IGtub3duCiAgNjMwIHwgIGVudW0gbF90ZXN0ZXJfc3RhZ2Ugc3Rh
Z2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICBefn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo2NjA6MTU6IGVycm9yOiDigJhMX1RFU1RF
Ul9TVEFHRV9QUkVfU0VUVVDigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pCiAgNjYwIHwgIGlmIChzdGFnZSA9PSBMX1RFU1RFUl9TVEFHRV9QUkVfU0VUVVApCiAgICAg
IHwgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvbWVzaC1jZmd0
ZXN0LmM6NjMwOjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxlIOKAmHN0YWdl4oCZIFstV2Vycm9y
PXVudXNlZC12YXJpYWJsZV0KICA2MzAgfCAgZW51bSBsX3Rlc3Rlcl9zdGFnZSBzdGFnZSA9IGxf
dGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOiBJbiBmdW5jdGlvbiDigJhqb2luX2NvbXBsZXRl4oCZ
Ogp0b29scy9tZXNoLWNmZ3Rlc3QuYzo3MDM6NzogZXJyb3I6IHZhcmlhYmxlIOKAmHN0YWdl4oCZ
IGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBlCiAgNzAzIHwgIGVudW0gbF90ZXN0
ZXJfc3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2UodGVzdGVyKTsKICAgICAgfCAgICAg
ICBefn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo3MDM6MjI6IGVycm9yOiBzdG9y
YWdlIHNpemUgb2Yg4oCYc3RhZ2XigJkgaXNu4oCZdCBrbm93bgogIDcwMyB8ICBlbnVtIGxfdGVz
dGVyX3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6NzA2OjE2OiBlcnJv
cjog4oCYTF9URVNURVJfU1RBR0VfUFJFX1NFVFVQ4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQogIDcwNiB8ICAgaWYgKHN0YWdlID09IExfVEVTVEVSX1NUQUdFX1BS
RV9TRVRVUCkgewogICAgICB8ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo3MDM6MjI6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCY
c3RhZ2XigJkgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQogIDcwMyB8ICBlbnVtIGxfdGVzdGVy
X3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6IEluIGZ1bmN0aW9uIOKA
mGRldl9tc2dfcmVjdl9jYWxs4oCZOgp0b29scy9tZXNoLWNmZ3Rlc3QuYzo5Njc6NzogZXJyb3I6
IHZhcmlhYmxlIOKAmHN0YWdl4oCZIGhhcyBpbml0aWFsaXplciBidXQgaW5jb21wbGV0ZSB0eXBl
CiAgOTY3IHwgIGVudW0gbF90ZXN0ZXJfc3RhZ2Ugc3RhZ2UgPSBsX3Rlc3Rlcl9nZXRfc3RhZ2Uo
dGVzdGVyKTsKICAgICAgfCAgICAgICBefn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3Qu
Yzo5Njc6MjI6IGVycm9yOiBzdG9yYWdlIHNpemUgb2Yg4oCYc3RhZ2XigJkgaXNu4oCZdCBrbm93
bgogIDk2NyB8ICBlbnVtIGxfdGVzdGVyX3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdl
KHRlc3Rlcik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1j
Zmd0ZXN0LmM6OTg5OjE1OiBlcnJvcjog4oCYTF9URVNURVJfU1RBR0VfUFJFX1NFVFVQ4oCZIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQogIDk4OSB8ICBpZiAoc3RhZ2Ug
PT0gTF9URVNURVJfU1RBR0VfUFJFX1NFVFVQKSB7CiAgICAgIHwgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6MTAwMTo5OiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfZ2V0X2RhdGHigJkg
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAxMDAxIHwgICByc3AgPSBs
X3Rlc3Rlcl9nZXRfZGF0YSh0ZXN0ZXIpOwogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6MTAwMTo3OiBlcnJvcjogYXNzaWdubWVudCB0byDigJhz
dHJ1Y3QgbXNnX2RhdGEgKuKAmSBmcm9tIOKAmGludOKAmSBtYWtlcyBwb2ludGVyIGZyb20gaW50
ZWdlciB3aXRob3V0IGEgY2FzdCBbLVdlcnJvcj1pbnQtY29udmVyc2lvbl0KIDEwMDEgfCAgIHJz
cCA9IGxfdGVzdGVyX2dldF9kYXRhKHRlc3Rlcik7CiAgICAgIHwgICAgICAgXgp0b29scy9tZXNo
LWNmZ3Rlc3QuYzo5Njc6MjI6IGVycm9yOiB1bnVzZWQgdmFyaWFibGUg4oCYc3RhZ2XigJkgWy1X
ZXJyb3I9dW51c2VkLXZhcmlhYmxlXQogIDk2NyB8ICBlbnVtIGxfdGVzdGVyX3N0YWdlIHN0YWdl
ID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGNsaWVudF9yZWFk
eeKAmToKdG9vbHMvbWVzaC1jZmd0ZXN0LmM6MTE3MTo3OiBlcnJvcjogdmFyaWFibGUg4oCYc3Rh
Z2XigJkgaGFzIGluaXRpYWxpemVyIGJ1dCBpbmNvbXBsZXRlIHR5cGUKIDExNzEgfCAgZW51bSBs
X3Rlc3Rlcl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8
ICAgICAgIF5+fn5+fn5+fn5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOjExNzE6MjI6IGVycm9y
OiBzdG9yYWdlIHNpemUgb2Yg4oCYc3RhZ2XigJkgaXNu4oCZdCBrbm93bgogMTE3MSB8ICBlbnVt
IGxfdGVzdGVyX3N0YWdlIHN0YWdlID0gbF90ZXN0ZXJfZ2V0X3N0YWdlKHRlc3Rlcik7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn4KdG9vbHMvbWVzaC1jZmd0ZXN0LmM6MTE3OTox
NTogZXJyb3I6IOKAmExfVEVTVEVSX1NUQUdFX1BSRV9TRVRVUOKAmSB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbikKIDExNzkgfCAgaWYgKHN0YWdlID09IExfVEVTVEVSX1NU
QUdFX1BSRV9TRVRVUCkKICAgICAgfCAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgp0b29scy9tZXNoLWNmZ3Rlc3QuYzoxMTcxOjIyOiBlcnJvcjogdW51c2VkIHZhcmlhYmxl
IOKAmHN0YWdl4oCZIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0KIDExNzEgfCAgZW51bSBsX3Rl
c3Rlcl9zdGFnZSBzdGFnZSA9IGxfdGVzdGVyX2dldF9zdGFnZSh0ZXN0ZXIpOwogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+CnRvb2xzL21lc2gtY2ZndGVzdC5jOiBJbiBmdW5jdGlv
biDigJhtYWlu4oCZOgp0b29scy9tZXNoLWNmZ3Rlc3QuYzoxNDA3OjExOiBlcnJvcjogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfbmV34oCZOyBkaWQgeW91IG1l
YW4g4oCYbF90bHNfbmV34oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0KIDE0MDcgfCAgdGVzdGVyID0gbF90ZXN0ZXJfbmV3KG9wdGlvbl9wcmVmaXgsIG9wdGlvbl9z
dHJpbmcsIG9wdGlvbl9saXN0KTsKICAgICAgfCAgICAgICAgICAgXn5+fn5+fn5+fn5+CiAgICAg
IHwgICAgICAgICAgIGxfdGxzX25ldwp0b29scy9tZXNoLWNmZ3Rlc3QuYzoxNDA3Ojk6IGVycm9y
OiBhc3NpZ25tZW50IHRvIOKAmHN0cnVjdCBsX3Rlc3RlciAq4oCZIGZyb20g4oCYaW504oCZIG1h
a2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2Vycm9yPWludC1jb252
ZXJzaW9uXQogMTQwNyB8ICB0ZXN0ZXIgPSBsX3Rlc3Rlcl9uZXcob3B0aW9uX3ByZWZpeCwgb3B0
aW9uX3N0cmluZywgb3B0aW9uX2xpc3QpOwogICAgICB8ICAgICAgICAgXgp0b29scy9tZXNoLWNm
Z3Rlc3QuYzoxNDExOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDi
gJhsX3Rlc3Rlcl9hZGRfZnVsbOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0KIDE0MTEgfCAgbF90ZXN0ZXJfYWRkX2Z1bGwodGVzdGVyLCAiQ29uZmlnIEFwcEtleSBB
ZGQ6IFN1Y2Nlc3MiLAogICAgICB8ICBefn5+fn5+fn5+fn5+fn5+fgp0b29scy9tZXNoLWNmZ3Rl
c3QuYzoxNDMxOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhs
X3Rlc3Rlcl9zdGFydOKAmTsgZGlkIHlvdSBtZWFuIOKAmGxfdGxzX3N0YXJ04oCZPyBbLVdlcnJv
cj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KIDE0MzEgfCAgbF90ZXN0ZXJfc3RhcnQo
dGVzdGVyLCBkb25lX2NhbGxiYWNrKTsKICAgICAgfCAgXn5+fn5+fn5+fn5+fn4KICAgICAgfCAg
bF90bHNfc3RhcnQKdG9vbHMvbWVzaC1jZmd0ZXN0LmM6MTQzNjo4OiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbF90ZXN0ZXJfc3VtbWFyaXpl4oCZIFstV2Vycm9y
PWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogMTQzNiB8ICAgaWYgKCFsX3Rlc3Rlcl9z
dW1tYXJpemUodGVzdGVyKSkKICAgICAgfCAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+CnRvb2xz
L21lc2gtY2ZndGVzdC5jOjE0NDg6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmGxfdGVzdGVyX2Rlc3Ryb3nigJk7IGRpZCB5b3UgbWVhbiDigJhsX3F1ZXVlX2Rl
c3Ryb3nigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogMTQ0OCB8
ICBsX3Rlc3Rlcl9kZXN0cm95KHRlc3Rlcik7CiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn4KICAg
ICAgfCAgbF9xdWV1ZV9kZXN0cm95CmNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMg
ZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6Njg0NjogdG9vbHMvbWVzaC1jZmd0ZXN0Lm9d
IEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTo0MDU4OiBhbGxdIEVycm9yIDIKCgojIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogTWFrZUNoZWNrIC0gU0tJUFBFRApPdXRwdXQ6
CmNoZWNrYnVpbGQgbm90IHN1Y2Nlc3MKCgoKLS0tClJlZ2FyZHMsCkxpbnV4IEJsdWV0b290aAoK

--===============2567999211574220278==--
