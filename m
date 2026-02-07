Return-Path: <linux-bluetooth+bounces-18853-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAIPK40yh2lIVAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18853-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 07 Feb 2026 13:39:41 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90F105DE5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 07 Feb 2026 13:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE330301B73A
	for <lists+linux-bluetooth@lfdr.de>; Sat,  7 Feb 2026 12:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F88133EB0A;
	Sat,  7 Feb 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XULze71H"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A218A6DB
	for <linux-bluetooth@vger.kernel.org>; Sat,  7 Feb 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770467977; cv=none; b=bZd9DUP80XD8qq65996yFh9OCfG2wS1TM3yxsldj2nShGxdfdWgsiRkl/6BABr8595TbMAbkRdm2TIfA/s9L7f8G4Q3vPJALbway4DzwrBWq3QgnZdIlmFi59CONS9ByYve/3GLhDESOz+UXqRoIj/EXrVgVw3+ECTBICvNo1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770467977; c=relaxed/simple;
	bh=Z9Qtc1qVI1SJgRNRI+tG2NnnOAMOJicAv6f3S7JQ154=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=TfMiLi9jvOpjlbGNE7uW4nqOfemExGkxGvFk7Hc3CaoMKucGmq9yIr3GxiO9H3jQvf27889e40deThk9MMZphNpyvZ/M9pWCHNmYOOaoeiOAxu9zJ4E4CVJQVpI4D11VVo+ltb5fDeG50FQxgkmZvl6Y3D8y5136XY5aXyeH2ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XULze71H; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1249b9f5703so2078224c88.0
        for <linux-bluetooth@vger.kernel.org>; Sat, 07 Feb 2026 04:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770467976; x=1771072776; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p/NLsrt7SyLrEt51rWpZKLITN38xNp0R7+px11V5M8A=;
        b=XULze71Hn0PGOapkFJwgqAb/1DiIKovcNEWc5jBGwv2dlHTdQsdLthDlL1SpS9bfXo
         UFGuHN0314qejZIygl5GO5lWHUuSuYAP31h7TJAkRrvTyASfFdpPyW4wowVwO4v8c5Ju
         /3nNm0Q4RSI/50jly8p2wrEDRQLO/+3dv5tv1ErLQuIhkZAXCexCBaxswPHoYpY/qiqZ
         1H5KBngmbmILjknkOVVXiP8fTYqeoP+U36OHNpfsaONmCw6WucyFe8LANr0jqnFHjOPP
         u41HN9QnQWeIXxhFiWYXD8G664q27Cparx5tvPpg4AtSOTSw9QmgB75+YRj9FDjWvUeZ
         POFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770467976; x=1771072776;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/NLsrt7SyLrEt51rWpZKLITN38xNp0R7+px11V5M8A=;
        b=DT5+7HawoWB0fCmlL7UFQjZFMxdNANP7F6e3NotgaYgQH85nz1aZUoylyBCIaCUEAT
         EOcAAXOYwrUY3VI2GCqWRm8MyY02epe2Gz0JMn4AOSqUBOyupDTFNUcKngP2nq0MfzCt
         8K2j/RhrN9RmeIkm9Msd3jQb+d0aUFz2HhmtGngyBjFttdc56qukSywPHZt6AmYc4Tdo
         jq8TSDzaN9GA7oNCPa+ictv5QnVdzyE5gYbg4MapOS5Ywm9BOtqmOjF8Nwv3Q3BG9gFp
         I1lyr+a7i0sQm487fqFiTEsIJNxJKkRIAhcx+6OVhykdCMebwKzuPPlyQuAk5dKNE90n
         X1fg==
X-Gm-Message-State: AOJu0YxK5hAcfbK+XFIddJ0e+tJksZPj9eC+Ezu0k23GZWHGLRMkLfLT
	qO+22ZtXephZ+JBagKk+dDZNtMXGS/BbTa9CzolIpxyiSKj5aGGqc5jPVbs44Yoa
X-Gm-Gg: AZuq6aLrae8TKvdQkqJrA819CspBSntQtZlrw4B5FuYaFVW1OZOV0AriOqU4Ylrcxi3
	1rvLpa4FJnzBdgYETZ4BmzPkkkc0Tja2En4XxxobB5mnQNlCkXvkcK7n3s8OoWJE3EFBmMz7B62
	gDUwuT+FjsDHIKnwR7Nx46tAVlAfq5Kg2gm0/kmYeVZaTWoCRQ9gA9rm0wDG0F932g90X6LSZlm
	gkOpu6HdUpfalLHBA62a4g1okpLsvVHcdKDPMIuknF/tR6WyU+Xj29iDd/W0WBY6MAee6XxtC27
	M6NLikQ0gbnVZm/vsHdR3WJW2KoGEQxg0gp73ymhBgiWPLCEmSzLTiGdwfPuJ1e72O8RTZinFjJ
	PWuUrr5kDb8DN/CqIiufVerqOdbDA23oKtJdm1qp1JoUjAwz1mHSS3yFyjTStN+AJaVVZfOvS1o
	N2L8TZRtAJWgIF678akgabO0fSAQ==
X-Received: by 2002:a05:7022:7a6:b0:11b:9386:8264 with SMTP id a92af1059eb24-12703fec496mr3331443c88.41.1770467975731;
        Sat, 07 Feb 2026 04:39:35 -0800 (PST)
Received: from [172.17.0.2] ([40.65.59.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm4861854c88.2.2026.02.07.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 04:39:34 -0800 (PST)
Message-ID: <69873286.050a0220.105a6c.d129@mx.google.com>
Date: Sat, 07 Feb 2026 04:39:34 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2491549647183257793=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, rudi@heitbaum.com
Subject: RE: src: retain const qualifier from pointer
In-Reply-To: <aYclgBGSNj0peBdM@f3de6192b473>
References: <aYclgBGSNj0peBdM@f3de6192b473>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18853-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,mx.google.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:replyto]
X-Rspamd-Queue-Id: 0A90F105DE5
X-Rspamd-Action: no action

--===============2491549647183257793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1051861

---Test result---

Test Summary:
CheckPatch                    PENDING   0.41 seconds
GitLint                       PENDING   0.36 seconds
BuildEll                      PASS      20.17 seconds
BluezMake                     PASS      653.50 seconds
MakeCheck                     PASS      18.47 seconds
MakeDistcheck                 PASS      242.36 seconds
CheckValgrind                 PASS      293.78 seconds
CheckSmatch                   WARNING   350.62 seconds
bluezmakeextell               PASS      181.16 seconds
IncrementalBuild              PENDING   0.38 seconds
ScanBuild                     PASS      1020.78 seconds

Details
##############################
Test: CheckPatch - PENDING
Desc: Run checkpatch.pl script
Output:

##############################
Test: GitLint - PENDING
Desc: Run gitlint
Output:

##############################
Test: CheckSmatch - WARNING
Desc: Run smatch tool with source
Output:
src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============2491549647183257793==--

