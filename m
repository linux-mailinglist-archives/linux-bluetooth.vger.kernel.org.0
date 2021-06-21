Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10E33AF873
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Jun 2021 00:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbhFUWeC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Jun 2021 18:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbhFUWeB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:01 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585D0C061760
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jun 2021 15:31:46 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q23so16931694ljh.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jun 2021 15:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTXp9V2gmS/6O+YjuJWBHqGlLGOormIxmTXNND1OMs8=;
        b=lai/1I7l4KC6OZXLITF8pOdxQsjd6lU25zB/FRzAon/Xz7Au42HePwMQ550WfPuc7p
         R7pq17A87GvzCXfVQQRRnjfAgC5kz71kcb6rblgOxQCJRROIZRRJ4l8VbwqwhavOOcW4
         cTx7T9k7VhUehbcrQZgbAJmuzcrcnmyFs8NbM5aVe/ycCouGwyeltnuWrcsKao79aZIT
         gOut8cr5CK1MuImXyopuS8k4brXmHU1DbOWvmUqukzRGgiVq/VWT7HPjO6+Fl+Gcp1rs
         6SapLXi94VG2/A7VnZw7ZiSdVF4aRA8nOjpTofWQqCVTMe0qfvlu1VsKEkHqpIHb9uJI
         lIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qTXp9V2gmS/6O+YjuJWBHqGlLGOormIxmTXNND1OMs8=;
        b=EsRli+P7W2fM6iSQtnHStlfTIdcOnhCxOE95Cmm0hvBZ4tPvVvvmSn3cXzZA+v+ztN
         uDW0hjrIjFqn+K+PFGImlUTYta4C0+IMO89wisqmdosF101n7IgWpVrhXb/WPgCcVCeo
         TX8x/4wHxLw4vTUdSH5yREnIEJwsh+wrYhNRkDGi3cyOt2mz6ATzHPgTt/KLhvu3kWaW
         0VRlYtIiShCTgIPNEaWonA4jNp0LUPxXEH1bO4ZMv+j5vPqg4m/0oyE00YH8ZRKrlA0Q
         aN6oG41Okfh7kOfJyMaursRXgtRNoq/3a1U14ccXo0Hn1HUwPyMrEavTDDdER6TLq9I8
         1Pxw==
X-Gm-Message-State: AOAM5330gCMqOqiBVL0lboxZynHLaA7LDHs38ZtxKBI0hU0qw26/6Z9x
        UFzWrMSumkZ+LSz+oUMHOPjdCA==
X-Google-Smtp-Source: ABdhPJx3Tm/JKfsPSaneIPp8NE+W6ZjNQe1NNfBaZHoOmMkmpX1TaXMONK6O/nQYB3zOFTKwsTpwhg==
X-Received: by 2002:a2e:7103:: with SMTP id m3mr386188ljc.300.1624314704471;
        Mon, 21 Jun 2021 15:31:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:31:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 0/7] Add support for Qualcomm QCA639x chips family
Date:   Tue, 22 Jun 2021 01:31:34 +0300
Message-Id: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Qualcomm QCA639x is a family of WiFi + Bluetooth chips, with BT part
being controlled through the UART and WiFi being present on PCIe
bus. Both blocks use common power management unit wich should be turned
on before either of devices can be probed. Add common 'qcom-qca6390'
driver providing regulator to be used by both BT and PCIe parts.

Changes since v2:
 - Rebase on top of linux-next to get wcn6750 changes.
 - Switch from misc device providing power domains into regulator code.
 - Use vddpe-3v3-supply as expected by pcie-qcom driver.
 - Use enable_gpio functionality in hci_qca driver.

Changes since v1:
 - Stopped using wildcard in the dts binding, stick to qcom,qca6390.
 - Stopped using pcie0_phy for qca639x power domain.
 - Describe root PCIe bridge in the dts and bind power domain to the
   bridge.
 - Add pci quirk to power up power domains connected to this bridge.

----------------------------------------------------------------
Dmitry Baryshkov (7):
      dt-bindings: regulator: qcom,qca6390: add binding for QCA6390 device
      regulator: qca6390: add support for QCA639x powerup sequence
      Bluetooth: hci_qca: provide default device data
      Bluetooth: hci_qca: merge qca_power into qca_serdev
      Bluetooth: hci_qca: merge wcn & non-wcn code paths
      Bluetooth: hci_qca: add power sequencer support to qca6390
      arm64: dts: qcom: qrb5165-rb5: add QCA6391 WiFi+BT SoC

 .../bindings/regulator/qcom,qca6390.yaml           |  70 +++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |  56 +++++
 drivers/bluetooth/hci_qca.c                        | 225 ++++++++++-----------
 drivers/regulator/Kconfig                          |  13 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/qcom-qca639x.c                   | 157 ++++++++++++++
 6 files changed, 401 insertions(+), 121 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,qca6390.yaml
 create mode 100644 drivers/regulator/qcom-qca639x.c



