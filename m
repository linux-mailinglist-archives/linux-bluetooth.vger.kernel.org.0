Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79BD2784EEB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Aug 2023 04:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjHWCyT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Aug 2023 22:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbjHWCyR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Aug 2023 22:54:17 -0400
X-Greylist: delayed 919 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:54:14 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACAB1B9
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Aug 2023 19:54:14 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-fe-64e55c554735
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 7F.D7.10987.65C55E46; Wed, 23 Aug 2023 06:09:42 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=aHKYbOapaM9gAJCuV6U1Z9AgbojGyPpvwYcxGb/YMxdy/fwmrkW6YkjJVJ50I68Br
          UPsOq8aWo5DDqpMoVGu2+5vapGJPChjiMxd6FRman0VY//6pcKUjqXnsVLtutakli
          yJpEikLbVWDQ1j15Irb0l0bRzjWE2CHr0N8wg42KM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=Szg6dPExtKGoOHRPqxEKBzBE5gJZJUqs+CZdSgHEP0qRWAfW0fm9XM5iS6c/tkO+9
          UIF3vfnXmt+oRxIIlXG42j/iw6ePqLJ0r1zRASJcqOIP375o+zsNLo3y4r2KAaCU4
          RsjTBq4uM9odWe8RTuVcpvbc+5jGnq7czp3jsUl1w=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:30:58 +0500
Message-ID: <7F.D7.10987.65C55E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-bluetooth@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:13 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGWzcs5mmKwfml3BZzrvUxOzB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhIHN6+hbGLkYtDSGAP
        k0Tfgc9gDovAamaJG3e/MkM4D5kl7t1pZIIoa2aU+N33iw2kn1fAWqL/1HF2EJtZQE/ixtQp
        UHFBiZMzn7BAxLUlli18DTSJA8hWk/jaVQISFhYQk/g0bRlYq4iAssSzfYfBTmIT0JdY8bWZ
        EcRmEVCVuHJ9LdgYIQEpiY1X1rNNYOSfhWTbLCTbZiHZNgth2wJGllWMEsWVuYnAYEs20UvO
        zy1OLCnWy0st0SvI3sQIDMTTNZpyOxiXXko8xCjAwajEw/tz3ZMUIdbEMqCuQ4wSHMxKIrzS
        3x+mCPGmJFZWpRblxxeV5qQWH2KU5mBREue1FXqWLCSQnliSmp2aWpBaBJNl4uCUamA8wfJg
        xbWTQW1iabdmnGlblJQf0pPeGC700NSNqVRM0sBAqve8ylbpU4svbwoQ5Hvl//dTm0Kf1Dq/
        hQf3z/91V///ueftHXqVupziO3bszVf4NaODUU1B0CTteMjk/6WTSwQ+B5tr7nXikX3/JuCk
        t9fmuxnrDV5pKIpdLmrh0ciTf7Jqz3clluKMREMt5qLiRADEMQypQAIAAA==
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

