Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBED64C2DE8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Feb 2022 15:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbiBXOJw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Feb 2022 09:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235344AbiBXOJr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Feb 2022 09:09:47 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE28294FC2
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Feb 2022 06:09:15 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nNEnw-0003dI-Iq; Thu, 24 Feb 2022 15:09:12 +0100
Message-ID: <db329421-ff6c-50c9-69f6-ae8e1b9e9063@leemhuis.info>
Date:   Thu, 24 Feb 2022 15:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-BW
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220215015938.1950978-1-luiz.dentz@gmail.com>
 <E428782F-C1D1-43FB-8CB3-009BD97A2D14@holtmann.org>
 <c418c95d-339c-5b8a-5349-26078424abe4@leemhuis.info>
Subject: Re: [PATCH] Bluetooth: Fix bt_skb_sendmmsg not allocating partial
 chunks
In-Reply-To: <c418c95d-339c-5b8a-5349-26078424abe4@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1645711755;1947dcc0;
X-HE-SMSGID: 1nNEnw-0003dI-Iq
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi, this is your Linux kernel regression tracker again. Top-posting for
once, to make this easily accessible for everyone.

I sent below inquiry on Saturday and didn't get a reply; and I didn't
notice any other activity to get this regression fix mainlined soon.

Bluetooth maintainers, what's up here? I'd like to avoid getting Linus
involved, but I guess I'm out of options if this mail doesn't get things
rolling -- or alternatively an answer why this fix might better wait for
the next merge window to get merged.

Ciao, Thorsten

On 19.02.22 10:18, Thorsten Leemhuis wrote:
> 
> [CCing Johan, Jakub and Dave]
> 
> Hi Bluetooth maintainers!
> 
> On 16.02.22 11:26, Marcel Holtmann wrote:
>>
>>> Since bt_skb_sendmmsg can be used with the likes of SOCK_STREAM it
>>> shall return the partial chunks it could allocate instead of freeing
>>> everything as otherwise it can cause problems like bellow.
>>>
>>> Link: https://lore.kernel.org/linux-bluetooth/aa3ee7ac-6c52-3861-1798-3cc1a37f6ebf@molgen.mpg.de/T/#m1f9673e4ab0d55a7dccf87905337ab2e67d689f1
>>> Fixes: 81be03e026dc ("Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg")
>>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>> ---
>>> include/net/bluetooth/bluetooth.h | 3 +--
>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> patch has been applied to bluetooth-next tree.
> 
> Luiz, Marcel, thx for fixing this 5.16 regression and picking the patch
> up for merging. But I have to wonder: why was this simple fix put into a
> tree that apparently is meant to only get merged to mainline during the
> the next merge window? That will mean this regression will bother people
> (maybe Paul is not the only one that is affected by this) for weeks to
> come and even make it into 5.17, before it gets fixed for 5.18-rc1.
> Despite the lack of a "Cc: <stable@vger.kernel.org>" tag it likely will
> get backporting to 5.17.y and 5.16.y afterwards, but the latter soon
> after will be EOLed anyway.
> 
> Correct me if I'm wrong, but that afaik is not how the Linux development
> process is meant to handle such regressions. This approach also
> contributes to the huge stable and longterm releases after the end of
> each merge window, which some people see as a problem.
> 
> I bring this up because there were other regression fixes in the last
> few weeks that took such a slow path towards mainline. I also checked
> MAINTAINERS and noticed you even have a tree that could feed fixes like
> this to Linus via the regular net tree, but apparently you haven't used
> it in quite a while:
> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git
> I rechecked and noticed not a single bluetooth fix was merged between
> v5.16-rc1..v5.16. I doubt Jakub or Dave are the reason, as they merge
> fixes from downstream trees every week and send them to Linus shortly
> after that.
> 
> So why are things like that? Or is there something wrong with my look on
> things?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
