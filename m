Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F05B028C82
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 May 2019 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388028AbfEWVmP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 23 May 2019 17:42:15 -0400
Received: from mail107c40.carrierzone.com ([209.235.156.189]:54964 "EHLO
        mail107c40.carrierzone.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387447AbfEWVmP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 23 May 2019 17:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
        s=mailmia; t=1558647734;
        bh=RvxnLaCw4+slVVfU9bE+z0lHtsyZ+0WnESaKlgdNEgs=;
        h=To:CC:Subject:From:Reply-to:Date:From;
        b=g2ARnuGllW3q4635I96N4QE+l8ryWEOsfees6gOYmgAvrLkHmnkYTDEBUKOMIpUU0
         e4+JRPsUn3QIIns8Dgihx6be+uQICUGS17n3QaqA2eiMtJl3SIn6H+z5Tl3D5lkiB0
         hzJgZu9MHh/IlklgAIpy3EBhoIJzI6HyTX/d5z8c=
Feedback-ID: eason@poshmfg.c
Received: from mail107c40.carrierzone.com (localhost [127.0.0.1])
        by mail107c40.carrierzone.com (8.14.9/8.14.9) with ESMTP id x4NLgDGr012901
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-bluetooth@vger.kernel.org>; Thu, 23 May 2019 21:42:14 +0000
Received: (from webmail@localhost)
        by mail107c40.carrierzone.com (8.14.9/8.12.2/Submit) id x4NLgDjE012897
        for linux-bluetooth@vger.kernel.org; Thu, 23 May 2019 17:42:13 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     linux-bluetooth@vger.kernel.org
Subject: Question about using getFile
From:   Eason Jiang <eason@poshmfg.ca>
X-Image-Url: http://mail.poshmfg.ca/api/storage/eason@poshmfg.ca/profile/picture
Reply-to: eason@poshmfg.ca
Date:   Thu, 23 May 2019 17:42:13 -0400
Message-Id: <1558647733.fsqujj2uuc8wkogo@mail.poshmfg.ca>
X-CTCH-RefID: str=0001.0A090210.5CE713B6.0008,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC:  0
X-CHA:  v=2.3 cv=Oc628CbY c=1 sm=1 tr=0 a=WkljmVdYkabdwxfqvArNOQ==:117
        a=IkcTkHD0fZMA:10 a=E5NmQfObTbMA:10 a=9Tc-NKJvBMtvFy2OSaIA:9
        a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I used a library called BluezQt, which is based on Bluez. When I wanted
to fetch a file from a remote device by calling getfile function in ftp,
I failed to fetch it. I want to know is it functional? Or does anyone
succeed to use this function? Any response would be appreciated!
