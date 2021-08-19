Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 493533F129F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Aug 2021 06:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhHSE7v (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Aug 2021 00:59:51 -0400
Received: from mail.sma-inc.us ([192.88.109.73]:12012 "EHLO sma-inc.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhHSE7v (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Aug 2021 00:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=sma-inc.us; s=mail;
        bh=8R8A/4Tilzh3a1xKVGM+jiGYobrbLK/T4g0imXq9TX0=;
        h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:To:References:Subject; b=JAL+5bgvmg0m5R7H+t
        cKywtmwWaEc1QieFme6U+ZoO2vDx6mn9aDjhyFhP9/5CuwSvc/ITpm6e/szZuITXTQVo+YIp0V/Qw
        RGodyon+nlFE6VZSiiwSb9IFyGirlWU78cAyqUXvy8hcN2dns6jm61cYvGLKdhl4I32jrvMnQ/B8=
Received: from [127.0.0.1] (account moe.james@sma-inc.us HELO [IPv6:fd2f:4760:521f:3f3c::c0a8:45ec])
  by sma-inc.us (CommuniGate Pro SMTP 6.2.15)
  with ESMTPSA id 7815276 for linux-bluetooth@vger.kernel.org; Wed, 18 Aug 2021 21:59:15 -0700
X-Assp-Version: 2.6.5(21074) on assp.sma-server3.sma.com
X-Assp-ID: assp.sma-server3.sma.com 49155-12098
X-Assp-Session: 7FE9396F5A00 (mail 1)
X-Assp-Envelope-From: jimoe@sohnen-moe.com
X-Assp-Intended-For: linux-bluetooth@vger.kernel.org
X-Assp-Server-TLS: yes
Received: from unknown ([fd2f:4760:521f:3f3c::c0a8:45ec] helo=[IPv6:fd2f:4760:521f:3f3c::c0a8:45ec])
         by assp.sma-server3.sma.com with SMTPA (2.6.5); 18 Aug 2021 21:59:14
         -0700
Subject: Re: The UNIFY bluetooth unit is not recognized by Gnome/bluetooth
References: <sig.0865cb2f28.54aee928-a4e2-9368-f417-58d87999b4e1@sohnen-moe.com>
To:     linux-bluetooth@vger.kernel.org
From:   James Moe <jimoe@sohnen-moe.com>
Message-ID: <sig.08659c3f9f.bb8c27d8-6553-b6b1-1bc2-6d7030fd1550@sohnen-moe.com>
Date:   Wed, 18 Aug 2021 21:59:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <sig.0865cb2f28.54aee928-a4e2-9368-f417-58d87999b4e1@sohnen-moe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 8/18/21 6:36 PM, James Moe wrote:

> opensuse tumbleweed 20210810
> linux 5.13.8-1-default x86_64
> gnome 40.3.0
>
bluez v5.60

-- 
James Moe
moe dot james at sohnen-moe dot com
520.743.3936
Think.
