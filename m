Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A63F6299C
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jul 2019 21:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfGHT35 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jul 2019 15:29:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:11838 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbfGHT35 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jul 2019 15:29:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jul 2019 12:29:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; 
   d="scan'208";a="165545052"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2019 12:29:56 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hkZKl-0006PT-RJ; Tue, 09 Jul 2019 03:29:55 +0800
Date:   Tue, 9 Jul 2019 03:29:51 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     kbuild-all@01.org, linux-bluetooth@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [bluetooth-next:for-upstream 6/34] drivers/bluetooth/btqca.c:271:21:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <201907090348.Rdvwytaq%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git for-upstream
head:   9ce67c3235be71e8cf922a9b3d0b7359ed3f4ce5
commit: 32646db8cc2862a14788de1bb4c365d0a27fb532 [6/34] Bluetooth: btqca: inject command complete event during fw download
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 32646db8cc2862a14788de1bb4c365d0a27fb532
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/bluetooth/btqca.c:271:21: sparse: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] opcode @@    got e] opcode @@
>> drivers/bluetooth/btqca.c:271:21: sparse:    expected restricted __le16 [usertype] opcode
>> drivers/bluetooth/btqca.c:271:21: sparse:    got int

vim +271 drivers/bluetooth/btqca.c

   254	
   255	static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
   256	{
   257		struct hci_event_hdr *hdr;
   258		struct hci_ev_cmd_complete *evt;
   259		struct sk_buff *skb;
   260	
   261		skb = bt_skb_alloc(sizeof(*hdr) + sizeof(*evt) + 1, GFP_KERNEL);
   262		if (!skb)
   263			return -ENOMEM;
   264	
   265		hdr = skb_put(skb, sizeof(*hdr));
   266		hdr->evt = HCI_EV_CMD_COMPLETE;
   267		hdr->plen = sizeof(*evt) + 1;
   268	
   269		evt = skb_put(skb, sizeof(*evt));
   270		evt->ncmd = 1;
 > 271		evt->opcode = QCA_HCI_CC_OPCODE;
   272	
   273		skb_put_u8(skb, QCA_HCI_CC_SUCCESS);
   274	
   275		hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
   276	
   277		return hci_recv_frame(hdev, skb);
   278	}
   279	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
