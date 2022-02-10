Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0F04B194D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Feb 2022 00:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345608AbiBJXSR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Feb 2022 18:18:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345151AbiBJXSO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Feb 2022 18:18:14 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91729266C
        for <linux-bluetooth@vger.kernel.org>; Thu, 10 Feb 2022 15:18:14 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id j24so6564432qkk.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 10 Feb 2022 15:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=XwQIM4fxhGgwLg7OTjfa7gyMmWrqhAMISBaZqcH9Z0s=;
        b=ewip7k/pIU+BXwnI14wtzPSqxKO+wUghsiKdGLM6aeZyJBRGbuf31QZivrTsj8HjOp
         OiNwQ3dT268F++T9bMxW+fcMYa4ek3PtPegKmGVb6r8p6g/HzoHA8tfih2T259rRtzBe
         AWlOcKT3W5mA7qLNrrlyell1Qpzp3bJNDPC66WPKaTHdB5Z9ux+/5JB6jSQxz+/5/udr
         ycwAvVupl7zRuvT831hCUZ0eMLTZWAvQrWKWMjwSdMH69jic0WmGPP4iUy7+cTPDQYz3
         QMXXIinmHVqJ9qrEAg5IjwEDehNyCD5PHGJNy6dVC5nXBDzstpW5jTL3t5Wr/Qwf9qai
         PIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=XwQIM4fxhGgwLg7OTjfa7gyMmWrqhAMISBaZqcH9Z0s=;
        b=c2XE0lrKlN8xMUFe0SGGFxmhsLePawoZwEqRbkET8tJ1p5wVQycTOkmrSTtfDnb4bm
         UkKT+eWjc9bwVZO+VipaBO39l5n2qbkpBTfYooNVvlj6bM+5ViLeHNokzKSC4T73v41I
         /f4O3X6yCsZh1sEDBQ1TykodjHPUgAp00/EOAeQcNePLDtdr4c8M6vXpdLlrLQfe/01x
         Mxb8DEDT+QFBSSiz3g7GhJ/pDejllqhF/HyyFjbILR5+d8VBfbm91pIyFXHLB4uFex3z
         5ZO1Txvv20pWZXpEHYqjhEhKHns+zwUF3E2iD16kq+GsMjOaI9kIoSe1WxDfvi8ENaJb
         54IA==
X-Gm-Message-State: AOAM531ijSVCUSRyUNC+wFqWrAvy3wXA6lkKSIeGiivRpo24e/Fxs7P1
        sVEZ7nV1JcjCL+c9g6L9BIo+/OwtcRhxew==
X-Google-Smtp-Source: ABdhPJzy0hcg0hh7xr5emNImfv/ZXr4ala6f9MAKWZmxf57VM+Zif9MdzGkXLmtWD4oNOWl9R57NwA==
X-Received: by 2002:a37:bf83:: with SMTP id p125mr5107700qkf.382.1644535093485;
        Thu, 10 Feb 2022 15:18:13 -0800 (PST)
Received: from [172.17.0.2] ([13.90.62.24])
        by smtp.gmail.com with ESMTPSA id j19sm8205586qkp.120.2022.02.10.15.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 15:18:13 -0800 (PST)
Message-ID: <62059d35.1c69fb81.7ce93.e2e5@mx.google.com>
Date:   Thu, 10 Feb 2022 15:18:13 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7471358690387025958=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ] device: Fix crash when removing device
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220210221451.418234-1-luiz.dentz@gmail.com>
References: <20220210221451.418234-1-luiz.dentz@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============7471358690387025958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

VGhpcyBpcyBhdXRvbWF0ZWQgZW1haWwgYW5kIHBsZWFzZSBkbyBub3QgcmVwbHkgdG8gdGhpcyBl
bWFpbCEKCkRlYXIgc3VibWl0dGVyLAoKVGhhbmsgeW91IGZvciBzdWJtaXR0aW5nIHRoZSBwYXRj
aGVzIHRvIHRoZSBsaW51eCBibHVldG9vdGggbWFpbGluZyBsaXN0LgpUaGlzIGlzIGEgQ0kgdGVz
dCByZXN1bHRzIHdpdGggeW91ciBwYXRjaCBzZXJpZXM6ClBXIExpbms6aHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2JsdWV0b290aC9saXN0Lz9zZXJpZXM9NjEzMjQyCgotLS1U
ZXN0IHJlc3VsdC0tLQoKVGVzdCBTdW1tYXJ5OgpDaGVja1BhdGNoICAgICAgICAgICAgICAgICAg
ICBGQUlMICAgICAgMS40MiBzZWNvbmRzCkdpdExpbnQgICAgICAgICAgICAgICAgICAgICAgIFBB
U1MgICAgICAxLjA0IHNlY29uZHMKUHJlcCAtIFNldHVwIEVMTCAgICAgICAgICAgICAgUEFTUyAg
ICAgIDQ5Ljg0IHNlY29uZHMKQnVpbGQgLSBQcmVwICAgICAgICAgICAgICAgICAgUEFTUyAgICAg
IDAuNzYgc2Vjb25kcwpCdWlsZCAtIENvbmZpZ3VyZSAgICAgICAgICAgICBQQVNTICAgICAgMTAu
MDMgc2Vjb25kcwpCdWlsZCAtIE1ha2UgICAgICAgICAgICAgICAgICBGQUlMICAgICAgMTM4OS41
NSBzZWNvbmRzCk1ha2UgQ2hlY2sgICAgICAgICAgICAgICAgICAgIEZBSUwgICAgICAxLjIxIHNl
Y29uZHMKTWFrZSBDaGVjayB3L1ZhbGdyaW5kICAgICAgICAgRkFJTCAgICAgIDM0NS44MSBzZWNv
bmRzCk1ha2UgRGlzdGNoZWNrICAgICAgICAgICAgICAgIEZBSUwgICAgICAxODEuNTkgc2Vjb25k
cwpCdWlsZCB3L2V4dCBFTEwgLSBDb25maWd1cmUgICBQQVNTICAgICAgMTAuMjUgc2Vjb25kcwpC
dWlsZCB3L2V4dCBFTEwgLSBNYWtlICAgICAgICBGQUlMICAgICAgMTM2OC4wMyBzZWNvbmRzCklu
Y3JlbWVudGFsIEJ1aWxkIHdpdGggcGF0Y2hlc1BBU1MgICAgICAwLjAwIHNlY29uZHMKCkRldGFp
bHMKIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjClRlc3Q6IENoZWNrUGF0Y2ggLSBGQUlM
CkRlc2M6IFJ1biBjaGVja3BhdGNoLnBsIHNjcmlwdCB3aXRoIHJ1bGUgaW4gLmNoZWNrcGF0Y2gu
Y29uZgpPdXRwdXQ6CltCbHVlWl0gZGV2aWNlOiBGaXggY3Jhc2ggd2hlbiByZW1vdmluZyBkZXZp
Y2UKV0FSTklORzpUWVBPX1NQRUxMSU5HOiAnaW1tZWRpYXRlbGx5JyBtYXkgYmUgbWlzc3BlbGxl
ZCAtIHBlcmhhcHMgJ2ltbWVkaWF0ZWx5Jz8KIzgxOiAKY2F1c2UgYSBjcmFzaCwgc28gaW5zdGVh
ZCBvZiByZW1vdmluZyBpdCBpbW1lZGlhdGVsbHkgdGhpcyBzZXQgYSB0aGUKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl4KCi9naXRodWIvd29ya3Nw
YWNlL3NyYy8xMjc0MjQ2MC5wYXRjaCB0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDggbGlu
ZXMgY2hlY2tlZAoKTk9URTogRm9yIHNvbWUgb2YgdGhlIHJlcG9ydGVkIGRlZmVjdHMsIGNoZWNr
cGF0Y2ggbWF5IGJlIGFibGUgdG8KICAgICAgbWVjaGFuaWNhbGx5IGNvbnZlcnQgdG8gdGhlIHR5
cGljYWwgc3R5bGUgdXNpbmcgLS1maXggb3IgLS1maXgtaW5wbGFjZS4KCi9naXRodWIvd29ya3Nw
YWNlL3NyYy8xMjc0MjQ2MC5wYXRjaCBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZpZXcu
CgpOT1RFOiBJZ25vcmVkIG1lc3NhZ2UgdHlwZXM6IENPTU1JVF9NRVNTQUdFIENPTVBMRVhfTUFD
Uk8gQ09OU1RfU1RSVUNUIEZJTEVfUEFUSF9DSEFOR0VTIE1JU1NJTkdfU0lHTl9PRkYgUFJFRkVS
X1BBQ0tFRCBTUERYX0xJQ0VOU0VfVEFHIFNQTElUX1NUUklORyBTU0NBTkZfVE9fS1NUUlRPCgpO
T1RFOiBJZiBhbnkgb2YgdGhlIGVycm9ycyBhcmUgZmFsc2UgcG9zaXRpdmVzLCBwbGVhc2UgcmVw
b3J0CiAgICAgIHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZSBDSEVDS1BBVENIIGluIE1BSU5U
QUlORVJTLgoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBCdWlsZCAtIE1h
a2UgLSBGQUlMCkRlc2M6IEJ1aWxkIHRoZSBCbHVlWiBzb3VyY2UgdHJlZQpPdXRwdXQ6CnRvb2xz
L21nbXQtdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnRvb2xzL21nbXQtdGVzdGVy
LmM6MTIzNjQ6NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcgc2l6ZSBsaW1pdCBleGNlZWRlZCB3
aXRoIOKAmC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZLCByZXRyeWluZyB3aXRob3V0CjEy
MzY0IHwgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICAgfCAgICAgXn5+fgp1
bml0L3Rlc3QtYXZkdHAuYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKdW5pdC90ZXN0LWF2ZHRw
LmM6NzY2OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNpemUgbGltaXQgZXhjZWVkZWQgd2l0
aCDigJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwgcmV0cnlpbmcgd2l0aG91dAogIDc2
NiB8IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAgICAgIHwgICAgIF5+fn4KdW5p
dC90ZXN0LWF2cmNwLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7igJk6CnVuaXQvdGVzdC1hdnJjcC5j
Ojk4OTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXplIGxpbWl0IGV4Y2VlZGVkIHdpdGgg
4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJldHJ5aW5nIHdpdGhvdXQKICA5ODkg
fCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogICAgICB8ICAgICBefn5+CnNyYy9k
ZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYZGV2aWNlX3JlbW92ZV9jb25uZWN0aW9u4oCZOgpzcmMv
ZGV2aWNlLmM6MzI4ODozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g
4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmTsgZGlkIHlvdSBtZWFuIOKAmGNsZWFyX3RlbXBvcmFy
eV90aW1lcuKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAzMjg4
IHwgICBzZXRfdGVtcG9yYXJ5X3RpbWVyKGRldmljZSwgMCk7CiAgICAgIHwgICBefn5+fn5+fn5+
fn5+fn5+fn5+CiAgICAgIHwgICBjbGVhcl90ZW1wb3JhcnlfdGltZXIKc3JjL2RldmljZS5jOiBB
dCB0b3AgbGV2ZWw6CnNyYy9kZXZpY2UuYzo0NjA0OjEzOiBlcnJvcjogY29uZmxpY3RpbmcgdHlw
ZXMgZm9yIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkgWy1XZXJyb3JdCiA0NjA0IHwgc3RhdGlj
IHZvaWQgc2V0X3RlbXBvcmFyeV90aW1lcihzdHJ1Y3QgYnRkX2RldmljZSAqZGV2LCB1bnNpZ25l
ZCBpbnQgdGltZW91dCkKICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnNy
Yy9kZXZpY2UuYzo0NjA0OjEzOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmHNldF90
ZW1wb3JhcnlfdGltZXLigJkgZm9sbG93cyBub24tc3RhdGljIGRlY2xhcmF0aW9uCnNyYy9kZXZp
Y2UuYzozMjg4OjM6IG5vdGU6IHByZXZpb3VzIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIOKAmHNl
dF90ZW1wb3JhcnlfdGltZXLigJkgd2FzIGhlcmUKIDMyODggfCAgIHNldF90ZW1wb3JhcnlfdGlt
ZXIoZGV2aWNlLCAwKTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMDI0
Mzogc3JjL2JsdWV0b290aGQtZGV2aWNlLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZTo0
MzA4OiBhbGxdIEVycm9yIDIKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDog
TWFrZSBDaGVjayAtIEZBSUwKRGVzYzogUnVuICdtYWtlIGNoZWNrJwpPdXRwdXQ6CnNyYy9kZXZp
Y2UuYzogSW4gZnVuY3Rpb24g4oCYZGV2aWNlX3JlbW92ZV9jb25uZWN0aW9u4oCZOgpzcmMvZGV2
aWNlLmM6MzI4ODozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCY
c2V0X3RlbXBvcmFyeV90aW1lcuKAmTsgZGlkIHlvdSBtZWFuIOKAmGNsZWFyX3RlbXBvcmFyeV90
aW1lcuKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAzMjg4IHwg
ICBzZXRfdGVtcG9yYXJ5X3RpbWVyKGRldmljZSwgMCk7CiAgICAgIHwgICBefn5+fn5+fn5+fn5+
fn5+fn5+CiAgICAgIHwgICBjbGVhcl90ZW1wb3JhcnlfdGltZXIKc3JjL2RldmljZS5jOiBBdCB0
b3AgbGV2ZWw6CnNyYy9kZXZpY2UuYzo0NjA0OjEzOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMg
Zm9yIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkgWy1XZXJyb3JdCiA0NjA0IHwgc3RhdGljIHZv
aWQgc2V0X3RlbXBvcmFyeV90aW1lcihzdHJ1Y3QgYnRkX2RldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgdGltZW91dCkKICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9k
ZXZpY2UuYzo0NjA0OjEzOiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mIOKAmHNldF90ZW1w
b3JhcnlfdGltZXLigJkgZm9sbG93cyBub24tc3RhdGljIGRlY2xhcmF0aW9uCnNyYy9kZXZpY2Uu
YzozMjg4OjM6IG5vdGU6IHByZXZpb3VzIGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIOKAmHNldF90
ZW1wb3JhcnlfdGltZXLigJkgd2FzIGhlcmUKIDMyODggfCAgIHNldF90ZW1wb3JhcnlfdGltZXIo
ZGV2aWNlLCAwKTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KY2MxOiBhbGwgd2Fybmlu
Z3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMDI0Mzog
c3JjL2JsdWV0b290aGQtZGV2aWNlLm9dIEVycm9yIDEKbWFrZTogKioqIFtNYWtlZmlsZToxMTI3
ODogY2hlY2tdIEVycm9yIDIKCgojIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKVGVzdDog
TWFrZSBDaGVjayB3L1ZhbGdyaW5kIC0gRkFJTApEZXNjOiBSdW4gJ21ha2UgY2hlY2snIHdpdGgg
VmFsZ3JpbmQKT3V0cHV0Ogp0b29scy9tZ210LXRlc3Rlci5jOiBJbiBmdW5jdGlvbiDigJhtYWlu
4oCZOgp0b29scy9tZ210LXRlc3Rlci5jOjEyMzY0OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5n
IHNpemUgbGltaXQgZXhjZWVkZWQgd2l0aCDigJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KA
mSwgcmV0cnlpbmcgd2l0aG91dAoxMjM2NCB8IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2
W10pCiAgICAgIHwgICAgIF5+fn4Kc3JjL2RldmljZS5jOiBJbiBmdW5jdGlvbiDigJhkZXZpY2Vf
cmVtb3ZlX2Nvbm5lY3Rpb27igJk6CnNyYy9kZXZpY2UuYzozMjg4OjM6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhzZXRfdGVtcG9yYXJ5X3RpbWVy4oCZOyBkaWQg
eW91IG1lYW4g4oCYY2xlYXJfdGVtcG9yYXJ5X3RpbWVy4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KIDMyODggfCAgIHNldF90ZW1wb3JhcnlfdGltZXIoZGV2aWNl
LCAwKTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAgIGNsZWFyX3RlbXBv
cmFyeV90aW1lcgpzcmMvZGV2aWNlLmM6IEF0IHRvcCBsZXZlbDoKc3JjL2RldmljZS5jOjQ2MDQ6
MTM6IGVycm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKA
mSBbLVdlcnJvcl0KIDQ2MDQgfCBzdGF0aWMgdm9pZCBzZXRfdGVtcG9yYXJ5X3RpbWVyKHN0cnVj
dCBidGRfZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB0aW1lb3V0KQogICAgICB8ICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4Kc3JjL2RldmljZS5jOjQ2MDQ6MTM6IGVycm9yOiBzdGF0
aWMgZGVjbGFyYXRpb24gb2Yg4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmSBmb2xsb3dzIG5vbi1z
dGF0aWMgZGVjbGFyYXRpb24Kc3JjL2RldmljZS5jOjMyODg6Mzogbm90ZTogcHJldmlvdXMgaW1w
bGljaXQgZGVjbGFyYXRpb24gb2Yg4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmSB3YXMgaGVyZQog
MzI4OCB8ICAgc2V0X3RlbXBvcmFyeV90aW1lcihkZXZpY2UsIDApOwogICAgICB8ICAgXn5+fn5+
fn5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwpt
YWtlWzFdOiAqKiogW01ha2VmaWxlOjEwMjQzOiBzcmMvYmx1ZXRvb3RoZC1kZXZpY2Uub10gRXJy
b3IgMQptYWtlOiAqKiogW01ha2VmaWxlOjQzMDg6IGFsbF0gRXJyb3IgMgoKCiMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwpUZXN0OiBNYWtlIERpc3RjaGVjayAtIEZBSUwKRGVzYzogUnVu
IGRpc3RjaGVjayB0byBjaGVjayB0aGUgZGlzdHJpYnV0aW9uCk91dHB1dDoKLi4vLi4vc3JjL2Rl
dmljZS5jOiBJbiBmdW5jdGlvbiDigJhkZXZpY2VfcmVtb3ZlX2Nvbm5lY3Rpb27igJk6Ci4uLy4u
L3NyYy9kZXZpY2UuYzozMjg4OjM6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJk7IGRpZCB5b3UgbWVhbiDigJhjbGVhcl90
ZW1wb3JhcnlfdGltZXLigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogMzI4
OCB8ICAgc2V0X3RlbXBvcmFyeV90aW1lcihkZXZpY2UsIDApOwogICAgICB8ICAgXn5+fn5+fn5+
fn5+fn5+fn5+fgogICAgICB8ICAgY2xlYXJfdGVtcG9yYXJ5X3RpbWVyCi4uLy4uL3NyYy9kZXZp
Y2UuYzogQXQgdG9wIGxldmVsOgouLi8uLi9zcmMvZGV2aWNlLmM6NDYwNDoxMzogd2FybmluZzog
Y29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkKIDQ2MDQgfCBz
dGF0aWMgdm9pZCBzZXRfdGVtcG9yYXJ5X3RpbWVyKHN0cnVjdCBidGRfZGV2aWNlICpkZXYsIHVu
c2lnbmVkIGludCB0aW1lb3V0KQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+
fn4KLi4vLi4vc3JjL2RldmljZS5jOjQ2MDQ6MTM6IGVycm9yOiBzdGF0aWMgZGVjbGFyYXRpb24g
b2Yg4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmSBmb2xsb3dzIG5vbi1zdGF0aWMgZGVjbGFyYXRp
b24KLi4vLi4vc3JjL2RldmljZS5jOjMyODg6Mzogbm90ZTogcHJldmlvdXMgaW1wbGljaXQgZGVj
bGFyYXRpb24gb2Yg4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmSB3YXMgaGVyZQogMzI4OCB8ICAg
c2V0X3RlbXBvcmFyeV90aW1lcihkZXZpY2UsIDApOwogICAgICB8ICAgXn5+fn5+fn5+fn5+fn5+
fn5+fgptYWtlWzJdOiAqKiogW01ha2VmaWxlOjEwMjQzOiBzcmMvYmx1ZXRvb3RoZC1kZXZpY2Uu
b10gRXJyb3IgMQptYWtlWzFdOiAqKiogW01ha2VmaWxlOjQzMDg6IGFsbF0gRXJyb3IgMgptYWtl
OiAqKiogW01ha2VmaWxlOjExMTk5OiBkaXN0Y2hlY2tdIEVycm9yIDEKCgojIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKVGVzdDogQnVpbGQgdy9leHQgRUxMIC0gTWFrZSAtIEZBSUwKRGVz
YzogQnVpbGQgQmx1ZVogc291cmNlIHdpdGggJy0tZW5hYmxlLWV4dGVybmFsLWVsbCcgY29uZmln
dXJhdGlvbgpPdXRwdXQ6CnRvb2xzL21nbXQtdGVzdGVyLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7i
gJk6CnRvb2xzL21nbXQtdGVzdGVyLmM6MTIzNjQ6NTogbm90ZTogdmFyaWFibGUgdHJhY2tpbmcg
c2l6ZSBsaW1pdCBleGNlZWRlZCB3aXRoIOKAmC1mdmFyLXRyYWNraW5nLWFzc2lnbm1lbnRz4oCZ
LCByZXRyeWluZyB3aXRob3V0CjEyMzY0IHwgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3Zb
XSkKICAgICAgfCAgICAgXn5+fgp1bml0L3Rlc3QtYXZkdHAuYzogSW4gZnVuY3Rpb24g4oCYbWFp
buKAmToKdW5pdC90ZXN0LWF2ZHRwLmM6NzY2OjU6IG5vdGU6IHZhcmlhYmxlIHRyYWNraW5nIHNp
emUgbGltaXQgZXhjZWVkZWQgd2l0aCDigJgtZnZhci10cmFja2luZy1hc3NpZ25tZW50c+KAmSwg
cmV0cnlpbmcgd2l0aG91dAogIDc2NiB8IGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
CiAgICAgIHwgICAgIF5+fn4KdW5pdC90ZXN0LWF2cmNwLmM6IEluIGZ1bmN0aW9uIOKAmG1haW7i
gJk6CnVuaXQvdGVzdC1hdnJjcC5jOjk4OTo1OiBub3RlOiB2YXJpYWJsZSB0cmFja2luZyBzaXpl
IGxpbWl0IGV4Y2VlZGVkIHdpdGgg4oCYLWZ2YXItdHJhY2tpbmctYXNzaWdubWVudHPigJksIHJl
dHJ5aW5nIHdpdGhvdXQKICA5ODkgfCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQog
ICAgICB8ICAgICBefn5+CnNyYy9kZXZpY2UuYzogSW4gZnVuY3Rpb24g4oCYZGV2aWNlX3JlbW92
ZV9jb25uZWN0aW9u4oCZOgpzcmMvZGV2aWNlLmM6MzI4ODozOiBlcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYc2V0X3RlbXBvcmFyeV90aW1lcuKAmTsgZGlkIHlvdSBt
ZWFuIOKAmGNsZWFyX3RlbXBvcmFyeV90aW1lcuKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCiAzMjg4IHwgICBzZXRfdGVtcG9yYXJ5X3RpbWVyKGRldmljZSwgMCk7
CiAgICAgIHwgICBefn5+fn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgICBjbGVhcl90ZW1wb3Jhcnlf
dGltZXIKc3JjL2RldmljZS5jOiBBdCB0b3AgbGV2ZWw6CnNyYy9kZXZpY2UuYzo0NjA0OjEzOiBl
cnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkgWy1X
ZXJyb3JdCiA0NjA0IHwgc3RhdGljIHZvaWQgc2V0X3RlbXBvcmFyeV90aW1lcihzdHJ1Y3QgYnRk
X2RldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdGltZW91dCkKICAgICAgfCAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+CnNyYy9kZXZpY2UuYzo0NjA0OjEzOiBlcnJvcjogc3RhdGljIGRl
Y2xhcmF0aW9uIG9mIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkgZm9sbG93cyBub24tc3RhdGlj
IGRlY2xhcmF0aW9uCnNyYy9kZXZpY2UuYzozMjg4OjM6IG5vdGU6IHByZXZpb3VzIGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIOKAmHNldF90ZW1wb3JhcnlfdGltZXLigJkgd2FzIGhlcmUKIDMyODgg
fCAgIHNldF90ZW1wb3JhcnlfdGltZXIoZGV2aWNlLCAwKTsKICAgICAgfCAgIF5+fn5+fn5+fn5+
fn5+fn5+fn4KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFrZVsx
XTogKioqIFtNYWtlZmlsZToxMDI0Mzogc3JjL2JsdWV0b290aGQtZGV2aWNlLm9dIEVycm9yIDEK
bWFrZTogKioqIFtNYWtlZmlsZTo0MzA4OiBhbGxdIEVycm9yIDIKCgoKCi0tLQpSZWdhcmRzLApM
aW51eCBCbHVldG9vdGgKCg==

--===============7471358690387025958==--
