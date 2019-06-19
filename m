Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1CC04B34E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jun 2019 09:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfFSHsE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Jun 2019 03:48:04 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:45830 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfFSHsE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Jun 2019 03:48:04 -0400
Received: by mail-io1-f46.google.com with SMTP id e3so35898414ioc.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 19 Jun 2019 00:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orcam.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=a7ESxKbJ6dLO06C54r7b1fWawG+1HB/PgepI3g5cPy0=;
        b=D0Xn//XyKqoE7HzlQhU+AXV3M/6VEkbswZWcchBQcUxp4SAszQGZ/putiSCL2rxAR1
         OtY+ZX8+q9Ri9p5FsdBzgsHSb00uDdxFdOyw0+r5N1wcZlzK4PceBfk0Ku/177wY8jKt
         3I4d1L0yvnbFqsTT+0ap7B7ZxKeaV9s/Dksv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=a7ESxKbJ6dLO06C54r7b1fWawG+1HB/PgepI3g5cPy0=;
        b=aD1YL6Qli+WbVgQfHobl988aclsDqhB7kYu3NDr+hoskXj4VtbCBxcqXkJmDFfH2MZ
         8efnr4yNaWCKCMYWrOp6AQ5lYl0WfQkdeUTROKbwJit/Cb2EoydxkHHl/cguc48liTqJ
         oU6XydTy5h9blnUIi7R1INaGbuJClwXL3RvlWb58AGnJDmK3i4++ubyNTjsay4I1r2fv
         2+YGroDddfmeKu5SCVtDCNOMaMC/plb1IqSdUzsNCEym8lxX5fWJnCashMmfz3m2T0SJ
         Ik2l1HJfb61nWr/moHCTSBeWHSDg8vdBeJVVAXZ8s3lgFwSDoqyZdOPGJ0Kt+EY383V6
         qwEQ==
X-Gm-Message-State: APjAAAWLLhdmf+L82ugzxQJUfsa1QBj2vxDUEtsH7wtndj3U8dWe0q9V
        YY81iaxrWWVMLLzXztNpeh4e3ouqgLMZdCc/uCpoHvjPLo0=
X-Google-Smtp-Source: APXvYqwIBcEJj81npR2uOKsYtBQcbB5NcT8+cJDTBz7f4EbusgYnnfjdFmOpyultjuOJOxBLlF1aRHGf8xC1FZicxy8=
X-Received: by 2002:a02:22c6:: with SMTP id o189mr5590245jao.35.1560930483834;
 Wed, 19 Jun 2019 00:48:03 -0700 (PDT)
MIME-Version: 1.0
From:   Ordit Gross <ordit.gross@orcam.com>
Date:   Wed, 19 Jun 2019 10:47:53 +0300
Message-ID: <CAB+bgRasCis8pyqnV2ULya0qcmgeVj8_c6P+_8=U=9LH1eVUKw@mail.gmail.com>
Subject: discover services
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hi all,
as gatt-client I see the default discovery is for all services
(bt_gatt_discover_all_primary_services).
in order to reduce time of discovery, can I hand over two UUIDs of
known services?
(when I had to discover only one service I used
bt_gatt_discover_primary_services)

what I essentially looking for is discover(UUID_SERVICE_1, UUID_SERVICE_2)
thanks

also, is there a better forum for such questions?
really appreciate your time (:
Ordit
