Return-Path: <linux-bluetooth+bounces-4362-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 041ED8BE9E9
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 18:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE48628C0FB
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 16:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B5B5380E;
	Tue,  7 May 2024 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdFPz+oM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5253E28
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 May 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715101018; cv=none; b=UNcVM26mvvxnSFLGNLLXeeUyM8yZPebgn0HHD5/fUWnZ2YcZVUxfDvyVMM9n0zzPDQMPYfFqNRhS3BDRpJKqftC2700pNt7/dgdAGjJ1TjAJgoMW63aUoS2JCGEO2U563scRpkgU5+fk1IDjzOB1CoQ1ywItod9a7l7IRiBILG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715101018; c=relaxed/simple;
	bh=cFSdexzCdZyBBMK8e7xWF1bGs9eR4BRKIavR+NENwg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTZEWFjl+ZaPH5W6pvgqSklC1TIXzdGbGnEl4pHrLaGp0OhQbk3Pp3hdu13t83ctAM90JmkLU3qLvtH9fBEGUhLNMKLg5RbHw1ARq1eeVezltAsApSMJfTnp9l6Q9JQNfr+40AXI9VGVUISvJFnqjt0VKdLqL0C+zr48nah4wi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdFPz+oM; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e242b1dfd6so37154531fa.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 May 2024 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715101014; x=1715705814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJMy6IXMLzvJCeG8EGOMKjuN/fGme8qSK+HXBWJO7v8=;
        b=bdFPz+oMs4QjynI7VwtgTWLwNip+xOdVJO1+7VG/dHrjNspLX3hHGyKOY3/98j8qLu
         SUakdhl0re8J2w4A/NC7UVPzNZCyUliETkNA5l1T5rLowxx0XiZ3XTdNEONFZX6T47jj
         ChKpAMNR2k6pBh624C0ZqrqgWVrOSbypdrW+9ImkKPIGj+LqCUOuRln8wy9KlUIWqcQk
         SFbWWDPSZbAoI+f9lvqs0O0C1TnkfMbUnb8huCw80V2lLlFBwpj9rywjtLXcpsDTlOj7
         H372aYc2yphRxYb4o6gouST00ptIDqbcNBnxV5e9OIr5TrChOX2C/fE9Ttwo5ZsnfENI
         Dpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715101014; x=1715705814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJMy6IXMLzvJCeG8EGOMKjuN/fGme8qSK+HXBWJO7v8=;
        b=sI5R8toled3NxHxVuaymHRZuKxeuSyWVCMDcY3wdS6t28FZXojHbkMMlW5R03n6uOJ
         aamoTzgf3ZHKWxepMrfDgxI3GvSVLACTrUEIFvMjHp/SEQV9tWSVnqa6VrTYphgYd2J8
         toitK4nfSWkA/UqihhvuYSS30JfADdazncGkjTuq0Nqh9SiuRYhAt3K/05NiJh2ZmUW+
         24/brlyPLPPxB8HsBjUe9RVQCnF3caJLKyJ4OtNKLRiiInFlLIGWo2cPY4cvbj80Kll5
         HHiLvcRkZSujG88FfDejVpNK2ceYWqc+3D92X+Qm+zApiE8OgtR53wVB3p4B8Vo9RPO+
         Kd0g==
X-Gm-Message-State: AOJu0YzdJ3tb4KXBrL2bIcHbcY7Hf39XMv3a++lrlZLMuouB5sStUwkG
	scTpZT4Cf2bMc6XUcVyVeCpbYHCcrSlhw++R0BPpc7uKinSyzSLTfQE14UFD+dTOfwsaKofEwCc
	+8FjLY6dIFuH+IcUn3BbOOlFE4hOEHg==
X-Google-Smtp-Source: AGHT+IFQFyv7zwiErLeo44Tb/DmbSuXqyHTCAtsRmlKLAQrVZMezPquKrUjUUE/hQ9hV0K4bQ20LqbRdKQSFG8m76xc=
X-Received: by 2002:a2e:9cd9:0:b0:2e1:e36f:749 with SMTP id
 38308e7fff4ca-2e446d83bf3mr1196301fa.7.1715101013670; Tue, 07 May 2024
 09:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507155658.294676-1-kiran.k@intel.com> <20240507155658.294676-3-kiran.k@intel.com>
In-Reply-To: <20240507155658.294676-3-kiran.k@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 May 2024 12:56:41 -0400
Message-ID: <CABBYNZJtKg_0UbTWkBBzM+J5rCRAU5QOrp5BAinpwAwvFUeRjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Bluetooth: btintel_pcie: Add *setup* function to
 download firmware
To: Kiran K <kiran.k@intel.com>
Cc: linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com, 
	chethan.tumkur.narayan@intel.com, chandrashekar.devegowda@intel.com, 
	helgaas@kernel.org, pmenzel@molgen.mpg.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kiran,

On Tue, May 7, 2024 at 12:23=E2=80=AFPM Kiran K <kiran.k@intel.com> wrote:
>
> Add support to download firmware.
>
> dmesg:
> [4.407464] Bluetooth: Core ver 2.22
> [4.407467] Bluetooth: Starting self testing
> [4.409093] Bluetooth: ECDH test passed in 1587 usecs
> [4.420737] Bluetooth: SMP test passed in 526 usecs
> [4.420745] Bluetooth: Finished self testing
> [4.420760] Bluetooth: HCI device and connection manager initialized
> [4.420764] Bluetooth: HCI socket layer initialized
> [4.420766] Bluetooth: L2CAP socket layer initialized
> [4.420769] Bluetooth: SCO socket layer initialized
> [4.437976] Bluetooth: hci0: Device revision is 0
> [4.437979] Bluetooth: hci0: Secure boot is disabled
> [4.437980] Bluetooth: hci0: OTP lock is disabled
> [4.437980] Bluetooth: hci0: API lock is disabled
> [4.437981] Bluetooth: hci0: Debug lock is disabled
> [4.437981] Bluetooth: hci0: Minimum firmware build 0 week 0 2000
> [4.437982] Bluetooth: hci0: Bootloader timestamp 2023.33 buildtype 1 buil=
d 45995
> [4.439461] Bluetooth: hci0: Found device firmware: intel/ibt-0190-0291-im=
l.sfi
> [4.439467] Bluetooth: hci0: Boot Address: 0x30099000
> [4.439468] Bluetooth: hci0: Firmware Version: 92-19.24
> [4.486773] Bluetooth: hci0: Waiting for firmware download to complete
> [4.486784] Bluetooth: hci0: Firmware loaded in 46209 usecs
> [4.486845] Bluetooth: hci0: Waiting for device to boot
> [4.491984] Bluetooth: hci0: Malformed MSFT vendor event: 0x02

We might want to fix the above as it is reporting as Malformed.

> [4.491987] Bluetooth: hci0: Device booted in 5074 usecs
> [4.496657] Bluetooth: hci0: Found device firmware: intel/ibt-0190-0291.sf=
i
> [4.496703] Bluetooth: hci0: Boot Address: 0x10000800
> [4.496704] Bluetooth: hci0: Firmware Version: 92-19.24
> [4.687338] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [4.687342] Bluetooth: BNEP filters: protocol multicast
> [4.687345] Bluetooth: BNEP socket layer initialized
> [4.922589] Bluetooth: hci0: Waiting for firmware download to complete
> [4.922608] Bluetooth: hci0: Firmware loaded in 415962 usecs
> [4.922664] Bluetooth: hci0: Waiting for device to boot
> [4.956185] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
> [4.956188] Bluetooth: hci0: Device booted in 32770 usecs
> [4.963167] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0190-02=
91.ddc
> [4.963440] Bluetooth: hci0: Applying Intel DDC parameters completed
> [4.963684] Bluetooth: hci0: Firmware timestamp 2024.18 buildtype 3 build =
62300
> [4.963687] Bluetooth: hci0: Firmware SHA1: 0x8201a4cd
> [5.003020] Bluetooth: MGMT ver 1.22
> [5.003084] Bluetooth: ISO socket layer initialized
> [5.057844] Bluetooth: RFCOMM TTY layer initialized
> [5.057858] Bluetooth: RFCOMM socket layer initialized
> [5.057865] Bluetooth: RFCOMM ver 1.11
>
> hciconfig -a:
> hci0:   Type: Primary  Bus: PCI
>         BD Address: A0:D3:65:48:F5:7F  ACL MTU: 1021:5  SCO MTU: 240:8
>         UP RUNNING PSCAN
>         RX bytes:23603 acl:0 sco:0 events:3792 errors:0
>         TX bytes:949804 acl:0 sco:0 commands:3788 errors:0
>         Features: 0xbf 0xfe 0x0f 0xfe 0xdb 0xff 0x7b 0x87
>         Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
>         Link policy: RSWITCH SNIFF
>         Link mode: PERIPHERAL ACCEPT
>         Name: 'LNLM620'
>         Class: 0x20010c
>         Service Classes: Audio
>         Device Class: Computer, Laptop
>         HCI Version: 5.4 (0xd)  Revision: 0x4b5c
>         LMP Version: 5.4 (0xd)  Subversion: 0x4b5c
>         Manufacturer: Intel Corp. (2)
>
> Signed-off-by: Chandrashekar <chandrashekar.devegowda@intel.com>
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
>  drivers/bluetooth/btintel_pcie.c | 313 ++++++++++++++++++++++++++++++-
>  drivers/bluetooth/btintel_pcie.h |   5 +
>  2 files changed, 315 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel=
_pcie.c
> index 911bb50d7ce7..664cc08b0b4f 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -42,6 +42,7 @@ MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
>
>  /* Intel PCIe uses 4 bytes of HCI type instead of 1 byte BT SIG HCI type=
 */
>  #define BTINTEL_PCIE_HCI_TYPE_LEN      4
> +#define BTINTEL_PCIE_HCI_CMD_PKT       0x00000001
>  #define BTINTEL_PCIE_HCI_ACL_PKT       0x00000002
>  #define BTINTEL_PCIE_HCI_SCO_PKT       0x00000003
>  #define BTINTEL_PCIE_HCI_EVT_PKT       0x00000004
> @@ -88,6 +89,75 @@ static struct btintel_pcie_data *btintel_pcie_get_data=
(struct msix_entry *entry)
>         return container_of(entries, struct btintel_pcie_data, msix_entri=
es[0]);
>  }
>
> +/* Set the doorbell for TXQ to notify the device that @index (actually i=
ndex-1)
> + * of the TFD is updated and ready to transmit.
> + */
> +static void btintel_pcie_set_tx_db(struct btintel_pcie_data *data, u16 i=
ndex)
> +{
> +       u32 val;
> +
> +       val =3D index;
> +       val |=3D (BTINTEL_PCIE_TX_DB_VEC << 16);
> +
> +       btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_HBUS_TARG_WRPTR, val=
);
> +}
> +
> +/* Copy the data to next(@tfd_index) data buffer and update the TFD(tran=
sfer
> + * descriptor) with the data length and the DMA address of the data buff=
er.
> + */
> +static void btintel_pcie_prepare_tx(struct txq *txq, u16 tfd_index,
> +                                   struct sk_buff *skb)
> +{
> +       struct data_buf *buf;
> +       struct tfd *tfd;
> +
> +       tfd =3D &txq->tfds[tfd_index];
> +       memset(tfd, 0, sizeof(*tfd));
> +
> +       buf =3D &txq->bufs[tfd_index];
> +
> +       tfd->size =3D skb->len;
> +       tfd->addr =3D buf->data_p_addr;
> +
> +       /* Copy the outgoing data to DMA buffer */
> +       memcpy(buf->data, skb->data, tfd->size);
> +}
> +
> +static int btintel_pcie_send_sync(struct btintel_pcie_data *data,
> +                                 struct sk_buff *skb)
> +{
> +       int ret;
> +       u16 tfd_index;
> +       struct txq *txq =3D &data->txq;
> +
> +       tfd_index =3D data->ia.tr_hia[BTINTEL_PCIE_TXQ_NUM];
> +
> +       if (tfd_index > txq->count)
> +               return -ERANGE;
> +
> +       /* Prepare for TX. It updates the TFD with the length of data and
> +        * address of the DMA buffer, and copy the data to the DMA buffer
> +        */
> +       btintel_pcie_prepare_tx(txq, tfd_index, skb);
> +
> +       tfd_index =3D (tfd_index + 1) % txq->count;
> +       data->ia.tr_hia[BTINTEL_PCIE_TXQ_NUM] =3D tfd_index;
> +
> +       /* Arm wait event condition */
> +       data->tx_wait_done =3D false;
> +
> +       /* Set the doorbell to notify the device */
> +       btintel_pcie_set_tx_db(data, tfd_index);
> +
> +       /* Wait for the complete interrupt - URBD0 */
> +       ret =3D wait_event_timeout(data->tx_wait_q, data->tx_wait_done,
> +                                msecs_to_jiffies(TX_WAIT_TIMEOUT_MS));
> +       if (!ret)
> +               return -ETIME;
> +
> +       return 0;
> +}
> +
>  /* Set the doorbell for RXQ to notify the device that @index (actually i=
ndex-1)
>   * is available to receive the data
>   */
> @@ -933,15 +1003,252 @@ static int btintel_pcie_alloc(struct btintel_pcie=
_data *data)
>         return err;
>  }
>
> +static int btintel_pcie_hci_open(struct hci_dev *hdev)
> +{
> +       bt_dev_dbg(hdev, "btintel_pcie_hci_open");

Afaik you don't need to add the function name as that can be enabled
directly with debugfs.

> +       return 0;
> +}
> +
> +static int btintel_pcie_hci_close(struct hci_dev *hdev)
> +{
> +       bt_dev_dbg(hdev, "btintel_pcie_hci_close");

Ditto.

> +       return 0;
> +}
> +
> +static int btintel_pcie_inject_cmd_complete(struct hci_dev *hdev, __u16 =
opcode)
> +{
> +       struct sk_buff *skb;
> +       struct hci_event_hdr *hdr;
> +       struct hci_ev_cmd_complete *evt;
> +
> +       skb =3D bt_skb_alloc(sizeof(*hdr) + sizeof(*evt) + 1, GFP_KERNEL)=
;
> +       if (!skb)
> +               return -ENOMEM;
> +
> +       hdr =3D (struct hci_event_hdr *)skb_put(skb, sizeof(*hdr));
> +       hdr->evt =3D HCI_EV_CMD_COMPLETE;
> +       hdr->plen =3D sizeof(*evt) + 1;
> +
> +       evt =3D (struct hci_ev_cmd_complete *)skb_put(skb, sizeof(*evt));
> +       evt->ncmd =3D 0x01;
> +       evt->opcode =3D cpu_to_le16(opcode);
> +
> +       *(u8 *)skb_put(skb, 1) =3D 0x00;
> +
> +       hci_skb_pkt_type(skb) =3D HCI_EVENT_PKT;
> +
> +       return hci_recv_frame(hdev, skb);
> +}
> +
> +static int btintel_pcie_hci_send_frame(struct hci_dev *hdev,
> +                                      struct sk_buff *skb)
> +{
> +       struct btintel_pcie_data *data =3D hci_get_drvdata(hdev);
> +       int ret;
> +       u32 type;
> +
> +       /* Due to the fw limitation, the type header of the packet should=
 be
> +        * 4 bytes unlike 1 byte for UART. In UART, the firmware can read
> +        * the first byte to get the packet type and redirect the rest of=
 data
> +        * packet to the right handler.
> +        *
> +        * But for PCIe, THF(Transfer Flow Handler) fetches the 4 bytes o=
f data
> +        * from DMA memory and by the time it reads the first 4 bytes, it=
 has
> +        * already consumed some part of packet. Thus the packet type ind=
icator
> +        * for iBT PCIe is 4 bytes.
> +        *
> +        * Luckily, when HCI core creates the skb, it allocates 8 bytes o=
f
> +        * head room for profile and driver use, and before sending the d=
ata
> +        * to the device, append the iBT PCIe packet type in the front.
> +        */
> +       switch (hci_skb_pkt_type(skb)) {
> +       case HCI_COMMAND_PKT:
> +               type =3D BTINTEL_PCIE_HCI_CMD_PKT;
> +               if (btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
> +                       struct hci_command_hdr *cmd =3D (void *)skb->data=
;
> +                       __u16 opcode =3D le16_to_cpu(cmd->opcode);
> +
> +                       /* When the 0xfc01 command is issued to boot into
> +                        * the operational firmware, it will actually not
> +                        * send a command complete event. To keep the flo=
w
> +                        * control working inject that event here.
> +                        */
> +                       if (opcode =3D=3D 0xfc01)
> +                               btintel_pcie_inject_cmd_complete(hdev, op=
code);
> +               }
> +               hdev->stat.cmd_tx++;
> +               break;
> +       case HCI_ACLDATA_PKT:
> +               type =3D BTINTEL_PCIE_HCI_ACL_PKT;
> +               hdev->stat.acl_tx++;
> +               break;
> +       case HCI_SCODATA_PKT:
> +               type =3D BTINTEL_PCIE_HCI_SCO_PKT;
> +               hdev->stat.sco_tx++;
> +               break;
> +       default:
> +               bt_dev_err(hdev, "Unknown HCI packet type");
> +               return -EILSEQ;
> +       }
> +       memcpy(skb_push(skb, BTINTEL_PCIE_HCI_TYPE_LEN), &type,
> +              BTINTEL_PCIE_HCI_TYPE_LEN);
> +
> +       ret =3D btintel_pcie_send_sync(data, skb);
> +       if (ret) {
> +               hdev->stat.err_tx++;
> +               bt_dev_err(hdev, "Failed to send frame (%d)", ret);
> +               goto exit_error;

You don't really need the goto line above since it will jump to that
line anyway.

> +       } else {
> +               hdev->stat.byte_tx +=3D skb->len;
> +               kfree_skb(skb);
> +       }
> +
> +exit_error:
> +       return ret;
> +}
> +
>  static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
>  {
> -       /* TODO: Unregister and release hdev */
> +       struct hci_dev *hdev;
> +
> +       hdev =3D data->hdev;
> +       hci_unregister_dev(hdev);
> +       hci_free_dev(hdev);
> +       data->hdev =3D NULL;
> +}
> +
> +static int btintel_pcie_setup(struct hci_dev *hdev)
> +{
> +       const u8 param[1] =3D { 0xFF };
> +       struct intel_version_tlv ver_tlv;
> +       struct sk_buff *skb;
> +       int err;
> +
> +       BT_DBG("%s", hdev->name);
> +
> +       skb =3D __hci_cmd_sync(hdev, 0xfc05, 1, param, HCI_CMD_TIMEOUT);
> +       if (IS_ERR(skb)) {
> +               bt_dev_err(hdev, "Reading Intel version command failed (%=
ld)",
> +                          PTR_ERR(skb));
> +               return PTR_ERR(skb);
> +       }
> +
> +       /* Check the status */
> +       if (skb->data[0]) {
> +               bt_dev_err(hdev, "Intel Read Version command failed (%02x=
)",
> +                          skb->data[0]);
> +               err =3D -EIO;
> +               goto exit_error;
> +       }
> +
> +       /* Apply the common HCI quirks for Intel device */
> +       set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
> +       set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> +       set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
> +
> +       /* Set up the quality report callback for Intel devices */
> +       hdev->set_quality_report =3D btintel_set_quality_report;
> +
> +       memset(&ver_tlv, 0, sizeof(ver_tlv));
> +       /* For TLV type device, parse the tlv data */
> +       err =3D btintel_parse_version_tlv(hdev, &ver_tlv, skb);
> +       if (err) {
> +               bt_dev_err(hdev, "Failed to parse TLV version information=
");
> +               goto exit_error;
> +       }
> +
> +       switch (INTEL_HW_PLATFORM(ver_tlv.cnvi_bt)) {
> +       case 0x37:
> +               break;
> +       default:
> +               bt_dev_err(hdev, "Unsupported Intel hardware platform (0x=
%2x)",
> +                          INTEL_HW_PLATFORM(ver_tlv.cnvi_bt));
> +               err =3D -EINVAL;
> +               goto exit_error;
> +       }
> +
> +       /* Check for supported iBT hardware variants of this firmware
> +        * loading method.
> +        *
> +        * This check has been put in place to ensure correct forward
> +        * compatibility options when newer hardware variants come
> +        * along.
> +        */
> +       switch (INTEL_HW_VARIANT(ver_tlv.cnvi_bt)) {
> +       case 0x1e:      /* BzrI */
> +               /* Display version information of TLV type */
> +               btintel_version_info_tlv(hdev, &ver_tlv);
> +
> +               /* Apply the device specific HCI quirks for TLV based dev=
ices
> +                *
> +                * All TLV based devices support WBS
> +                */
> +               set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirk=
s);
> +
> +               /* Apply LE States quirk from solar onwards */
> +               set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
> +
> +               /* Setup MSFT Extension support */
> +               btintel_set_msft_opcode(hdev,
> +                                       INTEL_HW_VARIANT(ver_tlv.cnvi_bt)=
);
> +
> +               err =3D btintel_bootloader_setup_tlv(hdev, &ver_tlv);
> +               if (err)
> +                       goto exit_error;
> +               break;
> +       default:
> +               bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
> +                          INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
> +               err =3D -EINVAL;
> +               break;
> +       }
> +
> +exit_error:
> +       kfree_skb(skb);
> +
> +       return err;
>  }
>
>  static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
>  {
> -       /* TODO: initialize hdev and assign the callbacks to hdev */
> -       return -ENODEV;
> +       int err;
> +       struct hci_dev *hdev;
> +
> +       hdev =3D hci_alloc_dev();
> +       if (!hdev)
> +               return -ENOMEM;
> +
> +       hdev->bus =3D HCI_PCI;
> +       hci_set_drvdata(hdev, data);
> +
> +       hdev->dev_type =3D HCI_PRIMARY;
> +
> +       data->hdev =3D hdev;
> +       SET_HCIDEV_DEV(hdev, &data->pdev->dev);
> +
> +       hdev->manufacturer =3D 2;
> +       hdev->open =3D btintel_pcie_hci_open;
> +       hdev->close =3D btintel_pcie_hci_close;
> +       hdev->send =3D btintel_pcie_hci_send_frame;
> +       hdev->setup =3D btintel_pcie_setup;
> +       hdev->shutdown =3D btintel_shutdown_combined;
> +       hdev->hw_error =3D btintel_hw_error;
> +       hdev->set_diag =3D btintel_set_diag;
> +       hdev->set_bdaddr =3D btintel_set_bdaddr;
> +
> +       err =3D hci_register_dev(hdev);
> +       if (err < 0) {
> +               BT_ERR("Failed to register to hdev (%d)", err);
> +               goto exit_error;
> +       }
> +
> +       return 0;
> +
> +exit_error:
> +       hci_free_dev(hdev);
> +       return err;
>  }
>
>  static int btintel_pcie_probe(struct pci_dev *pdev,
> diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel=
_pcie.h
> index f925dfb23cfc..0e596e094f80 100644
> --- a/drivers/bluetooth/btintel_pcie.h
> +++ b/drivers/bluetooth/btintel_pcie.h
> @@ -87,6 +87,11 @@ enum {
>  /* DMA allocation alignment */
>  #define BTINTEL_PCIE_DMA_POOL_ALIGNMENT        256
>
> +#define TX_WAIT_TIMEOUT_MS     500

This value above was this chosen based on what exactly?

> +
> +/* Doorbell vector for TFD */
> +#define BTINTEL_PCIE_TX_DB_VEC 0
> +
>  /* Number of pending RX requests for downlink */
>  #define BTINTEL_PCIE_RX_MAX_QUEUE      6
>
> --
> 2.40.1
>
>


--=20
Luiz Augusto von Dentz

