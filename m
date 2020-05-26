Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469B41DB2B6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 May 2020 14:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETMHT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 May 2020 08:07:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36840 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETMHT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 May 2020 08:07:19 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC1VCL176884;
        Wed, 20 May 2020 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=8oaHWvAGVq5R/WBB72eBFbH4gGCNOq3E0d9WK/A9nI4=;
 b=Zt2qOKtFya/s2h/himwuAYu364yCvIgMJK3M2syqX3w58JNB34J93i1P3f4fugQ0TELj
 ujn2DAqbH7yYTv88YKmZZscTUSXw7fHHWJGHzAB3XrsJSZ5vV0vbqjWSzmxre7tD/8b+
 ifqhvJOnA7vEMF809rb6QDBIBMU7CPVvM8TRWt0nD3uBno0vbv30+UFn1FTmRV2O/AcY
 H2PgEr9qvyZJs2exorNkGCy+f2+T2RigQ73fATFZEiAySeT4+Y7G+a1dg8qSMF6YqPxN
 qLztcz9N4OBskVAgp4aYgUzESsZ55IRM5kmnXPAhX5BY9Ez6IAXxiOrUO1HrUXBRoTQO fQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 31501r97wb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 12:07:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC4Tjl147796;
        Wed, 20 May 2020 12:05:16 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 314gm6y7gs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 May 2020 12:05:16 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04KC5FL5015280;
        Wed, 20 May 2020 12:05:15 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 May 2020 05:05:15 -0700
Date:   Wed, 20 May 2020 15:05:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     abhishekpandit@chromium.org
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bug report] Bluetooth: hci_qca: Enable WBS support for wcn3991
Message-ID: <20200520120510.GF172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=876
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=3
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=902 clxscore=1011 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200105
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello Abhishek Pandit-Subedi,

The patch a228f7a41029: "Bluetooth: hci_qca: Enable WBS support for
wcn3991" from May 14, 2020, leads to the following static checker
warning:

	drivers/bluetooth/hci_qca.c:1960 qca_serdev_probe()
	error: uninitialized symbol 'hdev'.

drivers/bluetooth/hci_qca.c
  1948          }
  1949  
  1950          if (power_ctrl_enabled) {
  1951                  hdev = qcadev->serdev_hu.hdev;
                        ^^^^
hdev is only initialized here.

  1952                  set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
  1953                  hdev->shutdown = qca_power_off;
  1954          }
  1955  
  1956          /* Wideband speech support must be set per driver since it can't be
  1957           * queried via hci.
  1958           */
  1959          if (data && (data->capabilities & QCA_CAP_WIDEBAND_SPEECH))
  1960                  set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
                                                                      ^^^^
Potentially uninitialized here.

  1961  
  1962          return 0;
  1963  }

regards,
dan carpenter
