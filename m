Return-Path: <linux-bluetooth+bounces-1766-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA185142A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 14:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBF81F21E90
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 13:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFD23A28B;
	Mon, 12 Feb 2024 13:10:20 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CC3A294;
	Mon, 12 Feb 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743420; cv=none; b=d7q3EECT/Nk8ztd6nj69zasgNJpIbf4gcwgYo8XQN7wVs2Fwj4DO0CLIiD/8I1Vt3ueOi88rwn+hc+kpdxdXDYG+83RG9cskfX4BqD+J8RvAR1ELqUSlnqYwiCgmWIlgHXUUsE5fKilp8ftI3GsixQlbIqxkHEsQfikptts8DoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743420; c=relaxed/simple;
	bh=PU835jH6b0hebR+N52z/qenEQa8Oqo7af4cy3Dnm6YM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iTdwaoxrHup+NE2sKK9VQIEuo/0DAJgGqb7KM5mkE/Dvs18LB7SqWjbn2mHrWy4ngNpolCPpPOikJ6MTOoNQ+pYz/+ag48NknlTBq4ikqKHHHMUATr/zlsRHGZWlEykWKGH3p0QdFwGfVOBOBSHL7HPH3vojWacnEZXASHfGbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: by air.basealt.ru (Postfix, from userid 490)
	id 6F9002F20244; Mon, 12 Feb 2024 13:10:09 +0000 (UTC)
X-Spam-Level: 
Received: from shell.ipa.basealt.ru (unknown [176.12.98.74])
	by air.basealt.ru (Postfix) with ESMTPSA id 056572F20231;
	Mon, 12 Feb 2024 13:10:03 +0000 (UTC)
From: oficerovas@altlinux.org
To: oficerovas@altlinux.org,
	stable@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pauli Virtanen <pav@iki.fi>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	kovalev@altlinux.org,
	nickel@altlinux.org,
	dutyrok@altlinux.org
Subject: [PATCH 0/2] Bluetooth: SCO: possible deadlock in sco_conn_del
Date: Mon, 12 Feb 2024 16:09:31 +0300
Message-ID: <20240212130933.3856081-1-oficerovas@altlinux.org>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Ofitserov <oficerovas@altlinux.org>

Syzkaller hit 'possible deadlock in sco_conn_del' bug.

This bug is not a vulnerability and is reproduced only when running
with root privileges for stable 6.1 kernel.

This series of patches is fix for this particular bug.
Both of these patches were taken from upstream
and applied clearly without any conflicts.
First one is the fix for the problem
and another one is for fix first patch.

Bluetooth: hci3: unexpected cc 0x0c38 length: 249 > 2
Bluetooth: hci2: unexpected cc 0x0c38 length: 249 > 2
======================================================
WARNING: possible circular locking dependency detected
6.1.55-un-def-alt1 #1 Not tainted
------------------------------------------------------
syz-executor272/377 is trying to acquire lock:
ffff888115b93130 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}, at: sco_conn_del+0x121/0x2c0 [bluetooth]

but task is already holding lock:
ffffffffc12bce28 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_conn_hash_flush+0xcc/0x2a0 [bluetooth]

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (hci_cb_list_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x18f0 kernel/locking/mutex.c:747
       hci_remote_features_evt+0x45b/0x950 [bluetooth]
       hci_event_packet+0x91e/0xf60 [bluetooth]
       hci_rx_work+0xa68/0x10f0 [bluetooth]
       process_one_work+0xa18/0x1570 kernel/workqueue.c:2292
       worker_thread+0x63a/0x1260 kernel/workqueue.c:2439
       kthread+0x2ec/0x3b0 kernel/kthread.c:376
       ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:306

-> #1 (&hdev->lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x18f0 kernel/locking/mutex.c:747
       sco_sock_connect+0x1e9/0xa60 [bluetooth]
       __sys_connect_file+0x15a/0x1a0 net/socket.c:1976
       __sys_connect+0x16a/0x1a0 net/socket.c:1993
       __do_sys_connect net/socket.c:2003 [inline]
       __se_sys_connect net/socket.c:2000 [inline]
       __x64_sys_connect+0x74/0xb0 net/socket.c:2000
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x5c/0x90 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x64/0xce

-> #0 (sk_lock-AF_BLUETOOTH-BTPROTO_SCO){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3090 [inline]
       check_prevs_add kernel/locking/lockdep.c:3209 [inline]
       validate_chain kernel/locking/lockdep.c:3824 [inline]
       __lock_acquire+0x28c2/0x5350 kernel/locking/lockdep.c:5048
       lock_acquire kernel/locking/lockdep.c:5661 [inline]
       lock_acquire+0x1fb/0x580 kernel/locking/lockdep.c:5626
       lock_sock_nested+0x42/0x100 net/core/sock.c:3475
       sco_conn_del+0x121/0x2c0 [bluetooth]
       sco_disconn_cfm+0x67/0x80 [bluetooth]
       hci_conn_hash_flush+0x11e/0x2a0 [bluetooth]
       hci_dev_close_sync+0x51d/0xf70 [bluetooth]
       hci_rfkill_set_block+0x17c/0x1c0 [bluetooth]
       rfkill_set_block+0x202/0x550 [rfkill]
       rfkill_fop_write+0x2b8/0x540 [rfkill]
       vfs_write+0x2d7/0xdd0 fs/read_write.c:582
       ksys_write+0x1f5/0x260 fs/read_write.c:637
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x5c/0x90 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x64/0xce

other info that might help us debug this:

Chain exists of:
  sk_lock-AF_BLUETOOTH-BTPROTO_SCO --> &hdev->lock --> hci_cb_list_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(hci_cb_list_lock);
                               lock(&hdev->lock);
                               lock(hci_cb_list_lock);
  lock(sk_lock-AF_BLUETOOTH-BTPROTO_SCO);

 *** DEADLOCK ***

4 locks held by syz-executor272/377:
 #0: ffffffffc0d83688 (rfkill_global_mutex){+.+.}-{3:3}, at: rfkill_fop_write+0x162/0x540 [rfkill]
 #1: ffff888100de90b8 (&hdev->req_lock){+.+.}-{3:3}, at: hci_rfkill_set_block+0x174/0x1c0 [bluetooth]
 #2: ffff888100de8078 (&hdev->lock){+.+.}-{3:3}, at: hci_dev_close_sync+0x2e1/0xf70 [bluetooth]
 #3: ffffffffc12bce28 (hci_cb_list_lock){+.+.}-{3:3}, at: hci_conn_hash_flush+0xcc/0x2a0 [bluetooth]

stack backtrace:
CPU: 1 PID: 377 Comm: syz-executor272 Not tainted 6.1.55-un-def-alt1 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-alt1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x14f/0x1be lib/dump_stack.c:106
 check_noncircular+0x263/0x2e0 kernel/locking/lockdep.c:2170
 check_prev_add kernel/locking/lockdep.c:3090 [inline]
 check_prevs_add kernel/locking/lockdep.c:3209 [inline]
 validate_chain kernel/locking/lockdep.c:3824 [inline]
 __lock_acquire+0x28c2/0x5350 kernel/locking/lockdep.c:5048
 lock_acquire kernel/locking/lockdep.c:5661 [inline]
 lock_acquire+0x1fb/0x580 kernel/locking/lockdep.c:5626
 lock_sock_nested+0x42/0x100 net/core/sock.c:3475
 sco_conn_del+0x121/0x2c0 [bluetooth]
 sco_disconn_cfm+0x67/0x80 [bluetooth]
 hci_conn_hash_flush+0x11e/0x2a0 [bluetooth]
 hci_dev_close_sync+0x51d/0xf70 [bluetooth]
 hci_rfkill_set_block+0x17c/0x1c0 [bluetooth]
 rfkill_set_block+0x202/0x550 [rfkill]
 rfkill_fop_write+0x2b8/0x540 [rfkill]
 vfs_write+0x2d7/0xdd0 fs/read_write.c:582
 ksys_write+0x1f5/0x260 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x5c/0x90 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x64/0xce
RIP: 0033:0x7fa908ef7d49
Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ef 70 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007fa9085f7e18 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 000055a2e59de080 RCX: 00007fa908ef7d49
RDX: 0000000000000008 RSI: 0000000020000040 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdb3f52d1e
R13: 00007ffdb3f52d1f R14: 000055a2e59de088 R15: 00007fa9085f8640

// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <dirent.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>
#include <sched.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/epoll.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/prctl.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#include <linux/capability.h>
#include <linux/futex.h>
#include <linux/rfkill.h>

static unsigned long long procid;

static void sleep_ms(uint64_t ms)
{
	usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
	struct timespec ts;
	if (clock_gettime(CLOCK_MONOTONIC, &ts))
	exit(1);
	return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static void thread_start(void* (*fn)(void*), void* arg)
{
	pthread_t th;
	pthread_attr_t attr;
	pthread_attr_init(&attr);
	pthread_attr_setstacksize(&attr, 128 << 10);
	int i = 0;
	for (; i < 100; i++) {
		if (pthread_create(&th, &attr, fn, arg) == 0) {
			pthread_attr_destroy(&attr);
			return;
		}
		if (errno == EAGAIN) {
			usleep(50);
			continue;
		}
		break;
	}
	exit(1);
}

typedef struct {
	int state;
} event_t;

static void event_init(event_t* ev)
{
	ev->state = 0;
}

static void event_reset(event_t* ev)
{
	ev->state = 0;
}

static void event_set(event_t* ev)
{
	if (ev->state)
	exit(1);
	__atomic_store_n(&ev->state, 1, __ATOMIC_RELEASE);
	syscall(SYS_futex, &ev->state, FUTEX_WAKE | FUTEX_PRIVATE_FLAG, 1000000);
}

static void event_wait(event_t* ev)
{
	while (!__atomic_load_n(&ev->state, __ATOMIC_ACQUIRE))
		syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0, 0);
}

static int event_isset(event_t* ev)
{
	return __atomic_load_n(&ev->state, __ATOMIC_ACQUIRE);
}

static int event_timedwait(event_t* ev, uint64_t timeout)
{
	uint64_t start = current_time_ms();
	uint64_t now = start;
	for (;;) {
		uint64_t remain = timeout - (now - start);
		struct timespec ts;
		ts.tv_sec = remain / 1000;
		ts.tv_nsec = (remain % 1000) * 1000 * 1000;
		syscall(SYS_futex, &ev->state, FUTEX_WAIT | FUTEX_PRIVATE_FLAG, 0, &ts);
		if (__atomic_load_n(&ev->state, __ATOMIC_ACQUIRE))
			return 1;
		now = current_time_ms();
		if (now - start > timeout)
			return 0;
	}
}

static bool write_file(const char* file, const char* what, ...)
{
	char buf[1024];
	va_list args;
	va_start(args, what);
	vsnprintf(buf, sizeof(buf), what, args);
	va_end(args);
	buf[sizeof(buf) - 1] = 0;
	int len = strlen(buf);
	int fd = open(file, O_WRONLY | O_CLOEXEC);
	if (fd == -1)
		return false;
	if (write(fd, buf, len) != len) {
		int err = errno;
		close(fd);
		errno = err;
		return false;
	}
	close(fd);
	return true;
}

const int kInitNetNsFd = 201;

#define MAX_FDS 30

static long syz_init_net_socket(volatile long domain, volatile long type, volatile long proto)
{
	int netns = open("/proc/self/ns/net", O_RDONLY);
	if (netns == -1)
		return netns;
	if (setns(kInitNetNsFd, 0))
		return -1;
	int sock = syscall(__NR_socket, domain, type, proto);
	int err = errno;
	if (setns(netns, 0))
	exit(1);
	close(netns);
	errno = err;
	return sock;
}

#define BTPROTO_HCI 1
#define ACL_LINK 1
#define SCAN_PAGE 2

typedef struct {
	uint8_t b[6];
} __attribute__((packed)) bdaddr_t;

#define HCI_COMMAND_PKT 1
#define HCI_EVENT_PKT 4
#define HCI_VENDOR_PKT 0xff

struct hci_command_hdr {
	uint16_t opcode;
	uint8_t plen;
} __attribute__((packed));

struct hci_event_hdr {
	uint8_t evt;
	uint8_t plen;
} __attribute__((packed));

#define HCI_EV_CONN_COMPLETE 0x03
struct hci_ev_conn_complete {
	uint8_t status;
	uint16_t handle;
	bdaddr_t bdaddr;
	uint8_t link_type;
	uint8_t encr_mode;
} __attribute__((packed));

#define HCI_EV_CONN_REQUEST 0x04
struct hci_ev_conn_request {
	bdaddr_t bdaddr;
	uint8_t dev_class[3];
	uint8_t link_type;
} __attribute__((packed));

#define HCI_EV_REMOTE_FEATURES 0x0b
struct hci_ev_remote_features {
	uint8_t status;
	uint16_t handle;
	uint8_t features[8];
} __attribute__((packed));

#define HCI_EV_CMD_COMPLETE 0x0e
struct hci_ev_cmd_complete {
	uint8_t ncmd;
	uint16_t opcode;
} __attribute__((packed));

#define HCI_OP_WRITE_SCAN_ENABLE 0x0c1a

#define HCI_OP_READ_BUFFER_SIZE 0x1005
struct hci_rp_read_buffer_size {
	uint8_t status;
	uint16_t acl_mtu;
	uint8_t sco_mtu;
	uint16_t acl_max_pkt;
	uint16_t sco_max_pkt;
} __attribute__((packed));

#define HCI_OP_READ_BD_ADDR 0x1009
struct hci_rp_read_bd_addr {
	uint8_t status;
	bdaddr_t bdaddr;
} __attribute__((packed));

#define HCI_EV_LE_META 0x3e
struct hci_ev_le_meta {
	uint8_t subevent;
} __attribute__((packed));

#define HCI_EV_LE_CONN_COMPLETE 0x01
struct hci_ev_le_conn_complete {
	uint8_t status;
	uint16_t handle;
	uint8_t role;
	uint8_t bdaddr_type;
	bdaddr_t bdaddr;
	uint16_t interval;
	uint16_t latency;
	uint16_t supervision_timeout;
	uint8_t clk_accurancy;
} __attribute__((packed));

struct hci_dev_req {
	uint16_t dev_id;
	uint32_t dev_opt;
};

struct vhci_vendor_pkt {
	uint8_t type;
	uint8_t opcode;
	uint16_t id;
};

#define HCIDEVUP _IOW('H', 201, int)
#define HCISETSCAN _IOW('H', 221, int)

static int vhci_fd = -1;

static void rfkill_unblock_all()
{
	int fd = open("/dev/rfkill", O_WRONLY);
	if (fd < 0)
	exit(1);
	struct rfkill_event event = {0};
	event.idx = 0;
	event.type = RFKILL_TYPE_ALL;
	event.op = RFKILL_OP_CHANGE_ALL;
	event.soft = 0;
	event.hard = 0;
	if (write(fd, &event, sizeof(event)) < 0)
	exit(1);
	close(fd);
}

static void hci_send_event_packet(int fd, uint8_t evt, void* data, size_t data_len)
{
	struct iovec iv[3];
	struct hci_event_hdr hdr;
	hdr.evt = evt;
	hdr.plen = data_len;
	uint8_t type = HCI_EVENT_PKT;
	iv[0].iov_base = &type;
	iv[0].iov_len = sizeof(type);
	iv[1].iov_base = &hdr;
	iv[1].iov_len = sizeof(hdr);
	iv[2].iov_base = data;
	iv[2].iov_len = data_len;
	if (writev(fd, iv, sizeof(iv) / sizeof(struct iovec)) < 0)
	exit(1);
}

static void hci_send_event_cmd_complete(int fd, uint16_t opcode, void* data, size_t data_len)
{
	struct iovec iv[4];
	struct hci_event_hdr hdr;
	hdr.evt = HCI_EV_CMD_COMPLETE;
	hdr.plen = sizeof(struct hci_ev_cmd_complete) + data_len;
	struct hci_ev_cmd_complete evt_hdr;
	evt_hdr.ncmd = 1;
	evt_hdr.opcode = opcode;
	uint8_t type = HCI_EVENT_PKT;
	iv[0].iov_base = &type;
	iv[0].iov_len = sizeof(type);
	iv[1].iov_base = &hdr;
	iv[1].iov_len = sizeof(hdr);
	iv[2].iov_base = &evt_hdr;
	iv[2].iov_len = sizeof(evt_hdr);
	iv[3].iov_base = data;
	iv[3].iov_len = data_len;
	if (writev(fd, iv, sizeof(iv) / sizeof(struct iovec)) < 0)
	exit(1);
}

static bool process_command_pkt(int fd, char* buf, ssize_t buf_size)
{
	struct hci_command_hdr* hdr = (struct hci_command_hdr*)buf;
	if (buf_size < (ssize_t)sizeof(struct hci_command_hdr) ||
	    hdr->plen != buf_size - sizeof(struct hci_command_hdr))
	exit(1);
	switch (hdr->opcode) {
	case HCI_OP_WRITE_SCAN_ENABLE: {
		uint8_t status = 0;
		hci_send_event_cmd_complete(fd, hdr->opcode, &status, sizeof(status));
		return true;
	}
	case HCI_OP_READ_BD_ADDR: {
		struct hci_rp_read_bd_addr rp = {0};
		rp.status = 0;
		memset(&rp.bdaddr, 0xaa, 6);
		hci_send_event_cmd_complete(fd, hdr->opcode, &rp, sizeof(rp));
		return false;
	}
	case HCI_OP_READ_BUFFER_SIZE: {
		struct hci_rp_read_buffer_size rp = {0};
		rp.status = 0;
		rp.acl_mtu = 1021;
		rp.sco_mtu = 96;
		rp.acl_max_pkt = 4;
		rp.sco_max_pkt = 6;
		hci_send_event_cmd_complete(fd, hdr->opcode, &rp, sizeof(rp));
		return false;
	}
	}
	char dummy[0xf9] = {0};
	hci_send_event_cmd_complete(fd, hdr->opcode, dummy, sizeof(dummy));
	return false;
}

static void* event_thread(void* arg)
{
	while (1) {
		char buf[1024] = {0};
		ssize_t buf_size = read(vhci_fd, buf, sizeof(buf));
		if (buf_size < 0)
	exit(1);
		if (buf_size > 0 && buf[0] == HCI_COMMAND_PKT) {
			if (process_command_pkt(vhci_fd, buf + 1, buf_size - 1))
				break;
		}
	}
	return NULL;
}
#define HCI_HANDLE_1 200
#define HCI_HANDLE_2 201

static void initialize_vhci()
{
	int hci_sock = socket(AF_BLUETOOTH, SOCK_RAW, BTPROTO_HCI);
	if (hci_sock < 0)
	exit(1);
	vhci_fd = open("/dev/vhci", O_RDWR);
	if (vhci_fd == -1)
	exit(1);
	const int kVhciFd = 202;
	if (dup2(vhci_fd, kVhciFd) < 0)
	exit(1);
	close(vhci_fd);
	vhci_fd = kVhciFd;
	struct vhci_vendor_pkt vendor_pkt;
	if (read(vhci_fd, &vendor_pkt, sizeof(vendor_pkt)) != sizeof(vendor_pkt))
	exit(1);
	if (vendor_pkt.type != HCI_VENDOR_PKT)
	exit(1);
	pthread_t th;
	if (pthread_create(&th, NULL, event_thread, NULL))
	exit(1);
	int ret = ioctl(hci_sock, HCIDEVUP, vendor_pkt.id);
	if (ret) {
		if (errno == ERFKILL) {
			rfkill_unblock_all();
			ret = ioctl(hci_sock, HCIDEVUP, vendor_pkt.id);
		}
		if (ret && errno != EALREADY)
	exit(1);
	}
	struct hci_dev_req dr = {0};
	dr.dev_id = vendor_pkt.id;
	dr.dev_opt = SCAN_PAGE;
	if (ioctl(hci_sock, HCISETSCAN, &dr))
	exit(1);
	struct hci_ev_conn_request request;
	memset(&request, 0, sizeof(request));
	memset(&request.bdaddr, 0xaa, 6);
	*(uint8_t*)&request.bdaddr.b[5] = 0x10;
	request.link_type = ACL_LINK;
	hci_send_event_packet(vhci_fd, HCI_EV_CONN_REQUEST, &request, sizeof(request));
	struct hci_ev_conn_complete complete;
	memset(&complete, 0, sizeof(complete));
	complete.status = 0;
	complete.handle = HCI_HANDLE_1;
	memset(&complete.bdaddr, 0xaa, 6);
	*(uint8_t*)&complete.bdaddr.b[5] = 0x10;
	complete.link_type = ACL_LINK;
	complete.encr_mode = 0;
	hci_send_event_packet(vhci_fd, HCI_EV_CONN_COMPLETE, &complete, sizeof(complete));
	struct hci_ev_remote_features features;
	memset(&features, 0, sizeof(features));
	features.status = 0;
	features.handle = HCI_HANDLE_1;
	hci_send_event_packet(vhci_fd, HCI_EV_REMOTE_FEATURES, &features, sizeof(features));
	struct {
		struct hci_ev_le_meta le_meta;
		struct hci_ev_le_conn_complete le_conn;
	} le_conn;
	memset(&le_conn, 0, sizeof(le_conn));
	le_conn.le_meta.subevent = HCI_EV_LE_CONN_COMPLETE;
	memset(&le_conn.le_conn.bdaddr, 0xaa, 6);
	*(uint8_t*)&le_conn.le_conn.bdaddr.b[5] = 0x11;
	le_conn.le_conn.role = 1;
	le_conn.le_conn.handle = HCI_HANDLE_2;
	hci_send_event_packet(vhci_fd, HCI_EV_LE_META, &le_conn, sizeof(le_conn));
	pthread_join(th, NULL);
	close(hci_sock);
}

static void setup_common()
{
	if (mount(0, "/sys/fs/fuse/connections", "fusectl", 0, 0)) {
	}
}

static void setup_binderfs()
{
	if (mkdir("/dev/binderfs", 0777)) {
	}
	if (mount("binder", "/dev/binderfs", "binder", 0, NULL)) {
	}
	if (symlink("/dev/binderfs", "./binderfs")) {
	}
}

static void loop();

static void sandbox_common()
{
	prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
	setsid();
	int netns = open("/proc/self/ns/net", O_RDONLY);
	if (netns == -1)
	exit(1);
	if (dup2(netns, kInitNetNsFd) < 0)
	exit(1);
	close(netns);
	struct rlimit rlim;
	rlim.rlim_cur = rlim.rlim_max = (200 << 20);
	setrlimit(RLIMIT_AS, &rlim);
	rlim.rlim_cur = rlim.rlim_max = 32 << 20;
	setrlimit(RLIMIT_MEMLOCK, &rlim);
	rlim.rlim_cur = rlim.rlim_max = 136 << 20;
	setrlimit(RLIMIT_FSIZE, &rlim);
	rlim.rlim_cur = rlim.rlim_max = 1 << 20;
	setrlimit(RLIMIT_STACK, &rlim);
	rlim.rlim_cur = rlim.rlim_max = 0;
	setrlimit(RLIMIT_CORE, &rlim);
	rlim.rlim_cur = rlim.rlim_max = 256;
	setrlimit(RLIMIT_NOFILE, &rlim);
	if (unshare(CLONE_NEWNS)) {
	}
	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL)) {
	}
	if (unshare(CLONE_NEWIPC)) {
	}
	if (unshare(0x02000000)) {
	}
	if (unshare(CLONE_NEWUTS)) {
	}
	if (unshare(CLONE_SYSVSEM)) {
	}
	typedef struct {
		const char* name;
		const char* value;
	} sysctl_t;
	static const sysctl_t sysctls[] = {
	    {"/proc/sys/kernel/shmmax", "16777216"},
	    {"/proc/sys/kernel/shmall", "536870912"},
	    {"/proc/sys/kernel/shmmni", "1024"},
	    {"/proc/sys/kernel/msgmax", "8192"},
	    {"/proc/sys/kernel/msgmni", "1024"},
	    {"/proc/sys/kernel/msgmnb", "1024"},
	    {"/proc/sys/kernel/sem", "1024 1048576 500 1024"},
	};
	unsigned i;
	for (i = 0; i < sizeof(sysctls) / sizeof(sysctls[0]); i++)
		write_file(sysctls[i].name, sysctls[i].value);
}

static int wait_for_loop(int pid)
{
	if (pid < 0)
	exit(1);
	int status = 0;
	while (waitpid(-1, &status, __WALL) != pid) {
	}
	return WEXITSTATUS(status);
}

static void drop_caps(void)
{
	struct __user_cap_header_struct cap_hdr = {};
	struct __user_cap_data_struct cap_data[2] = {};
	cap_hdr.version = _LINUX_CAPABILITY_VERSION_3;
	cap_hdr.pid = getpid();
	if (syscall(SYS_capget, &cap_hdr, &cap_data))
	exit(1);
	const int drop = (1 << CAP_SYS_PTRACE) | (1 << CAP_SYS_NICE);
	cap_data[0].effective &= ~drop;
	cap_data[0].permitted &= ~drop;
	cap_data[0].inheritable &= ~drop;
	if (syscall(SYS_capset, &cap_hdr, &cap_data))
	exit(1);
}

static int do_sandbox_none(void)
{
	if (unshare(CLONE_NEWPID)) {
	}
	int pid = fork();
	if (pid != 0)
		return wait_for_loop(pid);
	setup_common();
	initialize_vhci();
	sandbox_common();
	drop_caps();
	if (unshare(CLONE_NEWNET)) {
	}
	setup_binderfs();
	loop();
	exit(1);
}

static void kill_and_wait(int pid, int* status)
{
	kill(-pid, SIGKILL);
	kill(pid, SIGKILL);
	for (int i = 0; i < 100; i++) {
		if (waitpid(-1, status, WNOHANG | __WALL) == pid)
			return;
		usleep(1000);
	}
	DIR* dir = opendir("/sys/fs/fuse/connections");
	if (dir) {
		for (;;) {
			struct dirent* ent = readdir(dir);
			if (!ent)
				break;
			if (strcmp(ent->d_name, ".") == 0 || strcmp(ent->d_name, "..") == 0)
				continue;
			char abort[300];
			snprintf(abort, sizeof(abort), "/sys/fs/fuse/connections/%s/abort", ent->d_name);
			int fd = open(abort, O_WRONLY);
			if (fd == -1) {
				continue;
			}
			if (write(fd, abort, 1) < 0) {
			}
			close(fd);
		}
		closedir(dir);
	} else {
	}
	while (waitpid(-1, status, __WALL) != pid) {
	}
}

static void setup_test()
{
	prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
	setpgrp();
	write_file("/proc/self/oom_score_adj", "1000");
}

static void close_fds()
{
	for (int fd = 3; fd < MAX_FDS; fd++)
		close(fd);
}

struct thread_t {
	int created, call;
	event_t ready, done;
};

static struct thread_t threads[16];
static void execute_call(int call);
static int running;

static void* thr(void* arg)
{
	struct thread_t* th = (struct thread_t*)arg;
	for (;;) {
		event_wait(&th->ready);
		event_reset(&th->ready);
		execute_call(th->call);
		__atomic_fetch_sub(&running, 1, __ATOMIC_RELAXED);
		event_set(&th->done);
	}
	return 0;
}

static void execute_one(void)
{
	int i, call, thread;
	for (call = 0; call < 4; call++) {
		for (thread = 0; thread < (int)(sizeof(threads) / sizeof(threads[0])); thread++) {
			struct thread_t* th = &threads[thread];
			if (!th->created) {
				th->created = 1;
				event_init(&th->ready);
				event_init(&th->done);
				event_set(&th->done);
				thread_start(thr, th);
			}
			if (!event_isset(&th->done))
				continue;
			event_reset(&th->done);
			th->call = call;
			__atomic_fetch_add(&running, 1, __ATOMIC_RELAXED);
			event_set(&th->ready);
			event_timedwait(&th->done, 50);
			break;
		}
	}
	for (i = 0; i < 100 && __atomic_load_n(&running, __ATOMIC_RELAXED); i++)
		sleep_ms(1);
	close_fds();
}

static void execute_one(void);

#define WAIT_FLAGS __WALL

static void loop(void)
{
	int iter = 0;
	for (;; iter++) {
		int pid = fork();
		if (pid < 0)
	exit(1);
		if (pid == 0) {
			setup_test();
			execute_one();
			exit(0);
		}
		int status = 0;
		uint64_t start = current_time_ms();
		for (;;) {
			if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) == pid)
				break;
			sleep_ms(1);
			if (current_time_ms() - start < 5000)
				continue;
			kill_and_wait(pid, &status);
			break;
		}
	}
}

uint64_t r[2] = {0xffffffffffffffff, 0xffffffffffffffff};

void execute_call(int call)
{
		intptr_t res = 0;
	switch (call) {
	case 0:
memcpy((void*)0x20000000, "/dev/rfkill\000", 12);
		res = syscall(__NR_openat, 0xffffffffffffff9cul, 0x20000000ul, 0x100001ul, 0ul);
		if (res != -1)
				r[0] = res;
		break;
	case 1:
*(uint32_t*)0x20000040 = 0;
*(uint8_t*)0x20000044 = 0;
*(uint8_t*)0x20000045 = 3;
*(uint8_t*)0x20000046 = 1;
*(uint8_t*)0x20000047 = 0;
		syscall(__NR_write, r[0], 0x20000040ul, 8ul);
		break;
	case 2:
		res = -1;
res = syz_init_net_socket(0x1f, 5, 2);
		if (res != -1)
				r[1] = res;
		break;
	case 3:
*(uint16_t*)0x20000040 = 0x1f;
*(uint16_t*)0x20000042 = 0;
memset((void*)0x20000044, 255, 6);
*(uint16_t*)0x2000004a = 0;
*(uint8_t*)0x2000004c = 0;
		syscall(__NR_connect, r[1], 0x20000040ul, 0xeul);
		break;
	}

}
int main(void)
{
		syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
	syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
	syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
	for (procid = 0; procid < 4; procid++) {
		if (fork() == 0) {
			do_sandbox_none();
		}
	}
	sleep(1000000);
	return 0;
}

[PATCH 1/2] Bluetooth: SCO: Fix possible circular locking dependency
[PATCH 2/2] Bluetooth: SCO: fix sco_conn related locking and validity

-- 
2.42.1


