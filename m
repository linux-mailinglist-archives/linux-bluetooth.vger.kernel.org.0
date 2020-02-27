Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD437172878
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Feb 2020 20:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgB0TTZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Feb 2020 14:19:25 -0500
Received: from mail-vs1-f51.google.com ([209.85.217.51]:37063 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729418AbgB0TTZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Feb 2020 14:19:25 -0500
Received: by mail-vs1-f51.google.com with SMTP id x18so392182vsq.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Feb 2020 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtrN3bQd6wmY0yaOzacXdNqcE2dDsGAdaw7k83jw7OI=;
        b=d+7QTa+4BtSEngozxZu0e+Mk6d5uXGqg0KQXDUKzNExHKx0oqSEcjQ3sgI7Ha3Cxj8
         5mm85zolvDfL+cqcOAIDQ2N5kJKIN3Rp1lUsfawhAKuythdqB6WRsKXXel/IlFOVnDZu
         tAEih3ZVGAaSk6yAmx/zPO92oGzkCatY1/uik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YtrN3bQd6wmY0yaOzacXdNqcE2dDsGAdaw7k83jw7OI=;
        b=sFT4rGn47CerR7GN/dSmMa8IWelgL8M4nDSO+fULyXH/cR4HA9oCT50VoFdGVQZIOU
         Dple0CFt3f72etT4VgvkMRjdEFJoF3OifUcm4MdJU92/LOI1srEyIFbYdLc8K3y70ZNc
         Bt+HiV6kZiUg482MjGGduEM/5q7jr08/JRepBD/dqNiays10WAt/W1NOODZDz/LiEc0k
         BSD3Tt9RE9NDsvoYi9CmLhNjAyUK4QkG8P+/gW1V4HwhXh7Lkx/P7SYTaxjkT6GwGuK0
         32uutPvMFWi3vq3NCkZfy7yYINhgf7C2rHidlDY7+/2AwIjMy6BRgjZkDEI/mqVeswwK
         lU0w==
X-Gm-Message-State: ANhLgQ3/uT23pKh44ytAgSHkULMnhphcWFnl85moU/feLuImx3lktfwG
        Wg9BhEds8WrrGcj/NmplB1p8LaDeoGQ=
X-Google-Smtp-Source: ADFU+vvOG6YkGIqQEEg9DhE0Z7aopAWhI7nzmGrrp1qUjeqVSDii6/Sxn1TAMhFtm2vda0QPdhxspg==
X-Received: by 2002:a67:e9cc:: with SMTP id q12mr507325vso.173.1582831163752;
        Thu, 27 Feb 2020 11:19:23 -0800 (PST)
Received: from alain.c.googlers.com.com (39.119.74.34.bc.googleusercontent.com. [34.74.119.39])
        by smtp.gmail.com with ESMTPSA id n24sm1984140vso.34.2020.02.27.11.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 11:19:23 -0800 (PST)
From:   Alain Michaud <alainm@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Alain Michaud <alainm@chromium.org>
Subject: [BlueZ PATCH] Adding missing Phy Configuration bit description.
Date:   Thu, 27 Feb 2020 19:19:19 +0000
Message-Id: <20200227191919.119429-1-alainm@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This change simply adds the missing Phy Configuration settings bit
description to the Read Controller Information Command documentation.

---

 doc/mgmt-api.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index 1e59acc54..a5a98609d 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -307,6 +307,7 @@ Read Controller Information Command
 		13	Privacy
 		14	Controller Configuration
 		15	Static Address
+		16	Phy Configuration
 
 	This command generates a Command Complete event on success or
 	a Command Status event on failure.
-- 
2.25.1.481.gfbce0eb801-goog

