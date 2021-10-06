Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AF7423667
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Oct 2021 05:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhJFD4F (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Oct 2021 23:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhJFD4E (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Oct 2021 23:56:04 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0066EC061755
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Oct 2021 20:54:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r19so4458369lfe.10
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Oct 2021 20:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wCCx9f0vU16fSdLBhKBfZ5+A5fVVaqTGyNcvLThJsng=;
        b=zX3kiQrgVD4tpCNxddaJIVuuZr83i4g79u+zwZciJ77tUFwMh3CYloNfFJQLdYRPNN
         9TyzfJxsklBDvCzSMoS7/jD6FZTPsXfgaQJEALQMGbwasZVOOApUh+YcFz/B3/tiqTL3
         eXF8DTyXAcLwVaCircGD2OYyT66dx6HqGlS9glAh8PR8QSu5T00/1N99gOgovQYU+HyQ
         OnQGFx4mKlyIptzEkXQ74qIX6k0Gs1XV5vgMKRDExo/OlTpWFMPDf8NNDUrPdTUqYzHw
         pb0VnYqIB/bHUt0QOdiyLMFzQjv6z98jVYbLnPO/Diris3Az5EsHfwsZ7pGSBMxKJgm8
         X+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wCCx9f0vU16fSdLBhKBfZ5+A5fVVaqTGyNcvLThJsng=;
        b=HzH/vs5BiOLPmubRMCOgdDxpTL5kZ8O2h7yptygyLFGwf3HxoOjpJh1XB6Eu8lf/OH
         aEH69y5tSHb20AdpXNLsPIFJBFa8FEao90sBTcUvW9YxMGCph2c5PO1MjCdj5Iz5wJlJ
         DGrxHBDlbRX7pGP+/ET+j3jYhywJ6NYTzObW+bB/XpN+8tHLSnSj838Wzi0NcIHAuU0J
         2/1Q2Gr9kJoUfUCi/81n+SOpE8cimRuJvHsUjhyLffsmNhgv1lJ2ClE1xMzSkAbtvj6Z
         awpGxZif+bii43r+mYLZ9UoXYHIuwkK3YhQFYu4YT9zUjL7vkOtOSdTNWfeXMTyICRSy
         g5KQ==
X-Gm-Message-State: AOAM532twuMpLF71sTB018sDuTsVG1GRzt90kS/Yg9gBPxT9FDaSDbWS
        YodYDAqFB1JybKrQV3b1BU6SUw==
X-Google-Smtp-Source: ABdhPJzPZd/pHGI4jIrZHD3KVL2DcSrVWuPmq+ruK4twP5QWTbb7x2llr5UqxIb5QV/vVHrqtwge4Q==
X-Received: by 2002:a05:6512:553:: with SMTP id h19mr7453728lfl.7.1633492451130;
        Tue, 05 Oct 2021 20:54:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm2142967lfd.103.2021.10.05.20.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:54:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v1 00/15] create power sequencing subsystem
Date:   Wed,  6 Oct 2021 06:53:52 +0300
Message-Id: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This is a proposed power sequencer subsystem. This is a
generification of the MMC pwrseq code. The subsystem tries to abstract
the idea of complex power-up/power-down/reset of the devices.

The primary set of devices that promted me to create this patchset is
the Qualcomm BT+WiFi family of chips. They reside on serial+platform
or serial + SDIO interfaces (older generations) or on serial+PCIe (newer
generations).  They require a set of external voltage regulators to be
powered on and (some of them) have separate WiFi and Bluetooth enable
GPIOs.

The major drawback for now is the lack of proper PCIe integration
At this moment support for PCIe is hacked up to be able to test the
PCIe part of qca6390. Proper PCIe support would require automatically
powering up the devices before the scan basing on the proper device
structure in the device tree. This two last patches are noted as WIP and
are included into the patchset for the purpose of testing WiFi on newer
chips (like qca6390/qca6391).

Changes since RFC v2:
 - Add documentation for the pwrseq code. Document data structures,
   macros and exported functions.
 - Export of_pwrseq_xlate_onecell()
 - Add separate pwrseq_set_drvdata() function to follow the typical API
   design
 - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
 - Moved code to handle old mmc-pwrseq binding to the MMC patch
 - Split of_pwrseq_xlate_onecell() support to a separate patch

Changes since RFC v1:
 - Provider pwrseq fallback support
 - Implement fallback support in pwrseq_qca.
 - Mmove susclk handling to pwrseq_qca.
 - Significantly simplify hci_qca.c changes, by dropping all legacy
   code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
   parts of the chip.



