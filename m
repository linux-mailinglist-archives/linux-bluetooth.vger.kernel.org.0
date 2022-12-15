Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D96CB64E24E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 15 Dec 2022 21:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiLOU1o (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 15 Dec 2022 15:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiLOU1n (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 15 Dec 2022 15:27:43 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFFD396C2
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Dec 2022 12:27:41 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id y4so141765ljc.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 15 Dec 2022 12:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZyJpgJ9UlDHCXhfZ+TFWyaM8snfeU/80dcldX6pIac=;
        b=GdvcyfrpHLfJRpLDojq0YIVS30iEEoScl4atR5ly0SvOH/wP8ksgSTo7vME72MfRq8
         1bUBTYq9+QgY28jrFCla6NkylTp5s8OSOFsAUDyveTSyqevF7+7LhA8v6oI0TaV6R29P
         WP2vZ3igR7TWEYfEh46VkhtgAq1bsKOjRgIec/TsKGNuDwgflFHSGTqLpF891inLtLAU
         prhMFd2Vg6a7tht9Q5bPtmqNE1VZ6nbELw+zAs64sAeRbARi/h5tgcarWm/7nLiBk5h3
         cPzBYse4kzl6XPDYCcdVIzt5/sVa7K0Hy25Vt0RWXPVRQU1QGp4h+iF08xxucu4ZFNM0
         WoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZyJpgJ9UlDHCXhfZ+TFWyaM8snfeU/80dcldX6pIac=;
        b=T2R7AyqWFrqrN54mASEuXHH78LTl4G1AwcGIw3AwkcDacYcubPDZ67RmPOfTdK5arM
         htORGPWzuPlt2EN1G1Q3WIN1guP+v/tBvNFKapTpNoU4IOaYwPqTm72XTb/GYcJaPx4q
         Z7fNSM8DkD7pI9gctsByANSCv1cobBa4YH1wOl0X/LYo0EVFHbj4tFx4wIa52BVOE/tr
         ig/O9Vh3G4AL0wHx1EWN05UgCfvz/cftryRzLUSuNgS3fzX9ZWKvsEFUx9xk9Qsc1zKp
         mty7tYSwZgqjX2FmqypjAwQHtrcI5KRUOruIsKkBM0NLSWwfZFQMn0vv8yAm1YyguEdX
         AMnA==
X-Gm-Message-State: ANoB5pkM0xL7WZKNXNGzZg3pFvnwEStHGRIc/MECSEzW8soXrbhtmi+D
        7ISaF6oD7DcTz+ZV/3lVUiJIRzIzvk5CKb9mBb+CpMWA/4xpww==
X-Google-Smtp-Source: AA0mqf6658D3cYyaTK1/c0pQ2T6tQ0gopS3BOjLmHl0tBNFUEMAELpEZczTJHHWEtFjcIqEIKVrB+UsxxuKJl8ro/eM=
X-Received: by 2002:a2e:8943:0:b0:26f:bb12:2af5 with SMTP id
 b3-20020a2e8943000000b0026fbb122af5mr11662899ljk.293.1671136059722; Thu, 15
 Dec 2022 12:27:39 -0800 (PST)
MIME-Version: 1.0
References: <a5d13cfe-dece-7fb1-f2c2-447112d2cb99@systech.com>
In-Reply-To: <a5d13cfe-dece-7fb1-f2c2-447112d2cb99@systech.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 15 Dec 2022 12:27:28 -0800
Message-ID: <CABBYNZJZ7EW4AN9baynHhpOmRSX2sfVjwWaqzURyFBMKyobMeg@mail.gmail.com>
Subject: Re: Need Help Understanding HCI Disconnect Completion Events
To:     Jay Foster <jay.foster@systech.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Jay,

On Thu, Dec 15, 2022 at 11:56 AM Jay Foster <jay.foster@systech.com> wrote:
>
> A customer using my company's product is experiencing Bluetooth
> disconnects using a PAN networking application.  The btmon capture on
> the NAP role side sees a disconnect completion event with reason =
> timeout coming from the adapter (RTL8821CU).  The capture shows a
> sequence like:
>
> 185.515624 receive HCI_EVT (Rcvd Number of Completed Packets)
> 195.512404 send HCI ACL Packet, BNEP protocol, TLSv1.2 data
> 195.512519 send HCI ACL Packet, BNEP protocol, TLSv1.2 Encrypted Alert
> 196.321628 send HCI ACL Packet, BNEP protocol, TCP Retransmission of
> Encrypted Alert
> 197.456727 send HCI ACL Packet, BNEP protocol, TCP RST,ACK
> 206.716499 receive HCI_EVT (Rcvd Disconnect Complete, Reason: Connection
> Timeout (0x08)

I highly recommend using btmon to collect HCI trace.

> The disconnect completion event arrives about 20 seconds after the last
> frame received from the adapter.  It appears that the other side of the
> connection stops responding, or the local side stops receiving the
> responses, right after time 185.515624.
>
> Is the disconnect completion event generated by the adapter (adapter FW)?
> Is the disconnect completion event in response to something sent by the
> other side of the connection (PANU role)?
> What types of things would cause a disconnect completion event to be
> received by the HCI driver?
>
> The very next frame in the capture is at time 206.747045 and is an
> HCI_EVT received from the adapter (Rcvd Connect Request).  This is the
> PANU role side immediately reconnecting.  This seems to indicate to me
> that the other side knows about the disconnect right away.
>
> I have had no success thus far reproducing this myself.  I am looking
> for better understanding of the disconnect completion event with timeout
> to guide me in assessing causes.

You will need to check with the manufacturer as to why the link is
timing out, but if it is 20 seconds it is most likely the link
supervision timeout kicking in due to lack of acknowledgements from
the remote side.

> Jay
>


-- 
Luiz Augusto von Dentz
