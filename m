Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84E111628CC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 Feb 2020 15:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgBROpx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Feb 2020 09:45:53 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:34843 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgBROpx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Feb 2020 09:45:53 -0500
Received: by mail-io1-f66.google.com with SMTP id h8so10118539iob.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Feb 2020 06:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ycdOljiUMLVr5RkIaK/aL83s9QdfM/BD9qm78d3uXZc=;
        b=PGI0/GCUjHJLEwwotOsUjqXyeJ3YiSKagBXdlpXpf5psnCaLldqrOh5xdrkkzTiacE
         +8LtaCalBmBswRFMQVOV179iA816baPqbCeAhk+HDODomkW30/0w3suYEw02sXXxnj1A
         kTC9PrQ8Z3w5pJvgQpM9oFEBZTgJ+VdHmhoCsm3K4U+rieSj4s5AQMSDxJqEp8sLfgzF
         cRQGScuRT2fUxgaIhD1cMcbLdQ8nDXe2TCgVDi/Nchdchs9WiPEFYkp5yg/gdaWwShtd
         rC/hvOLIFzLIqoQXAD9EvzJEXLBgQG1CpPwW+ldZKtDa3rJdIVtt38QZfKkDvrXDRL+8
         t2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ycdOljiUMLVr5RkIaK/aL83s9QdfM/BD9qm78d3uXZc=;
        b=mqRYC1/cKapOziE2/Mjhf3Q/i6xXqECMYMNUqFEVefhp5pXIGIQYBB+zYTSRbR7Uyx
         eoSg8n2hI1N40r7J8cEHEajdlJYuNXveSCxMjz7Y3ospfI2pNPUJY8xvIr9gPOvmwbxE
         UQzgcGgkE7mM8fYZL+4lMFfB+eHgsQa5/d8emG25HMcxpck5Jo5XliKr4ONmuk12Q+n6
         9q5Dbp9LMHaixWQdyvyHbTJjFHE0OAWhO5ddm6/sXW3Ni8xlDiQ7ugnrvz3Pw5akwARv
         00/oh4Fnorl62ZLUIWEBnk8QozTzcFJpYbAmgrzwf2dqVqaEz5w8kfZxBbLw+68SbhDN
         5O0A==
X-Gm-Message-State: APjAAAWvObiEohuv76jXUwfRjlpJt6HZuI755XjVWDIxJmLP+JDw5Olq
        XZ93gbakNFXeKW2P/QgBWtblLqgM3a5ZmLvPhJmbi1mGdz2LJg==
X-Google-Smtp-Source: APXvYqyIvF0BZTdSjuBnttr/YvoDub0TOpjPyYshQ6drenGJBc5FlwI8eZAKjsR1R9doZ0OW/AOGXWF2SsbZaSYow9U=
X-Received: by 2002:a5e:aa18:: with SMTP id s24mr15348811ioe.221.1582037152365;
 Tue, 18 Feb 2020 06:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20200218123747.3006-1-sathish.narasimman@intel.com> <072E9094-BA5F-47CB-9740-B04A6DC5384D@holtmann.org>
In-Reply-To: <072E9094-BA5F-47CB-9740-B04A6DC5384D@holtmann.org>
From:   Sathish Narasimman <nsathish41@gmail.com>
Date:   Tue, 18 Feb 2020 20:17:29 +0530
Message-ID: <CAOVXEJJ9NgkPocUmQS=f2204UEf2sfc8HrSmQ7ZvWYonKunRuQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Fix - During le_conn_timeout disable EXT_ADV
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Sathish Narsimman <sathish.narasimman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel

On Tue, Feb 18, 2020 at 7:40 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Sathish,
>
> > Disabling LE_LEGACY_ADV when LE_EXT_ADV is enabled causes 'command
> > disallowed . This patch fixes that issue and disables EXT_ADV if
> > enabled.
> >
> > Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
> > ---
> > net/bluetooth/hci_conn.c | 16 +++++++++++++---
> > 1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> > index a582c676e584..a8d8a876363c 100644
> > --- a/net/bluetooth/hci_conn.c
> > +++ b/net/bluetooth/hci_conn.c
> > @@ -481,9 +481,19 @@ static void le_conn_timeout(struct work_struct *work)
> >        * (which doesn't have a timeout of its own).
> >        */
> >       if (conn->role == HCI_ROLE_SLAVE) {
> > -             u8 enable = 0x00;
> > -             hci_send_cmd(hdev, HCI_OP_LE_SET_ADV_ENABLE, sizeof(enable),
> > -                          &enable);
> > +             if (ext_adv_capable(hdev)) {
> > +                     struct hci_cp_le_set_ext_adv_enable cp;
> > +
> > +                     cp.enable = 0x00;
> > +                     cp.num_of_sets = 0x00;
> > +
> > +                     hci_send_cmd(hdev, HCI_OP_LE_SET_EXT_ADV_ENABLE,
> > +                                  sizeof(cp), &cp);
> > +             } else {
> > +                     u8 enable = 0x00;
> > +                     hci_send_cmd(hdev, HCI_OP_LE_SET_ADV_ENABLE,
> > +                                  sizeof(enable), &enable);
> > +             }
>
> hmmm, I wonder if it is better to create a helper function for this.
>
> Regards
>
> Marcel
>

let me verify and submit patch with __hci_req_disable_advertising

Regards
Sathish N
