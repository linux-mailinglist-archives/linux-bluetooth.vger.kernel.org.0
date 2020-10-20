Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1712428A70B
	for <lists+linux-bluetooth@lfdr.de>; Sun, 11 Oct 2020 12:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729784AbgJKKoH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 11 Oct 2020 06:44:07 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48479 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbgJKKoH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 11 Oct 2020 06:44:07 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 69F1460008;
        Sun, 11 Oct 2020 10:44:05 +0000 (UTC)
Message-ID: <6d428fa88c83a38e840f7fbbefc132747102d29a.camel@hadess.net>
Subject: Re: Bose QC 35 Battery/ANC Support
From:   Bastien Nocera <hadess@hadess.net>
To:     Peter Mullen <omaolaip@tcd.ie>, linux-bluetooth@vger.kernel.org
Date:   Sun, 11 Oct 2020 12:44:04 +0200
In-Reply-To: <333e38b3-da26-e3c6-76fb-1ee1caf90299@tcd.ie>
References: <333e38b3-da26-e3c6-76fb-1ee1caf90299@tcd.ie>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sat, 2020-10-10 at 22:00 -0700, Peter Mullen wrote:
> For battery level integration, I've basically just wrapped the dbus 
> interface from the standard GATT battery profile. This has been
> working 
> fine with my DE; the battery level shows immediately after connection
> and updates as the level drops.

Glad this works. I'd like to eventually look at the code you have so
far for this functionality, so don't hesitate to share it.

Cheers

