Return-Path: <linux-bluetooth+bounces-460-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17180A03D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 11:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D18E1C20CCF
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 10:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D67134BD;
	Fri,  8 Dec 2023 10:08:14 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA11D10EF
	for <linux-bluetooth@vger.kernel.org>; Fri,  8 Dec 2023 02:08:05 -0800 (PST)
Received: from [192.168.0.2] (ip5f5af1f0.dynamic.kabel-deutschland.de [95.90.241.240])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4B3CD61E5FE01;
	Fri,  8 Dec 2023 11:07:59 +0100 (CET)
Message-ID: <b6f9ca9a-24f7-45cf-b50d-edd16fbf453c@molgen.mpg.de>
Date: Fri, 8 Dec 2023 11:07:58 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH BlueZ v2] tools: avtest: Add reject-code option
Content-Language: en-US
To: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Danis?= <frederic.danis@collabora.com>
References: <20231208090013.620051-1-frederic.danis@collabora.com>
Cc: linux-bluetooth@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231208090013.620051-1-frederic.danis@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Frédéric,


Thank you for your patch.

Am 08.12.23 um 10:00 schrieb Frédéric Danis:
> Some PTS tests like A2DP/SNK/AVP/BI-03-C, A2DP/SNK/AVP/BI-08-C , …
> request some specific rejection code to pass.
> This commit add an option to specify the rejection code during

add*s*

> AVDTP_SET_CONFIGURATION rejection.

It’d be great if you gave one example using that new option.

> ---
>   tools/avtest.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/avtest.c b/tools/avtest.c
> index ca37b3b46..5ac3418aa 100644
> --- a/tools/avtest.c
> +++ b/tools/avtest.c
> @@ -188,7 +188,8 @@ static void dump_buffer(const unsigned char *buf, int len)
>   }
>   
>   static void process_avdtp(int srv_sk, int sk, unsigned char reject,
> -								int fragment)
> +								int fragment,
> +								int reject_code)
>   {
>   	unsigned char buf[672];
>   	ssize_t len;
> @@ -284,7 +285,8 @@ static void process_avdtp(int srv_sk, int sk, unsigned char reject,
>   			if (reject == AVDTP_SET_CONFIGURATION) {
>   				hdr->message_type = AVDTP_MSG_TYPE_REJECT;
>   				buf[2] = buf[4];
> -				buf[3] = 0x13; /* SEP In Use */
> +				buf[3] = reject_code ? reject_code :
> +							0x13; /* SEP In Use */
>   				printf("Rejecting set configuration command\n");
>   				len = write(sk, buf, 4);
>   			} else {
> @@ -443,7 +445,8 @@ static int set_minimum_mtu(int sk)
>   	return 0;
>   }
>   
> -static void do_listen(const bdaddr_t *src, unsigned char reject, int fragment)
> +static void do_listen(const bdaddr_t *src, unsigned char reject, int fragment,
> +							int reject_code)
>   {
>   	struct sockaddr_l2 addr;
>   	socklen_t optlen;
> @@ -483,7 +486,7 @@ static void do_listen(const bdaddr_t *src, unsigned char reject, int fragment)
>   			continue;
>   		}
>   
> -		process_avdtp(sk, nsk, reject, fragment);
> +		process_avdtp(sk, nsk, reject, fragment, reject_code);
>   
>   		if (media_sock >= 0) {
>   			close(media_sock);
> @@ -709,6 +712,7 @@ static void usage(void)
>   	printf("Options:\n"
>   		"\t--device <hcidev>    HCI device\n"
>   		"\t--reject <command>   Reject command\n"
> +		"\t--reject-code <code> Reject code to use\n"
>   		"\t--send <command>     Send command\n"
>   		"\t--preconf            Configure stream before actual command\n"
>   		"\t--wait <N>           Wait N seconds before exiting\n"
> @@ -720,6 +724,7 @@ static struct option main_options[] = {
>   	{ "help",	0, 0, 'h' },
>   	{ "device",	1, 0, 'i' },
>   	{ "reject",	1, 0, 'r' },
> +	{ "reject-code",	1, 0, 'R' },
>   	{ "send",	1, 0, 's' },
>   	{ "invalid",	1, 0, 'f' },
>   	{ "preconf",	0, 0, 'c' },
> @@ -764,12 +769,12 @@ int main(int argc, char *argv[])
>   	unsigned char cmd = 0x00;
>   	bdaddr_t src, dst;
>   	int opt, mode = MODE_NONE, sk, invalid = 0, preconf = 0, fragment = 0;
> -	int avctp = 0, wait_before_exit = 0;
> +	int avctp = 0, wait_before_exit = 0, reject_code = 0;
>   
>   	bacpy(&src, BDADDR_ANY);
>   	bacpy(&dst, BDADDR_ANY);
>   
> -	while ((opt = getopt_long(argc, argv, "+i:r:s:f:hcFCw:",
> +	while ((opt = getopt_long(argc, argv, "+i:r:s:f:hcFCw:R:",
>   						main_options, NULL)) != EOF) {
>   		switch (opt) {
>   		case 'i':
> @@ -809,6 +814,10 @@ int main(int argc, char *argv[])
>   			wait_before_exit = atoi(optarg);
>   			break;
>   
> +		case 'R':
> +			reject_code = atoi(optarg);
> +			break;
> +
>   		case 'h':
>   		default:
>   			usage();
> @@ -826,7 +835,7 @@ int main(int argc, char *argv[])
>   
>   	switch (mode) {
>   	case MODE_REJECT:
> -		do_listen(&src, cmd, fragment);
> +		do_listen(&src, cmd, fragment, reject_code);
>   		break;
>   	case MODE_SEND:
>   		sk = do_connect(&src, &dst, avctp, fragment);

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

