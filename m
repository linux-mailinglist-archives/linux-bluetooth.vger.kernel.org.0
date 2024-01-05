Return-Path: <linux-bluetooth+bounces-925-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E1F825940
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jan 2024 18:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C415128263F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jan 2024 17:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE95D321B5;
	Fri,  5 Jan 2024 17:42:19 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from server.interlinx.bc.ca (mail.interlinx.bc.ca [69.165.217.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24577328AF
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jan 2024 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlinx.bc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=interlinx.bc.ca
Received: from brian-laptop.interlinx.bc.ca (unknown [IPv6:fd0c:685d:4db3:4ba7:23ab:92fe:41d5:f62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by server.interlinx.bc.ca (Postfix) with ESMTPSA id AA70325A81
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jan 2024 12:42:09 -0500 (EST)
Message-ID: <a869266032b2de08f3c57f2de681cbfdcfe206fc.camel@interlinx.bc.ca>
Subject: Re: Unable to connect BT mouse after it drops: Failed to connect:
 org.bluez.Error.Failed br-connection-create-socket
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
To: linux-bluetooth@vger.kernel.org
Date: Fri, 05 Jan 2024 12:42:08 -0500
In-Reply-To: <30fb108034be78c04ff195dba6708aa9d881bf75.camel@interlinx.bc.ca>
References: <85bf602dac47b63cfc5ec772fddcedbce29c13df.camel@interlinx.bc.ca>
	 <548cbe00abc60f0506dbc47802bddd276c192205.camel@interlinx.bc.ca>
	 <CABBYNZKS0BZGRZ8NMjue91i_P3mtQSL=ctLDcHDiZ+BBcXL2Aw@mail.gmail.com>
	 <30fb108034be78c04ff195dba6708aa9d881bf75.camel@interlinx.bc.ca>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-01-04 at 08:13 -0500, Brian J. Murrell wrote:
>=20
> As far as the terminal's scrollback buffer goes, here's what btmon
> reported:

Was this at all useful or do you need me to reset the adapter, get the
mouse working again and capture the btmon output into a file?

Cheers,
b.


