Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01A5373AD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jun 2019 13:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbfFFL7O (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Jun 2019 07:59:14 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:41613 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbfFFL7O (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Jun 2019 07:59:14 -0400
Received: by mail-lf1-f41.google.com with SMTP id 136so1321550lfa.8
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Jun 2019 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMMiwjAlMh6MGR8worNddSzah23ku1550J8bzwy/Gxg=;
        b=1/hjtpNcwugk5Bd3/5XwmN0UqYOyRJ3S9ONb3FUXLirBzkpKpuAXWrwsgHzkhIi43B
         7wSODec5hieOR6Cwi6bOnhYGiEiFbFSq2FwKy5h5gDDis+AmMe/iN3ogyBpuANpeMt6b
         9Acpty5UMe7NqgZ/byw+h6XC7DfMCwna8Qeh2cOmnPu9Z9ZvHCEhJ1PSxU4d+OLAF4lO
         KZHosa95cEAK6SPqa36C2IcfC8lZmzDAeb+WsRsjM3ZYI+iMbMgqngvukOak/Rte3t6x
         qplXh5wm1Z3QwexNTwOcf0NKWDbZHA7IAM5scb5TwP5r/unGRmr06N4K03So51ikKzdi
         sr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMMiwjAlMh6MGR8worNddSzah23ku1550J8bzwy/Gxg=;
        b=Ktc5l55NJk3djFQPNnaeJ+M/ZdsF5XnTM/5Z8YQXkkH3ELwh9pPnW9MSYf+1OoxO1N
         1TsQ9LsReVVNwf5nYcrCzNA0VZbymnikVdaGCNJb/ycxKGQaXvHk2X6EGRdoaoxqKxDC
         aYJ4FSYwL61BORYdgVKREV7XwnwOdYIr3YjRxr2o3YAqe+QQdUaQkkQ/E4UC5dWI0h17
         PQLLi2p8NjOykA3lnftnMA7n3i4Dj5d4CGMXo3Ir7iC2NEKFvL7PfSUMSqrcA37L5enW
         iecRxF7EJdeiRJ5SoV4G9oFtMV6xpetHCXMSurKVXDjvLB5CLyxb9weLzj3ihF921/mV
         HLCg==
X-Gm-Message-State: APjAAAWtyfUt5fN82VlidiGKk3LegGmDea8qxBdoz3k6u7R3stLEPM8b
        OKDAZ+0NP2CqJ97SvIccrebMdihc7VaoVA==
X-Google-Smtp-Source: APXvYqxBu2whUL7ifjF3etwNxQ00f/H7HOJ9Vs6ZeZzcgCB7XrNKcePCF3wEwOfZNnH+nCT774kX9A==
X-Received: by 2002:ac2:410a:: with SMTP id b10mr6892410lfi.175.1559822352199;
        Thu, 06 Jun 2019 04:59:12 -0700 (PDT)
Received: from localhost.localdomain ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id d5sm262170lfc.96.2019.06.06.04.59.11
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 04:59:11 -0700 (PDT)
From:   Jakub Witowski <jakub.witowski@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 0/1] Fix segmentation fault after adding second network key
Date:   Thu,  6 Jun 2019 13:59:05 +0200
Message-Id: <20190606115906.9262-1-jakub.witowski@silvair.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Segmentation fault occured when we want to add second network key via
NETWORK KEY ADD opcode (0x8040). It was caused by passing 'subnet' pointer (which was NULL) 
to the start_network_beacon() function.

Jakub Witowski (1):
  mesh: Fix segmentation fault after adding second netkey via
    NET_KEY_ADD opcode

 mesh/net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.20.1

