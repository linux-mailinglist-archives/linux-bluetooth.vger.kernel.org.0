Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4921FFB81
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Jun 2020 21:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgFRTHZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Jun 2020 15:07:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:32343 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbgFRTHY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Jun 2020 15:07:24 -0400
IronPort-SDR: KfeUKQUqIthSlxdPogwjOhpb/LkXus2OvvgR3rchnNnMghpW/9q1fv/Dwz7ak5wZyIzxXPp17H
 4waMaA0iTZJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9656"; a="207935052"
X-IronPort-AV: E=Sophos;i="5.75,252,1589266800"; 
   d="gz'50?scan'50,208,50";a="207935052"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 12:06:49 -0700
IronPort-SDR: Rgq0OerI1TZ3xb+rOflLN8pZrN+V5AHTl1s+I8g592Rh2zEWvxVRIX6S4A0y833GWYSgAkGVmH
 yN0b8j8GEm1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,252,1589266800"; 
   d="gz'50?scan'50,208,50";a="317909774"
Received: from lkp-server02.sh.intel.com (HELO 5ce11009e457) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2020 12:06:46 -0700
Received: from kbuild by 5ce11009e457 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jlzs5-0000Ng-Tr; Thu, 18 Jun 2020 19:06:45 +0000
Date:   Fri, 19 Jun 2020 03:06:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     kbuild-all@lists.01.org, linux-bluetooth@vger.kernel.org,
        Johan Hedberg <johan.hedberg@intel.com>,
        Alain Michaud <alainm@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>
Subject: [bluetooth-next:master 5/14] net/bluetooth/mgmt.c:3932:9: sparse:
 sparse: cast to restricted __le32
Message-ID: <202006190301.bWUER94O%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
head:   46605a271114f1243c807a55c607271c81e662d2
commit: 4c54bf2b093bb2ae95e756342646d868e8101cb4 [5/14] Bluetooth: Add get/set device flags mgmt op
config: c6x-randconfig-s032-20200618 (attached as .config)
compiler: c6x-elf-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.2-rc1-10-gc17b1b06-dirty
        git checkout 4c54bf2b093bb2ae95e756342646d868e8101cb4
        # save the attached .config to linux build tree
        make W=1 C=1 ARCH=c6x CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   net/bluetooth/mgmt.c:3605:29: sparse: sparse: restricted __le16 degrades to integer
>> net/bluetooth/mgmt.c:3932:9: sparse: sparse: cast to restricted __le32

vim +3932 net/bluetooth/mgmt.c

  3921	
  3922	static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
  3923				    u16 len)
  3924	{
  3925		struct mgmt_cp_set_device_flags *cp = data;
  3926		struct bdaddr_list_with_flags *br_params;
  3927		struct hci_conn_params *params;
  3928		u8 status = MGMT_STATUS_INVALID_PARAMS;
  3929		u32 supported_flags = SUPPORTED_DEVICE_FLAGS();
  3930		u32 current_flags = __le32_to_cpu(cp->current_flags);
  3931	
> 3932		bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) = 0x%x",
  3933			   &cp->addr.bdaddr, cp->addr.type,
  3934			   __le32_to_cpu(current_flags));
  3935	
  3936		if ((supported_flags | current_flags) != supported_flags) {
  3937			bt_dev_warn(hdev, "Bad flag given (0x%x) vs supported (0x%0x)",
  3938				    current_flags, supported_flags);
  3939			goto done;
  3940		}
  3941	
  3942		if (cp->addr.type == BDADDR_BREDR) {
  3943			br_params = hci_bdaddr_list_lookup_with_flags(&hdev->whitelist,
  3944								      &cp->addr.bdaddr,
  3945								      cp->addr.type);
  3946	
  3947			if (br_params) {
  3948				br_params->current_flags = current_flags;
  3949				status = MGMT_STATUS_SUCCESS;
  3950			} else {
  3951				bt_dev_warn(hdev, "No such BR/EDR device %pMR (0x%x)",
  3952					    &cp->addr.bdaddr, cp->addr.type);
  3953			}
  3954		} else {
  3955			params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
  3956							le_addr_type(cp->addr.type));
  3957			if (params) {
  3958				params->current_flags = current_flags;
  3959				status = MGMT_STATUS_SUCCESS;
  3960			} else {
  3961				bt_dev_warn(hdev, "No such LE device %pMR (0x%x)",
  3962					    &cp->addr.bdaddr,
  3963					    le_addr_type(cp->addr.type));
  3964			}
  3965		}
  3966	
  3967	done:
  3968		if (status == MGMT_STATUS_SUCCESS)
  3969			device_flags_changed(sk, hdev, &cp->addr.bdaddr, cp->addr.type,
  3970					     supported_flags, current_flags);
  3971	
  3972		return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_DEVICE_FLAGS, status,
  3973					 &cp->addr, sizeof(cp->addr));
  3974	}
  3975	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--tKW2IUtsqtDRztdT
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
PzRIXId2WQEA

--tKW2IUtsqtDRztdT--
