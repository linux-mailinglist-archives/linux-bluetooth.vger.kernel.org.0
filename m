Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595E0157357
	for <lists+linux-bluetooth@lfdr.de>; Mon, 10 Feb 2020 12:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbgBJLTT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 10 Feb 2020 06:19:19 -0500
Received: from mail-vk1-f169.google.com ([209.85.221.169]:34088 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgBJLTT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 10 Feb 2020 06:19:19 -0500
Received: by mail-vk1-f169.google.com with SMTP id w67so1668113vkf.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 10 Feb 2020 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qD5gnbnauLJcvCFwpm5TOqJxHL+71By7OVs+td2AyR8=;
        b=d2EZY+97UONiaTDNOPe9L2MePvgS1m0hEtjbFYWPrmcBFyJwh+AAB5thsEvrwEJNxN
         hgq15swPwVxFslN6sGhXSUGBwR/zOH7zrenoDmycZt14LduPpzkLhR0kfzOH4N9sJzUI
         d1zMoiWZ0k34OViw5W5C/Y41Cs7ShcpGrK5/Q4hbfw29tOwJFH1btk58t0HyBxiWuzoI
         MlS2DUHlyDPvzoOai8eBtQCD+8huZ4peTgeysuSQjsLuaLb7W/HpEK5NI8X03uKFUA+K
         5w1j5govKn1Vt0RqRP2mDVeuOyS2gY6HiRyPHwUbFH+6KNNatplu3hdAWN/+RJS0y11U
         +ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qD5gnbnauLJcvCFwpm5TOqJxHL+71By7OVs+td2AyR8=;
        b=Tyr5kyKvZIVL4Wu+adDFJ433c+KC6XlfgHjOi1BE/WOX6EcJ5FT2ljQG0vVUP5KDZO
         EN5gxgx9QLGC6SMpyzFqxQ3UuWT5k5HIJmKic8EQKZ6djPO/zGIW7DwvAfDwpihip6sL
         dkyumCtyMkRYDT/et6B3oUonnmIm1RsgXp8BTK7Jxt12hMMIOk1jvxbgKWySECSW3uL7
         eElCffD8m9JFkMILrOf0G2cFaUz3rnylXK8eMad+ZYzP5BzuO05uh3skXMETswvUv8Ip
         54ba/nTjlxH0lc3SVUdfqBiurhN75mUQjrs+EVgljzzmUDfXT6LPmP+PfcDnC9B864Y3
         JBrA==
X-Gm-Message-State: APjAAAXAT1DQckfNHXzsKEVR5OkXUVSUhuKis9QCHHu8BsgOglPZLeCU
        s51GHq6RIgz5aiQjhO9pv7tBUMFLVIMeDq2diM8DOnAUzkSWEA==
X-Google-Smtp-Source: APXvYqxzsGy48mltBoNCU2reRcmCI3LKjisbeAHqxpOrtlt8e1vgF25mK1LqFpyoFDbTCc3cUepCq2buCveddLyikMs=
X-Received: by 2002:a1f:c982:: with SMTP id z124mr358041vkf.6.1581333558182;
 Mon, 10 Feb 2020 03:19:18 -0800 (PST)
MIME-Version: 1.0
From:   Amit K Bag <amit.k.bag@intel.corp-partner.google.com>
Date:   Mon, 10 Feb 2020 16:49:07 +0530
Message-ID: <CAANRJtzBpw__m0ymcXJu1VhYhGcVT=AkLYpwHaahT=F4xKo+Wg@mail.gmail.com>
Subject: OPP throughput is low in ubuntu 18.04
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello All,

I am tring to test the OPP throughput in linux.
I transferred between 2 machines having ubuntu 16.04 with bluez
version 5.44 in that I am getting 1.4mbps speed.

Kernel : 4.14.13
OS : ubuntu 18.04.2 LTS
Bluez -5.44

I am using a 12 MB of audio file.
But the same file when I transferred between  2 machines having ubuntu
18.04 the speed is significantly reduced.

Kernel : 4.18.0-15-generic
OS : ubuntu 18.04.2 LTS
Bluez -5.48

Could someone tell me why its reduced in ubuntu 18.04
