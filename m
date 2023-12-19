Return-Path: <linux-bluetooth+bounces-670-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F8581910A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Dec 2023 20:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FC51C24FAA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Dec 2023 19:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259963985A;
	Tue, 19 Dec 2023 19:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QM/hWDAr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF053984A
	for <linux-bluetooth@vger.kernel.org>; Tue, 19 Dec 2023 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-425a3cdbda9so236981cf.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Dec 2023 11:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703015572; x=1703620372; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvjRjK/crBU8Z/z/3pDUmXaaKRR/02XeH/BuAoLaCyU=;
        b=QM/hWDArp7GKZApXhuoK0fmVe71spn09uCl2V5saNLyY299ZwvbKFzLM0xkZPGi2hj
         THrBSxRfRh713q+Bpxp1yAl2gvXpMQ4e7sSaWYQykb9ue82kls76bLs1etDhc+R4n6It
         NlWkLwYBtodjgtGoNkBvbbYId/+2AHT5yAEtYcR20kE6szpLfvtCSTM3Cz9DKc6esDBz
         sgyr/QCL/QoeCpPwAEZmSnreVsq58gssEDzgwvskiNjoDAVB4Q8E5UbLdr8Fm37SiKLY
         OpHL2ax24VmzQcjELlzlxe61lqXIwa+vunFzoPgV3xyaWb+BG+siwJ/PNPhGpimf9AbU
         PTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703015572; x=1703620372;
        h=content-transfer-encoding:subject:from:to:content-language:reply-to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvjRjK/crBU8Z/z/3pDUmXaaKRR/02XeH/BuAoLaCyU=;
        b=AQkxjfSJdMRLip1f9MQ/+cAG2iy3TPJQn3UQSA6QlxK2zfYr6Pd9FNezXbFfuwBCn2
         Rvd1BzBctXBzMiPX6qJnoZjpK1+V3RXmJb/V0qjw2DlOaZicujVDV2q7xEiWkRo4qc+1
         p52cpOXJvyQc1uUjSzhws/m2/ZWxgUbE+szr1qc8ZwfQx4YdyULzHhdXuMQLLmH/2ixe
         XkiNg+yF35xJwbqf/RcVMoJoNCIP9921WEhmintZPfqyNa9aYil7iztP/FcOKWKkSyN5
         Ro6SksxO82lfev5Jhu/OHsblOArMaiY/aWXUk7q12j2iW5M2vCFNnRpH2ZGvfp00Wm7s
         urSg==
X-Gm-Message-State: AOJu0YzrBnzOAqGSYjc0gcw94obnr63gS/UrkWVMo5ul8PFrMlj3adX1
	Pg6x9gf/lgbb8tEwbMl+2nWgn50gM2Q9iw==
X-Google-Smtp-Source: AGHT+IF2lL+gDUSI9K17z5Uar7SSzRR5TYP8+K8wI+BSI9Y2RGAOdj40f7nty0nxk7+xkcOz5JEQcw==
X-Received: by 2002:ac8:7f08:0:b0:425:4054:bc5e with SMTP id f8-20020ac87f08000000b004254054bc5emr2258686qtk.58.1703015571863;
        Tue, 19 Dec 2023 11:52:51 -0800 (PST)
Received: from [192.168.0.101] (pool-100-2-46-216.nycmny.fios.verizon.net. [100.2.46.216])
        by smtp.gmail.com with ESMTPSA id fh3-20020a05622a588300b00425b356b919sm9358095qtb.55.2023.12.19.11.52.51
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 11:52:51 -0800 (PST)
Message-ID: <976f20f9-d711-49a6-abde-12a25088d795@gmail.com>
Date: Tue, 19 Dec 2023 14:52:51 -0500
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: polinsky@acm.org
Content-Language: en-US
To: linux-bluetooth@vger.kernel.org
From: Alan Polinsky <alan.polinsky@gmail.com>
Subject: the setup of Grado GW100x has failed
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there. I am a retired computer programmer who has recently purchased 
a Grado GW100x pair of bluetooth headphones. I have an older Dell XPS13 
computer dual booting between Windows 10 (rarely) and 64 bit 
Slackware15. If I boot into Windows 10 the headphones connect perfectly, 
but under Slackware I get the message: "the setup of Grado GW100x has 
failed". About a week ago I installed a new version of Bluez from 
Slackware but the problem remains. I don't know how to even debug the 
problem. People at the LinuxQuestions forum suggested switching from 
Pulseaudio to Pipewire, which made no sense to me, but I gave it a try. 
I get the same result. Perhaps you can help.


Alan Polinsky


