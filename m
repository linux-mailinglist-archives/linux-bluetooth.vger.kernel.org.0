Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 473221643FF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Feb 2020 13:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgBSMPW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Feb 2020 07:15:22 -0500
Received: from ip-78-45-52-129.net.upcbroadband.cz ([78.45.52.129]:35384 "EHLO
        ixit.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgBSMPW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Feb 2020 07:15:22 -0500
X-Greylist: delayed 318 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Feb 2020 07:15:21 EST
Received: from localhost.localdomain (227.146.230.94.awnet.cz [94.230.146.227])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 675232014A;
        Wed, 19 Feb 2020 13:10:01 +0100 (CET)
From:   David Heidelberg <david@ixit.cz>
To:     marcel@holtmann.org
Cc:     johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        luiz.dentz@gmail.com, pali.rohar@gmail.com, pavel@ucw.cz
Subject: Re: HCI Set custom bandwidth for AuriStream SCO codec
Date:   Wed, 19 Feb 2020 13:09:40 +0100
Message-Id: <20200219120940.1509224-1-david@ixit.cz>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <B6A143FD-717D-44F9-B62F-17CF357961A1@holtmann.org>
References: <B6A143FD-717D-44F9-B62F-17CF357961A1@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello Marcel,

first thank you for reviewing Pali's work.

As I understood you'd like more minimal interface, but since Pali has been
working on bluetooth stack for really long and there is no better option,
would you be willing accept this code?

I know it may sounds like compromise, but no-one came with better solution
in given time.

In my opinion upstream can benefit from already (well) designed
and tested solution, than waiting for messaiah with possibly perfect solution
which doesn't exist yet (may never shows up).

Best regards
David Heidelberg
