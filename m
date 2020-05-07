Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9731C9F60
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 May 2020 01:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgEGX5S (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 7 May 2020 19:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727051AbgEGX5Q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 7 May 2020 19:57:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433F8C05BD43
        for <linux-bluetooth@vger.kernel.org>; Thu,  7 May 2020 16:57:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h26so5998557lfg.6
        for <linux-bluetooth@vger.kernel.org>; Thu, 07 May 2020 16:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=7cBd5Z9DIbKj9idmjfaAUA/v0qaSaQI72BuhcObHQU8=;
        b=ZljUNppSETB9mKN+ZZzZ42iCxyRhItZE+o94e5MjtB2CNereMq0STtkbN3dX5M12nW
         2m6Mkp8FIwRNuZx07pregurgN0rKYLX53YO3HwZ032GO4j73is0bhIZnL3GQ7IZrq34n
         mp8+X+bBUQ+oV0njyxR7oic34anW+aDkT4AyVPo74Oev1vErur6iUx/CTA5hbNWYHo7h
         nyOhCEl65aAP0IsYKTCpyDnFVgl2Z+9Ro3Y5KF7Az4bNUl9GV1IdDu048o/n8+WeF/Yf
         dM46NnoOjqQXn4B0Li3oaI4e8KtszcxkrJBsO1Gv9pssNpKjau8UII9eCv50w1mNGmBQ
         pT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=7cBd5Z9DIbKj9idmjfaAUA/v0qaSaQI72BuhcObHQU8=;
        b=ZlmEtmxAZeQyH1sklwfsO217mnqhFVWWJUJdHy4t/1Gb+bWAQlhFtkOai1KGLUMgmE
         zJiXEMZGAL43kGdsg/smsjID3HHlDoqXcdmTP91n9cNAerRJmkQM7BH0rfIbwQD0vCbT
         /D+iiGuEFObXhVWhFEWb5frr5txxh/YTkNdBWezUSlg3OAQ4zIZWsB3OQ1nnFULSVz8M
         XcgvXhTTtQSgKGfWcDRCiKOKWP6psyJ5BMhUez9gV8lR0t1zlMHa6r8yaPflFqx1bOQ4
         +sHAqGHMcuU2QCuaYW+IzZ/x4UAh2VyBp+xew81sdTRwH3TZI5KFvfRWO0AEIDaUT/vu
         zdGA==
X-Gm-Message-State: AOAM530BrEg9IXe0JkAj4ky6gWuweLcrKe2P3Cur9IvY2tmHv79t79iW
        A8wY9EN4sZYjIwouDaSeA59mjBXFjEI=
X-Google-Smtp-Source: ABdhPJytohT5iQqYcNsNjWJXVHMol5rnSZSOYI1UhVwvQE+QXb18JD/VdwZmnvSAhqUS5U/VOrCBIQ==
X-Received: by 2002:ac2:46c1:: with SMTP id p1mr6599lfo.25.1588895834042;
        Thu, 07 May 2020 16:57:14 -0700 (PDT)
Received: from [192.168.1.2] (broadband-188-255-20-215.ip.moscow.rt.ru. [188.255.20.215])
        by smtp.gmail.com with ESMTPSA id q20sm4045635lfm.35.2020.05.07.16.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 16:57:12 -0700 (PDT)
Subject: Re: avrcp: Cannot connect Sennheiser Momentum True Wireless 2
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
References: <7c4e6f59-d2ef-36c0-46df-0195fad40e7e@gmail.com>
 <76911d0f-dd24-5536-586a-a8e9bc7ad786@gmail.com>
 <CABBYNZKr3r-6cXGAS3w6SR2-fw2h9gHqvnH=H7O6MSxnandUcg@mail.gmail.com>
From:   Andrey Semashev <andrey.semashev@gmail.com>
Message-ID: <74cd38cf-2390-b7be-bd51-9b549d2ad4f4@gmail.com>
Date:   Fri, 8 May 2020 02:57:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABBYNZKr3r-6cXGAS3w6SR2-fw2h9gHqvnH=H7O6MSxnandUcg@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------C332DC2BCD71CE49BEB905CC"
Content-Language: en-US
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is a multi-part message in MIME format.
--------------C332DC2BCD71CE49BEB905CC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2020-05-07 23:29, Luiz Augusto von Dentz wrote:
> Hi Andrey,
> 
> On Wed, May 6, 2020 at 10:32 AM Andrey Semashev
> <andrey.semashev@gmail.com> wrote:
>>
>> On 2020-05-06 19:56, Andrey Semashev wrote:
>>> Hello!
>>>
>>> I have a problem connecting Sennheiser Momentum True Wireless 2
>>> headphones over Bluetooth. The headphones say "Connected" and then
>>> reboot immediately after. After reboot the headphones say "Power on" and
>>> try connecting again, and fail the same way, and so on.
>>>
>>>   From the Bluetooth packet dump it looks like the problem happens after
>>> bluetoothd sends AVRCP ListPlayerApplicationSettingAttributes message to
>>> the headphones. The headphones send Not Implemented response and then
>>> reboot. Both in the request and the response Wireshark shows warnings
>>> about encoding issues.
>>>
>>> I'm attaching a packet dump captured from one of the connection
>>> attempts. The ListPlayerApplicationSettingAttributes message is in
>>> packet 262 and the response is in packet 264.
>>>
>>> This is on Kubuntu 20.04. I tried bluez 5.53 from Kubuntu and revision
>>> 3146b7a0785758be2d4e894d44e99d29c0db983e from git master - the behavior
>>> is the same.
>>>
>>> I've also verified that the headphones do work on Windows 10. On that
>>> system, ListPlayerApplicationSettingAttributes is not present in the
>>> packet exchange. I can provide the packet dump from Windows, if needed.
>>>
>>> I hope this is the right place to report problems like this one. If not
>>> - sorry, and please point me to the right place.
>>>
>>> Thank you.
>>
>> I'll add that I can connect the headphones if I disable AVRCP by adding
>> --noplugin=avrcp to bluetoothd command line.
> 
> Weird the ListPlayerApplicationSettingAttributes should only really be
> used when the remote device claims to be have target role but I doubt
> the headsets would be implementing that so perhaps we are not
> detecting this properly, do you have the HCI traces in btsnoop format?
> You can collect that with use of btmon.

Here is the btsnoop dump attached. It was taken with your patch 
regarding AVC_CTYPE_NOT_IMPLEMENTED applied.

--------------C332DC2BCD71CE49BEB905CC
Content-Type: application/octet-stream;
 name="mtw2.btsnoop"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="mtw2.btsnoop"

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
EQ4MSAAAGVgQAAADAwENAAAAGgAAABoAAAAEAAAAAADigsql3Y9qCwAWABIARQQQEQ4DSAAA
GVgxAAAFDQAAAAAAAAAaAAAAGgAAAAUAAAAAAOKCyqXdlCcLIBYAEgBDABARDgNIAAAZWDEA
AAUBAAAAAAAAABcAAAAXAAAABAAAAAAA4oLKpd2UWgsAEwAPAEUEEhEOD0gAABlYMQAAAgEA
AAAABwAAAAcAAAADAAAAAADigsql3aBkEwUBCwACAAAAABcAAAAXAAAABQAAAAAA4oLKpd21
3gsgEwAPAEMAEhEOD0gAABlYMQAAAg1XAAAAFQAAABUAAAAEAAAAAADigsql3bYzCwARAA0A
RQQgEQ4BSAAAGVgRAAAAAAAAFgAAABYAAAAFAAAAAADigsql3iFSCyASAA4AQwAiEQ4ISAAA
GVgRAAABBAAAABUAAAAVAAAABAAAAAAA4oLKpd4hywsAEQANAEUEMBEOAUgAABlYMAAAAAAA
AAcAAAAHAAAAAwAAAAAA4oLKpd5QJxMFAQsAAgAAAAALAAAACwAAAAQAAAAAAOKCyqYDkawL
AAcAAwBBAzAHEAAAAAcAAAAHAAAAAwAAAAAA4oLKpi41BBMFAQsAAQAAAAAGAAAABgAAAAMA
AAAAAOKCyqYuOOsFBAALAAgAAAAOAAAADgAAABEAAAAAAOKCyqYuOQABAAAADAAM1LhmGwAA
AQAAAFYAAABW//8ADQAAAAAA4oLKpi46RQMLYmx1ZXRvb3RoZABwcm9maWxlcy9hdWRpby9h
dmR0cC5jOmhhbmRsZV91bmFuc3dlcmVkX3JlcSgpIE5vIHJlcGx5IHRvIFN0YXJ0IHJlcXVl
c3QAAAAAmQAAAJn//wANAAAAAADigsqmLm2iAwtibHVldG9vdGhkAHNyYy9wcm9maWxlLmM6
ZXh0X2lvX2Rpc2Nvbm5lY3RlZCgpIFVuYWJsZSB0byBnZXQgaW8gZGF0YSBmb3IgSGVhZHNl
dCBWb2ljZSBnYXRld2F5OiBnZXRwZWVybmFtZTogVHJhbnNwb3J0IGVuZHBvaW50IGlzIG5v
dCBjb25uZWN0ZWQgKDEwNykAAAAADAAAAAwAAAADAAAAAADigsqmO81/BAoM1LhmGwAEBCQB
AAAACgAAAAoAAAACAAAAAADigsqmO83KCQQHDNS4ZhsAAAAAAAYAAAAGAAAAAwAAAAAA4oLK
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
gsqmS+SrDAARAA0ACAQwEQ4BSAAAGVgwAAAAAAAABwAAAAcAAAADAAAAAADigsqmTdaVEwUB
DAABAAAAAAsAAAALAAAABAAAAAAA4oLKpnBdWAwABwADAAUDcAcQAAAABwAAAAcAAAADAAAA
AADigsqmm5SfEwUBDAABAAAAAAYAAAAGAAAAAwAAAAAA4oLKppuYzgUEAAwACAAAAA4AAAAO
AAAAEQAAAAAA4oLKppuZBAEAAAAMAAzUuGYbAAABAAAAmQAAAJn//wANAAAAAADigsqmm5pY
AwtibHVldG9vdGhkAHNyYy9wcm9maWxlLmM6ZXh0X2lvX2Rpc2Nvbm5lY3RlZCgpIFVuYWJs
ZSB0byBnZXQgaW8gZGF0YSBmb3IgSGVhZHNldCBWb2ljZSBnYXRld2F5OiBnZXRwZWVybmFt
ZTogVHJhbnNwb3J0IGVuZHBvaW50IGlzIG5vdCBjb25uZWN0ZWQgKDEwNykAAAAAVgAAAFb/
/wANAAAAAADigsqmm5qRAwtibHVldG9vdGhkAHByb2ZpbGVzL2F1ZGlvL2F2ZHRwLmM6aGFu
ZGxlX3VuYW5zd2VyZWRfcmVxKCkgTm8gcmVwbHkgdG8gU3RhcnQgcmVxdWVzdAA=
--------------C332DC2BCD71CE49BEB905CC--
