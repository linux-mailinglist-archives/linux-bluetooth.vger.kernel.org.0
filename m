Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E362715D2D5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Feb 2020 08:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728799AbgBNHdO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 Feb 2020 02:33:14 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:50571 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728691AbgBNHdN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 Feb 2020 02:33:13 -0500
Received: by mail-pj1-f67.google.com with SMTP id r67so3515458pjb.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Feb 2020 23:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Kcj4w91lJlpFFuWtk5hFEe8dyRj17InJpAIYaCKfPPc=;
        b=J6S8LBbnR4tLQen0vLjAfR+yzuLtuRG9RfkTFu0BIiSpRJMoUCJDSC+bKG/6ZBgmor
         LJTkEWE3kwjue4Pvw9+YpruZpZSBduXmD71BR4evkuJ2Fk2+ONKmmUF/P23lplshVMpk
         rHE3xonX0URW5F3L1JIXUpAff7fCjH1hktyRuliK+EOlcKIjwN6+DHWEYT/pzJaqpWIR
         T5t6TlXSPHDvOZvmdBE8bNHTqV6N+59javPAzDqVKabVn8hpbnE5Z4oIktxkUlyWhvKh
         Uf+7uIMSoMXe4J3UuRWJ5fG4vo7DDYQnH6ArrKn739Pe/1BD9bw6jApoFgEe9WvbFcLy
         XDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Kcj4w91lJlpFFuWtk5hFEe8dyRj17InJpAIYaCKfPPc=;
        b=RPkWBohXwhZi3nwkmMp9376WviV1p4L7gVhg/khVkHHK//2LPlltOhEyovXPi+yyr2
         SVvU1UwHjOUoNUcMyvw7BJ/jYu8AuIM3d1TKQZamBeOqw1whjxFA0Kkk9BPShbgnkulK
         lwoceYLpt/HJqhJsTzNfNHz/t1RdebpSIbQzVjIq1QkX12Tdj7+BGq9DWhmwTVbj+EUw
         es1oHp1ytWFUVfM6eLFCZQjZWnw8YYdef+eN8fsaPgrXhcKR3LZde2GfndsWx8SSivQ5
         6PTzkkAKMuORttJ5SjJrhN3pFYwc0fo98yNqpFOWUzUgHy+RLxzbKeMl9mK/mLw+IvjC
         ZuYw==
X-Gm-Message-State: APjAAAUguc5JAH/1yWNNlVgvyE6CrdPdX0XlkpjHJRT2vzcv/V3l73hh
        GoetuWKN99YD1hPnqGIF48Q=
X-Google-Smtp-Source: APXvYqyLvxy9lkuCtrXzlSsJzkCAc3QGXccqkMB60S3ptMxEFanhG29qIXc8An4SdbwOu3oaFRYPqg==
X-Received: by 2002:a17:90a:ec0f:: with SMTP id l15mr1853039pjy.39.1581665593216;
        Thu, 13 Feb 2020 23:33:13 -0800 (PST)
Received: from rkrasik-mobl2.ger.corp.intel.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
        by smtp.gmail.com with ESMTPSA id 4sm5859648pfn.90.2020.02.13.23.33.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 23:33:12 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [Bluez PATCH v3] core: Add new policy for Just-Works repairing
From:   Johan Hedberg <johan.hedberg@gmail.com>
In-Reply-To: <20200214114350.Bluez.v3.1.I333a90ad3c75882c6f008c94a28ca7d3e8f6c76e@changeid>
Date:   Fri, 14 Feb 2020 09:33:07 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Luiz Von Dentz <luiz.von.dentz@intel.com>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1BEAEE28-6159-491D-BCCC-4C5298891987@gmail.com>
References: <20200214114350.Bluez.v3.1.I333a90ad3c75882c6f008c94a28ca7d3e8f6c76e@changeid>
To:     Howard Chung <howardchung@google.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Howard,

On 14. Feb 2020, at 5.45, Howard Chung <howardchung@google.com> wrote:
> @@ -6141,6 +6141,22 @@ int device_confirm_passkey(struct btd_device =
*device, uint8_t type,
> 	struct authentication_req *auth;
> 	int err;
>=20
> +	/* Just-Works repairing policy */
> +	if (confirm_hint && (device_is_paired(device, BDADDR_BREDR) ||
> +				device_is_paired(device, =
BDADDR_LE_PUBLIC))) {

Wouldn=E2=80=99t a single call to device_is_paired() using =E2=80=9Ctype=E2=
=80=9D (the address type that=E2=80=99s part of the mgmt event) be the =
right thing to do here?

Johan=
