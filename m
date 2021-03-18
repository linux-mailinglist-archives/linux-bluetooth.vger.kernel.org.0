Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD273410FE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Mar 2021 00:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCRX04 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Mar 2021 19:26:56 -0400
Received: from mx.flatmax.org ([13.55.16.222]:43778 "EHLO mx.flatmax.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhCRX0n (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Mar 2021 19:26:43 -0400
X-Greylist: delayed 1515 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 19:26:43 EDT
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41] helo=[192.168.1.33])
        by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <flatmax@flatmax.org>)
        id 1lN1dv-0002iK-P6
        for linux-bluetooth@vger.kernel.org; Fri, 19 Mar 2021 10:01:28 +1100
To:     linux-bluetooth@vger.kernel.org
From:   Matt Flax <flatmax@flatmax.org>
Subject: PAN howto
Message-ID: <304af64a-43ba-3364-f489-b41cc8a76dbe@flatmax.org>
Date:   Fri, 19 Mar 2021 10:01:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software, running on the system "mx.flatmax.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 Content preview:  Hi there, Can anyone point to a concise and known good PAN
    setup HOWTO ? We have embedded devices and are aiming to enable WiFi setup
    over PAN, as well as other PAN things. 
 Content analysis details:   (-2.9 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi there,

Can anyone point to a concise and known good PAN setup HOWTO ?

We have embedded devices and are aiming to enable WiFi setup over PAN, 
as well as other PAN things.

The target OS is buldroot and userspace config and setup is preferable. 
We are using a kernel.fragment file to enable and disable CONFIG options 
in the kernel.

Buiidroot running Linux 5.8.xx

Bluez-utils v5.55


thanks

Matt

