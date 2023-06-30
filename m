Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771AB743A26
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jun 2023 13:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjF3LAf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Jun 2023 07:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjF3LAd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Jun 2023 07:00:33 -0400
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790E62D56
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jun 2023 03:59:45 -0700 (PDT)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
        by mail.kmu-office.ch (Postfix) with ESMTPSA id A0A475C03E7;
        Fri, 30 Jun 2023 12:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
        t=1688122772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Y7+SfiHSeBGQ5eR3l0vWzH9AkKmN/hNTqBEfAakH5ko=;
        b=XfNM3s9VPsqjE7azDvfhfvrFA8ZJSclF4FRACjjNCI7hrUosGuwxcTYq+qZGYQnxoQw271
        ue4Uscgh0Vfh+FQFfiNdJHpt4oEOMm826M6RVCJquF4h/KWDxeeg6IrzItcLPSNsxKP+Ok
        nZ/l51g2+himHBDCvaWSYu12SEpWa0U=
MIME-Version: 1.0
Date:   Fri, 30 Jun 2023 12:59:32 +0200
From:   Stefan Agner <stefan@agner.ch>
To:     Brian Gix <brian.gix@gmail.com>
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        Regressions <regressions@lists.linux.dev>,
        =?UTF-8?Q?Jan_=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Subject: Re: [PATCH v4 2/4] Bluetooth: Rework le_scan_restart for hci_sync
In-Reply-To: <0de3f0d0d5eb6d83cfc8d90cbb2b1ba1@agner.ch>
References: <20220727135834.294184-1-brian.gix@intel.com>
 <20220727135834.294184-3-brian.gix@intel.com>
 <578e6d7afd676129decafba846a933f5@agner.ch>
 <CABBYNZJGKfwTQM8WAdUGXueTPnFyus1a65UO5mg2g4PXVuCnpA@mail.gmail.com>
 <CABBYNZLgG+zTsk-6ceqzLXXyVRnN6p-m8sFq9Ss7mveD0f9BsQ@mail.gmail.com>
 <CABUQxGxBdAFncJ6YVb7a9gnU-_YZDGFDmpHJTtm5K1tDGEGRDQ@mail.gmail.com>
 <0de3f0d0d5eb6d83cfc8d90cbb2b1ba1@agner.ch>
Message-ID: <fcdf856db8fd8e77558b4d82b843c51e@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Brian,

Gentle ping on the issue below.

On 2023-06-20 16:41, Stefan Agner wrote:
> On 2023-06-16 03:22, Brian Gix wrote:
> 
>> On Thu, Jun 15, 2023 at 11:28 AM Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:
>>
>>> +Brian Gix
>>>
>>> On Thu, Jun 15, 2023 at 10:27 AM Luiz Augusto von Dentz
>>> <luiz.dentz@gmail.com> wrote:
>>>>
>>>> Hi Stefan,
>>>>
>>>> On Thu, Jun 15, 2023 at 5:06 AM Stefan Agner <stefan@agner.ch> wrote:
>>>>>
>>>>> Hi Brian, hi all,
>>>>>
>>>>> We experienced quite some Bluetooth issues after moving from Linux 5.15
>>>>> to 6.1 on Home Assistant OS, especially on Intel NUC type systems (which
>>>>> is a popular choice in our community, so it might just be that). When
>>>>> continuously scanning/listening for BLE packets, the packet flow
>>>>> suddenly ends. Depending on which and how many devices (possibly also
>>>>> other factors) within minutes or hours.
>>>>>
>>>>> Jan (in cc) was able to bisect the issue, and was able to pinpoint the
>>>>> problem to this change.
>>>>>
>>>>> Meanwhile I was able to confirm, that reverting this single commit on
>>>>> the latest 6.1.34 seems to resolve the issue.
>>>>>
>>>>> I've reviewed the change and surrounding code, and one thing I've
>>>>> noticed is that the if statement to set cp.filter_dup in
>>>>> hci_le_set_ext_scan_enable_sync and hci_le_set_scan_enable_sync are
>>>>> different. Not sure if that needs to be the way it is, but my outside
>>>>> gut feeling says hci_le_set_ext_scan_enable_sync should use "if (val &&
>>>>> hci_dev_test_flag(hdev, HCI_MESH))" as well.
>>>>>
>>>>> However, that did not fix the problem (but maybe it is wrong
>>>>> nonetheless?).
>>>>>
>>>>> Anyone has an idea what could be the problem here?
>>>>
>>>> Are there any logs of the problem? Does any HCI command fails or
>>>> anything so that we can track down what could be wrong?
> 
> No HCI command fails, there is also no issue reported in the kernel log.
> BlueZ just stops receiving BLE packets, at least from certain devices.
> 
>>>
>>> @Brian Gix perhaps you have a better idea what is going wrong here?
>>
>> It seems unlikely that this is Mesh related. Mesh does need for filtering to
>> be FALSE, and Mesh does not use extended scanning in any case.
>>
>> But this was part of the final rewrite to retire the hci_req mechanism in
>> favor of the hci_sync mechanism. So my best guess off the top of my head is
>> that there was an unintended race condition that worked better than the
>> synchronous single-threading mechanism?  Filtering (or not) should not
> 
> After review the code I concluded the same. What is a bit surprising to
> me is that it is so well reproducible. I guess it is nicer to have a
> reproducible one than a hard to reproduce one :)
> 
>> prevent advertising packets from permanently wedging.  Does anyone have an
>> HCI flow log with and without the offending patch?  Ideally they should be
>> identical...  If they are not then I obviously did something wrong. As this
>> was not specifically Mesh related, I may have missed some non-mesh corner
>> cases.
> 
> 
> I've taken two btmon captures, I created them using:
> btmon -i hci0 -w /config/hcidump-hci-req-working.log
> 
> You can find them at:
> https://os-builds.home-assistant.io/hcidump-hci-req-working.log
> https://os-builds.home-assistant.io/hcidump-hci-sync-non-working.log

Could you gain any insights from these logs?

--
Stefan


> 
> This is while running our user space software (Home Assistant with
> Bluetooth integration). Besides some BLE devices (e.g. Xioami Mi
> Temperature & Humidity sensor) I have a ESP32 running which sends SPAM
> advertisements every 100ms (this accelerates the issue). In the
> non-working case you'll see that the system doesn't receive any SPAM
> advertisements after around 27 seconds. The working log shows that it
> continuously receives the same packets (capture 120s).
> 
> Hope this helps.
> 
> --
> Stefan
> 
> 
