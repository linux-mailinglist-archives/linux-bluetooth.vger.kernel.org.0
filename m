Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FE51B0C5C
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Apr 2020 15:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgDTNPS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 20 Apr 2020 09:15:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49480 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgDTNPS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 20 Apr 2020 09:15:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: scerveau)
        with ESMTPSA id BA8F32A0DCD
From:   =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@collabora.com>
Subject: [PATCH 0/1] add hog ref in hog_attach_instance 
Date:   Mon, 20 Apr 2020 15:14:47 +0200
Message-Id: <20200420131448.21796-1-scerveau@collabora.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When I tried to connect a bluetooth gamepad 8718,
I was experiencing a crash which can be reproduced
always.

https://www.amazon.com/Controller-PowerLead-Wireless-Compatible-Android/dp/B07XJ37HPK

After investigation, it appears that instance was not reffed initially
when added to the slist and double free was requested on this hog during
the free of the slist (unref during a destroy_gatt_req).

Stéphane Cerveau (1):
  add hog ref in hog_attach_instance

 profiles/input/hog-lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

