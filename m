Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A547E2C8B6
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 May 2019 16:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfE1O1I (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 May 2019 10:27:08 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:33867 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbfE1O1I (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 May 2019 10:27:08 -0400
Received: by mail-wr1-f47.google.com with SMTP id f8so20505138wrt.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 May 2019 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=66fegvF4oiu4Tco06DeNgmwjqueSk4MYbxZYf4jr3HA=;
        b=Qblm786WRb598E1gH4NJAFTvk2Eu+xRCCECehX0lwoq+gd5woU+kdWDKqmMC4i4V87
         5FIeu2t5sYK9R9Xx97hlcj1W19PXUpaTBx+PVEREGT3vayxUaKFWDIXUjYm1zKLB691V
         3gRcnNO40f5fJjOEuk4NdfDEmgFjuTqAgFryq7olKzbqb2pxeia3qBl5XxGU/Wii+11L
         +BF4yZMxdmuxRUKS811y1hQ/zWc/wM9vg0jyVqETOci9ZtLVpOpI/EI91pRvDMn4JJFK
         ST41cfEP5+qXOsot0kO7pV1I1nenKBFWLqNBBpZXKfL7AnkRMI+B4Ly7x+0sYrd0jD3R
         ap3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=66fegvF4oiu4Tco06DeNgmwjqueSk4MYbxZYf4jr3HA=;
        b=mcAVB1swA6I4vrb2PDqpnoAagqQV8Vifcnwr3J3ZnoVh480boTYVL0vOoOyhZPyxPR
         hjdMYLAnKqBzOGV4Hx2Ci8IDaEgi4FCjz+gGphv6Q3Un2437tg4TNTKYmgKEvnBaRQSp
         Pa0VhyKlRG55JWLuRZCqhmc7mExlFcOkjfmbf2qgbj2a5W4xTKXUxFF789r+ZGwekapd
         8P4v0bM0XfxPlnhMd/A0F2OoF3aM88X/Q082GgTiJphvzm5icCEwzFyfJn4VqFKlwZpj
         0LQam6YGwc79QueTltf2zqqU2W8zmaOeZ8hWmecqkjf1diqx+7yHdz6BoWhPOgUxvnS1
         D5Nw==
X-Gm-Message-State: APjAAAUIyEbLuACy+8GMbg5viE+7VLBF/9NHd1jSmk3NcZM9tMOax/3F
        RY1/Ph6dHn6nOuQAxXPs98oAbcDOnUw=
X-Google-Smtp-Source: APXvYqzc1KxOytz1+EsfIwQeMzLG8XDfSGgMW5z2BM/XuBSW0SBMZyTXEFZP48//n3d+F2+3nsQ8mQ==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr11798741wrs.172.1559053626366;
        Tue, 28 May 2019 07:27:06 -0700 (PDT)
Received: from [192.168.1.10] (93-34-147-76.ip50.fastwebnet.it. [93.34.147.76])
        by smtp.gmail.com with ESMTPSA id r2sm3490673wma.26.2019.05.28.07.27.05
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 07:27:05 -0700 (PDT)
To:     linux-bluetooth@vger.kernel.org
From:   Matteo Formigli <matteo.formigli@gmail.com>
Message-ID: <c29b94c3-732f-e9f6-9593-01c89dd0b2f3@gmail.com>
Date:   Tue, 28 May 2019 16:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

intro linux-bluetooth

