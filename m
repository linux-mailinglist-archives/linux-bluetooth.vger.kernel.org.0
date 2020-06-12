Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACDD1F7638
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 11:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgFLJw3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 05:52:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:4129 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgFLJw3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 05:52:29 -0400
IronPort-SDR: 5gExowyIWZEjFPKrEhulUuFgjdik5ptyeUSBj7dsPJ2q9a43kkeceK4qhpycaBzkzXhSaHUNH9
 /NL90RDkmGGw==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 02:43:18 -0700
IronPort-SDR: yZHcjmCfcsGq0KH3NdjVtQ8Iok7G4R60iJFeHtWNncnY1DMclg0NToNXex2pkKR95qEwL8Q6rf
 kHcrji0YpFuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,502,1583222400"; 
   d="gz'50?scan'50,208,50";a="307255228"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2020 02:43:15 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjgDS-0000fa-HM; Fri, 12 Jun 2020 09:43:14 +0000
Date:   Fri, 12 Jun 2020 17:42:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kiran K <kiran.k@intel.com>, linux-bluetooth@vger.kernel.org
Cc:     kbuild-all@lists.01.org, ravishankar.srivatsa@intel.com,
        kiraank@gmail.com, Kiran K <kiran.k@intel.com>,
        Raghuram Hegde <raghuram.hegde@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Amit K Bag <amit.k.bag@intel.com>
Subject: Re: [PATCH 3/4] Bluetooth: btintel: Add helper functions to parse
 firmware name
Message-ID: <202006121702.o8wnHHHY%lkp@intel.com>
References: <20200611114526.13594-4-kiran.k@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20200611114526.13594-4-kiran.k@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kiran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on next-20200611]
[cannot apply to bluetooth/master v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Kiran-K/Add-support-for-new-generation-Intel-controllers/20200611-194619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: nds32-randconfig-r014-20200612 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from ./arch/nds32/include/generated/asm/bug.h:1,
from include/linux/bug.h:5,
from include/linux/thread_info.h:12,
from include/asm-generic/preempt.h:5,
from ./arch/nds32/include/generated/asm/preempt.h:1,
from include/linux/preempt.h:78,
from include/linux/spinlock.h:51,
from include/linux/seqlock.h:36,
from include/linux/time.h:6,
from include/linux/stat.h:19,
from include/linux/module.h:13,
from drivers/bluetooth/btintel.c:9:
include/linux/dma-mapping.h: In function 'dma_map_resource':
arch/nds32/include/asm/memory.h:82:32: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
82 | #define pfn_valid(pfn)  ((pfn) >= PHYS_PFN_OFFSET && (pfn) < (PHYS_PFN_OFFSET + max_mapnr))
|                                ^~
include/asm-generic/bug.h:139:27: note: in definition of macro 'WARN_ON_ONCE'
139 |  int __ret_warn_once = !!(condition);            |                           ^~~~~~~~~
include/linux/dma-mapping.h:352:19: note: in expansion of macro 'pfn_valid'
352 |  if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
|                   ^~~~~~~~~
drivers/bluetooth/btintel.c: At top level:
drivers/bluetooth/btintel.c:229:6: warning: no previous prototype for 'btintel_boot_info' [-Wmissing-prototypes]
229 | void btintel_boot_info(struct hci_dev *hdev,
|      ^~~~~~~~~~~~~~~~~
drivers/bluetooth/btintel.c:252:6: warning: no previous prototype for 'btintel_boot_info_tlv' [-Wmissing-prototypes]
252 | void btintel_boot_info_tlv(struct hci_dev *hdev,
|      ^~~~~~~~~~~~~~~~~~~~~
<<                  from drivers/bluetooth/btintel.c:9:
>> drivers/bluetooth/btintel.c:385:6: warning: no previous prototype for 'btintel_get_fw_name' [-Wmissing-prototypes]
385 | bool btintel_get_fw_name(struct intel_version *ver,
|      ^~~~~~~~~~~~~~~~~~~
<<                  from drivers/bluetooth/btintel.c:9:
>> drivers/bluetooth/btintel.c:439:6: warning: no previous prototype for 'btintel_get_fw_name_tlv' [-Wmissing-prototypes]
439 | void btintel_get_fw_name_tlv(struct intel_version_tlv *ver,
|      ^~~~~~~~~~~~~~~~~~~~~~~

vim +/btintel_get_fw_name +385 drivers/bluetooth/btintel.c

   384	
 > 385	bool btintel_get_fw_name(struct intel_version *ver,
   386				 struct intel_boot_params *params,
   387				 char *fw_name, size_t len,
   388				 const char *suffix)
   389	{
   390		/* This is for legacy HCI_Intel_Read_Version command.
   391		 *
   392		 * With this Intel bootloader only the hardware variant and device
   393		 * revision information are used to select the right firmware for SfP
   394		 * and WsP.
   395		 *
   396		 * The firmware filename is ibt-<hw_variant>-<dev_revid>.sfi.
   397		 *
   398		 * Currently the supported hardware variants are:
   399		 *   11 (0x0b) for iBT3.0 (LnP/SfP)
   400		 *   12 (0x0c) for iBT3.5 (WsP)
   401		 *
   402		 * For ThP/JfP and for future SKU's, the FW name varies based on HW
   403		 * variant, HW revision and FW revision, as these are dependent on CNVi
   404		 * and RF Combination.
   405		 *
   406		 *   17 (0x11) for iBT3.5 (JfP)
   407		 *   18 (0x12) for iBT3.5 (ThP)
   408		 *
   409		 * The firmware file name for these will be
   410		 * ibt-<hw_variant>-<hw_revision>-<fw_revision>.sfi.
   411		 *
   412		 */
   413	
   414		switch (ver->hw_variant) {
   415		case 0x0b:	/* SfP */
   416		case 0x0c:	/* WsP */
   417			snprintf(fw_name, len, "intel/ibt-%u-%u.%s",
   418				 le16_to_cpu(ver->hw_variant),
   419				 le16_to_cpu(params->dev_revid),
   420				 suffix);
   421			break;
   422		case 0x11:	/* JfP */
   423		case 0x12:	/* ThP */
   424		case 0x13:	/* HrP */
   425		case 0x14:	/* CcP */
   426			snprintf(fw_name, len, "intel/ibt-%u-%u-%u.%s",
   427				 le16_to_cpu(ver->hw_variant),
   428				 le16_to_cpu(ver->hw_revision),
   429				 le16_to_cpu(ver->fw_revision),
   430				 suffix);
   431			break;
   432		default:
   433			return false;
   434		}
   435		return true;
   436	}
   437	EXPORT_SYMBOL_GPL(btintel_get_fw_name);
   438	
 > 439	void btintel_get_fw_name_tlv(struct intel_version_tlv *ver,
   440				     char *fw_name, size_t len,
   441				     const char *suffix)
   442	{
   443		/* This is for legacy HCI_Intel_Read_Version command.
   444		 * The firmware file name for these will be
   445		 * ibt-<cnvi_top type+cnvi_top step>-<cnvr_top type+cnvr_top step>
   446		 *
   447		 * Currently the supported hardware variants are:
   448		 * iBT4.2 23 (0x17) for TyP
   449		 * iBT4.2 24 (0x18) for Solar
   450		 */
   451		snprintf(fw_name, len, "intel/ibt-%04x-%04x.%s",
   452			 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvi_top),
   453			 INTEL_CNVX_TOP_STEP(ver->cnvi_top)),
   454			 INTEL_CNVX_TOP_PACK_SWAB(INTEL_CNVX_TOP_TYPE(ver->cnvr_top),
   455			 INTEL_CNVX_TOP_STEP(ver->cnvr_top)),
   456			 suffix);
   457	}
   458	EXPORT_SYMBOL_GPL(btintel_get_fw_name_tlv);
   459	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--fUYQa+Pmc3FrFX/N
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
z88fFQuQFSnkAQA=

--fUYQa+Pmc3FrFX/N--
