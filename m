Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2772D77D195
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Aug 2023 20:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239022AbjHOSP5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Aug 2023 14:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239088AbjHOSP4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Aug 2023 14:15:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DEF10DA
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Aug 2023 11:15:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A03D660C21
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Aug 2023 18:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF98DC433C8;
        Tue, 15 Aug 2023 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692123355;
        bh=ue+DHnTWogh9x4/wbN+kqQCpSLUJL/OugkBmklSdLho=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nH0Unv+LEriZvrApV2k/WkeQSi3bdh8FvNrUBkAwrVYzmXAG6nMMx6I+sBg6DaruF
         dJhrtFR9bIcmhusp0/k5LrKqNVAfihx+y3HWpBOWAz/9Q0g0aLifNhV5taCTQvvJbh
         J2X7SX18elPdH2/Iw6tLBoqegtwITQTVZANi7aPrBGMWZHLZ31ut16E2/m3oHocX7j
         81+a2dz71Fs9727zz5LhTmifzRC5qfxAoxC2eD5NbqIelpxJQlkEmrXrQ4SCuerCz6
         VViGN4ojbdzT8PwSfJqOChi9JI8dNqr9vLWUCMNYQWnAnXfawO8vrgwtWkfrE7mss4
         1SzYNaZ+0rygQ==
Date:   Tue, 15 Aug 2023 11:15:54 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     davem@davemloft.net, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: pull request: bluetooth-next 2023-08-11
Message-ID: <20230815111554.7ff6205e@kernel.org>
In-Reply-To: <CABBYNZJmkOpPgF6oox-JAyGAZRxzX7Kn9JQpLPXi_FR=Cf-FOA@mail.gmail.com>
References: <20230811192256.1988031-1-luiz.dentz@gmail.com>
        <20230814164546.71dbc695@kernel.org>
        <CABBYNZJmkOpPgF6oox-JAyGAZRxzX7Kn9JQpLPXi_FR=Cf-FOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, 15 Aug 2023 10:59:35 -0700 Luiz Augusto von Dentz wrote:
> > As indicated by Stephen's complaint about lack of an SoB tag,
> > it appears that DaveM merged this PR over the weekend :)  
> 
> Ok, since it has been applied what shall we do?

Not much we can do now. Make sure you run:

https://github.com/kuba-moo/nipa/blob/master/tests/patch/verify_signedoff/verify_signedoff.sh

on the next PR.
