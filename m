Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62E63C6EB3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Jul 2021 12:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbhGMKlL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 13 Jul 2021 06:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235304AbhGMKlL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 13 Jul 2021 06:41:11 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E618C0613DD
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Jul 2021 03:38:21 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id m68so5630082qke.7
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Jul 2021 03:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=jW4glC7Cmyoro4FkK2oyGIb6zgIEKfs0IWKg6YurApw=;
        b=UKoMIvnmt9PPiQuAIr7IbQ3z5Ag3iF7X3JvCywwgYNSOiQ2u0tzzBnjTFMi3EoUXMH
         YQzA0GOIb98CIJ/tYYsK4SIZHd6UDy8JO9OPWY/LMnh5Mx4tu27ZDgUM0v35A4fNosvy
         xBDUpWFF6upXs6Cr0w0C6C7KfALZI4BUSrjmGU+Jz0WZUf0qw00MUtmAMmrUTkDFFPCh
         HaCdbRElGlmofAyz0GGJGJluahzfeu9BIVzt3v2ce6ghF1YPn/8UXkopkNTsoBARBDv0
         JOFEEvhm20ZIG1tIA3noqj6UdqiobZlbBKKKt1euGHn47S//aEg69tXq22KpkLl91imH
         00Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=jW4glC7Cmyoro4FkK2oyGIb6zgIEKfs0IWKg6YurApw=;
        b=TM4SUBgoFZ/JvEyjxuzZXclaTAcaJMQL45F4C0RpHyUH9UCrbOloVcSBoKsA62Djjo
         o0oB9I/LA74MowwZytzu7PP9Lxaxc9DK7FjC0D2M+ncYDqR/uZ9ErjHGNrMb2/j2j3Sl
         8tI6SOVE9Kmis9dn9Vt5lUNUkaSpUCAtIKiivBVi8pb9J2L87xed6FTSb7O1g94dnSId
         veD1xqla8yuEnMwO4l1Roj0vMx20zcH2Wl0Ag0+9iE3N/U0PUGWGgZVEBHAxV5laeXRa
         SzuOs960l+76eoN+jCjPwzIN2+f60sNH96ki8HBjVJn+5nOe6urazZtNm79kRrDsF7Yc
         4ZFw==
X-Gm-Message-State: AOAM5308qnYXvVCM5k2l9utnevAcG5Ht5xv0jbau8G7mMQESP5ZXK0kn
        HGwAm9INY4uhKNe8lWZg4JCY/L3MdDK1mg==
X-Google-Smtp-Source: ABdhPJy8w7/j9xapi73J7ZwY6B4ZnldBMpH0QF4ed+wRGK6opNGdzwkl9H+3YWOEMHVcLL6ugAC86Q==
X-Received: by 2002:ae9:e203:: with SMTP id c3mr3431671qkc.400.1626172700423;
        Tue, 13 Jul 2021 03:38:20 -0700 (PDT)
Received: from [172.17.0.2] ([40.79.65.91])
        by smtp.gmail.com with ESMTPSA id f2sm6543846qth.11.2021.07.13.03.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 03:38:20 -0700 (PDT)
Message-ID: <60ed6d1c.1c69fb81.c7e00.8778@mx.google.com>
Date:   Tue, 13 Jul 2021 03:38:20 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6579007567194675994=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, howardchung@google.com
Subject: RE: [Bluez,v3] a2dp: Fix crash in channel_free while waiting cmd resp
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210713175519.Bluez.v3.1.Id7aa1152377161d17b442bf258773d9b6c624ca3@changeid>
References: <20210713175519.Bluez.v3.1.Id7aa1152377161d17b442bf258773d9b6c624ca3@changeid>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6579007567194675994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9NTE0NjUzCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBQQVNTICAgICAgMC4zOSBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIEZB
SUwgICAgICAwLjEzIHNlY29uZHMKUHJlcCAtIFNldHVwIEVMTCAgICAgICAgICAgICAgUEFTUyAg
ICAgIDQ4LjAxIHNlY29uZHMKQnVpbGQgLSBQcmVwICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDAuMTEgc2Vjb25kcwpCdWlsZCAtIENvbmZpZ3VyZSAgICAgICAgICAgICBQQVNTICAgICAgOC40
NSBzZWNvbmRzCkJ1aWxkIC0gTWFrZSAgICAgICAgICAgICAgICAgIEZBSUwgICAgICAxNTYuODIg
c2Vjb25kcwpNYWtlIENoZWNrICAgICAgICAgICAgICAgICAgICBGQUlMICAgICAgMS4zNCBzZWNv
bmRzCk1ha2UgRGlzdGNoZWNrICAgICAgICAgICAgICAgIFBBU1MgICAgICAyNDEuNDAgc2Vjb25k
cwpCdWlsZCB3L2V4dCBFTEwgLSBDb25maWd1cmUgICBQQVNTICAgICAgOC4yOSBzZWNvbmRzCkJ1
aWxkIHcvZXh0IEVMTCAtIE1ha2UgICAgICAgIEZBSUwgICAgICAxNDQuMzQgc2Vjb25kcwoKRGV0
YWlscwojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQ2hlY2tQYXRjaCAtIFBB
U1MKRGVzYzogUnVuIGNoZWNrcGF0Y2gucGwgc2NyaXB0IHdpdGggcnVsZSBpbiAuY2hlY2twYXRj
aC5jb25mCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogR2l0TGludCAtIEZB
SUwKRGVzYzogUnVuIGdpdGxpbnQgd2l0aCBydWxlIGluIC5naXRsaW50Ck91dHB1dDoKYTJkcDog
Rml4IGNyYXNoIGluIGNoYW5uZWxfZnJlZSB3aGlsZSB3YWl0aW5nIGNtZCByZXNwCjE0OiBCMyBM
aW5lIGNvbnRhaW5zIGhhcmQgdGFiIGNoYXJhY3RlcnMgKFx0KTogIjB4MDAwMDU5ZjAxOTQzZTY4
OAkoYmx1ZXRvb3RoZCAtYXZkdHAuYzozNjkwKSIKMTY6IEIzIExpbmUgY29udGFpbnMgaGFyZCB0
YWIgY2hhcmFjdGVycyAoXHQpOiAiMHgwMDAwNTlmMDE5NDM5MjhhCShibHVldG9vdGhkIC1hMmRw
LmM6MzA2OSkiCjE4OiBCMyBMaW5lIGNvbnRhaW5zIGhhcmQgdGFiIGNoYXJhY3RlcnMgKFx0KTog
IjB4MDAwMDU5ZjAxOTQzNzdmYQkoYmx1ZXRvb3RoZCAtc2luay5jOjMyNCkiCjIwOiBCMyBMaW5l
IGNvbnRhaW5zIGhhcmQgdGFiIGNoYXJhY3RlcnMgKFx0KTogIjB4MDAwMDU5ZjAxOTQ4NzE1YQko
Ymx1ZXRvb3RoZCAtc2VydmljZS5jOjE3NykiCjIyOiBCMyBMaW5lIGNvbnRhaW5zIGhhcmQgdGFi
IGNoYXJhY3RlcnMgKFx0KTogIjB4MDAwMDU5ZjAxOTQ4ZDc3YwkoYmx1ZXRvb3RoZCAtZGV2aWNl
LmM6NTM0NikiCjI0OiBCMyBMaW5lIGNvbnRhaW5zIGhhcmQgdGFiIGNoYXJhY3RlcnMgKFx0KTog
IjB4MDAwMDU5ZjAxOTQ3NmQxNAkoYmx1ZXRvb3RoZCAtYWRhcHRlci5jOjcyMDIpIgoyNjogQjMg
TGluZSBjb250YWlucyBoYXJkIHRhYiBjaGFyYWN0ZXJzIChcdCk6ICIweDAwMDA1OWYwMTk0NzZj
M2UJKGJsdWV0b290aGQgLWFkYXB0ZXIuYzoxMDgyNykiCjI4OiBCMyBMaW5lIGNvbnRhaW5zIGhh
cmQgdGFiIGNoYXJhY3RlcnMgKFx0KTogIjB4MDAwMDU5ZjAxOTQ5ZDhkNwkoYmx1ZXRvb3RoZCAt
bWFpbi5jOjExMTQpCQltYWluIgoyOTogQjMgTGluZSBjb250YWlucyBoYXJkIHRhYiBjaGFyYWN0
ZXJzIChcdCk6ICIweDAwMDA3ODdiMzYxODVkNzQJKGxpYmMuc28uNiAtbGliYy1zdGFydC5jOjMw
OCkiCjMxOiBCMyBMaW5lIGNvbnRhaW5zIGhhcmQgdGFiIGNoYXJhY3RlcnMgKFx0KTogIjB4MDAw
MDU5ZjAxOTQzM2UzOQkoYmx1ZXRvb3RoZCArIDB4MDAwMjZlMzkpCQlfc3RhcnQiCgoKIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IFByZXAgLSBTZXR1cCBFTEwgLSBQQVNTCkRl
c2M6IENsb25lLCBidWlsZCwgYW5kIGluc3RhbGwgRUxMCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKVGVzdDogQnVpbGQgLSBQcmVwIC0gUEFTUwpEZXNjOiBQcmVwYXJlIGVudmlyb25t
ZW50IGZvciBidWlsZAoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IEJ1aWxk
IC0gQ29uZmlndXJlIC0gUEFTUwpEZXNjOiBDb25maWd1cmUgdGhlIEJsdWVaIHNvdXJjZSB0cmVl
CgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQnVpbGQgLSBNYWtlIC0gRkFJ
TApEZXNjOiBCdWlsZCB0aGUgQmx1ZVogc291cmNlIHRyZWUKT3V0cHV0Ogpwcm9maWxlcy9hdWRp
by9hMmRwLmM6IEluIGZ1bmN0aW9uIOKAmGZpbmFsaXplX2FsbOKAmToKcHJvZmlsZXMvYXVkaW8v
YTJkcC5jOjQyMTozMTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDigJhjYi0+c2VsZWN0
X2Ni4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJvcj1pbmNvbXBhdGli
bGUtcG9pbnRlci10eXBlc10KICA0MjEgfCAgICBjYi0+c2VsZWN0X2NiKHMtPnNlc3Npb24sIHMt
PnNlcHMsIHMtPmNhcHMsCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+Xn5+
fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEdTTGlzdCAqIHtha2Egc3RydWN0IF9HU0xpc3QgKn0K
cHJvZmlsZXMvYXVkaW8vYTJkcC5jOjQyMTozMTogbm90ZTogZXhwZWN0ZWQg4oCYc3RydWN0IGEy
ZHBfc2VwICrigJkgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYR1NMaXN0ICrigJkge2FrYSDi
gJhzdHJ1Y3QgX0dTTGlzdCAq4oCZfQpwcm9maWxlcy9hdWRpby9hMmRwLmM6NDMwOjMxOiBlcnJv
cjogcGFzc2luZyBhcmd1bWVudCAyIG9mIOKAmGNiLT5jb25maWdfY2LigJkgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIFstV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQog
IDQzMCB8ICAgIGNiLT5jb25maWdfY2Iocy0+c2Vzc2lvbiwgcy0+c2Vwcywgc3RyZWFtLAogICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fgogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBHU0xpc3QgKiB7YWthIHN0cnVjdCBfR1NMaXN0ICp9CnByb2ZpbGVzL2F1ZGlvL2EyZHAu
Yzo0MzA6MzE6IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCBhMmRwX3NlcCAq4oCZIGJ1dCBhcmd1
bWVudCBpcyBvZiB0eXBlIOKAmEdTTGlzdCAq4oCZIHtha2Eg4oCYc3RydWN0IF9HU0xpc3QgKuKA
mX0KcHJvZmlsZXMvYXVkaW8vYTJkcC5jOiBJbiBmdW5jdGlvbiDigJhjaGFubmVsX2ZyZWXigJk6
CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzoxNTc3OjQyOiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAz
IG9mIOKAmGZpbmFsaXplX3NldHVwX2Vycm5v4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIg
dHlwZSBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KIDE1NzcgfCAgIGZpbmFs
aXplX3NldHVwX2Vycm5vKHNldHVwLCAtRU5PVENPTk4sIGZpbmFsaXplX2FsbCwgTlVMTCk7CiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+
fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKCopKHN0
cnVjdCBhMmRwX3NldHVwICopCnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzoyNjI6MTg6IG5vdGU6IGV4
cGVjdGVkIOKAmEdTb3VyY2VGdW5j4oCZIHtha2Eg4oCYaW50ICgqKSh2b2lkICop4oCZfSBidXQg
YXJndW1lbnQgaXMgb2YgdHlwZSDigJh2b2lkICgqKShzdHJ1Y3QgYTJkcF9zZXR1cCAqKeKAmQog
IDI2MiB8ICAgICAgR1NvdXJjZUZ1bmMgY2IxLCAuLi4pCiAgICAgIHwgICAgICB+fn5+fn5+fn5+
fn5efn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTog
KioqIFtNYWtlZmlsZTo4NTMxOiBwcm9maWxlcy9hdWRpby9ibHVldG9vdGhkLWEyZHAub10gRXJy
b3IgMQptYWtlOiAqKiogW01ha2VmaWxlOjQxMzQ6IGFsbF0gRXJyb3IgMgoKCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBNYWtlIENoZWNrIC0gRkFJTApEZXNjOiBSdW4gJ21h
a2UgY2hlY2snCk91dHB1dDoKcHJvZmlsZXMvYXVkaW8vYTJkcC5jOiBJbiBmdW5jdGlvbiDigJhm
aW5hbGl6ZV9hbGzigJk6CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzo0MjE6MzE6IGVycm9yOiBwYXNz
aW5nIGFyZ3VtZW50IDIgb2Yg4oCYY2ItPnNlbGVjdF9jYuKAmSBmcm9tIGluY29tcGF0aWJsZSBw
b2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgNDIxIHwg
ICAgY2ItPnNlbGVjdF9jYihzLT5zZXNzaW9uLCBzLT5zZXBzLCBzLT5jYXBzLAogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBH
U0xpc3QgKiB7YWthIHN0cnVjdCBfR1NMaXN0ICp9CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzo0MjE6
MzE6IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCBhMmRwX3NlcCAq4oCZIGJ1dCBhcmd1bWVudCBp
cyBvZiB0eXBlIOKAmEdTTGlzdCAq4oCZIHtha2Eg4oCYc3RydWN0IF9HU0xpc3QgKuKAmX0KcHJv
ZmlsZXMvYXVkaW8vYTJkcC5jOjQzMDozMTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDi
gJhjYi0+Y29uZmlnX2Ni4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJv
cj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICA0MzAgfCAgICBjYi0+Y29uZmlnX2NiKHMt
PnNlc3Npb24sIHMtPnNlcHMsIHN0cmVhbSwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH5efn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1NMaXN0ICoge2FrYSBzdHJ1Y3Qg
X0dTTGlzdCAqfQpwcm9maWxlcy9hdWRpby9hMmRwLmM6NDMwOjMxOiBub3RlOiBleHBlY3RlZCDi
gJhzdHJ1Y3QgYTJkcF9zZXAgKuKAmSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJhHU0xpc3Qg
KuKAmSB7YWthIOKAmHN0cnVjdCBfR1NMaXN0ICrigJl9CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzog
SW4gZnVuY3Rpb24g4oCYY2hhbm5lbF9mcmVl4oCZOgpwcm9maWxlcy9hdWRpby9hMmRwLmM6MTU3
Nzo0MjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiDigJhmaW5hbGl6ZV9zZXR1cF9lcnJu
b+KAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxl
LXBvaW50ZXItdHlwZXNdCiAxNTc3IHwgICBmaW5hbGl6ZV9zZXR1cF9lcnJubyhzZXR1cCwgLUVO
T1RDT05OLCBmaW5hbGl6ZV9hbGwsIE5VTEwpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICgqKShzdHJ1Y3QgYTJkcF9zZXR1cCAqKQpwcm9maWxl
cy9hdWRpby9hMmRwLmM6MjYyOjE4OiBub3RlOiBleHBlY3RlZCDigJhHU291cmNlRnVuY+KAmSB7
YWthIOKAmGludCAoKikodm9pZCAqKeKAmX0gYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYdm9p
ZCAoKikoc3RydWN0IGEyZHBfc2V0dXAgKinigJkKICAyNjIgfCAgICAgIEdTb3VyY2VGdW5jIGNi
MSwgLi4uKQogICAgICB8ICAgICAgfn5+fn5+fn5+fn5+Xn5+CmNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6ODUzMTogcHJvZmls
ZXMvYXVkaW8vYmx1ZXRvb3RoZC1hMmRwLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTox
MDQwNjogY2hlY2tdIEVycm9yIDIKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVz
dDogTWFrZSBEaXN0Y2hlY2sgLSBQQVNTCkRlc2M6IFJ1biBkaXN0Y2hlY2sgdG8gY2hlY2sgdGhl
IGRpc3RyaWJ1dGlvbgoKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IEJ1aWxk
IHcvZXh0IEVMTCAtIENvbmZpZ3VyZSAtIFBBU1MKRGVzYzogQ29uZmlndXJlIEJsdWVaIHNvdXJj
ZSB3aXRoICctLWVuYWJsZS1leHRlcm5hbC1lbGwnIGNvbmZpZ3VyYXRpb24KCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBCdWlsZCB3L2V4dCBFTEwgLSBNYWtlIC0gRkFJTApE
ZXNjOiBCdWlsZCBCbHVlWiBzb3VyY2Ugd2l0aCAnLS1lbmFibGUtZXh0ZXJuYWwtZWxsJyBjb25m
aWd1cmF0aW9uCk91dHB1dDoKcHJvZmlsZXMvYXVkaW8vYTJkcC5jOiBJbiBmdW5jdGlvbiDigJhm
aW5hbGl6ZV9hbGzigJk6CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzo0MjE6MzE6IGVycm9yOiBwYXNz
aW5nIGFyZ3VtZW50IDIgb2Yg4oCYY2ItPnNlbGVjdF9jYuKAmSBmcm9tIGluY29tcGF0aWJsZSBw
b2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAgNDIxIHwg
ICAgY2ItPnNlbGVjdF9jYihzLT5zZXNzaW9uLCBzLT5zZXBzLCBzLT5jYXBzLAogICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfl5+fn5+fgogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBH
U0xpc3QgKiB7YWthIHN0cnVjdCBfR1NMaXN0ICp9CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzo0MjE6
MzE6IG5vdGU6IGV4cGVjdGVkIOKAmHN0cnVjdCBhMmRwX3NlcCAq4oCZIGJ1dCBhcmd1bWVudCBp
cyBvZiB0eXBlIOKAmEdTTGlzdCAq4oCZIHtha2Eg4oCYc3RydWN0IF9HU0xpc3QgKuKAmX0KcHJv
ZmlsZXMvYXVkaW8vYTJkcC5jOjQzMDozMTogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMiBvZiDi
gJhjYi0+Y29uZmlnX2Ni4oCZIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZSBbLVdlcnJv
cj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10KICA0MzAgfCAgICBjYi0+Y29uZmlnX2NiKHMt
PnNlc3Npb24sIHMtPnNlcHMsIHN0cmVhbSwKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH5efn5+fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1NMaXN0ICoge2FrYSBzdHJ1Y3Qg
X0dTTGlzdCAqfQpwcm9maWxlcy9hdWRpby9hMmRwLmM6NDMwOjMxOiBub3RlOiBleHBlY3RlZCDi
gJhzdHJ1Y3QgYTJkcF9zZXAgKuKAmSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJhHU0xpc3Qg
KuKAmSB7YWthIOKAmHN0cnVjdCBfR1NMaXN0ICrigJl9CnByb2ZpbGVzL2F1ZGlvL2EyZHAuYzog
SW4gZnVuY3Rpb24g4oCYY2hhbm5lbF9mcmVl4oCZOgpwcm9maWxlcy9hdWRpby9hMmRwLmM6MTU3
Nzo0MjogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiDigJhmaW5hbGl6ZV9zZXR1cF9lcnJu
b+KAmSBmcm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxl
LXBvaW50ZXItdHlwZXNdCiAxNTc3IHwgICBmaW5hbGl6ZV9zZXR1cF9lcnJubyhzZXR1cCwgLUVO
T1RDT05OLCBmaW5hbGl6ZV9hbGwsIE5VTEwpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICgqKShzdHJ1Y3QgYTJkcF9zZXR1cCAqKQpwcm9maWxl
cy9hdWRpby9hMmRwLmM6MjYyOjE4OiBub3RlOiBleHBlY3RlZCDigJhHU291cmNlRnVuY+KAmSB7
YWthIOKAmGludCAoKikodm9pZCAqKeKAmX0gYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUg4oCYdm9p
ZCAoKikoc3RydWN0IGEyZHBfc2V0dXAgKinigJkKICAyNjIgfCAgICAgIEdTb3VyY2VGdW5jIGNi
MSwgLi4uKQogICAgICB8ICAgICAgfn5+fn5+fn5+fn5+Xn5+CmNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCm1ha2VbMV06ICoqKiBbTWFrZWZpbGU6ODUzMTogcHJvZmls
ZXMvYXVkaW8vYmx1ZXRvb3RoZC1hMmRwLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTo0
MTM0OiBhbGxdIEVycm9yIDIKCgoKCi0tLQpSZWdhcmRzLApMaW51eCBCbHVldG9vdGgKCg==

--===============6579007567194675994==--
