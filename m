Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6B113623C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 22:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgAIVIl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 16:08:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37351 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgAIVIl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 16:08:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id o13so8764849ljg.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Jan 2020 13:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FTW9jIYcLQMb7e9oKW1p6IjvJ4YaMuR5pJ9pkgM2jAs=;
        b=SlHdxpA3LcTodJoHxXwoh1ZiSc4Rc/KnFVA+3qQ/NEXNs5Y8FR+cbbqvkq6dQzmy0i
         248q72WGfJMxwhI2fhBnJg1ywwvIYw+iFLoXuoNceABwUPMu+kSOTilt60Ri8EVT8PNO
         4csA0Uf86SP/q3HjpYuakdtpwVNz9aPEhy7UnyTvz28zuo8svoRT4OLMmWqufQtrVPn+
         LYR7tn8rBivtplz18vF3q5DE8Q+klD47NgiFsuWk7ABMPXt/kqVTH9g1dCWF/3RfdzYE
         VKYGIDQJGofzwMAg7iIBo779E6tg22pAUJLbNc0TSd8soveBx1OPo74ZUUByQ4cnFTGM
         B1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=FTW9jIYcLQMb7e9oKW1p6IjvJ4YaMuR5pJ9pkgM2jAs=;
        b=ropTMDP5hkzvnt5gFVvjrs08mat/1mSMHPoGazturBVFuJG/8LQrS3fOc1QdbHSMhR
         hT95VlM5V/i8rhqZ5fiLsWiHc4v068k14QvWgmbASFAfs7wQs7q8zdynEIY/Mpq/HaXM
         tnjzVoiZkLo+loEoCVR1Ug9hke3rS4jUPQd2ad554+TQ0w25EopgOy9heP7ZzRAYhlFU
         FbZIwmuvgfpAb4RT2v5lrZ1M2oovAC8VCCK8x1S6gm3coHn32OM5K2JentgAn4iFzRIE
         iZLfqNYprBv8eDD7mfz85+efLK3oGTHG+8Xt9Xt8o+MlxgpA08Ij9Z9oEDwDG1qEFJAK
         7nIw==
X-Gm-Message-State: APjAAAUSWcvcarlWHQioDv2cRbXq3d/OyASCwndE3aZaAzmRbUyHVr17
        yv2gbMlc2jK/0K/P4d+b2tswzQ==
X-Google-Smtp-Source: APXvYqwL31qMPy4QCJDSWV4NRMqz4vBt03dD2zUZRrv+lio28GSs/kFhcNms+C9Sjf6pcKX63Az6Yg==
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr1535ljm.233.1578604119653;
        Thu, 09 Jan 2020 13:08:39 -0800 (PST)
Received: from kynes (apn-37-7-124-67.dynamic.gprs.plus.pl. [37.7.124.67])
        by smtp.gmail.com with ESMTPSA id d20sm3548430ljg.95.2020.01.09.13.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 13:08:39 -0800 (PST)
From:   "=?utf-8?Q?Micha=C5=82?= Lowas-Rzechonek" 
        <michal.lowas-rzechonek@silvair.com>
X-Google-Original-From: =?utf-8?Q?Micha=C5=82?= Lowas-Rzechonek <khorne@kynes>
Date:   Thu, 9 Jan 2020 22:08:37 +0100
To:     Inga Stotland <inga.stotland@intel.com>
Cc:     linux-bluetooth@vger.kernel.org, brian.gix@intel.com
Subject: Re: [PATCH BlueZ] mesh: Correctly generate NetKey list
Message-ID: <20200109210837.yraajvc76g4xv5oh@kynes>
Mail-Followup-To: Inga Stotland <inga.stotland@intel.com>,
        linux-bluetooth@vger.kernel.org, brian.gix@intel.com
References: <20200109175715.22925-1-inga.stotland@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200109175715.22925-1-inga.stotland@intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Inga,

On 01/09, Inga Stotland wrote:
> When responding with NetKey List Status, packed NetKey indices into
> 3 octets per pair. If number of NetKeys is odd, append the last key
> index as a 2-octet value.

Another thing: doesn't this duplicate the same logic implemented in
appkey.c function appkey_list?

OP_APPKEY_LIST is (and was) working fine.

-- 
Michał Lowas-Rzechonek <michal.lowas-rzechonek@silvair.com>
Silvair http://silvair.com
Jasnogórska 44, 31-358 Krakow, POLAND
