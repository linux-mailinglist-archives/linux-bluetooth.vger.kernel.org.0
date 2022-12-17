Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2E9C64F6B7
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Dec 2022 02:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiLQBPb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Dec 2022 20:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiLQBP3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Dec 2022 20:15:29 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9F04D5F2
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Dec 2022 17:15:28 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id p24-20020a0568301d5800b0066e6dc09be5so2378648oth.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Dec 2022 17:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X/wPjOcOA4LyLTLHN4vmxdMcdgXja3kiFxxYm6skXgs=;
        b=aKs8bkksBIL2qwl7xUaCluj7GbJQfKpzH4hM0hbiQVbUNL0PMjv1CaFMS5RW+jrJiw
         MudiZ/jonihwjvgpckBERSlyErnaL3X5HPujEEiewCBTdPbndLofZkOp3jwyoEDydoVc
         owxXIcCU772uUgHcimdCA3waKy7c21FAxEUmfY5wN+ipz/q9bkjE5mBWWTlhAzEEo2WC
         Z4Gf8FPg0yCibR76yLem5BatPNnhm7NUEkZo83zvuwCVWuX67p85P+XXA0Ml322LnoxX
         4Pw25nI08m3tjfr92YjRupMa0+GKJjoV9Fo1BHgbS7/pH+WViBxIEc5gZUYA5kGTekiz
         dUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/wPjOcOA4LyLTLHN4vmxdMcdgXja3kiFxxYm6skXgs=;
        b=e4kq/lSgygzy7Loinfmpuyj2TFrqt/e6P2UvvIotdyt/vZQheAeH7HMkOlHx1EGQrj
         H6rfoa/ckFFmjleBXqjv2lIWxA2uTKTdRYMpUFp4X04EHX4Qvb6UfiyXYlX0Bu90IS39
         BkRTT+5uSYM0yQY/Qi5T3i8d3bbtdHdTghUFHC7TVAQ52Z/kjWwiRbGFqEvWj7eGN+Bq
         Jx3cwTEs4MYbSqB2XIDhTsahbpIlhWWRHnMcBtoi+hUW1wMNwZijMISwyTkEgH1fJgeA
         14ML6rETbacYx1/kGjikxYEL7tgUoWHnTntvnSIBUOEJvNtwq2VsDep4GNKN0yhegmBm
         5N6Q==
X-Gm-Message-State: ANoB5pmVVDNPlIEAWwWdb/6GHoLRvy39wN2aCNUnrkEZrRg8uHZyEVNR
        M6Ybk1JC9xMA4VCJf+T+3oGJBb1P/Go=
X-Google-Smtp-Source: AA0mqf5YvMy1Q6yXMjWgOfgPXy/dfkF+xrLqtDqSxfLc6sdzuqCQOmX2xmn+Y3K4h4XUy0v1GSdjUg==
X-Received: by 2002:a9d:5917:0:b0:66e:b4ec:593e with SMTP id t23-20020a9d5917000000b0066eb4ec593emr14792546oth.36.1671239728013;
        Fri, 16 Dec 2022 17:15:28 -0800 (PST)
Received: from [172.17.0.2] ([23.98.147.219])
        by smtp.gmail.com with ESMTPSA id b4-20020a9d4784000000b0066f09567827sm1514923otf.78.2022.12.16.17.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 17:15:27 -0800 (PST)
Message-ID: <639d182f.9d0a0220.9830f.6c33@mx.google.com>
Date:   Fri, 16 Dec 2022 17:15:27 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============1325571009853941622=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v3] shared/gatt-client: Fix not marking service as active
In-Reply-To: <20221216234517.3026289-1-luiz.dentz@gmail.com>
References: <20221216234517.3026289-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============1325571009853941622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9NzA1MjgyCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQQVNTICAgICAgMC44MiBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAwLjMxIHNlY29uZHMKQnVpbGRFbGwgICAgICAgICAgICAgICAgICAgICAgUEFTUyAg
ICAgIDMwLjk0IHNlY29uZHMKQmx1ZXpNYWtlICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAg
IDE0Ljk5IHNlY29uZHMKTWFrZUNoZWNrICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDIx
LjQ4IHNlY29uZHMKTWFrZURpc3RjaGVjayAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDM1LjU3
IHNlY29uZHMKQ2hlY2tWYWxncmluZCAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDE1LjE2IHNl
Y29uZHMKYmx1ZXptYWtlZXh0ZWxsICAgICAgICAgICAgICAgRkFJTCAgICAgIDEyLjA2IHNlY29u
ZHMKSW5jcmVtZW50YWxCdWlsZCAgICAgICAgICAgICAgRkFJTCAgICAgIDE1LjU4IHNlY29uZHMK
U2NhbkJ1aWxkICAgICAgICAgICAgICAgICAgICAgRkFJTCAgICAgIDU3Mi44NiBzZWNvbmRzCgpE
ZXRhaWxzCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBCbHVlek1ha2UgLSBG
QUlMCkRlc2M6IEJ1aWxkIEJsdWVaCk91dHB1dDoKCnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzog
SW4gZnVuY3Rpb24g4oCYZGlzY292ZXJfZGVzY3PigJk6CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQu
Yzo3MTM6OTogZXJyb3I6IOKAmGRlc3Rfc3RhcnTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGlu
IHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYZGVzY19zdGFydOKAmT8KICA3MTMgfCAg
ICAgaWYgKGRlc3Rfc3RhcnQgPT0gZW5kKQogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fgogICAg
ICB8ICAgICAgICAgZGVzY19zdGFydApzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6NzEzOjk6IG5v
dGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3Ig
ZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6ODIyMDog
c3JjL3NoYXJlZC9saWJzaGFyZWRfbWFpbmxvb3BfbGEtZ2F0dC1jbGllbnQubG9dIEVycm9yIDEK
bWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KbWFrZTogKioqIFtN
YWtlZmlsZTo0NDgyOiBhbGxdIEVycm9yIDIKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
ClRlc3Q6IE1ha2VDaGVjayAtIEZBSUwKRGVzYzogUnVuIEJsdWV6IE1ha2UgQ2hlY2sKT3V0cHV0
OgoKc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOiBJbiBmdW5jdGlvbiDigJhkaXNjb3Zlcl9kZXNj
c+KAmToKc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjcxMzo5OiBlcnJvcjog4oCYZGVzdF9zdGFy
dOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVh
biDigJhkZXNjX3N0YXJ04oCZPwogIDcxMyB8ICAgICBpZiAoZGVzdF9zdGFydCA9PSBlbmQpCiAg
ICAgIHwgICAgICAgICBefn5+fn5+fn5+CiAgICAgIHwgICAgICAgICBkZXNjX3N0YXJ0CnNyYy9z
aGFyZWQvZ2F0dC1jbGllbnQuYzo3MTM6OTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZp
ZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4K
bWFrZVsxXTogKioqIFtNYWtlZmlsZTo4MDE3OiBzcmMvc2hhcmVkL2xpYnNoYXJlZF9nbGliX2xh
LWdhdHQtY2xpZW50LmxvXSBFcnJvciAxCm1ha2U6ICoqKiBbTWFrZWZpbGU6MTE2ODQ6IGNoZWNr
XSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBNYWtlRGlzdGNo
ZWNrIC0gRkFJTApEZXNjOiBSdW4gQmx1ZXogTWFrZSBEaXN0Y2hlY2sKT3V0cHV0OgoKLi4vLi4v
c3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOiBJbiBmdW5jdGlvbiDigJhkaXNjb3Zlcl9kZXNjc+KA
mToKLi4vLi4vc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5jOjcxMzo5OiBlcnJvcjog4oCYZGVzdF9z
dGFydOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3Ug
bWVhbiDigJhkZXNjX3N0YXJ04oCZPwogIDcxMyB8ICAgICBpZiAoZGVzdF9zdGFydCA9PSBlbmQp
CiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+CiAgICAgIHwgICAgICAgICBkZXNjX3N0YXJ0Ci4u
Ly4uL3NyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo3MTM6OTogbm90ZTogZWFjaCB1bmRlY2xhcmVk
IGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFw
cGVhcnMgaW4KbWFrZVsyXTogKioqIFtNYWtlZmlsZTo4MjIwOiBzcmMvc2hhcmVkL2xpYnNoYXJl
ZF9tYWlubG9vcF9sYS1nYXR0LWNsaWVudC5sb10gRXJyb3IgMQptYWtlWzJdOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtlWzFdOiAqKiogW01ha2VmaWxlOjQ0ODI6IGFs
bF0gRXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxlOjExNjA1OiBkaXN0Y2hlY2tdIEVycm9yIDEK
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrVmFsZ3JpbmQgLSBGQUlM
CkRlc2M6IFJ1biBCbHVleiBNYWtlIENoZWNrIHdpdGggVmFsZ3JpbmQKT3V0cHV0OgoKc3JjL3No
YXJlZC9nYXR0LWNsaWVudC5jOiBJbiBmdW5jdGlvbiDigJhkaXNjb3Zlcl9kZXNjc+KAmToKc3Jj
L3NoYXJlZC9nYXR0LWNsaWVudC5jOjcxMzo5OiBlcnJvcjog4oCYZGVzdF9zdGFydOKAmSB1bmRl
Y2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhkZXNj
X3N0YXJ04oCZPwogIDcxMyB8ICAgICBpZiAoZGVzdF9zdGFydCA9PSBlbmQpCiAgICAgIHwgICAg
ICAgICBefn5+fn5+fn5+CiAgICAgIHwgICAgICAgICBkZXNjX3N0YXJ0CnNyYy9zaGFyZWQvZ2F0
dC1jbGllbnQuYzo3MTM6OTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVw
b3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KbWFrZVsxXTog
KioqIFtNYWtlZmlsZTo4MjIwOiBzcmMvc2hhcmVkL2xpYnNoYXJlZF9tYWlubG9vcF9sYS1nYXR0
LWNsaWVudC5sb10gRXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBq
b2JzLi4uLgptYWtlOiAqKiogW01ha2VmaWxlOjExNjg0OiBjaGVja10gRXJyb3IgMgojIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogYmx1ZXptYWtlZXh0ZWxsIC0gRkFJTApEZXNj
OiBCdWlsZCBCbHVleiB3aXRoIEV4dGVybmFsIEVMTApPdXRwdXQ6CgpzcmMvc2hhcmVkL2dhdHQt
Y2xpZW50LmM6IEluIGZ1bmN0aW9uIOKAmGRpc2NvdmVyX2Rlc2Nz4oCZOgpzcmMvc2hhcmVkL2dh
dHQtY2xpZW50LmM6NzEzOjk6IGVycm9yOiDigJhkZXN0X3N0YXJ04oCZIHVuZGVjbGFyZWQgKGZp
cnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmGRlc2Nfc3RhcnTigJk/
CiAgNzEzIHwgICAgIGlmIChkZXN0X3N0YXJ0ID09IGVuZCkKICAgICAgfCAgICAgICAgIF5+fn5+
fn5+fn4KICAgICAgfCAgICAgICAgIGRlc2Nfc3RhcnQKc3JjL3NoYXJlZC9nYXR0LWNsaWVudC5j
OjcxMzo5OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5
IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgptYWtlWzFdOiAqKiogW01ha2Vm
aWxlOjgyMjA6IHNyYy9zaGFyZWQvbGlic2hhcmVkX21haW5sb29wX2xhLWdhdHQtY2xpZW50Lmxv
XSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCm1h
a2U6ICoqKiBbTWFrZWZpbGU6NDQ4MjogYWxsXSBFcnJvciAyCiMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwpUZXN0OiBJbmNyZW1lbnRhbEJ1aWxkIC0gRkFJTApEZXNjOiBJbmNyZW1lbnRh
bCBidWlsZCB3aXRoIHRoZSBwYXRjaGVzIGluIHRoZSBzZXJpZXMKT3V0cHV0OgpbQmx1ZVosdjNd
IHNoYXJlZC9nYXR0LWNsaWVudDogRml4IG5vdCBtYXJraW5nIHNlcnZpY2UgYXMgYWN0aXZlCgpz
cmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6IEluIGZ1bmN0aW9uIOKAmGRpc2NvdmVyX2Rlc2Nz4oCZ
OgpzcmMvc2hhcmVkL2dhdHQtY2xpZW50LmM6NzEzOjk6IGVycm9yOiDigJhkZXN0X3N0YXJ04oCZ
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKA
mGRlc2Nfc3RhcnTigJk/CiAgNzEzIHwgICAgIGlmIChkZXN0X3N0YXJ0ID09IGVuZCkKICAgICAg
fCAgICAgICAgIF5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgIGRlc2Nfc3RhcnQKc3JjL3NoYXJl
ZC9nYXR0LWNsaWVudC5jOjcxMzo5OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBp
cyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgptYWtl
WzFdOiAqKiogW01ha2VmaWxlOjgyMjA6IHNyYy9zaGFyZWQvbGlic2hhcmVkX21haW5sb29wX2xh
LWdhdHQtY2xpZW50LmxvXSBFcnJvciAxCm1ha2VbMV06ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlz
aGVkIGpvYnMuLi4uCm1ha2U6ICoqKiBbTWFrZWZpbGU6NDQ4MjogYWxsXSBFcnJvciAyCiMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBTY2FuQnVpbGQgLSBGQUlMCkRlc2M6IFJ1
biBTY2FuIEJ1aWxkCk91dHB1dDoKCnNyYy9zaGFyZWQvYWQuYzozNjk6MTk6IHdhcm5pbmc6IFVz
ZSBvZiB6ZXJvLWFsbG9jYXRlZCBtZW1vcnkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBidWZbKCpwb3MpKytdID0gYWRfdHlwZTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KMSB3YXJuaW5nIGdlbmVyYXRlZC4Kc3JjL3NoYXJlZC9nYXR0LWNs
aWVudC5jOiBJbiBmdW5jdGlvbiDigJhkaXNjb3Zlcl9kZXNjc+KAmToKc3JjL3NoYXJlZC9nYXR0
LWNsaWVudC5jOjcxMzo5OiBlcnJvcjog4oCYZGVzdF9zdGFydOKAmSB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhkZXNjX3N0YXJ04oCZPwog
IDcxMyB8ICAgICBpZiAoZGVzdF9zdGFydCA9PSBlbmQpCiAgICAgIHwgICAgICAgICBefn5+fn5+
fn5+CiAgICAgIHwgICAgICAgICBkZXNjX3N0YXJ0CnNyYy9zaGFyZWQvZ2F0dC1jbGllbnQuYzo3
MTM6OTogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBv
bmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KbWFrZVsxXTogKioqIFtNYWtlZmls
ZTo4MjIwOiBzcmMvc2hhcmVkL2xpYnNoYXJlZF9tYWlubG9vcF9sYS1nYXR0LWNsaWVudC5sb10g
RXJyb3IgMQptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgptYWtl
OiAqKiogW01ha2VmaWxlOjQ0ODI6IGFsbF0gRXJyb3IgMgoKCi0tLQpSZWdhcmRzLApMaW51eCBC
bHVldG9vdGgKCg==

--===============1325571009853941622==--
