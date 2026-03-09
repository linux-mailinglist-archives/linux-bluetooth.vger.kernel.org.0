Return-Path: <linux-bluetooth+bounces-19955-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEvcKQsGr2knLwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19955-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 18:40:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D51923DBF0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 18:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E60753045655
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 17:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31973ED118;
	Mon,  9 Mar 2026 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAytj5LC"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ACB374752
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 17:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773077852; cv=pass; b=HVhbGxVSv5OLHTlS793TBlsVVIBRDJof4WrxmxqK2gfQjbdA1ale9BcIISGk++W8Y2EMvNJdwxt4EZE5qnSfH/SEbt1Lcgtn+C3PI5XLJjgJocWsn6bcHrYYnkeOc/obhRs6PU7OcYiydKgFxKJDomJd1gOC/l7Flm4rhk/Kxxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773077852; c=relaxed/simple;
	bh=7t5IkUmnse0LhoYngB32FGKhTFpmyY4cAQHOPFla0eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jokQnY/Rg/gZ8gpuyzLwnpryKaX/YPVDQDcvFFKAnCqSX4QPTA8VkZ/Z5/ajnGVYv6juBdvOoS4G51zzTIbGoo4OqCW55xyewolv2xvQWbuATMBxiAes/nGgSHbO1Y4UHdCMRhwD+7sJqZaGH2yX4x6ALTiJY2nca/DYL+SL3Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAytj5LC; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d75371d873so890985a34.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Mar 2026 10:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773077850; cv=none;
        d=google.com; s=arc-20240605;
        b=by0B6hsfNFE1zJQ6lxSGTe1GXhVbG3M8v8jhHdTlEUq7h5yR33UB2DwmQymudP4KSq
         HiWcnulootSoVjDHIxybDbJp6Ms7zCR65/y6sFF4oSbq19sYuz2ydGGDLd1t0lX5G3YL
         QY87Huk4+MXv+bA+Lxb6Lhj1PN6jOvxv2kRrMiWoOgJi/CsreAH1dvamvrC6tP4EUPbo
         68DcJIQjllwJLPh6l7ZZaZeq7bKQ6erSvBjn4IW9LYK/DzdqlApfgKMQjMI5fcHnls8F
         ZCM8+J3dVA0r71me7Nus/f+Au0SIzKRacw9wRCu8Dsg56SeUDFIrMVhHowtTNKv7HAGL
         onwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2+jCw0CwUW/GOkM+pLwlxys60R/ZHzrvU2ZE73+qhE=;
        fh=Q70BYIync/2GQ6vI1YdDXs9Dm/6OnlhKbztq2Aoi5Os=;
        b=dNAG6qOFQG9mxIFJt5RfVjY4VV6/jSbD3qP45Mkx6sTVLu9fAWCfDLL3/EiFzkbs5g
         IGboExCVyIV2gkKJVWxPRb2f4y453VpwoX9+kfcCAqCNhGO/yO+J3CW/mdLvE0LR5/P5
         VBarUJo16YZ97b/1cBkUyyX3dUyKSh2lSkOZa8rYAejS2TXKx7iLUaviL2W6GnE1lAmz
         dfaWI3qRw2GeZKbhx78AaDJy5UfazhNPIaOp9MygZuSV8LYjaxM/jLngstZr7DVLikAo
         GlqDmhYLU0SkCkyU4NpDLmMz/1COqV++LcjgW8vV3HOkfbQrNmDt1iyx34LwyQOi3RQw
         mKYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773077850; x=1773682650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2+jCw0CwUW/GOkM+pLwlxys60R/ZHzrvU2ZE73+qhE=;
        b=MAytj5LCVrNzIGdTP1Lo3IuJZ8iDQ9kujWziNhwTBciyxqN1UMVAZzXQ3eZmIFoTnJ
         lC0TzPoRperBuRN59ctH330p8cZgVrsW3yZ57JThkF74RhzicT37MILicn430PVHg3ON
         lK5OooLQscgFi7P336h74Sc4/Qcc/yUAuGzTj+DuK0gBEx83hgowkpnE71MedexKpv8K
         N6N4ovMvcZ7UVrqT8bgxVBxAE7fr5MncaboRp7iSmEW1EwJFSGvcz9/++ASqcU6tHYUl
         lLEccLX+ZL/7Ug3S0PUbq1Q1JnlarslDJZIpPFOyt5AAwlWKj+LQ8RJ4/uUOrc44vo2L
         nAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773077850; x=1773682650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2+jCw0CwUW/GOkM+pLwlxys60R/ZHzrvU2ZE73+qhE=;
        b=i58z+iVKwQxaBiB0SzuoNhKPMX/qqLkbU0HoeizM6R8oIYUUmHjDlbFjMKTHSBjrgT
         VYQCEQPi17sX66X5aLRddySB+FY/0l7nuCfCTVqHRLcTAz/fNq9U9WDitY9j+5UbhPRA
         geZaK/SLHf6er5YxSbvOun30IvCGZFnPwGOCtdAGYuXB6LDmJX44rbtMx1/JbgpVxJeJ
         kfvznOF5VOoi/m6rLVL6CwUFc+fz+SvsaLSK1YaXo9hA5yGYuiRb+7vdVx8NjXREdj4t
         L5dDsfU5YlBGBYODPv273ZsBwC2ZE1VQdrNIi+9xkpvRfOxT6fxJ0ETMIczswS8D8dbv
         8V0w==
X-Forwarded-Encrypted: i=1; AJvYcCXrwsp+hJqj6NW2Fo6CV/ZvtH1OHWcNRxysqdwojiVCCuUEQJGCSBe+uGz78xfrC8u6EFKfMbHQpiTuj3YCfv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/gZkfxIySVMZngqHZjSKXHJxlU8SW5D0Q/joGgUAqIqfPeB5w
	FnAO0LRJWKX/sj5QXznSX56wL9zgt9/EneyONQMKQ+Q8Wuitj4Kru7taB9QGwor9Af7lrA9BpFV
	zK9WRP7EoZQUE5pjR5qJ4OnI2nubaaKQ=
X-Gm-Gg: ATEYQzwvoMGEe8YxA7y6Qeu2U3uUjw9zAYAaG66dUXbsh1/avGoamPSHxmyX2ISlv6A
	tjW1X0U/LjU8QEyJTeTA9o5sSX6viG1N3JxyfoLXTemlMusmi0PzwTyTQRODxNPwWFxhU6V41RY
	8P2b0YIE/sNqoV77fjTOqcql7WocPYDgfExVxzAw9UCfRhJLSgdA9yLZdmoNf5F8qqeOxMqBpu5
	rlg3EWvZTBy5eymg1Nxb4H7SBsRIbpdUI2h8qF0g9hfqh7a6hTCUEqMzeCJ4wbyT1XL87Z1Mpod
	F78MYeVFuzqW+ig+G4rE3yQt6EclFvcIX+0Skbe8zbhnV/tLHy0pHuyWzg==
X-Received: by 2002:a05:6830:370c:b0:7d7:5959:946f with SMTP id
 46e09a7af769-7d75959aa68mr328936a34.7.1773077849664; Mon, 09 Mar 2026
 10:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302233756.910702-1-dajid.morel@volvo.com>
 <CABBYNZJtZZ7mHJinJY9ZfhfHbYUC9aEmoRx9ACz5R4HSwepyFg@mail.gmail.com>
 <CAM8DPm26RVUJbgA+Lutqshu+ZqkVtNaVrKdG-k1WdE0rcSe0dQ@mail.gmail.com>
 <CABBYNZKxUJUtZTNe0+ot1JmNDyLzf3x-TyN+TqPz-o5xMmx=6A@mail.gmail.com>
 <CAM8DPm24s+2raquaofgPoroTMECGdKeba7pnDz5X64wN66yjiw@mail.gmail.com>
 <CABBYNZKaNmSPbCpJ-GKu2eSrgd_GcOOWkekHW0OMK8WMLESYWQ@mail.gmail.com>
 <CAM8DPm20Sm1t_NMoWQFZtkmdaiL1ALs8SFMqxe-QtT5wjbp6xA@mail.gmail.com>
 <CABBYNZKmu3b2h2NyhhV7CwmB=h1R9uAe0HXDCP73iAvqzy7AYA@mail.gmail.com>
 <CAM8DPm2z-6xUm3SyFJ9umn4=o9bBov6PhKV0TEDCBc14eMFSew@mail.gmail.com>
 <CABBYNZJZWkEy2D4WW8ODMoU-ZmsT1aN0LccOzdsCxuKnFZHnuA@mail.gmail.com>
 <CAM8DPm1fWn7jovVPgcBrApy_czP0TbnBi=oUZmhjMqDkORv2bw@mail.gmail.com>
 <CABBYNZJ6NNL26BOxV2E6HBA6D3vgOauRQ=75vRcBMA0D-vSEHw@mail.gmail.com>
 <CAM8DPm0rgZEY+aNj8-RJv7JwvMOBQuRu7qt7G+z_OpVL+zk3Gw@mail.gmail.com> <ea9528bd-ccde-4da3-b85b-793e370b4da1@molgen.mpg.de>
In-Reply-To: <ea9528bd-ccde-4da3-b85b-793e370b4da1@molgen.mpg.de>
From: Dajid Morel <dajidp.morel@gmail.com>
Date: Mon, 9 Mar 2026 18:37:18 +0100
X-Gm-Features: AaiRm51TYDXAcfnoPVj_7YXzNmZC8WP_-Zbe0i5NWPZDl2M9Spf5uXFxWOY5Ti0
Message-ID: <CAM8DPm20ECFZF6v19SrLwA8o92YXY_dsWvOyFDOuym5S7P2kCg@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: Increase LE connection timeout for
 industrial sensors
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Dajid Morel <dajid.morel@volvo.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1D51923DBF0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19955-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[volvo.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dajidpmorel@gmail.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Paul,

Thank you for your feedback. I have analyzed the current bluetooth-next tre=
e
(Commit: 19182348259c) as you suggested

As you pointed out, Luiz is the expert on this topic. For my part, I
am an apprentice student
majoring in Physics and Microelectronics Systems; I do not have
extensive expertise in the Linux kernel.
My analysis relies primarily on observing physical behavior and
experimentation on our production line.

Le lun. 9 mars 2026 =C3=A0 17:02, Paul Menzel <pmenzel@molgen.mpg.de> a =C3=
=A9crit :
>
> Dear Dajid,
>
>
> Sorry for chiming in. Luiz is the most knowledgeable person in this.
>
> Am 09.03.26 um 11:02 schrieb Dajid Morel:
> >> Yeah, you really don't know what you are talking about, there is no
> >> timeout on HCI_OP_LE_CREATE_CONN itself, the controller shall generate
> >> a command complete immediately and the connection attempt is only
> >> interrupted with HCI_OP_LE_CREATE_CONN_CANCEL, so lets say yo want to
> >> increase HCI_CMD_TIMEOUT that means HCI_OP_LE_CREATE_CONN_CANCEL
> >> cannot be send because it would be pending on HCI_EV_LE_CONN_COMPLETE,
> >> anyway I fill like Im wasting my time here.
> >
> > Hi Luiz,
> >
> > I'll be brief and stick to the logs. Here is the output from a stock
> > 5.15 kernel (2s timeout) on the Raspberry Pi 4:
> >
> > [bluetooth]# connect E8:C0:B1:D4:A3:3C
> > Attempting to connect to E8:C0:B1:D4:A3:3C
> > Failed to connect: org.bluez.Error.Failed le-connection-abort-by-local
> >
> > The "le-connection-abort-by-local" error is the smoking gun. It proves
> > the Host is aborting the sequence, not the peer.
> >
> > When I apply my patch (15s timeout) on the exact same hardware:
> >
> > - The "abort-by-local" error disappears completely.
> > - The connection succeeds 100% of the time.
> > - We can read the pressure data.
> >
> > I noticed in dmesg that the Broadcom controller is missing its firmware=
 patch:
> > [   16.357546] Bluetooth: hci0: BCM: chip id 63
> > [   16.360628] Bluetooth: hci0: BCM: features 0x07
> > [   16.378604] Bluetooth: hci0: BCM20702A
> > [   16.378639] Bluetooth: hci0: BCM20702A1 (001.002.014) build 0000
> > [   16.381695] Bluetooth: hci0: BCM: firmware Patch file not found, tri=
ed:
> > [   16.388662] Bluetooth: hci0: BCM: 'brcm/BCM20702A1-0a5c-21e8.hcd'
> > [   16.394969] Bluetooth: hci0: BCM: 'brcm/BCM-0a5c-21e8.hcd'
> >
> > This likely makes the controller slower to process sync commands when
> > high-latency sensors are advertising nearby. However, the system is
> > 100% stable with the 15s timeout patch, even without that firmware.
> >
> > If the timeout is truly decoupled, then "le-connection-abort-by-local"
> > should not be triggered at exactly 2 seconds. The fact that it is
> > proves that the hardcoded limit in hci_sync.c is the blocker.
> >
> > Since this is for a Volvo production line, we need a way to support
> > these sensors. If you refuse the global constant change, how can we
> > avoid this "local abort" in the sync sequence for slow controllers?
>
> As this is the upstream list, it=E2=80=99d really help if you could test =
with
> 6.19, 7.0-rc3 or =E2=80=93 best option =E2=80=93 with the bluetooth-next =
tree, just to
> be sure.
>
> It=E2=80=99s definitely great, that you are looking for an upstream solut=
ion, so
> please be patient, and I=E2=80=99d really be interested in your test resu=
lts.
> Depending on these, a way forward can be derived.
>
>
> Kind regards,
>
> Paul

The source code analysis of bluetooth-next confirms that the LE
connection preparatory
 phase (Accept List) is still limited by the hardcoded HCI_CMD_TIMEOUT
(2s), which is
identical to my production kernel (Jammy 5.15, Commit: 7824a77711ba):

ubuntu@builder:~/bluetooth-next$ sed -n '2511,2514p'
net/bluetooth/hci_sync.c err
=3D __hci_cmd_sync_status(hdev, HCI_OP_LE_ADD_TO_ACCEPT_LIST,
sizeof(cp), &cp, HCI_CMD_TIMEOUT);

While I cannot easily boot a 7.0-rc3 kernel on this specific
industrial hardware today, the
code at line 2511 in bluetooth-next is strictly identical to my 5.15
kernel. In our environment
with high-latency sensors (5s advertising interval), this 2s limit
systematically triggers a
"le-connection-abort-by-local" error before the final connection
command is even reached.

What architectural approach would you recommend to allow for more
latency during these preparatory
sync commands without modifying the global kernel constant?

Best regards,

Dajid Morel

