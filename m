Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983F6204E9E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 23 Jun 2020 11:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732201AbgFWJ6G (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 23 Jun 2020 05:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731947AbgFWJ6F (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 23 Jun 2020 05:58:05 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B858C061573
        for <linux-bluetooth@vger.kernel.org>; Tue, 23 Jun 2020 02:58:05 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id c4so9313828iot.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 23 Jun 2020 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orcam.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=z+NLoHvR7pL7e9bXEqE7ANamElXGMJmyWSurZyi8Vgw=;
        b=iejA/IPZgvNy/iKsht0lKMmbfoxxizdebWTL+2c7YzrghNgzTsevG2pBiQENomZxn1
         47EuHjvwknDegBmLyOPDqGpTo+FJyOotInftUfsBihOYD7Ee8rt3upeuWpdjv2oAtnwJ
         lcBigT5vpw4OMa9librWOhvAdjpCNLI4p4XF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=z+NLoHvR7pL7e9bXEqE7ANamElXGMJmyWSurZyi8Vgw=;
        b=UPuiHUzxjLYkF94VUU6KAsVmzBUfiPMPf1wjFU9LgGh8W4Mo+z6j86uirPmnVOxoSy
         1j0wRD8NkXwWG4ebqblFc412mvbb9CbYGRVK6Zei5E6ZaPfj+VxUie5EWVXVTtuno/9f
         he8o98og0x3WR7KcDRdUii79i3+PeJjVDATjqRFPCqVE3A0Uu1Qg9S15iL8/v3LcPa3u
         ioMXv84xnho0fh335/qgl9c1FAlaWJzvyu4bu+nMrzdI4QbdVDMPc56MOsOOI9PA+I8j
         n0yaUOusPFK5DjRh3onE3BjJ4APfQInEjtQhtJCWdJGAUtTZGXYJ2RIpyzbdLisgWfHy
         hfCA==
X-Gm-Message-State: AOAM533X0l1aSY2gj0jD4zfyWHdtxDIln9GNQqPu1Uoce3z5X0mxF6WR
        lQoLZdC0i9LoLm1SRZyiSJitvsw2FBq5srKpLyjqnuZcbq9vtQ==
X-Google-Smtp-Source: ABdhPJydyv5Rz77rQUZnxeNVCfFhxeN7H6fwXaNaSHY1G2f6Mog7gajVNGhJrPSF8RLieHX8Vj/9vVXcE79VpArqzCA=
X-Received: by 2002:a5d:8b53:: with SMTP id c19mr22952353iot.93.1592906284693;
 Tue, 23 Jun 2020 02:58:04 -0700 (PDT)
MIME-Version: 1.0
From:   Ordit Gross <ordit.gross@orcam.com>
Date:   Tue, 23 Jun 2020 12:57:53 +0300
Message-ID: <CAB+bgRbZ+40TsjrjPnA2UDQLyeVvwqBcQ6nmQfvfvu2xNE547g@mail.gmail.com>
Subject: avoid speaker (br/edr) reconnect
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hi all,

our device (audio source) has the capability to connect to audio
speakers (using code that is based on bluetoothctl bluez v5.47).
I understand that the first connection to the speaker is initiated
from our device,
whereas further connections are initiated by the speaker. (still
looking for documentation for that behavior, but have observed it in
hci dump).

When user removes credentials of the speaker on our device, the audio
speaker still connects to us, pair, but mediaControl connects and
disconnects immediately, so we can't open pcm device.

1. What is the recommended way for canceling the auto reconnect of a
speaker to a known device? (is the only way reset speaker? or can
source device do something?)

2. Considering we have removed credentials on the source side, why
does flow get stuck?

any help would be appreciated
