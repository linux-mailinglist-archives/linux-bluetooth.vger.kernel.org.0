Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 595025E6FB2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Sep 2022 00:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiIVW1C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 22 Sep 2022 18:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiIVW1A (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 22 Sep 2022 18:27:00 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381379CCE7
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Sep 2022 15:26:59 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id a20so7332436qtw.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Sep 2022 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=D/UNQxgDRADn72CQaSBMHa5+Aqk/0V6gCrdemPJNnkM=;
        b=Z7cWHjUFbMxU35TO6f36bP+XgP0/U6O5Otn2zyko69vECCQuVwcbd+K7xFixsdNwOh
         sTh6v7bB77nxTNd+0H2oeHVh6w2XvUHdxkigUj4enFAJx3BP3bkixbSs+CB1acZUd3+5
         K9jQ50TT4TcsMMHdbzxoZ4BmOzPXeYkTMNqJc7qpbTs5sqS2FHqdW2bXoXOeaBQWZRaV
         UrUNa0qgrtWorXx6vbb5RYG8epNJBR2EXIZhuURUXZGS8JLf3C8rqakgBwZebIXSp+np
         Tm/V8xlzhlZKR5foUTMkNNfLppPYhl/KrMaXT6I+LxpPSkB99eNGVdGGMxjIZYz7uZlf
         3muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=D/UNQxgDRADn72CQaSBMHa5+Aqk/0V6gCrdemPJNnkM=;
        b=I4djwGXe77Se3c2A7QlzEF8Q6KqkBYYRVVH3p2Hnw4RFF6Z7cOMcSikANV/wEoLYs+
         9LoZ+ar2IJudWDKpvu4GC4ecDPOO8aSJQe59mlLI377u7YMlaDMg8Ixkso2PX7LF8nkw
         9G8r4URUvD79XMhYb1nlb5bEDIEC6oydRjkKO4bGstu4zXJ/am7Rb48aQIBWzgSjihIK
         EeCL+7PHroyRvWW0Xj6CJ9S+d5v70dY23g33DxVPY2/F1xd5cdyUKFCsuyVSvWhJRDc6
         N7Qlw+aPUuuJFphBQswLf09EI7WYKC3CD/iKdSPvqJdUU1abkW1Y7TusvKhkLxWPpEgx
         OTdQ==
X-Gm-Message-State: ACrzQf235HSHcDyXlxmnJfJcTE8xEJa8aCiGJ7u9v3cpKUuWYbNLZVa2
        gTo1gjl4CCng4rpVFiqyA5gpzRp10Fc=
X-Google-Smtp-Source: AMsMyM7QF4GEmo7Ih0hBw12bWsjDX0ed63bCGoLegCxBbvyfLRnuVO7FFSQk3cIOtEPAYqmR/5f2Xw==
X-Received: by 2002:a05:622a:1014:b0:35c:e8ef:a406 with SMTP id d20-20020a05622a101400b0035ce8efa406mr4917388qte.306.1663885618155;
        Thu, 22 Sep 2022 15:26:58 -0700 (PDT)
Received: from [172.17.0.2] ([52.191.13.145])
        by smtp.gmail.com with ESMTPSA id ey24-20020a05622a4c1800b0035a70a25651sm4244088qtb.55.2022.09.22.15.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:26:58 -0700 (PDT)
Message-ID: <632ce132.050a0220.6fc79.12a3@mx.google.com>
Date:   Thu, 22 Sep 2022 15:26:58 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6776413060636723717=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, brian.gix@intel.com
Subject: RE: Mesh demon switched to using kernel Mesh MGMT
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220922214039.611611-2-brian.gix@intel.com>
References: <20220922214039.611611-2-brian.gix@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6776413060636723717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9Njc5NjE4CgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQQVNTICAgICAgMy4zNSBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAyLjAyIHNlY29uZHMKUHJlcCAtIFNldHVwIEVMTCAgICAgICAgICAgICAgUEFTUyAg
ICAgIDI3LjI2IHNlY29uZHMKQnVpbGQgLSBQcmVwICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDAuNzkgc2Vjb25kcwpCdWlsZCAtIENvbmZpZ3VyZSAgICAgICAgICAgICBQQVNTICAgICAgOC43
NyBzZWNvbmRzCkJ1aWxkIC0gTWFrZSAgICAgICAgICAgICAgICAgIEZBSUwgICAgICAxMDguMjMg
c2Vjb25kcwpNYWtlIENoZWNrICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgMTIyMy40OSBz
ZWNvbmRzCk1ha2UgQ2hlY2sgdy9WYWxncmluZCAgICAgICAgIEZBSUwgICAgICA4Ni40OCBzZWNv
bmRzCk1ha2UgRGlzdGNoZWNrICAgICAgICAgICAgICAgIEZBSUwgICAgICAxMS42NyBzZWNvbmRz
CkJ1aWxkIHcvZXh0IEVMTCAtIENvbmZpZ3VyZSAgIFBBU1MgICAgICA4Ljk5IHNlY29uZHMKQnVp
bGQgdy9leHQgRUxMIC0gTWFrZSAgICAgICAgRkFJTCAgICAgIDM5Ljk3IHNlY29uZHMKSW5jcmVt
ZW50YWwgQnVpbGQgdy8gcGF0Y2hlcyAgRkFJTCAgICAgIDE0OS40NyBzZWNvbmRzClNjYW4gQnVp
bGQgICAgICAgICAgICAgICAgICAgIEZBSUwgICAgICA1MzUuOTYgc2Vjb25kcwoKRGV0YWlscwoj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQnVpbGQgLSBNYWtlIC0gRkFJTApE
ZXNjOiBCdWlsZCB0aGUgQmx1ZVogc291cmNlIHRyZWUKT3V0cHV0Ogp0b29scy9tZ210LXRlc3Rl
ci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9tZ210LXRlc3Rlci5jOjEyNDcwOjU6
IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQgd2l0aCDigJgtZnZh
ci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAoxMjQ3MCB8IGludCBt
YWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4KbWVzaC9tZXNoLWlv
LmM6Mjc6MTA6IGZhdGFsIGVycm9yOiBtZXNoL21lc2gtaW8tbWdtdC5oOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5CiAgIDI3IHwgI2luY2x1ZGUgIm1lc2gvbWVzaC1pby1tZ210LmgiCiAgICAg
IHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQu
Cm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzQ5MTogbWVzaC9tZXNoLWlvLm9dIEVycm9yIDEKbWFr
ZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioqIFtNYWtl
ZmlsZTo0NDUxOiBhbGxdIEVycm9yIDIKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
VGVzdDogTWFrZSBDaGVjayAtIEZBSUwKRGVzYzogUnVuICdtYWtlIGNoZWNrJwpPdXRwdXQ6CnVu
aXQvdGVzdC1hdmR0cC5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp1bml0L3Rlc3QtYXZkdHAu
Yzo3NjY6NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBsaW1pdCBleGNlZWRlZCB3aXRo
IOKAmC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRyeWluZyB3aXRob3V0CiAgNzY2
IHwgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCAgICAgXn5+fgp1bml0
L3Rlc3QtYXZyY3AuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdW5pdC90ZXN0LWF2cmNwLmM6
OTg5OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQgd2l0aCDi
gJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAogIDk4OSB8
IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4KbWVzaC9t
ZXNoLWlvLmM6Mjc6MTA6IGZhdGFsIGVycm9yOiBtZXNoL21lc2gtaW8tbWdtdC5oOiBObyBzdWNo
IGZpbGUgb3IgZGlyZWN0b3J5CiAgIDI3IHwgI2luY2x1ZGUgIm1lc2gvbWVzaC1pby1tZ210Lmgi
CiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1p
bmF0ZWQuCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzQ5MTogbWVzaC9tZXNoLWlvLm9dIEVycm9y
IDEKbWFrZTogKioqIFtNYWtlZmlsZToxMTU4ODogY2hlY2tdIEVycm9yIDIKCgojIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogTWFrZSBDaGVjayB3L1ZhbGdyaW5kIC0gRkFJTApE
ZXNjOiBSdW4gJ21ha2UgY2hlY2snIHdpdGggVmFsZ3JpbmQKT3V0cHV0Ogp0b29scy9tZ210LXRl
c3Rlci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu4oCZOgp0b29scy9tZ210LXRlc3Rlci5jOjEyNDcw
OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQgd2l0aCDigJgt
ZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAoxMjQ3MCB8IGlu
dCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4KbWVzaC9tZXNo
LWlvLmM6Mjc6MTA6IGZhdGFsIGVycm9yOiBtZXNoL21lc2gtaW8tbWdtdC5oOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5CiAgIDI3IHwgI2luY2x1ZGUgIm1lc2gvbWVzaC1pby1tZ210LmgiCiAg
ICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNvbXBpbGF0aW9uIHRlcm1pbmF0
ZWQuCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzQ5MTogbWVzaC9tZXNoLWlvLm9dIEVycm9yIDEK
bWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioqIFtN
YWtlZmlsZTo0NDUxOiBhbGxdIEVycm9yIDIKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKVGVzdDogTWFrZSBEaXN0Y2hlY2sgLSBGQUlMCkRlc2M6IFJ1biBkaXN0Y2hlY2sgdG8gY2hl
Y2sgdGhlIGRpc3RyaWJ1dGlvbgpPdXRwdXQ6Cm1ha2VbMl06ICoqKiBObyBydWxlIHRvIG1ha2Ug
dGFyZ2V0ICdtZXNoL21lc2gtaW8tbWdtdC5oJywgbmVlZGVkIGJ5ICdkaXN0ZGlyLWFtJy4gIFN0
b3AuCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MTE0MjE6IGRpc3RkaXJdIEVycm9yIDIKbWFrZTog
KioqIFtNYWtlZmlsZToxMTQ5NzogZGlzdF0gRXJyb3IgMgoKCiMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwpUZXN0OiBCdWlsZCB3L2V4dCBFTEwgLSBNYWtlIC0gRkFJTApEZXNjOiBCdWls
ZCBCbHVlWiBzb3VyY2Ugd2l0aCAnLS1lbmFibGUtZXh0ZXJuYWwtZWxsJyBjb25maWd1cmF0aW9u
Ck91dHB1dDoKbWVzaC9tZXNoLWlvLmM6Mjc6MTA6IGZhdGFsIGVycm9yOiBtZXNoL21lc2gtaW8t
bWdtdC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAgIDI3IHwgI2luY2x1ZGUgIm1lc2gv
bWVzaC1pby1tZ210LmgiCiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+CmNv
bXBpbGF0aW9uIHRlcm1pbmF0ZWQuCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6NzQ5MTogbWVzaC9t
ZXNoLWlvLm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9i
cy4uLi4KbWFrZTogKioqIFtNYWtlZmlsZTo0NDUxOiBhbGxdIEVycm9yIDIKCgojIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogSW5jcmVtZW50YWwgQnVpbGQgdy8gcGF0Y2hlcyAt
IEZBSUwKRGVzYzogSW5jcmVtZW50YWwgYnVpbGQgcGVyIHBhdGNoIGluIHRoZSBzZXJpZXMKT3V0
cHV0OgptZXNoL21lc2gtaW8uYzoyNzoxMDogZmF0YWwgZXJyb3I6IG1lc2gvbWVzaC1pby1tZ210
Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKICAgMjcgfCAjaW5jbHVkZSAibWVzaC9tZXNo
LWlvLW1nbXQuaCIKICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn4KY29tcGls
YXRpb24gdGVybWluYXRlZC4KbWFrZVsxXTogKioqIFtNYWtlZmlsZTo3NDkxOiBtZXNoL21lc2gt
aW8ub10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4u
LgptYWtlOiAqKiogW01ha2VmaWxlOjQ0NTE6IGFsbF0gRXJyb3IgMgoKCiMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBTY2FuIEJ1aWxkIC0gRkFJTApEZXNjOiBSdW4gU2NhbiBC
dWlsZCB3aXRoIHBhdGNoZXMKT3V0cHV0Ogp0b29scy9idHBjbGllbnQuYzoyNDk0OjM6IHdhcm5p
bmc6IFZhbHVlIHN0b3JlZCB0byAncmVwbHknIGlzIG5ldmVyIHJlYWQKICAgICAgICAgICAgICAg
IHJlcGx5ID0gbF9kYnVzX21lc3NhZ2VfbmV3X2Vycm9yKGFnLnBlbmRpbmdfcmVxLAogICAgICAg
ICAgICAgICAgXiAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CjEgd2FybmluZyBnZW5lcmF0ZWQuCkluIGZpbGUgaW5jbHVkZWQgZnJvbSB1bml0L3Rlc3QtbWVz
aC1jcnlwdG8uYzoyMDoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vbWVzaC9jcnlwdG8uYzoxODoK
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vZWxsL2VsbC5oOjE6Ci4vZWxsL3V0aWwuaDoxODc6OTog
d2FybmluZzogMXN0IGZ1bmN0aW9uIGNhbGwgYXJndW1lbnQgaXMgYW4gdW5pbml0aWFsaXplZCB2
YWx1ZQogICAgICAgIHJldHVybiBMX0JFMzJfVE9fQ1BVKExfR0VUX1VOQUxJR05FRCgoY29uc3Qg
dWludDMyX3QgKikgcHRyKSk7CiAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgouL2VsbC91dGlsLmg6ODk6Mjg6IG5vdGU6
IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0xfQkUzMl9UT19DUFUnCiNkZWZpbmUgTF9CRTMyX1RPX0NQ
VSh2YWwpIGJzd2FwXzMyKHZhbCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fgovdXNyL2luY2x1ZGUvYnl0ZXN3YXAuaDozNDoyMTogbm90ZTogZXhwYW5kZWQgZnJvbSBt
YWNybyAnYnN3YXBfMzInCiNkZWZpbmUgYnN3YXBfMzIoeCkgX19ic3dhcF8zMiAoeCkKICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgp1bml0L3Rlc3QtbWVzaC1jcnlwdG8uYzo5NjU6
MTE6IHdhcm5pbmc6IFRoZSBsZWZ0IGV4cHJlc3Npb24gb2YgdGhlIGNvbXBvdW5kIGFzc2lnbm1l
bnQgaXMgYW4gdW5pbml0aWFsaXplZCB2YWx1ZS4gVGhlIGNvbXB1dGVkIHZhbHVlIHdpbGwgYWxz
byBiZSBnYXJiYWdlCiAgICAgICAgICAgICAgICBrZXlfYWlkIHw9IEtFWV9JRF9BS0Y7CiAgICAg
ICAgICAgICAgICB+fn5+fn5+IF4KdW5pdC90ZXN0LW1lc2gtY3J5cHRvLmM6MTAwODoyOiB3YXJu
aW5nOiA0dGggZnVuY3Rpb24gY2FsbCBhcmd1bWVudCBpcyBhbiB1bmluaXRpYWxpemVkIHZhbHVl
CiAgICAgICAgdmVyaWZ5X3VpbnQ4KCJOSUQiLCAwLCBrZXlzLT5uZXRfbmlkLCBuaWQpOwogICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgp1bml0L3Rlc3Qt
bWVzaC1jcnlwdG8uYzoxMjg5OjY6IHdhcm5pbmc6IEJyYW5jaCBjb25kaXRpb24gZXZhbHVhdGVz
IHRvIGEgZ2FyYmFnZSB2YWx1ZQogICAgICAgIGlmIChjdGwpIHsKICAgICAgICAgICAgXn5+CnVu
aXQvdGVzdC1tZXNoLWNyeXB0by5jOjE1MDk6Nzogd2FybmluZzogQnJhbmNoIGNvbmRpdGlvbiBl
dmFsdWF0ZXMgdG8gYSBnYXJiYWdlIHZhbHVlCiAgICAgICAgICAgICAgICBpZiAobmV0X2N0bCkg
ewogICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KdW5pdC90ZXN0LW1lc2gtY3J5cHRvLmM6MTc2
MzoyOiB3YXJuaW5nOiAxc3QgZnVuY3Rpb24gY2FsbCBhcmd1bWVudCBpcyBhbiB1bmluaXRpYWxp
emVkIHZhbHVlCiAgICAgICAgbF9wdXRfYmU2NChjbWFjX3RtcCwgY21hYyk7CiAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KNiB3YXJuaW5ncyBnZW5lcmF0ZWQuCm1lc2gvbWVzaC1p
by5jOjI3OjEwOiBmYXRhbCBlcnJvcjogbWVzaC9tZXNoLWlvLW1nbXQuaDogTm8gc3VjaCBmaWxl
IG9yIGRpcmVjdG9yeQogICAyNyB8ICNpbmNsdWRlICJtZXNoL21lc2gtaW8tbWdtdC5oIgogICAg
ICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgpjb21waWxhdGlvbiB0ZXJtaW5hdGVk
LgptYWtlWzFdOiAqKiogW01ha2VmaWxlOjc0OTE6IG1lc2gvbWVzaC1pby5vXSBFcnJvciAxCm1h
a2U6ICoqKiBbTWFrZWZpbGU6NDQ1MTogYWxsXSBFcnJvciAyCgoKCgotLS0KUmVnYXJkcywKTGlu
dXggQmx1ZXRvb3RoCgo=

--===============6776413060636723717==--
