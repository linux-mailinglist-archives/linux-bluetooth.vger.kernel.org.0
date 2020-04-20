Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDE11B19B7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Apr 2020 00:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgDTWnJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 20 Apr 2020 18:43:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgDTWnJ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 20 Apr 2020 18:43:09 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8CCE206F9;
        Mon, 20 Apr 2020 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587422589;
        bh=RnvO8UKzq1d3ZcywucfAXSFVurw2n01HaZZFpZi1Qjk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1GXy+Z5Jp9fXp5ZhlcxIqBsb4xoEOUTaDW5icjEyvKWtE9mcqLzg+L2duiiKIuH7L
         paubaQd+/lOisE7sWxnFksu9CaNm6fCQ0Wu98UIEnmp5vkOFFvP52JNlMMfflZuJtU
         1h2TYiUWHy7suBQjBZ1h1g+kxRMs1YdMBiAoJP8w=
Received: by pali.im (Postfix)
        id D023B8A3; Tue, 21 Apr 2020 00:43:06 +0200 (CEST)
Date:   Tue, 21 Apr 2020 00:43:06 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH] profile: Fix reporting error message when connection
 failed
Message-ID: <20200420224306.vmtydk5ylubs2dvk@pali>
References: <20200419211058.31987-1-pali@kernel.org>
 <CABBYNZLO+o1XiY7bo0epOt-hOQ+SSFKBiCjcKv4e+xkTfBYWGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABBYNZLO+o1XiY7bo0epOt-hOQ+SSFKBiCjcKv4e+xkTfBYWGw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Monday 20 April 2020 15:38:43 Luiz Augusto von Dentz wrote:
> Looks good, but lets have the btio changes as a separate patch.

Hello! Do you need from me to resent this change again split to two
separate patches? Or will you apply it directly?
