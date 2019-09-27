Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD14FBFFDB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Sep 2019 09:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfI0HOn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Sep 2019 03:14:43 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37562 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfI0HOm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Sep 2019 03:14:42 -0400
Received: by mail-pl1-f195.google.com with SMTP id u20so715030plq.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Sep 2019 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=XQF2w0K6Zx8FnaPmkw9BGXSIBsc8lwKZi4J5Yzp6Chk=;
        b=TXP0BkCf3HOUJ35zGPm6ukmmdPCK4JhijRXkB37xUg6+RTEQGmbAc0iKnZBn72Sq8Z
         fgvAEs6lz6CASTpslzkP1ITtRa4QXoaSUlBk7IrFmslcSGzqbG6VIPMkpxkZoF5qa+oW
         aeGVpUjes1gyUIy7/4W1HkqpktHB1+djxXikPgCixbT0F77k+ml1jh+PeUvfOocQjUTq
         xKSQ3hE2jBYT0a3KGL2neismkWaQArOeZVP4HF9tFawodThIXD7pfsQfz5HjYfUq2zCH
         D4FDya/ROAGKXItRqDUqvQH8cdboLKjEyUvWK48Ia7p7b7JvGixxBC9Iimz4jnJ1keYp
         F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=XQF2w0K6Zx8FnaPmkw9BGXSIBsc8lwKZi4J5Yzp6Chk=;
        b=fploDx3HQwYELQcnyAm0NsWUmh8mOGAJpvxxogNHNZzleB9DSjC18hlKpL96t9W0VN
         bTnzEtx6DJmd4pygragx9f/kg+Wp0BoDmKAnmy8YPfb0Jdfoe3KDIhdzO1lhmDy9Z1YK
         571S22moym8saDZZZwBEGauBdKCs3v9namh4s7ZgFMpLJZ6VMqvJ9qz3GarzUb71soZ6
         WA27ZWEng9slr/pBCPHreQMHvb7OV+q6K8dCI49hofHyrWWjhYv0C+BMdXew6DJzKj2Z
         bM1JNFTIsMn1WkAtYOGAweEMosdNRhpJKAcoyAD83Iqh8FL23l+zodhutRI89VmKbkdN
         LyuA==
X-Gm-Message-State: APjAAAWa4PhqN2d3Rop0ZocqyebsuV5zoE+xqgO2B0/4mpLA+gg0nCJp
        Y4/YdS6LLYImfWbPdLcsxnU=
X-Google-Smtp-Source: APXvYqy8EP60OAA4ZD1tHh6ckMkDBwHj+Q1AGdSEtxcF7tXbelJ/G1Udx+PGjKJtRzKVYZxFc1fJnQ==
X-Received: by 2002:a17:902:20b:: with SMTP id 11mr3047852plc.62.1569568481928;
        Fri, 27 Sep 2019 00:14:41 -0700 (PDT)
Received: from robertre-mobl1.ger.corp.intel.com ([134.134.139.77])
        by smtp.gmail.com with ESMTPSA id q20sm1866195pfl.79.2019.09.27.00.14.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 00:14:40 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Add support to use Resolving list
From:   Johan Hedberg <johan.hedberg@gmail.com>
In-Reply-To: <1568802985-9990-1-git-send-email-spoorthix.k@intel.com>
Date:   Fri, 27 Sep 2019 10:14:36 +0300
Cc:     "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4A7F9C6A-9F69-43A2-864A-EDB4EB69D2DE@gmail.com>
References: <1568802985-9990-1-git-send-email-spoorthix.k@intel.com>
To:     SpoorthiX K <spoorthix.k@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Spoorthi,

On 18 Sep 2019, at 13.36, spoorthix.k@intel.com wrote:
> +static void add_to_resolve_list(struct hci_request *req,
> +				struct hci_conn_params *params)
> +{
> +	struct hci_cp_le_add_to_resolv_list cp;
> +	struct bdaddr_list_with_irk *entry;
> +
> +	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return;
> +
> +	memset(&cp, 0, sizeof(cp));
> +
> +	cp.bdaddr_type =3D params->addr_type;
> +	bacpy(&cp.bdaddr, &params->addr);
> +	memcpy(entry->peer_irk, cp.peer_irk, 16);
> +	memcpy(entry->local_irk, cp.local_irk, 16);
> +
> +	hci_req_add(req, HCI_OP_LE_ADD_TO_RESOLV_LIST, sizeof(cp), &cp);
> +}

Are you missing a call to add the entry to some list here? As it stands =
now this just results in the allocated memory being leaked. Where & when =
should it be freed?

Johan=
