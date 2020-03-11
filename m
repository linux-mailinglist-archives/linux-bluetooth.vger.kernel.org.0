Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61A13181298
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 09:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgCKIHc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 04:07:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40487 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgCKIHc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 04:07:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so715323plk.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Mar 2020 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=28S4oHxFGTBsoUL4aoZBJyyFDhsxAGbUm5Rtsz6x1iM=;
        b=ad1+riowNx6QuSwmfHW+lorC6E88TvDm8pPGGHtjRcyAScpJgGHqiIqY6t/loZ+6SU
         ttw4brGSlKQErFSfPCFycCVw47DGiuvtiLHkif6dRs7Ti/AAQJjCYNqPRICBdYzdnaqo
         E6DSAznWZOl7cL0f3VR2s9jxRrjqPfHw3/DcjK1MaHB1PUVImSgPInXaAJPqL6CPMlSD
         0Yx2jJ6BR6WkNWkAKmLDsPQLHFH1smtUpwhy4qDWT1H+9jrdrfHKS8qNJ/sLk9dZGk1v
         zNwViejw3DG6M3gSWAHrCH1rCwyLlSiPHV1T+9Z5D2Gjvrm+VlrVExU+z0IXuFoXFOb4
         hK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=28S4oHxFGTBsoUL4aoZBJyyFDhsxAGbUm5Rtsz6x1iM=;
        b=DSpV/KIhH831/yNMRWn8xVBAVKz3UBluPgBPy+5ua0O1pSDjWNSkHaXNMICoO2aRpG
         YRygLoAt7/C5iMrW+CcnbhJ2w29NMbS4aDh3u9xbHtpCtzBiNgN2MnQ6lJ4e/SY93vgB
         RX9ti/nGqKlDftvGHYVmAwHpBo89bc4Nt3f53wVHurfC/PCWbrw9JYRLd77BkQZtsiNU
         iVJ0HdPgdtbDRjMw+kEeuZgulPlKySKa86eA5SD9CbyGl2wm8VerT4L/hM/qTh4b9fnN
         dtcAOEfDuQjhuIw5aJSO9kprperX6YDm8UtcU4WZ8VGFwFUhklAjWJkoanHPRrwO5JJ4
         TzFg==
X-Gm-Message-State: ANhLgQ3XFquIGKS1h80KGjmc+jOqpnyfRfirvSDknFqkjrBhFNkGKE/l
        weiPvwk8QLD3OB1H7SS8EPK+t5XjJrsVuA==
X-Google-Smtp-Source: ADFU+vsiHH3hWRJIR3MJV8h0c/ziXLW7pf13lRRbdxGdBIRMx9+yKfvXtDRGU5vAsUJXN43od8cbeQ==
X-Received: by 2002:a17:902:8f91:: with SMTP id z17mr2001410plo.234.1583914050925;
        Wed, 11 Mar 2020 01:07:30 -0700 (PDT)
Received: from localhost ([192.55.54.40])
        by smtp.gmail.com with ESMTPSA id u6sm47772908pgj.7.2020.03.11.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 01:07:30 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:07:26 +0200
From:   Johan Hedberg <johan.hedberg@gmail.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: Use bt_dev_err for RPA generation failure
 message
Message-ID: <20200311080726.GA3293@rboyd-mobl.ger.corp.intel.com>
Mail-Followup-To: Marcel Holtmann <marcel@holtmann.org>,
        linux-bluetooth@vger.kernel.org
References: <20200309214810.431559-1-marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309214810.431559-1-marcel@holtmann.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Mon, Mar 09, 2020, Marcel Holtmann wrote:
> When the RPA generation fails, indicate the error with a device specifc
> error message.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  net/bluetooth/hci_request.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to bluetooth-next. Thanks.

Johan
