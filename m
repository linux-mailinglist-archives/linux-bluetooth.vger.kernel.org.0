Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659307016D8
	for <lists+linux-bluetooth@lfdr.de>; Sat, 13 May 2023 15:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbjEMNRL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 13 May 2023 09:17:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233967AbjEMNRI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 13 May 2023 09:17:08 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8454B3C1E
        for <linux-bluetooth@vger.kernel.org>; Sat, 13 May 2023 06:17:06 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 1D2E7240103
        for <linux-bluetooth@vger.kernel.org>; Sat, 13 May 2023 15:17:05 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QJR4J4jNlz6tw6;
        Sat, 13 May 2023 15:17:04 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v2 2/2] tools/test-runner: add option to start Pipewire inside the VM
Date:   Sat, 13 May 2023 13:17:01 +0000
Message-Id: <52ba235fd5d62df196796711d3c79b1512df9032.1683983569.git.pav@iki.fi>
In-Reply-To: <a8e734ecc8d9fce9c9b9681a9db74dd224ff3cc2.1683983569.git.pav@iki.fi>
References: <a8e734ecc8d9fce9c9b9681a9db74dd224ff3cc2.1683983569.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add option for launching Pipewire inside the VM to serve Bluetooth
endpoints, which can be used in tests.

Make the option to optionally take path to the audio daemon, so e.g.
Pulseaudio support can be added later.
---
 tools/test-runner.c | 149 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 145 insertions(+), 4 deletions(-)

diff --git a/tools/test-runner.c b/tools/test-runner.c
index cd65c4cf0..d4a6332a8 100644
--- a/tools/test-runner.c
+++ b/tools/test-runner.c
@@ -54,6 +54,7 @@ static bool start_monitor = false;
 static int num_devs = 0;
 static const char *qemu_binary = NULL;
 static const char *kernel_image = NULL;
+static char *audio_server;
 
 static const char *qemu_table[] = {
 	"qemu-system-x86_64",
@@ -252,11 +253,11 @@ static void start_qemu(void)
 				"TESTHOME=%s TESTDBUS=%u TESTDAEMON=%u "
 				"TESTDBUSSESSION=%u XDG_RUNTIME_DIR=/run/user/0 "
 				"TESTMONITOR=%u TESTEMULATOR=%u TESTDEVS=%d "
-				"TESTAUTO=%u TESTARGS=\'%s\'",
+				"TESTAUTO=%u TESTAUDIO='%s' TESTARGS=\'%s\'",
 				initcmd, cwd, start_dbus, start_daemon,
 				start_dbus_session,
 				start_monitor, start_emulator, num_devs,
-				run_auto, testargs);
+				run_auto, audio_server, testargs);
 
 	argv = alloca(sizeof(qemu_argv) +
 				(sizeof(char *) * (4 + (num_devs * 4))));
@@ -723,13 +724,120 @@ static pid_t start_btvirt(const char *home)
 	return pid;
 }
 
+static int create_pipewire_conf(void)
+{
+	static const char *const dirs[] = {
+		"/run/conf",
+		"/run/conf/wireplumber",
+		"/run/conf/wireplumber/bluetooth.lua.d",
+		"/run/conf/wireplumber/main.lua.d",
+		NULL
+	};
+	int i;
+	FILE *f;
+
+	for (i = 0; dirs[i]; ++i)
+		mkdir(dirs[i], 0755);
+
+	/* Enable only Bluetooth part, disable whatever requires user DBus */
+	f = fopen("/run/conf/wireplumber/main.lua.d/51-custom.lua", "w");
+	if (!f)
+		goto fail;
+
+	fprintf(f, "alsa_monitor.enabled = false\n"
+		"v4l2_monitor.enabled = false\n"
+		"libcamera_monitor.enabled = false\n"
+		"default_access.properties[\"enable-flatpak-portal\"]"
+		" = false\n");
+	fclose(f);
+
+	f = fopen("/run/conf/wireplumber/bluetooth.lua.d/51-custom.lua", "w");
+	if (!f)
+		goto fail;
+
+	fprintf(f, "bluez_monitor.properties[\"with-logind\"] = false\n"
+		"bluez_midi_monitor.enabled = false\n");
+	fclose(f);
+
+	return 0;
+
+fail:
+	perror("Failed to create Pipewire config");
+	return -1;
+}
+
+static int start_audio_server(pid_t pids[2])
+{
+	char *daemons[2] = {NULL, NULL};
+	char wp_exe[PATH_MAX];
+	char *ptr;
+	char *envp[5];
+	int i;
+
+	daemons[0] = audio_server;
+
+	ptr = strrchr(audio_server, '/');
+	if (ptr && !strcmp(ptr, "/pipewire")) {
+		if (create_pipewire_conf())
+			return -1;
+
+		snprintf(wp_exe, sizeof(wp_exe), "%.*s/wireplumber",
+				(int)(ptr - audio_server), audio_server);
+		daemons[1] = wp_exe;
+
+		setenv("PIPEWIRE_RUNTIME_DIR", "/run", 1);
+	}
+
+	envp[0] = "DBUS_SYSTEM_BUS_ADDRESS=unix:"
+		"path=/run/dbus/system_bus_socket";
+	envp[1] = "XDG_CONFIG_HOME=/run/conf";
+	envp[2] = "XDG_STATE_HOME=/run";
+	envp[3] = "XDG_RUNTIME_DIR=/run";
+	envp[4] = NULL;
+
+	for (i = 0; i < 2; ++i)
+		pids[i] = -1;
+
+	for (i = 0; i < 2; ++i) {
+		const char *daemon = daemons[i];
+		char *argv[2];
+		pid_t pid;
+
+		if (!daemon)
+			continue;
+
+		printf("Starting audio server %s\n", daemon);
+
+		argv[0] = (char *) daemon;
+		argv[1] = NULL;
+
+		pid = fork();
+		if (pid < 0) {
+			perror("Failed to fork new process");
+			return -1;
+		}
+
+		if (pid == 0) {
+			execve(argv[0], argv, envp);
+			exit(EXIT_SUCCESS);
+		}
+
+		pids[i] = pid;
+
+		printf("Audio server process %d created\n", pid);
+	}
+
+	return 0;
+}
+
 static void run_command(char *cmdname, char *home)
 {
 	char *argv[9], *envp[3];
 	int pos = 0, idx = 0;
 	int serial_fd;
 	pid_t pid, dbus_pid, daemon_pid, monitor_pid, emulator_pid,
-	      dbus_session_pid;
+	      dbus_session_pid, audio_pid[2];
+	int i;
 
 	if (!home) {
 		perror("Invalid parameter: TESTHOME");
@@ -777,6 +885,11 @@ static void run_command(char *cmdname, char *home)
 	else
 		emulator_pid = -1;
 
+	if (audio_server)
+		start_audio_server(audio_pid);
+	else
+		audio_pid[0] = audio_pid[1] = -1;
+
 start_next:
 	if (run_auto) {
 		if (chdir(home + 5) < 0) {
@@ -878,6 +991,13 @@ start_next:
 			monitor_pid = -1;
 		}
 
+		for (i = 0; i < 2; ++i) {
+			if (corpse == audio_pid[i]) {
+				printf("Audio server %d terminated\n", i);
+				audio_pid[i] = -1;
+			}
+		}
+
 		if (corpse == pid)
 			break;
 	}
@@ -887,6 +1007,11 @@ start_next:
 		goto start_next;
 	}
 
+	for (i = 0; i < 2; ++i) {
+		if (audio_pid[i] > 0)
+			kill(audio_pid[i], SIGTERM);
+	}
+
 	if (daemon_pid > 0)
 		kill(daemon_pid, SIGTERM);
 
@@ -982,6 +1107,17 @@ static void run_tests(void)
 		start_emulator = true;
 	}
 
+	ptr = strstr(cmdline, "TESTAUDIO='");
+	if (ptr) {
+		const char *start = ptr + 11;
+		const char *end = strchr(start, '\'');
+
+		if (end) {
+			audio_server = strndup(start, end - start);
+			printf("Audio server %s requested\n", audio_server);
+		}
+	}
+
 	ptr = strstr(cmdline, "TESTHOME=");
 	if (ptr) {
 		home = ptr + 4;
@@ -1005,6 +1141,7 @@ static void usage(void)
 		"\t-d, --daemon           Start bluetoothd\n"
 		"\t-m, --monitor          Start btmon\n"
 		"\t-l, --emulator         Start btvirt\n"
+		"\t-A, --audio[=path]     Start audio server\n"
 		"\t-u, --unix [path]      Provide serial device\n"
 		"\t-q, --qemu <path>      QEMU binary\n"
 		"\t-k, --kernel <image>   Kernel image (bzImage)\n"
@@ -1022,6 +1159,7 @@ static const struct option main_options[] = {
 	{ "monitor", no_argument,       NULL, 'm' },
 	{ "qemu",    required_argument, NULL, 'q' },
 	{ "kernel",  required_argument, NULL, 'k' },
+	{ "audio",   optional_argument, NULL, 'A' },
 	{ "version", no_argument,       NULL, 'v' },
 	{ "help",    no_argument,       NULL, 'h' },
 	{ }
@@ -1041,7 +1179,7 @@ int main(int argc, char *argv[])
 	for (;;) {
 		int opt;
 
-		opt = getopt_long(argc, argv, "aubdslmq:k:vh", main_options,
+		opt = getopt_long(argc, argv, "aubdslmq:k:A::vh", main_options,
 								NULL);
 		if (opt < 0)
 			break;
@@ -1075,6 +1213,9 @@ int main(int argc, char *argv[])
 		case 'k':
 			kernel_image = optarg;
 			break;
+		case 'A':
+			audio_server = optarg ? optarg : "/usr/bin/pipewire";
+			break;
 		case 'v':
 			printf("%s\n", VERSION);
 			return EXIT_SUCCESS;
-- 
2.40.1

