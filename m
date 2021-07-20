Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB473D038A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jul 2021 23:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhGTUVs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Jul 2021 16:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235024AbhGTURJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Jul 2021 16:17:09 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371A6C061574
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jul 2021 13:57:45 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m16so6053273lfg.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jul 2021 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zcs1DNlYnugwuqbuKt5ill9SgMlBkzS8sR/o5Say5Ps=;
        b=d52P7wdKUfvhD6TZTuMM9XPx/tdNMvFVyyPcaHthIjmnZnm7516mUaXv+LMM35mWyt
         7Rgcj6Mm60xfYEVsDRhLiTG9U9qDByZ46i/9AzDlrbbWKDyAoc5QiAIP2qCtBv4d7BXk
         funqt34bhtgPnfdRNQCeDOz5X7u1co92M7W7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zcs1DNlYnugwuqbuKt5ill9SgMlBkzS8sR/o5Say5Ps=;
        b=bck0WUKnM1IrdAN9hIBwdwU1f8ogVG28YGlHvAmv0l6yVMk2fIRA8J5c55zdFsUbh2
         FRCY1y3N3W5xeLEA7EDRQ+Rss32Q0yQA9q3LvVMtMaD5p02lk0SC8hMJAEOA2JEfHGzq
         fwnsa4pd9Eohhsk1pDOPjW0QgbQpCmukuTv5vCicY/JwHyGOtVuvA3RhIFi/6VzWokZK
         hoA5VMQowQsHddAnvYltuVNOQAO5wTfcEnBLj3OxiF6uMCFPQND8uE/0+47YTrKiuwxR
         sw7OgOySENUBbtQUibwVi8GT5WXwLT6LM0GCZ6pqt5hT+A0y0X3LvNdFYvnw29qtCrA5
         HkZA==
X-Gm-Message-State: AOAM533HVlC9PgVhCrSrJPV1IfKl3x5sknFRHOG+763nF9Nc9gesUN2e
        Pqa5/CQF3AZDZ0K7mNnc6FISn5uo2nNx4U0Up76gjg==
X-Google-Smtp-Source: ABdhPJxO4+TntRd1dQktYGRXBi1lO59nAkUmwZjObnGVUh7894tsZ2BJY5BCjRjmij8+kuRyIEou2GoQG9q6rwvclTY=
X-Received: by 2002:a05:6512:2316:: with SMTP id o22mr23973536lfu.175.1626814663412;
 Tue, 20 Jul 2021 13:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210626052152.2543526-1-mcchou@chromium.org> <20210625222111.BlueZ.v2.1.If79c3f0720cc893be1770c6853fe2fbe626f2caa@changeid>
 <086ED9D7-96E6-46AB-88B6-F2E71ACD1B15@holtmann.org> <CABmPvSHyt0LfMRJeaWzEMUZZNGnnNnZTnw_0iU4CyxQMd8jy1w@mail.gmail.com>
 <AF4F82B4-E735-4629-A01E-F8FB512652D8@holtmann.org>
In-Reply-To: <AF4F82B4-E735-4629-A01E-F8FB512652D8@holtmann.org>
From:   Miao-chen Chou <mcchou@chromium.org>
Date:   Tue, 20 Jul 2021 13:57:32 -0700
Message-ID: <CABmPvSH-ux_mo2EY_+Wmr_sDfk+Ai4BV+kPaZQLEL3hm_dYi6Q@mail.gmail.com>
Subject: Re: [BlueZ PATCH v2 1/3] error: BR/EDR and LE connection failure reasons
To:     Marcel Holtmann <marcel@holtmann.org>,
        Alain Michaud <alainmichaud@google.com>
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Alain Michaud <alainm@chromium.org>,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

+Alain Michaud

On Mon, Jul 19, 2021 at 12:57 AM Marcel Holtmann <marcel@holtmann.org> wrot=
e:
>
> Hi Miao-chen,
>
> >>> The source of Connect() failures can be divided into the following
> >>> three.
> >>> - bluetoothd's device interface state transition and profile state
> >>> transition
> >>> - Kernel's L2CAP layer state transition
> >>> - Potential HCI error codes returned by the remote device
> >>>
> >>> This also added error-code.txt to describe these error codes.
> >>>
> >>> Reviewed-by: Alain Michaud <alainm@chromium.org>
> >>> Reviewed-by: Howard Chung <howardchung@google.com>
> >>> ---
> >>>
> >>> Changes in v2:
> >>> - Add error-code.txt
> >>> - Remove BtdError from return string
> >>>
> >>> doc/error-code.txt | 266 ++++++++++++++++++++++++++++++++++++++++++++=
+
> >>> src/error.c        | 111 +++++++++++++++++++
> >>> src/error.h        |  52 +++++++++
> >>> 3 files changed, 429 insertions(+)
> >>> create mode 100644 doc/error-code.txt
> >>
> >> please split documentation and code changes into separate patches.
> >>
> >>
> >>>
> >>> diff --git a/doc/error-code.txt b/doc/error-code.txt
> >>> new file mode 100644
> >>> index 000000000..e91324855
> >>> --- /dev/null
> >>> +++ b/doc/error-code.txt
> >>> @@ -0,0 +1,266 @@
> >>> +D-Bus Method Return Error Codes
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +The motivation of having detailed error codes is to provide context-=
based
> >>> +failure reasons along with D-Bus method return so that D-Bus clients=
 can
> >>> +build metrics and optimize their application based on these failure =
reasons.
> >>> +For instance, a client can build retry mechanism for a connection fa=
ilure or
> >>> +improve the bottleneck of use scenario based on actionable metrics.
> >>> +
> >>> +These error codes are context-based but not necessarily tied to inte=
rface or
> >>> +method calls. For instance, if a pairing request failed due to conne=
ction
> >>> +failure, connection error would be attached to the method return of =
Pair().
> >>> +
> >>> +BR/EDR connection already connected
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0001
> >>> +     errno:  EALREADY, EISCONN
> >>
> >> I would rather see connnection-already-connected instead of 0x0001 in =
the D-Bus error message.
> > Having a code attached instead of a string description makes it easier
> > for a D-Bus client to interpret and map to corresponding handlers IMO.
> > For instead, a client can simplily use the code in a switch case to
> > perform retry or error reporting.
>
> this argument has been made since forever. However D-Bus is heavily strin=
g based and we also have our API heavily string and descriptive. So I rathe=
r keep it that way.
>
> >>
> >>> +
> >>> +Either the profile is already connected or ACL connection is in plac=
e.
> >>> +
> >>> +BR/EDR connection page timeout
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0002
> >>> +     errno:  EHOSTDOWN
> >>> +
> >>> +Failed due to page timeout.
> >>> +
> >>> +BR/EDR connection profile unavailable
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0003
> >>> +     errno:  ENOPROTOOPT
> >>> +
> >>> +Failed to find connectable services or the target service.
> >>> +
> >>> +BR/EDR connection SDP search
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0004
> >>> +     errno:  none
> >>> +
> >>> +Failed to complete the SDP search.
> >>> +
> >>> +BR/EDR connection create socket
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0005
> >>> +     errno:  EIO
> >>> +
> >>> +Failed to create or connect to BT IO socket. This can also indicate =
hardware
> >>> +failure in the controller.
> >>> +
> >>> +BR/EDR connection invalid arguments
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0006
> >>> +     errno:  EHOSTUNREACH
> >>> +
> >>> +Failed due to invalid arguments.
> >>> +
> >>> +BR/EDR connection not powered
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0007
> >>> +     errno:  EHOSTUNREACH
> >>> +
> >>> +Failed due to adapter not powered.
> >>> +
> >>> +BR/EDR connection not supported
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0008
> >>> +     errno:  EOPNOTSUPP, EPROTONOSUPPORT
> >>> +
> >>> +Failed due to unsupported state transition of L2CAP channel or other=
 features
> >>> +either by the local host or the remote.
> >>> +
> >>> +BR/EDR connection bad socket
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0009
> >>> +     errno:  EBADFD
> >>> +
> >>> +Failed due to the socket is in bad state.
> >>> +
> >>> +BR/EDR connection memory allocation
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x000A
> >>> +     errno:  EBADFD
> >>> +
> >>> +Failed to allocate memory in either host stack or controller.
> >>
> >> If this happens, then the code is wrong. Should be an ENOMEM.
> > My mistake, this should be ENOMEM. Corrected in v3.
> >>
> >>> +
> >>> +BR/EDR connection busy
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x000B
> >>> +     errno:  EBUSY
> >>> +
> >>> +Failed due to other ongoing operations, such as pairing, busy L2CAP =
channel or
> >>> +the operation disallowed by the controller.
> >>> +
> >>> +BR/EDR connection concurrent connection limit
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x000C
> >>> +     errno:  EMLINK
> >>> +
> >>> +Failed due to reaching the concurrent connection limit to a device.
> >>> +
> >>> +BR/EDR connection timeout
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >>> +     code:   0x000D
> >>> +     errno:  ETIMEDOUT
> >>> +
> >>> +Failed due to connection timeout
> >>> +
> >>> +BR/EDR connection refused
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >>> +     code:   0x000E
> >>> +     errno:  ECONNREFUSED
> >>> +
> >>> +Refused by the remote device due to limited resource, security reaso=
n or
> >>> +unacceptable address type.
> >>> +
> >>> +BR/EDR connection aborted by remote
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x000F
> >>> +     errno:  ECONNRESET
> >>> +
> >>> +Terminated by the remote device due to limited resource or power off=
.
> >>> +
> >>> +BR/EDR connection aborted by local
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0010
> >>> +     errno:  ECONNABORTED
> >>> +
> >>> +Aborted by the local host.
> >>> +
> >>> +BR/EDR connection protocol error
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0011
> >>> +     errno:  EPROTO
> >>> +
> >>> +Failed due to LMP protocol error.
> >>> +
> >>> +BR/EDR connection canceled
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> >>> +     code:   0x0012
> >>> +     errno:  none
> >>> +
> >>> +Failed due to cancellation caused by adapter drop, unexpected device=
 drop, or
> >>> +incoming disconnection request before connection request is complete=
d.
> >>> +
> >>> +BR/EDR connection unknown error
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0013
> >>> +     errno:  ENOSYS
> >>> +
> >>> +Failed due to unknown reason.
> >>> +
> >>> +LE connection invalid arguments
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0101
> >>> +     errno:  EINVAL
> >>> +
> >>> +Failed due to invalid arguments.
> >>> +
> >>> +LE connection not powered
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >>> +     code:   0x0102
> >>> +     errno:  EHOSTUNREACH
> >>> +
> >>> +Failed due to adapter not powered.
> >>> +
> >>> +LE connection not supported
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>> +     code:   0x0103
> >>> +     errno:  EOPNOTSUPP, EPROTONOSUPPORT
> >>> +
> >>> +Failed due to unsupported state transition of L2CAP channel or other=
 features
> >>> +(e.g. LE features) either by the local host or the remote.
> >>> +
> >>> +LE connection already connected
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0104
> >>> +     errno: EALREADY, EISCONN
> >>> +
> >>> +Either the BT IO is already connected or LE link connection in place=
.
> >>> +
> >>> +LE connection bad socket
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> >>> +     code:   0x0105
> >>> +     errno: EBADFD
> >>> +
> >>> +Failed due to the socket is in bad state.
> >>> +
> >>> +LE connection memory allocation
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0106
> >>> +     errno: ENOMEM
> >>> +
> >>> +Failed to allocate memory in either host stack or controller.
> >>> +
> >>> +LE connection busy
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0107
> >>> +     errno:  EBUSY
> >>> +
> >>> +Failed due to other ongoing operations, such as pairing, connecting,=
 busy
> >>> +L2CAP channel or the operation disallowed by the controller.
> >>> +
> >>> +LE connection refused
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x0108
> >>> +     errno:  ECONNREFUSED
> >>> +
> >>> +Failed due to that LE is not enabled or the attempt is refused by th=
e remote
> >>> +device due to limited resource, security reason or unacceptable addr=
ess type.
> >>> +
> >>> +LE connection create socket
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>> +     code:   0x0109
> >>> +     errno:  EIO
> >>> +
> >>> +Failed to create or connect to BT IO socket. This can also indicate =
hardware
> >>> +failure in the controller.
> >>> +
> >>> +LE connection timeout
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x010A
> >>> +     errno:  ETIMEDOUT
> >>> +
> >>> +Failed due to connection timeout
> >>> +
> >>> +LE connection concurrent connection limit
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x010B
> >>> +     errno:  EMLINK
> >>> +
> >>> +Failed due to reaching the synchronous connection limit to a device.
> >>> +
> >>> +LE connection abort by remote
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x010C
> >>> +     errno:  ECONNRESET
> >>> +
> >>> +Aborted by the remote device due to limited resource or power off.
> >>> +
> >>> +LE connection abort by local
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x010D
> >>> +     errno:  ECONNABORTED
> >>> +
> >>> +Aborted by the local host.
> >>> +
> >>> +LE connection link layer protocol error
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +     code:   0x010E
> >>> +     errno:  EPROTO
> >>> +
> >>> +Failed due to link layer protocol error.
> >>> +
> >>> +LE connection GATT browsing
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>> +     code:   0x010F
> >>> +     errno:  none
> >>> +
> >>> +Failed to complete the GATT browsing.
> >>> +
> >>> +LE connection unknown error
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>> +     code:   0x0110
> >>> +     errno:  ENOSYS
> >>> +
> >>> + Failed due to unknown reason.
> >>> diff --git a/src/error.c b/src/error.c
> >>> index 89517075e..73602c4bf 100644
> >>> --- a/src/error.c
> >>> +++ b/src/error.c
> >>> @@ -27,6 +27,7 @@
> >>> #include <config.h>
> >>> #endif
> >>>
> >>> +#include <stdio.h>
> >>> #include "gdbus/gdbus.h"
> >>>
> >>> #include "error.h"
> >>> @@ -43,6 +44,12 @@ DBusMessage *btd_error_invalid_args_str(DBusMessag=
e *msg, const char *str)
> >>>                                      "%s", str);
> >>> }
> >>>
> >>> +DBusMessage *btd_error_invalid_args_err(DBusMessage *msg, uint16_t e=
rr)
> >>> +{
> >>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".InvalidArgume=
nts",
> >>> +                                     "0x%04X", err);
> >>> +}
> >>> +
> >>> DBusMessage *btd_error_busy(DBusMessage *msg)
> >>> {
> >>>      return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress",
> >>> @@ -79,12 +86,24 @@ DBusMessage *btd_error_in_progress(DBusMessage *m=
sg)
> >>>                                      "In Progress");
> >>> }
> >>>
> >>> +DBusMessage *btd_error_in_progress_err(DBusMessage *msg, uint16_t er=
r)
> >>> +{
> >>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress", =
"0x%04X",
> >>> +                                     err);
> >>> +}
> >>> +
> >>> DBusMessage *btd_error_not_available(DBusMessage *msg)
> >>> {
> >>>      return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable",
> >>>                                      "Operation currently not availab=
le");
> >>> }
> >>>
> >>> +DBusMessage *btd_error_not_available_err(DBusMessage *msg, uint16_t =
err)
> >>> +{
> >>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable"=
,
> >>> +                                     "0x%04X", err);
> >>> +}
> >>> +
> >>> DBusMessage *btd_error_does_not_exist(DBusMessage *msg)
> >>> {
> >>>      return g_dbus_create_error(msg, ERROR_INTERFACE ".DoesNotExist",
> >>> @@ -121,8 +140,100 @@ DBusMessage *btd_error_not_ready(DBusMessage *m=
sg)
> >>>                                      "Resource Not Ready");
> >>> }
> >>>
> >>> +DBusMessage *btd_error_not_ready_err(DBusMessage *msg, uint16_t err)
> >>> +{
> >>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".NotReady", "0=
x%04X",
> >>> +                                     err);
> >>> +}
> >>> +
> >>> DBusMessage *btd_error_failed(DBusMessage *msg, const char *str)
> >>> {
> >>>      return g_dbus_create_error(msg, ERROR_INTERFACE
> >>>                                      ".Failed", "%s", str);
> >>> }
> >>> +
> >>> +DBusMessage *btd_error_failed_err(DBusMessage *msg, uint16_t err)
> >>> +{
> >>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".Failed", "0x%=
04X",
> >>> +                                     err);
> >>> +}
> >>> +
> >>> +uint16_t btd_error_bredr_conn_from_errno(int errno_code)
> >>> +{
> >>> +     switch (-errno_code) {
> >>> +     case EALREADY:
> >>> +     case EISCONN: // Fall through
> >>
> >> Don=E2=80=99t do this Fall through. It is actually not a fall through =
per se. This is just a statement with two case labels. That is perfectly no=
rmal and no compiler should complain. And frankly no C-programmer should be=
 confused if this was intentional or not.
> > Corrected in v3.
> >>
> >>> +             return BTD_ERR_BREDR_CONN_ALREADY_CONNECTED;
> >>> +     case EHOSTDOWN:
> >>> +             return BTD_ERR_BREDR_CONN_PAGE_TIMEOUT;
> >>> +     case ENOPROTOOPT:
> >>> +             return BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE;
> >>> +     case EIO:
> >>> +             return BTD_ERR_BREDR_CONN_CREATE_SOCKET;
> >>> +     case EINVAL:
> >>> +             return BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS;
> >>> +     case EHOSTUNREACH:
> >>> +             return BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED;
> >>> +     case EOPNOTSUPP:
> >>> +     case EPROTONOSUPPORT: // Fall through
> >>> +             return BTD_ERR_BREDR_CONN_NOT_SUPPORTED;
> >>> +     case EBADFD:
> >>> +             return BTD_ERR_BREDR_CONN_BAD_SOCKET;
> >>> +     case ENOMEM:
> >>> +             return BTD_ERR_BREDR_CONN_MEMORY_ALLOC;
> >>> +     case EBUSY:
> >>> +             return BTD_ERR_BREDR_CONN_BUSY;
> >>> +     case EMLINK:
> >>> +             return BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT;
> >>> +     case ETIMEDOUT:
> >>> +             return BTD_ERR_BREDR_CONN_TIMEOUT;
> >>> +     case ECONNREFUSED:
> >>> +             return BTD_ERR_BREDR_CONN_REFUSED;
> >>> +     case ECONNRESET:
> >>> +             return BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE;
> >>> +     case ECONNABORTED:
> >>> +             return BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL;
> >>> +     case EPROTO:
> >>> +             return BTD_ERR_BREDR_CONN_PROTO_ERROR;
> >>> +     default:
> >>> +             return BTD_ERR_BREDR_CONN_UNKNOWN;
> >>> +     }
> >>> +}
> >>> +
> >>> +uint16_t btd_error_le_conn_from_errno(int errno_code)
> >>> +{
> >>> +     switch (-errno_code) {
> >>> +     case EINVAL:
> >>> +             return BTD_ERR_LE_CONN_INVALID_ARGUMENTS;
> >>> +     case EHOSTUNREACH:
> >>> +             return BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED;
> >>> +     case EOPNOTSUPP:
> >>> +     case EPROTONOSUPPORT: // Fall through
> >>> +             return BTD_ERR_LE_CONN_NOT_SUPPORTED;
> >>> +     case EALREADY:
> >>> +     case EISCONN: // Fall through
> >>> +             return BTD_ERR_LE_CONN_ALREADY_CONNECTED;
> >>> +     case EBADFD:
> >>> +             return BTD_ERR_LE_CONN_BAD_SOCKET;
> >>> +     case ENOMEM:
> >>> +             return BTD_ERR_LE_CONN_MEMORY_ALLOC;
> >>> +     case EBUSY:
> >>> +             return BTD_ERR_LE_CONN_BUSY;
> >>> +     case ECONNREFUSED:
> >>> +             return BTD_ERR_LE_CONN_REFUSED;
> >>> +     case EIO:
> >>> +             return BTD_ERR_LE_CONN_CREATE_SOCKET;
> >>> +     case ETIMEDOUT:
> >>> +             return BTD_ERR_LE_CONN_TIMEOUT;
> >>> +     case EMLINK:
> >>> +             return BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT;
> >>> +     case ECONNRESET:
> >>> +             return BTD_ERR_LE_CONN_ABORT_BY_REMOTE;
> >>> +     case ECONNABORTED:
> >>> +             return BTD_ERR_LE_CONN_ABORT_BY_LOCAL;
> >>> +     case EPROTO:
> >>> +             return BTD_ERR_LE_CONN_PROTO_ERROR;
> >>> +     default:
> >>> +             return BTD_ERR_LE_CONN_UNKNOWN;
> >>> +     }
> >>> +}
> >>> diff --git a/src/error.h b/src/error.h
> >>> index 7c8cad066..74d433aca 100644
> >>> --- a/src/error.h
> >>> +++ b/src/error.h
> >>> @@ -24,22 +24,74 @@
> >>> */
> >>>
> >>> #include <dbus/dbus.h>
> >>> +#include <stdint.h>
> >>>
> >>> #define ERROR_INTERFACE "org.bluez.Error"
> >>>
> >>> +/* BR/EDR connection failure reasons
> >>> + * BT_ERR_* should be used as one of the parameters to btd_error_*_e=
rr().
> >>> + */
> >>> +#define BTD_ERR_BREDR_CONN_ALREADY_CONNECTED 0x0001
> >>> +#define BTD_ERR_BREDR_CONN_PAGE_TIMEOUT              0x0002
> >>> +#define BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE       0x0003
> >>> +#define BTD_ERR_BREDR_CONN_SDP_SEARCH                0x0004
> >>> +#define BTD_ERR_BREDR_CONN_CREATE_SOCKET     0x0005
> >>> +#define BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS 0x0006
> >>> +#define BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED       0x0007
> >>> +#define BTD_ERR_BREDR_CONN_NOT_SUPPORTED     0x0008
> >>> +#define BTD_ERR_BREDR_CONN_BAD_SOCKET                0x0009
> >>> +#define BTD_ERR_BREDR_CONN_MEMORY_ALLOC              0x000A
> >>> +#define BTD_ERR_BREDR_CONN_BUSY                      0x000B
> >>> +#define BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT        0x000C
> >>> +#define BTD_ERR_BREDR_CONN_TIMEOUT           0x000D
> >>> +#define BTD_ERR_BREDR_CONN_REFUSED           0x000E
> >>> +#define BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE   0x000F
> >>> +#define BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL    0x0010
> >>> +#define BTD_ERR_BREDR_CONN_PROTO_ERROR               0x0011
> >>> +#define BTD_ERR_BREDR_CONN_CANCELED          0x0012
> >>> +#define BTD_ERR_BREDR_CONN_UNKNOWN           0x0013
> >>> +
> >>> +/* LE connection failure reasons
> >>> + * BT_ERR_* should be used as one of the parameters to btd_error_*_e=
rr().
> >>> + */
> >>> +#define BTD_ERR_LE_CONN_INVALID_ARGUMENTS    0x0101
> >>> +#define BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED  0x0102
> >>> +#define BTD_ERR_LE_CONN_NOT_SUPPORTED                0x0103
> >>> +#define BTD_ERR_LE_CONN_ALREADY_CONNECTED    0x0104
> >>> +#define BTD_ERR_LE_CONN_BAD_SOCKET           0x0105
> >>> +#define BTD_ERR_LE_CONN_MEMORY_ALLOC         0x0106
> >>> +#define BTD_ERR_LE_CONN_BUSY                 0x0107
> >>> +#define BTD_ERR_LE_CONN_REFUSED                      0x0108
> >>> +#define BTD_ERR_LE_CONN_CREATE_SOCKET                0x0109
> >>> +#define BTD_ERR_LE_CONN_TIMEOUT                      0x010A
> >>> +#define BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT   0x010B
> >>> +#define BTD_ERR_LE_CONN_ABORT_BY_REMOTE              0x010C
> >>> +#define BTD_ERR_LE_CONN_ABORT_BY_LOCAL               0x010D
> >>> +#define BTD_ERR_LE_CONN_PROTO_ERROR          0x010E
> >>> +#define BTD_ERR_LE_CONN_GATT_BROWSE          0x010F
> >>> +#define BTD_ERR_LE_CONN_UNKNOWN                      0x0110
> >>> +
> >>
> >> What is the intention to split BR/EDR and LE here. You do know up-fron=
t what connection type you are. Trying to figure out from the error code wh=
at connection you have been trying to establish is plain wrong.
> > In fact the up-front connection type is not necessarily known. In the
> > case of dual-mode devices, such as Bose QC35, a D-Bus client can issue
> > Connect(), and it depends on the timing of connection request (adv
> > usually arrive first compared to inquiry result), it can be either
> > BR/EDR or LE link being established. Another aspect of this is the
> > metrics collection, where knowing transport can be handy. For
> > instance, we can associate the certain error to particular use cases
> > at application layer, and that can help targeting the bottleneck to
> > tackle.
>
> Then we need to find a different way to convey the transport chosen. Doin=
g this by error message is a bad idea.
>
> >>
> >> The description is that you want to know exactly where the connection =
failed. And I think that can be established independent from the transport.
> > Indeed the intention is to know where it failed exactly. However, as
> > mentioned above, transport information is also an important piece of
> > information to know.
>
> We need to find a different way to inform about which transport failed (o=
r better which was chosen in the first place).
>
> >>
> >> In addition, I don=E2=80=99t like the 0x00?? vs 0x01?? reservation of =
any number. That always goes bad at some point in the future.
> > As replied above, having a code attached instead of a string
> > description makes it easier for a D-Bus client to interpret and map to
> > corresponding handlers, but I am happy to explore other options as
> > well.
>
> You are creating namespaces within a 16-bit integer. That is never a good=
 idea. It always goes wrong at some point in the future and then we are stu=
ck with an API.
>
> Regards
>
> Marcel
>
