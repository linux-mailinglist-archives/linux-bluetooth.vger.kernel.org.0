Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0983C2001D6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Jun 2020 08:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgFSGJF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Jun 2020 02:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgFSGJE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Jun 2020 02:09:04 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA0CC06174E
        for <linux-bluetooth@vger.kernel.org>; Thu, 18 Jun 2020 23:09:03 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id y1so6380023qtv.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 18 Jun 2020 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=64ZNQKwneDS2S6nqyl7e8XhF1k+HyHascClr5duT9XQ=;
        b=TF9PqV3aDrf/8l77OrWsxr6hSJvhp/jg+jPbUQGndwNsxCgiFst6xH7n0y117xNA06
         YAi8eIqyyAjoaslLcLQloSU96HOluHQbPwv60N07q3Coitl5JjCEmxSxZzibr9sYWkUh
         y4z6QbR5qqBcn77Nkmm4S88aj9xMsmxGQkrFkOq98vvCj4wOHk7pW3Aab3l/ajvVrOXI
         AzgJ9ntg/UTPfnTmsTS7NkRVQ9rBdXJ4skPINSjOoCH6XZ4Y/2Q2gbtcbjtcicGCurb3
         pBgZhgWjup8C7PKWWSP6SCcgaobJpRLI7rgTcdM3euY0sS9KPtgItvNFGXBhL9R2AUSj
         qHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=64ZNQKwneDS2S6nqyl7e8XhF1k+HyHascClr5duT9XQ=;
        b=QRH6dHL23erjo0gT+Ff8ZhMzAph/aDNncIXCMOpUE/z8b6cdZc7prfnlYvZQF+JIGG
         cs1FN6fA1J858dBnYZAjjt2CJXaklTeyRsfNTKCpodLGq3VqST0REIPo+Guxr+wVv4dj
         YR+8vQ3dmkXy9CmqaCD1udp1Gi3AquIFBwGKIMonC3tWq1Ql1wB+TMtknnz0f1BrX+8g
         DLQH8b9Ir8Gxs4rgQp9LT+DHfvKG1fNxl7niXPnuxgNf8+CwiEgVE08PosI0OzzkssKG
         oSfCdr8JQx4pH/ZwAAvho0TPOFyK1D1SI0GvIHHxoC3plkaGt4KAuzMzrXDpKSnngS/Z
         Iiow==
X-Gm-Message-State: AOAM532qGilzpzUOD+pNY02/BpxepctwQfAttpLhqw5j7kxVTNtRMxbi
        hABsWHmhAQdvLJEtj89fukkuoZlu4bQ=
X-Google-Smtp-Source: ABdhPJxm040bX5Vt1rxV17CaMT4d28f7MIJ9mAlQoSv99VDLSmuGg+6Hj1LRtFSybeYIqEUB2xmhAg==
X-Received: by 2002:ac8:1381:: with SMTP id h1mr1861084qtj.195.1592546942611;
        Thu, 18 Jun 2020 23:09:02 -0700 (PDT)
Received: from [172.17.0.2] ([52.167.0.124])
        by smtp.gmail.com with ESMTPSA id r125sm2353851qkb.42.2020.06.18.23.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 23:09:02 -0700 (PDT)
Message-ID: <5eec567e.1c69fb81.ba63.b98d@mx.google.com>
Date:   Thu, 18 Jun 2020 23:09:02 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1799024146932291484=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, tedd.an@linux.intel.com
Subject: RE: [1/2] midi: Fix SysEx parser in MIDI plugin
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20200619060153.65114-1-tedd.an@linux.intel.com>
References: <20200619060153.65114-1-tedd.an@linux.intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============1799024146932291484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While we are preparing for reviewing the patches, we found the following
issue/warning.

Test Result:
checkpatch Failed

Outputs:
ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
#38: FILE: profiles/midi/libmidi.c:348:
+	while (i < size && !(data[i++] & 0x80));

ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#59: FILE: profiles/midi/libmidi.c:395:
+		if ((sysex_length = sysex_eox_len(data + i, size - i)) > 0) {

WARNING:LONG_LINE: line over 80 characters
#72: FILE: profiles/midi/libmidi.c:446:
+			if ((sysex_length = sysex_eox_len(data + i, size - i)) > 0) {

ERROR:ASSIGN_IN_IF: do not use assignment in if condition
#72: FILE: profiles/midi/libmidi.c:446:
+			if ((sysex_length = sysex_eox_len(data + i, size - i)) > 0) {

- total: 3 errors, 1 warnings, 53 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: Ignored message types: COMMIT_MESSAGE COMPLEX_MACRO CONST_STRUCT FILE_PATH_CHANGES MISSING_SIGN_OFF PREFER_PACKED SPLIT_STRING

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.



---
Regards,
Linux Bluetooth

--===============1799024146932291484==--
