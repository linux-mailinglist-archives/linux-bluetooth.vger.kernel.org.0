Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD91C727C
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 16:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgEFOKT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 May 2020 10:10:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:58537 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgEFOKT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 May 2020 10:10:19 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 86084240014;
        Wed,  6 May 2020 14:08:26 +0000 (UTC)
Message-ID: <a4650a5e465c23915d951b296ca86de9f2d91b44.camel@hadess.net>
Subject: Re: [PATCH] build: Add option to disable battery profile
From:   Bastien Nocera <hadess@hadess.net>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>
Cc:     linux-bluetooth@vger.kernel.org
Date:   Wed, 06 May 2020 16:08:24 +0200
In-Reply-To: <4A9E7F0B-4AB8-4330-BB2B-1A0EAA4EFDE8@holtmann.org>
References: <20200501215352.23858-1-sonnysasaka@chromium.org>
         <4A9E7F0B-4AB8-4330-BB2B-1A0EAA4EFDE8@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.1 (3.36.1-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 2020-05-06 at 13:24 +0200, Marcel Holtmann wrote:
> I have a little bit concern splitting this since battery service and
> HoG are kinda connected. Wouldn’t it be better we have a cleaner
> interface. Maybe we should actually integrate cleanly with
> /dev/upower or similar.

Wat?

