Return-Path: <linux-bluetooth+bounces-306-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7537A7FEE7A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Nov 2023 13:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F541281EF7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Nov 2023 12:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC403E482;
	Thu, 30 Nov 2023 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C086684
	for <linux-bluetooth@vger.kernel.org>; Thu, 30 Nov 2023 04:02:27 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E4C4240007;
	Thu, 30 Nov 2023 12:02:25 +0000 (UTC)
Message-ID: <68150dc3fd176000e7dc893536182b3cd3cb8947.camel@hadess.net>
Subject: Re: [PATCH v2 2/2] Bluetooth: Fix bogus check for re-auth no
 supported with non-ssp
From: Bastien Nocera <hadess@hadess.net>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 30 Nov 2023 13:02:25 +0100
In-Reply-To: <20200520212015.626026-2-luiz.dentz@gmail.com>
References: <20200520212015.626026-1-luiz.dentz@gmail.com>
	 <20200520212015.626026-2-luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Wed, 2020-05-20 at 14:20 -0700, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>=20
> This reverts 19f8def031bfa50c579149b200bfeeb919727b27
> "Bluetooth: Fix auth_complete_evt for legacy units" which seems to be
> working around a bug on a broken controller rather then any
> limitation
> imposed by the Bluetooth spec, in fact if there ws not possible to
> re-auth the command shall fail not succeed.
>=20
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Looks like this fell through the cracks, do you want me to rebase and
re-send it?

