Return-Path: <linux-bluetooth+bounces-308-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED97FF0A5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Nov 2023 14:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10D81F20EDE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Nov 2023 13:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DE3482E6;
	Thu, 30 Nov 2023 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CBE194
	for <linux-bluetooth@vger.kernel.org>; Thu, 30 Nov 2023 05:48:18 -0800 (PST)
Received: from [141.14.220.40] (g40.guest.molgen.mpg.de [141.14.220.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0E41C61E5FE03
	for <linux-bluetooth@vger.kernel.org>; Thu, 30 Nov 2023 14:48:15 +0100 (CET)
Message-ID: <352db44d-7ed9-48ee-8f44-1fcd0e75768c@molgen.mpg.de>
Date: Thu, 30 Nov 2023 14:48:14 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-bluetooth@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: BLUFFS: Bluetooth Forward and Future Secrecy Attacks and Defenses
 (CVE-2023-24023)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linux Bluetooth folks,


Probably you are already aware of BLUFFS [1], published on November 
27th, 2023.


Kind regards,

Paul


[1]: https://francozappa.github.io/post/2023/bluffs-ccs23/

