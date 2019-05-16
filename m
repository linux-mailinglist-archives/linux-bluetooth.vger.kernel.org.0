Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C862A20D22
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 May 2019 18:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfEPQgA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 May 2019 12:36:00 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:40575 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfEPQgA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 May 2019 12:36:00 -0400
Received: by mail-io1-f41.google.com with SMTP id s20so3099310ioj.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 May 2019 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=z+TppvzHmGaJ1qwjQe2I+72i3Po1iqRaG3+JfdmD3ac=;
        b=RfHhirmFdUw1w2h3xcA/8NVbEnEUWf7kDm/TYOHVrLicAcefPtmqj8MAzNFlMAB/D1
         /AS+YLWUvgHhKbZW+Aqkee6UZz1qP/s0unB7l7S9CvX5vTGHvkXdHJxTgu6Dmuxrk665
         Is0LKzu3noYCWYaMwbPKaiyK0mLYPkWQ19Y6GzJaduitqKig4QjPhq/JB38xjnK9pm9n
         7sLHTmMlxI/IH2rrFCV5pP8kYTa8pc8JZrGVjW+UBru2PsILjQcDgerH6xuTU00DEjbG
         ehVeh5z1cBkbPXNEZ2PpyLfgmaIfQj0dpQXnI1OchiOUYh8/vmRgybX816+TUCkdMjOS
         3e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=z+TppvzHmGaJ1qwjQe2I+72i3Po1iqRaG3+JfdmD3ac=;
        b=OWZGbvDpmv0Zct5e0/mS5qCKWa8a30VjPe5gGEwM6QNQFyb733z+05N705biBaaoBY
         g+S10BmjKFHlYfSFLXlGUAf4th6oADCO62t/rtZz6GZ7cmztfjHayXSWbYpaHTyMNWUu
         FDOEVdQMtjmypUU2ngh4QU0vOzK+d6t3DVJ3vmSsh1JpvlnkO1fN6fynUscADqWModrH
         rTsehbzHle4X5LdBSVm7YwzpdquTxrRGBmtQ8zXS6WKxrrdS5o91uQyk9VRCFJgnxCq9
         XDEfcZdQHvz0qR8UeNJz1GS9tOvQ9igKUjw4aGrxMwJ7YUGiyvq5fS7woCmTTZQlYCcS
         s7ww==
X-Gm-Message-State: APjAAAVcoBpSuHQrcrHewzKgabYcgRJLwW0pt/23p6Gxm+ENvOeP8No5
        /MroUWO1OvP4p/ySr/A3P0URsDWua4jWWHMQxNkiaA==
X-Google-Smtp-Source: APXvYqwfCxz6gbuqwEzAsTENafYbPBF8W2ljf8Dj3WdiBj42aK5i3UIO8q1DzoeSsb1fp3GTEP5Ssqu4u0At0jNGGnI=
X-Received: by 2002:a05:6602:204a:: with SMTP id z10mr27079891iod.158.1558024558952;
 Thu, 16 May 2019 09:35:58 -0700 (PDT)
MIME-Version: 1.0
From:   Alexandre Pereira Nunes <alexandre.nunes@gmail.com>
Date:   Thu, 16 May 2019 13:35:32 -0300
Message-ID: <CANxMttBkpPXpZsA9ckeka-b2N9HMVWKYwefUAygmyy0uA=E93A@mail.gmail.com>
Subject: Mouse no longer connects
To:     linux-bluetooth@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000063895d058903dc9a"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--00000000000063895d058903dc9a
Content-Type: text/plain; charset="UTF-8"

It seems like Linux 5.0.x is culprit

A hcidump of connection attempts is annexed.

--00000000000063895d058903dc9a
Content-Type: application/zip; name="btmouse-fail.zip"
Content-Disposition: attachment; filename="btmouse-fail.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_jvqvkp1t0>
X-Attachment-Id: f_jvqvkp1t0

UEsDBBQAAgAIAABpsE7CjGBfNQIAAOcIAAAUABwAdG1wL2J0bW91c2UtZmFpbC5kbXBVVAkAA+CK
3Vzgit1cdXgLAAEEAAAAAAQAAAAASyopzsvPL2AAAkYGBuZXQJoViplBggyP0ra1VbotYPnPJMiE
XdIrHSQJ4vJCMUKyJkSLhYVrrwSnkIhCgyrICgZuKGZCUpTFyMnCDlEFEmSHYiRzIoRZ+FkYgMqQ
TEBI1135wiLEwYAwgQ+KEUqaGLtYmIG6GCGKQC5hYINihFOamMoYpVmYwA7FdEUTazrYFdIgVwhC
MSNCOuAjE4MiDwMHUIyJkQUo64jDLeHzWLhBbvnDxGIhISHZjGQbklvC3zDKsDAzMOJwTHQf2DEy
IMcIQDGSdFcWizIwMhgh7oMCmFuQbOlaySgJiyKIMAM/FDMgqdoMDBQuYGgxMnAxMkH0i0IxsrIL
QGUCDDxAZcyMHEBRR6iTsHmgLwHsAUmQBzigGEl67nEWYVZGqAcw5ZtDlyHJw9yCiI3miK3A2IC4
hRvoFia4S4HuB2Mkw1oY61jY/0MTkFNOaWpJfn5JhoJvfmlxKsMIApix1HbgLgsrMIYYhbHm/rYr
VriLhrYbCriLhg73JYSLhg7394SKhg7vSnxFQ9eWrYSKht6n5UQUDb3PuPAUDb0vLRFFA6YVfUUm
ROT4vqLZiByPWb70FW/BVr5gOqavTAZf0dA30YGooqFvYjkRRUPfxA5iioa+icuJLxr6pqrgKxr6
1uzBm/X79izBkfWxGXbACmEYlqJh4ktpYNEgjEhAIxRgxtLEtyL4ioZJeUy4i4ZJhY9wFw2Tl00g
XDRMXnadUNEweVURtGgAAFBLAwQUAAIACABFbLBOX9pNArYoAACsfQEADAAcAHRtcC9kdW1wLnR4
dFVUCQADAZHdXAGR3Vx1eAsAAQToAwAABOgDAADsXVtv27qWfs+v0GBwgARIvEnqbqAPadJMCyRp
Tpx0BiiKQrblRruK5SPJabN//fAiSpREUbZlGW5rI+j2tqglilxc3+K68TYaaOTzEDz7WvEZRct4
Iv5AP5d+kgZzLw2iufDrXRyl0SQKtWt//i190j7MZ9ERuwQ1MAD0k7WdRPM0jsLQj0W6T1GSarXP
+4sPX999etA0k/3//eRlqn3y59MoPhst/EkwCyZHR1exh3sOh7jV+DX1Ew337UcQ+9qxAbRxkCYn
p/mlibdIl7E/La7Rfr6b4wvJMmQvlr4u/KH2Nlz6aRTh13lvYHr4v2EwX/7Unnxvijt/7Lrs3vM4
Dl68kI7fULvxXjVonWoIQFeD+hDYQwMNbMeAFh2EM6DTuz7T4U6eglmqzaJYS5+CRFt4k+9+OsyH
jNyQ+HjEpskX1s9FNHnKngRN0wEIOZZIPmstPGLqh6mnzeLoWVvE/ksQLYVRmJGhUzyvmcQ0SBah
97oyjSSYY26K/Zkf++QbfuVZEONJb7udze7t8nnsx/ilhd8YsxXTXp7SC/aOLa0+M1J47J+9+Ls/
HWpXXpj4XyoXg2/zKK5cvYuCeXqWRmf0i3aJOW5C2Geo3fsTP3ghTAazp/AFginN+RuPOX8NnybB
1ydjOE7JF/8l/XKU8x67na3FobB2sg4Ky3FI15BwK1k9mHWzhkLvyCI6Bj8BPGFUSLs7ynnaA+V8
8sO7Fx+/FGlmnFRosktntYVIGZReu4immEzlOiE2m7EBufPIGKR4GT1EqRfmk4QEIsv5FPPB1J8e
cXHw+d3PhR+nVLxox7dR6v/1yBudDKu3fTkSRcln9dWR/+LHQfqqhfhLONQI8UqT/4mj5WKoPRYU
jphYA4Y2m2kAaRCSf1f4DMjn6Oi2V8mL2JpyLbtnyYv2W/KaENk9Sl5OvoPkxVPUWfI201hJ8spu
L0tedJC8B8m7z5IX7I3k1fGaQriDttFF8kK9kLwX0XyOuQjz93+WuDdc8upD0qoieiEelUz25hcL
4Ztf3Yn0dR0D6UZv0rcgv6n0ha4LQUfpq6TRLn0Zp7RIX10iffPZrUxqVf42tdtLCYy/TaLn52j+
i4ji6sqsiuLKdU5MJYohoJffXn49v7y8x6IZDKExhGgI3CF0hmPc8dpP2cyHXoIlwQyLrJeAjBV+
GEB4uWjHd1jILp78GD/n+P2Hy5Ph4/z7PPoxx6+Q+DFpnQy16+A5SP3pZZBMIiyVvXHo3+C3OMnF
MQSDAZWh2hvtJsB8kT2JPXnI+CKYf8NLh/6M3xYVdw/w8sZyuvHuRyyNUv9bFAf/YAYqSACRBO0A
pvNGu4riZ49PF26VNwID3sviH/xE72/8xBF7WfZI8s5EbhM6lC0oixcPA2vQefBDf/EUzV9rVDCZ
lamcL6dBVKcwACtT+Dj+m/DbQ+zNkxkRHTVag+oANdJikgTPp5RKZXgaqdxjbcRvplIenkYqt376
I4q/N5MpjVEjmbsoCchcK+gMGI+2vRRZNkQsipwnThJsI5GtNk1cbtoNlRoP8dKXEsUvCSCAOdHK
8qsscrp4TLZ6roP592ytnF9cEyk6Z8JQO770MMxdPHn4lzA5ycSioGORP0/Dcgc6GsDojvUtA0sl
DcsVZBLFC3eoqmPR7v6rf13LYAgKdUepVck1MKJrXdxcakR/pH0icvt8MvEXKRfcpCMVrcsYkvYV
rctxcqUL1pQufnFnOpfr9KpzMfJdbI2W0d3W2EhjJZ0Lc0yLzmXIdC4+ueU5ralc8ma9aFwjpqOs
r21NnqeNShZTo+rqlah8tSpZI649AZWSdYHVPW/OtbEKVX7xTLEs6QRk7T4uJlSANrZmChhwC5WC
cj6AFSxjhDS69dSuAj+cDpkIvWAjwJ+Y8H7XNRRKGAIqrTNyvJsZQXUveSeb9ER7UzXxPgqJzMGc
j/ktfcKg4yWEfC4bCnAYaA/4+vUNFkphqC38mChL9B48BnilYVk1eRpkk5xxIIZ7ogIW/GdmnJS9
/RlvcUnWOl6Op65uP/MVjIF1Ec0TX7jfrtyfN8kI6DYit3PAggSkCGbZEsySmQkGBWL1DVcmFT54
u2h2MQ3YmmgaYCw1Sr0Uy8rjRp464fhl4hGtwpdpcfiya+jFr+0IvUykmz2iFyffxV6rb8Feq3ex
GBAGakEvU4JefG7LU1oFL3mrg722i5FAXKMSG0F5CWNSLdZa1lfWnqj9TJ4KUphxATEFnIdh9MMv
5ATrf8Jdqb8zcHLAEFjJWB1llCiVXZRAETwFli7CEQaiGf0XFNDUbqPuf+dkYUmiWwaEVicrNSyg
iOgVdB/5zedYY+3zXkkfQMNBttUT2ojkN7ZPWzowYEf7tIpGO9owHmlBG+vX2Cv9IXgjLsQq2AjX
CBGI1EjjlJBmtMSCN0lEpNl4/3GxjDHLpeFrdQuSMLclnqWMNn9cIVGxOg8cIlH3TsG38YoxbVTY
ozaTqkbd94dxaRHiGeKi1R6SZlXnHx4HLluNuvOPX92JcNVNqz9DlEh+U+GKAKHVTbgqabQLV8Yq
LcLVlglXI3fqlSa1Jl0b2h3Ea3efX74im5x+vAElp7d4/WCbpBW03fdYQQ2Z1wsD+6ZyeG2XQCY1
4tcFbcV8FcIPl0FCnBjTkj2oWQlvthStoF6vYxHCyreugTFVwakWLoGNUgTJYCBARu+Y4TBBoOfx
Ihv5MDI1nhpd77G4xv88R5j3RsvFIoqJo+nK94hsSDiCOFhvqwXu5bq5VQ/cc3aLHmZvoSMi+Q6G
IKRbnQ1BzTRWQg+9NXTEkaCHlYfkqTRzeauDE2NzJ0bLupQZZNS3MKCC491YZaAGAWy2yqzQVd5T
dRiiGukkuOG22W5sU1d5GCBsARQET52yjwGOKa6guv9bYdTpG0lcKhR0iOy+3AvqOc59DO7++hiI
7LeRY/cILZx8B2jBDNsZWppprAItejmwXQYt7sHHcPAxrO9j+D0hTbLRcdZAHCVkNe2HMCwBw272
NjCQ2gNvAwREprjIsLjjW7JNPdG0MJp4IYUn8n/8c40uzu8oGbtmFys5f95/uDzLpv9UG118uGQh
sAbMgQmCIaFSNZvpOTbBOjjlV3eDTrZlIbM/dMrJb4xO0NUlNqv10ElFYwV0opzUlisKZHazHHnK
s1qzmzW02z+I8iYh/hYiPFGNULWSTUiGYgAM6d9X/gWLvOxb/neyFZgjFihqdSKtUBXlyFXW/KiI
YgbUaMMdxm/k2wa+axgMoCSI+u6tdhV6JBSYMtj5Mo1ILDgWQuErvrJMnmhUbtbT48xZAqSB4W8v
Mlpsoh/4RPNtLX27itEP5Vc4GjDLYd0tTaOEqxeR/kWc6DWNgOV7s1DiW0q4fIk5bEah9+KTMagz
SvHgFRmmRkD2dPE660LmJTrmXPT5Gv9QcmnhsbliY2NxgGV+psxaeY7544WFWZOJEcnQ32pkbJG7
GRDxxcmMqCVHGYUc1mqEZYAXEkjP7KhMd+KaSIb7w6aIRlFxKlmVq9EOQoIFb/9hil+YuNBitnGu
NSjreFQ4jW6wqlnAJ+ssFNSmjBfoG16+zr3nbJUQ5Y/kbUzL72lwUSZlXFBoLHQHjfBKnlClxeGB
EoBegpkywzL8DEhX8n8J9tnBOSYECaGVEgBLqk/fSg+kUGXAjomAgjNwNcMuhHvvG7QdvU/rbk5+
8y04tIHbdQuuoLGKkkM4p03JgQfn4H7FXrSbeEvhGO0bzHG/jsPrm7ty98o5VW80/SwJozRbi0lz
EtcbzVyhJaS6UuE0lCU7QaZQjQixj7NZQkRAtRXkahdeTQRkzyeTZexNXmstizwsqieMaMh6tRUs
1Lj3UTiVpWFBQdUbzYPZTJWrRcYNT9j3rI10yCBVQKMfeEY56Ga4nkipssRJDrL/XmLlIn3VLrGw
9edMubzHMNyc8Ie7ffGRmkiaEwzx639CzRMIilH6pDc2E7Lnlmeh90O7jr5po9f55CmO5kRWks5W
7wLC8J6vfJc43hefRper3kDZ9c77RjinWFi3/rcoDeS5oALzluZMNlXZcNMczIVHtc/WfhE5n73+
VRj9yFnimuwoiBbNRPWJdMDexpE3HRPNTlxYzUNVZC82j867y3u67ULazXiRKBiZ8SVvrrc0z9b2
uznm4wkWdR/m/1kG8as2mnhzxSr/MMcTFHqtdxSrXbgDT7QvbS5w6v1o9IFpNZw+HqRlWGdvcdzf
4VVwp5SLdLjffTJamrER/2Sqm7GRVk5eNrznV+8J2tPNK923KYaWtiUJpKRWCFP45LcUq//t/V9k
vm+xfM5BSyUGrt8J4HaR47VqaDPU4Wy1aB9lc507QCHGR8tx7KXKLGciK5aJ37a6JIPPdqzrjX7D
PcXwk1f0iTBXrU1h+PP2isXZMPb0thYWJ+bzdz9TkuY9FVcPNVXLAZINf/CMF5g394lQxCxC5FfG
WWmkjYiWyfObs9FsZp11F8jInxBNGHdhQe07AUtQb5ymYkNE5Mnlo2p2YiznfS7ocW8I38vYS5ih
22h+Nquam95Gy/nUi1+5iapxvlrEOZ0g6hrBi5BkoSeEy8guJFqmmcVjyrRS+WxBJk/ZxD78XwaA
16xgT6Omkov4Cl5KgA+o30NUvXJG4zqr0AOFC6Y5ZqDdt7JWZIBBA82EWLPZhBoyDE13SNAZ+XM1
R6/Hmjm78MMgtrFEJuoSa2Y3xJrVJie3SKC9DgggBTRRn9aIjHyXlHnb6Z4yb3dxuRCmabNGoF8h
IuAPDDarL8w2x3ztjswvP9mZXx5Sp067X17eU97RJrOJvoJphO4byqVnJUAC9fbMQWXwmdECMRCd
usiqhJ9NeFgzs5bDvfDy61RQmNBBu4g/q0184eXX9xtuXN3oE244+U457mALOe6gA9wQLmqDG/0Q
gHYIQOsWgPa74Jxk7wPRGqCjAq2mLRKEp65rKcLPJvsSfkbKhFnAhna3tExL7omtz0w1WROSomG1
ZBuIikz4erpNfnU3oOTCLCKrH1DKyW8edgYxs3UNO1PQaAclxkFtoCStG5bn0pRnteaRbWh3AKbt
eGQVK1XlmW2+jZY4bUvt1Lt5aCXbkBvv56D8+4rOXKndU3uPp0RlKC/Z75sbM7vf+mbdRoqgZKwt
RimR3gIEH5q8Pqfwa+nTiqCKXV87OK65uTM0hPdR08KCmEVDNfzhofrvQenTN5iaTBQiA3aquWmI
NkS6zEj0X7XaJjT3PpbJhQaAfSJnRr5TwU19CwU39S7IiSQ1aCrIaf4qsUx/jAWxvizl+6lau2wX
5e4uiweosnjk/YNuX5XY84gD4v7z00Col3CPxLDdoiG7eoO77aVR/Fq5ImoLgzzmvRT9HkaT73m4
FA01pmEjz3jFZWHr0rro9L6v7L6vn7wwmH5l/sYZWQkCl9ch0GndQ5pQZflEqAUcXROTsCuWT7ex
IHWWjQukpRy0XUCjlck6k0OjPKFJnvxUpDmZBTQK9ekL3q3rozde8r0wf5Kya2Z9t5kfygRNyW4T
7BgzYb+YCTtjJtzCgXgQdMJMsxUzpZXXzGIXqTqZqandfmHmKglOG6adrJwoswXc7T/BCbQnOJE4
E68lyQlsO8kJ9JTktM6kr5rkVMswkmY5bZhPt2KWUzXRan+SnKxNk5wkKNaQ5STFO0zT65DmhPIr
InW2LOVQmr0GOimnKZH16NEvlpCm5NEviKcsgVoNqV1oHnaGGA7oonkg4SCMUr5ZppeRPcFsmfhT
em7QZElPbhtTzfNYnm9tkxCpmipi5YZvVC8Bm1/dmSpigF5VEaPz2bzI7a6KILeTKuK0ns0rq1OY
T29lVquqSFO7gypyUEW2qIpYB1XkN1FFslDDrgnXDNdWybjOEFAo5bmRLuIcySCevsbtMgy1ICeU
dR90TsHOPB/LMB0q4Js+THgz7q66jbTZMk6fcIcCQXvyXrwgpIs172ZVVYLMFjMRVCWdfnEKM02W
0T1oyOjOAtzAHh3vSmxOGBAd6PYY5FazVxYKlbPXoW0u0s0eQ9ty8l1C2yDqHtoGUQdlivBOmzLl
HELbDqFtm4S2/dquGJkT3lzDg6B0QTS56l3zFABVHNu+HNpCOjKwIIJ6p/PDHAF7Ck7jIS05j+WQ
42K1pQo5Vn7KuFODHMvYKeRYyO2xXlpOfnPI0V2js/tdQWMFyKEs0wY5snKefHLLc1qFHHmrA+Rs
DjmqZVnFH0VbesRLS3iaWUGc2tZeABtVmJqiG4SAcHoLVupNviOAldL7zae39Cxbif94YJlYM7N2
KFvxXn2PZath6LrV3/lYBfmNZathA7vj+VhKGivIVsoyLbIVgYNsPcjWP1e2QrZQXMftUv4XCYcN
lv2E3Dgn9+ad8pjr3IqC4L67pQzDgIbbo+jl5LsUqXe2UKTe0buIXsxRbaIX/ipuqUMZ4D+1DLB1
KAP8m5QB3twtJQO0lWJkBMfUeCuOqfWDZKpeplKKk+jBKor2HFXVkPZ/QLU2HptLsD4pwFKEUlKg
7zlIkiI6e31iLOnpbXCWyzm8sv/9cbQBLVCpjbeNHuYZUaM09j1aKnMTOkV5q6uLdV8NyKo3kXkc
sZNes7JnRKdheWLr0RcrYV0FPwsvaLIOHVAS4nk//zeYT0lPg3/WGTJQhoTHOX7HRIyoCsnqyMqD
kaPMGcrWamJLPKhjwYOKihSwck3sgeBBBXvnQUWkCJUNdOh2ysZGpiNkY9fdCtUcbISG9J6K0o83
77m5pbhcqP3F9d3o/Y6tm/3lYRfkNze56KhzZWwVjXa9n/FOm94vq0VVTHB1Xmuaf2PLg+mlSy62
Yp3WM7CbG9PH2C2HCZpmH6eXF70SV/4NZnW/1YWpSKJqd06umSplaMDWZjP5MekG0qyJZpuaZWq2
oVmzUqoUe60MRPA10sKht03p/+J7dHJnQ0JyPh4FGqE6GrX+1QKDCCF9W4SMbREyt0XI2hYhe1uE
nG0RcrdFyNsWofG2CE22RWi6LUL+tgjNtkQIgpzQWuez9K6Iknp1jqMjC24rlE+wz9T0z70uSmdZ
toH6y8gsyG+qd0KnexUDJY12vZOxSpveeShKtz/6pmw5VtVMSRtK1Fwnhm/toj73vpewiaDq5GNC
HuDHz2So/NLplpmbUVDrTB6axqLT9H0ITUMGXSAOgp029aYgSz9hjTiKz7iVKJejxlCrJbcbeW57
PbXd2GVmu2Uj3e5v/16Q39xvZ+CNQle/nYLGKnKUsEmbHJXVUcsT1g1VXru81UGObi5Hq0uxKkMr
1wmxWUsMNBKILOdTn0QLT3MD6+d3Pxd+zMpfaMe3WET+9cgbnQyrt30pGWY/q6+O/BefJr6E7AAD
QrzShMZAD7XHgkIhfcmOGtGz/dDeGFRNuqhcBK2+Za+537JX122rR9nLyXfJPnG71/FvprGK7CVs
0iZ7zYPsPcjefZa9++PMIiWfXEfX8y5tVlpYr51sX62EiEhVJ70WswZy71V+UYhZA7v0Xdl4k2/1
V0qhIL+x/HUN4Bgd5a+KRrv8ZazSJn+lVZ30PBYNqDxXTe32Ugbjb5Po+Tma/zKpgOW1Wc8FLF3n
xPqpMkjPjSNBwSxsihVfQXi9aMd3WMwunvwYP+f4/YfLk+Hj/Ps8+jGnid8xaZ2Q7L7nIPWn1ACC
5TKJcSOxIUW4DhRCN24CzBd55V7y5CzEjfizpuxnUgxZzAukNorGux/nJGn9WxQH/2AGKkgAWWrh
G+2KBiVl0yVW9ZXXNbzx/sZPHLGXZY8k7ywENzUfyLYCnQc/9BdP0fy1+ZTUFaicL6dB1Hwc6woU
Po7/JvxGzxqdNZyLB1akxSSJ8iTEFajck8iZZirV4JgGKrd++iOKvzeTqUTsNJC5ixJafFNBZyAE
cipeSlZPWpwk2EYiW22auNxUZwhnLwkgTadlRCvLr7LIRbMlzdwtYmongj2Rxh3xGKkTns0r2Bcb
ymtiuYLMzOgoySHQBv/qX9uyMwi1zU61p4UyV+cTEoBVrvVR1rtsUsy7qnc5xdEN9VQBx9mt1mXq
Zp9al6mbnU+vM7dwep3ZSeuy2xJgkayAVT675UmtKV3yZofq05tXn25emLLCB42tmQoGdlT+AKjL
H6h7CVrqUdsbxyzRsPm3mPUxv6VP/FjiQjgU8DDQHvD16xsslcJQW/gxUZfoPTGJr0+wsJo8DUQ/
lySoCbVXhhZCmiR1HXTQEu6kW84pAE65NDRws6gnSWlo0Jz8hmevb9hyqAwykLO1QINq0ZFGzipy
3va6cpBtOYYBe0QxTr6L7RZY3W23wOqAYoSD2lDsUDnoUDlog8pBvxOASkJwkb0G2ijhqilQV7fs
UwhQcxkhsC9lhBCWuwNoIOTqnWzWQjq2kHyX44273/smF1mGqfeGOAX5jSPeMK2uteqUNNoQhzNJ
G+K4v8a+6U/JsRCWYi2lQsiRJXFlSI02Th/5E3QvkqXjhq/V7UjC3Jh4ljLa/HFCjQuUJcDtm5qv
Y/Aa6CbUnW5y1aj7AqvBxDrY72PRjAHUTdPoS7yK5DcVryQDze14xIuSRrt4ZbzSIl518Ksci/bH
KPUtEcUXsnDitkNCYbd44g0k8dougkxsxK8L4Twz4YfLICFOjWnJOqRQxRWGoxWU7HXtQwatJj0u
Aqcl8AGlR4fR7Unf2AGZPDB10MWzkQUAZqdqFifYFse35sfDciSBQ612MrWRa+n1c6kNZ7coYrmg
TxSx3K6nc0Cjczi1gsZKKEI3GmoUkZVByk+bNlQ6urzVwbXR5WBN5cqUF3ZW3ZLVeB7vrsYzVNV4
bu0q76k6QFGNeBL40FvLQTvQVPod9DZcMU8dB1VOpBxTcEF117jCxtM3nCAqGJBumH15HNTTnLsd
dLS/bgcCAJYJzB7xhZPvgC+YZzvjSzONVfCFsFEbvqCD2+HgdtjkwILfEdckux4drgE7Stxq3BuZ
p8CyFccYjP+/vWvtbRtXot/3Vwi4uEALpLmkROoRoB/SpkULJG22bnIvsFgsFFtuvXXsXD+2zf76
5UMiKYkP2ZIMtXVRFEFFTSSRnBnOnDkzkPxDEFCtEkcI+l3FyRqedYLBR80iiCO/P3skxO9tjwJM
FllLe2ST0cAesZXjskfBMWo2MOon55mnTP7kVLZ3/UbULq+uy49XBh8/94Jn6/lyk+/FtRnt/NzD
DUbCnPuxiKbpUMEwp3Kkwt5Pp2uqAqqjYGETyW6iJuR8PN6u0vFjbaQELLOs0Ighu6qjoLSxb5bz
iQ6vDBU7PFrMplMbqJl+NzJhX/Ix2k8GGSUvcSJWwnznSf61ViqvMCjYVX/dpnNaYXZBlG22yEkW
001mRsaTx375nrkLZiQ+ef1b3zyBkh7zzW1gHKbAzLfP5ulX73L5yRs9LsafV8sF1ZX0Yat3qfSW
543vUr/3y9vRRdMb2HK9Tj/RlSM31rvs03Iz0xdNKIu3NGe6qco/NytWeEgZH6/zuQAQU1Aif72k
HMuUV5ir6qfaD/ZitUwnd9QRUzeW+VNJmL/567y6+MDi5b53dfewtixkvi6L4YFjOKyQv75d/H87
Wz16o3G6sOzytwsyQfPUeYfc7codZKIz7XBlpX4Yjd5yr6aQz1l+17aF+orsgmurXmSf+9Utcgzj
X/wW24fxL22dvPzznr9+Q609q71gTNaWT8vG0koLyVGrv0Xufs5fS8tapdGyqYHLV4pxeynste3T
5lanWFYP7q+Md7kDSDU+2t6t0o21HIjqii05gTh2l+bj85T/bl/fcI/8/PQVM6rMbXtTpSMuxls2
p+Hbs9scSxyqTMLK7mGnNr2B5J9/dk82WLrIqFIkS4Tqr3xlbZbeiHqZRSFQ/jXNS2fXDTKibWEz
+ggPjPF+xiu5jNMkD0RUn1zc2GZnRfR8Vih68jR03euWlzJDtEv0tErA/2K5XUzS1WNB2m+cL4c6
ZxPEwgRkE9JyLUazTU8hy+0mh8lMuFeqny3I9Smf2I//yw3gJa9tN3oqQsVX7KXG8AH7e0AdZbXk
WBdPYAtHWKLo7kDDjrFyxPKvSgp2OmZxc+QFMc3F0r+JFwf1FGx8iLAE4odLDFsVl0WGFGxtgkRU
Ag06Qh7BMMJ9RiTCqG2EHIL2jWjMMhpFJDB0RsjR9xAh/wkzsPWN6QpU1/th8Dj1+GBxashK4t1x
av2TFg9qCp0EDcIj7OwgeocabUnojGwnkTUjGzmsTHQSI1xJyI4LtE/RBG0IQW/MFUWUhOYeaBU+
8aeujmgwqkFFSzURb95ePMuX1ok3Yl1p6AZCUKZn8RmVUg2JB8L8wLr9EVcPZYASHPZpgHLxLQyQ
rixrVwNkltHIAJF15TJAOlYvMb2VWa2FxA3jjp3Qjp3QOuyE5js7oYliLW0rNBT21Aqtopl/gM5o
ftJNazQ6IY16o8X7tkYzUADUG6MZygL9Fm3RkLhyPboiLqY0qPxhoeKk5auBveHF4yK9z/cNhUSM
Oa2z+p6oUG7alQx+r7WDyhtBxUo7KJ/9wDL8nBYPwXo7qHPZDmrHP707RSEzXnFLJEBTmFrNG5Zu
UDjsM7jfLyrAb4sKACCE7YvjzTKauEBxA1RAeESpHVFq7VBqP8rhXxcURjscxK0neVPoODxJUGyB
qI2HAlGLqEpJcBC2o3UN9RC1+szUCjwp61itLgf6sny+Xpkjrh7IKCXY77E0R4jf3yiFZLG1NUoW
GQ2MEltBLqOk5R0TVTflWa2dyw3jjoapG6iaZafaIGvm2xhJqqsYNGgHXdPEZq/Sb6fl/2+IctMm
hL03ZEpsCIISsME8mCdEd893GyWCUhZbfqW19haggIv0DJ/K/5b+OC2oJRTutI27xbsR62M2kUnV
/GhobtD2r0qDtp5NacwVIWqXVs3R3nlatdYZVNjNePgQ7wT3mlAtxLfh68Qd8HVi3MZuIndCNf5e
IN4/TVK1vi31p6l6Y19+hkoOV+gDbIU++ueDSV9M7gKISVFR2Wam8Ct88NUYphzIr16Rx043y9Vj
5YrqK5yKlEApOTBfjr8IFDmLuzI07T3ZcXlUX8urzu77g9/3x206n03+4FH+Kd0JyiqvGUAEnTRr
CNpywQg7bKMPkxOAUCUbnBgZrfOaXaBlffAOYRuTXNkFRfxTn/BtkiqWSWEsLaVCdy+Xct05vUrX
X2QslBK34frRU7R5glhz9AQHNqGJ36sJTdrGQwFszwphltHMhAbOeKiWug3LI6Wt1ZNp3LBMaJN0
8J5JucZZxQ7McP/pYOBOB1M0bupICYOuU8Kgr5TwLrOuSwnrcsC1BKw2Cbwn/KBJRrqeE66mpYeU
Eg73TQlr7JohJ6y1gERm2iIp7IsrqnS+UfXGNX8N/2k5qUt3aMp+CJWkbsp+8IsEL6jRUR3AM0Eg
tyFh0J1n4it9N0q5+tyNo0eIKbllwtoUjbesVdwdc1SfaNFrCFCnr+aqhCJK7tdJZsXVQ7kqoR/0
6ark4tu4KkF79JpZRjNXJXTRICIdDaKY3sqsVl0V07ijq3J0VTp0VcKjq/LDuio5NLEtfI1buib4
tdwmKtyhe/kq8S86F4C9xrvtfO7NhKD88UFrQFueONnON2cWg85+mfJmRbbr3dKbblebz+SBZop3
lf6VzuZs+4rHrLpSkMdyxoorFbAfYhnmyfFxpwZ8XF40AAbUYRYxZtAkDHDYH0auFvCULhYcNDIu
Bhj2WBwgxLfhb0vaV6eZZTRxr+jacblX8IiMOyLj9kHGfd+5HF0OP94hBWHNYZgy/T6MTyAILDi4
obSKQZRHFAE/SFoZn1gxPnKpFZAYsciEzfGJ31K1OaFodB7XbE6IDmpzQtxnQZoQ3wL4BhBoDXwz
y3DbHL5kXDZHxxlaTG55Tqs2Rz/qaHP2tzm2bVk1QJaxrK2MA96GKyandtpXrI0N5mZ5DCpA6RhD
vHpcHAlghebf3DGmb90asI0SojDuriLYV5pylUPfxXlSH6A+KVCG0vEPBh9bTUDox/0pYiF+f0WM
QOS3VcQWGU0UMV1fLkUcfC+x1WNl8M9aGRweK4N/2Mrg/WOrOhPXKBGsRFfvOomu7p4JroZKSzB/
NQwrGb1+qbop7n9AlTiTTybYXRTgMPkNZe+8n63XEqO4uzAO/H8xeyY0H9nrv74f7SELVIgzu3hC
URUw2qyylPHo7iNHct+9frnrqwEdtRudxxHvkJhzIlIvh9dK7CZfpcl7PfsmQ/nrXeSAkloXz/nf
2WJCn3T29y6fDJSNxM2CvONaBQrM6e7IuQNpG2Bud2tl8po0wJ2SBvBlIUS5TP5USQOA4aUBEPPm
oiA+aCQGDToSk0CMeozECPFtmsbDuH3TeBi3OADQJeM6AKBjJOYYifl5IzGUmy2ECOGkjW71caxU
e9fzDtUab4TP2D0V9eoDqWDlZali5fWDKNkgiUOY9KZkpfj9G/lGRMe1beRrkeFWsnztuJSsjn9N
TnB1XmtxFuPIo7JtU+tt2af1Cm/zYPZrIkdbQ4xLidhc3s2ajsxW9/QrZCUmR0WH79NrXT5vfna0
pTstFVsNEpm7FmYhD0TedEotgraPe71suVSYZfLWnX9r6B8qyO9KUNCVINSVINyVoLArQVFXguKu
BCVdCUq7EnTXlaBxV4ImXQnKuhI07UgQBELQTtx4vXulIfMsMIo6A/4pkfGaMzpoBrwgScIg7NEJ
LcTvf9KHHVR8wjYVn3ypuJzQIwPecJxP3Xas+pyaMUwo3gXxtzOD0IcsXfOJaOihKm4dLnBsHMoW
DALHRvncQhSjuBXRKFZ06S3xiZerZ0U4XujR6MyrFc8jUTtfL51Hh6ycR4Efov4q56X4/fuLBtTV
bNlf1CKjgR5ly8SlR3WkbaIgHtnq5vWjjnp0fz1a3YpVHVq5ToVNHYhpXxGyXUwyii2eiEzWb6++
PWQrTq/hPXlHVOR/bopBT8+qt/1eyoD9Zr86yv7KWJnMnLeRosIrQxhi+sy7kRKk9iUnauAzLmh/
MJmrmG2qBEWob90bD1v3BmGAetS9hfg22arEb5+tSvwWupcuE5fujY+696h7h6x7h4MaoARTkR+j
dvUbuROv9hmqEi8iyhoV1ODCQKSyxEUFLgwOmcjC0A97rNuQ4vfWv1FCZLXUvzYZbv3Ll4pL/2pZ
owIBAwa2NJZp3CB1MPlpvLy/Xy6+m8LB8t6sVw6WrhfC+iE1ZN17KSaAI1Q5eYtP9ov35Jqo2YfP
2Yr8Htqj7OnZzeLLYvl1wcrEV3T0mtYC3s822YQFQIhepvBiCsKTuEioYOSuZmRdCJpg+ptzdDHN
aE34f1PmZbWKkMUojHffLGiJ+6flavY3WUBSBNAVIj73XjP0Zz5dKoWwnkbxKv2T/MYRf1n+K+k7
KyhSc1vcBnI+ZvPs4fNy8WjuVd9Ayvl2MltqeJZBYwnv7/6k6411fJ8auhODhrK4JrH2o24g5QOF
KJqlVFGIBinvss3X5eqLWUwFGmkQc71cM65Pi5xTBUNveSkdebU6SdAlIt9tnrrdctCrrvVx8ZI0
ZC2EVrZfZZOrYUtW5yvLGcZKPJEBPAsw6tOi9leJLxrIPIle8XEedNRAiLzTf/fubWHATSgOo1ZU
1wpN1vmYIl11LbByvwuDM3pDxe+KZZ+IepVWHB/W64r8qE+vKxffhgAr6oAAK4JtvC6yZBxeF9YR
YInZLU9qzenSDzuSXe9Pdm3emDqaBONo7oKBA5ElADtZgv0pgYP+OtobpsQqlF6QpU/W2+ZzVhQr
CeUgzcOp95Fcv7wiWmk+9x6yFXWX2D0rWsq0Jspq/PlUzXNpYE3YTUTtB2USaZDkiCUtVsmIWz3t
vYMehkx/JCgBXYEEqvQixlUhSoXxoDmCMAxCDHq0QIX4NnFXvz1HkFlGEwtEV5DLAh05go4cQXtw
BP1Ixk8DoMVgR3NS5voBzbl+/gFQSwECHgMUAAIACAAAabBOwoxgXzUCAADnCAAAFAAYAAAAAAAA
AAAApIEAAAAAdG1wL2J0bW91c2UtZmFpbC5kbXBVVAUAA+CK3Vx1eAsAAQQAAAAABAAAAABQSwEC
HgMUAAIACABFbLBOX9pNArYoAACsfQEADAAYAAAAAAABAAAApIGDAgAAdG1wL2R1bXAudHh0VVQF
AAMBkd1cdXgLAAEE6AMAAAToAwAAUEsFBgAAAAACAAIArAAAAH8rAAAAAA==
--00000000000063895d058903dc9a--
