Return-Path: <linux-bluetooth+bounces-943-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C60826657
	for <lists+linux-bluetooth@lfdr.de>; Sun,  7 Jan 2024 23:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8B8B281899
	for <lists+linux-bluetooth@lfdr.de>; Sun,  7 Jan 2024 22:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3577711CBE;
	Sun,  7 Jan 2024 22:20:28 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4EE11C80;
	Sun,  7 Jan 2024 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=v0yd.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=v0yd.nl
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4T7Wpl2Spqz9sZF;
	Sun,  7 Jan 2024 23:20:15 +0100 (CET)
Message-ID: <9b728113-8bb5-44df-8ba8-b0ee535100c8@v0yd.nl>
Date: Sun, 7 Jan 2024 23:20:13 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] Bluetooth: hci_event: Remove limit of 2 reconnection
 attempts
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, verdre@v0yd.nl
References: <20240102185933.64179-1-verdre@v0yd.nl>
 <20240102185933.64179-4-verdre@v0yd.nl>
 <CABBYNZLoivEW=yrDtTbu5SjGauESH0zHb7NXs0YaSKSKqre5GQ@mail.gmail.com>
 <7036c788-7d8c-4e36-8289-64f43a3f8610@v0yd.nl>
 <CABBYNZLBf24vkTWEgWd8jHBfwh8jA2wDUbZZUW7QGHuUax5jcw@mail.gmail.com>
From: =?UTF-8?Q?Jonas_Dre=C3=9Fler?= <verdre@v0yd.nl>
In-Reply-To: <CABBYNZLBf24vkTWEgWd8jHBfwh8jA2wDUbZZUW7QGHuUax5jcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luiz,

On 1/5/24 17:05, Luiz Augusto von Dentz wrote:
> Hi Jonas,
> 
> On Fri, Jan 5, 2024 at 10:54 AM Jonas Dreßler <verdre@v0yd.nl> wrote:
>>
>> Hi Luiz,
>>
>> On 1/3/24 17:05, Luiz Augusto von Dentz wrote:
>>> Hi Jonas,
>>>
>>> On Tue, Jan 2, 2024 at 1:59 PM Jonas Dreßler <verdre@v0yd.nl> wrote:
>>>>
>>>> Since commit 4c67bc74f016b0d360b8573e18969c0ff7926974, we retry connecting
>>>> later when we get a "Command Disallowed" error returned by "Create
>>>> Connection".
>>>>
>>>> In this commit the intention was to retry only once, and give up if we see
>>>> "Command Disallowed" again on the second try.
>>>>
>>>> This made sense back then when the retry was initiated *only* from the
>>>> "Connect Complete" event. If we received that event, we knew that now the
>>>> card now must have a "free slot" for a new connection request again. These
>>>> days we call hci_conn_check_pending() from a few more places though, and
>>>> in these places we can't really be sure that there's a "free slot" on the
>>>> card, so the second try to "Create Connection" might fail again.
>>>>
>>>> Deal with this by being less strict about these retries and try again
>>>> every time we get "Command Disallowed" errors, removing the limitation to
>>>> only two attempts.
>>>>
>>>> Since this can potentially cause us to enter an endless cycle of
>>>> reconnection attempts, we'll add some guarding against that with the next
>>>> commit.
>>>
>>> Don't see where you are doing such guarding, besides you seem to
>>> assume HCI_ERROR_COMMAND_DISALLOWED would always means the controller
>>> is busy, or something like that, but it could perform the connection
>>> later, but that may not always be the case, thus why I think
>>> reconnecting just a few number of times is better, if you really need
>>> to keep retrying then this needs to be controlled by a policy in
>>> userspace not hardcoded in the kernel, well I can even argument that
>>> perhaps the initial number of reconnection shall be configurable so
>>> one don't have to recompile the kernel if that needs changing.
>>
>> Yes, fair enough, the next commit assumes that COMMAND_DISALLOWED always
>> means busy. The guarding is that we stop retrying as soon as there's no
>> (competing) ongoing connection attempt nor an active inquiry, which
>> should eventually be the case no matter what, no?
>>
>> I agree it's probably still better to not rely on this fairly complex
>> sanity check and keep the checking of attempts nonetheless.
>>
>> I think we could keep doing that if we check for
>> !hci_conn_hash_lookup_state(hdev, ACL_LINK, BT_CONNECT) &&
>> !test_bit(HCI_INQUIRY, &hdev->flags) in hci_conn_check_pending() before
>> we actually retry, to make sure the retry counter doesn't get
>> incremented wrongly. I'll give that a try.
> 
> Perhaps I'm missing something, but it should be possible to block
> concurrent access to HCI while a command is pending with use of
> hci_cmd_sync, at least on LE we do that by waiting the connection
> complete event so connection attempts are serialized but we don't seem
> to be doing the same for BR/EDR.
> 

That's a good point, it might even allow for a nice little cleanup 
because we can then cancel inquiries in hci_acl_create_connection() 
synchronously, too.

Question is just whether there's any devices out there that actually do 
support paging with more than a single device at a time and if we want 
to support that?

> 
>>>
>>>> Signed-off-by: Jonas Dreßler <verdre@v0yd.nl>
>>>> ---
>>>>    net/bluetooth/hci_event.c | 7 ++++---
>>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>>>> index e8b4a0126..e1f5b6f90 100644
>>>> --- a/net/bluetooth/hci_event.c
>>>> +++ b/net/bluetooth/hci_event.c
>>>> @@ -2323,12 +2323,13 @@ static void hci_cs_create_conn(struct hci_dev *hdev, __u8 status)
>>>>
>>>>           if (status) {
>>>>                   if (conn && conn->state == BT_CONNECT) {
>>>> -                       if (status != HCI_ERROR_COMMAND_DISALLOWED || conn->attempt > 2) {
>>>> +                       if (status == HCI_ERROR_COMMAND_DISALLOWED) {
>>>> +                               conn->state = BT_CONNECT2;
>>>> +                       } else {
>>>>                                   conn->state = BT_CLOSED;
>>>>                                   hci_connect_cfm(conn, status);
>>>>                                   hci_conn_del(conn);
>>>> -                       } else
>>>> -                               conn->state = BT_CONNECT2;
>>>> +                       }
>>>>                   }
>>>>           } else {
>>>>                   if (!conn) {
>>>> --
>>>> 2.43.0
>>>>
>>>
>>>
>>
>> Cheers,
>> Jonas
> 
> 
> 
> --
> Luiz Augusto von Dentz

