Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 649D66CAE5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Jul 2019 10:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfGRI0N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Jul 2019 04:26:13 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46001 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfGRI0M (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Jul 2019 04:26:12 -0400
Received: by mail-ot1-f47.google.com with SMTP id x21so28071691otq.12
        for <linux-bluetooth@vger.kernel.org>; Thu, 18 Jul 2019 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GkaprJuHG8aMYxCDCO7BOhlrd3nfkIcptm8XijDLzqo=;
        b=EDJmPFYG8iFYwHU/i6fpQasB4nt15GxCZy3YwN9/qDNKvrnVLQWzz7JzqTXiH6Ojcl
         FnZeugC+SUBeOoKfkr1Yf1DyRgwqMoajelXylPpxn3ahP9LpXVqJ/SknILnarkFqqBjg
         yVvrvdftzPRuzn56fP/m8x6Efa5dieNf032sZfHGFKZ2xF9z5Oo1w+k/TF5eGFFVih3O
         HUA27juuzCbHbgKJzhrFx3xRBsuxQYOckaXgmm980Cx3czA89FR2FOHq2dBCc4lzLXhR
         vey7YDMsqByMEaayYpzcSqiefdWn0RHfprFH9qH66YDOzRWNUpgYPRocCMEW43E+wExb
         m4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GkaprJuHG8aMYxCDCO7BOhlrd3nfkIcptm8XijDLzqo=;
        b=HCurFhLFBF0NALLn7OUVHHHEbD0VmjqjqwVc+2z+8OVt9blLMy5cK4BSuDn//TCn1D
         xxOE9TvpXo3Z6lfkVewVCz3UnA8WfhrcHFc9XHGkm0RzSp/g3CFAUbvfLVZyhgkP76BQ
         k+WrTA60lM1F6HYzMOEZQeAhhSCa1bim0SWdq+3ZN1z2WA5pNpwE/6tMVog+jqns2bf8
         qOWILN6mjpH84ydQZqJnzJCPKTVJPJ7RHwNw7rLIgE/GXhO9textrqk0nqbCatSsXLC9
         o9pJsTFbQDuPtZt1AJDXkRCh0rKnVnw/Q+Ggq1jW8fsPIXTkKwo+9rExcMNnzlvqpMbd
         aM0A==
X-Gm-Message-State: APjAAAXiV0R34rwf5kitQAXyQO4C3ZF8/3wl59LZFqwyTHzJJE+nvzFs
        cQj1FjbfKq323+zP83v/MxAoQVTwoNoxvyIDwlk=
X-Google-Smtp-Source: APXvYqxhxnfBBW06tDS5sRucKcW8icgmoe7pPeOLzr0+QDM+lmsyIBCrDw2Fv6X8LZKwM2SuhVcZ/CNOVEDG3zpYjTM=
X-Received: by 2002:a9d:7e88:: with SMTP id m8mr31667038otp.177.1563438371262;
 Thu, 18 Jul 2019 01:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAu3APas5syS3gYXN-BBqB=OcDZJjpPwND6qzOO1wSmbMq2U1Q@mail.gmail.com>
In-Reply-To: <CAAu3APas5syS3gYXN-BBqB=OcDZJjpPwND6qzOO1wSmbMq2U1Q@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 18 Jul 2019 11:25:58 +0300
Message-ID: <CABBYNZ+W8dG7qgAe-2QYnSkyVG_1eA4KtMKHyXws0LWwB346Ow@mail.gmail.com>
Subject: Re: DBus LEAdvertisement and Python
To:     Barry Byford <31baz66@gmail.com>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Barry,

On Thu, Jul 18, 2019 at 10:03 AM Barry Byford <31baz66@gmail.com> wrote:
>
> Hello,
>
> The Python examples provided in the test directory of the BlueZ
> repository use the python-dbus library. Looking at the documentation
> of that library it does start by raising concerns and offering
> alternatives. I have been looking at some of the alternatives and am
> having difficultly getting them to work with BlueZ. I have been
> focusing on the org.bluez.LEAdvertisement1 interface.
>
> Looking at the documentation, it says the service, interface and
> object details are:
> Service org.bluez
> Interface org.bluez.LEAdvertisement1
> Object path freely definable
>
> I am not being successful at publishing to the org.bluez service. It
> is also not where the current examples publish to.
> Looking at the GattProfile1 documentation, it has service and object
> as application dependant.
> Service <application dependent>
> Interface org.bluez.GattProfile1
> Object path <application dependent>
> Should the documentation of Service on LEAdvertisement1 be freely
> definable also?

Yep, the bus name is up to the application which usually don't
register a friendly name if you try to register with 'org.bluez' it
would probably conflict with the daemon itself so you wouldn't be able
to register that name anyway.

> I have created the LEAdvertisement1 interface so that it has an
> ObjectManager and is introspectable. When I pass the object to
> RegisterAdvertisement on the org.bluez.LEAdvertisingManager1 interface
> it accepts it (does not give an error) but does not register the data
> and I see no advertisement appear. Is there somewhere I can find a
> more detailed description of what needs to be on the
> org.bluez.LEAdvertisement1 interface that will work with
> RegisterAdvertisement?

Do you have the bluetoothd output when you register, I get the
following when using bluetoothctl:

bluetooth]# power on
Changing power on succeeded
[bluetooth]# advertise on
[CHG] Controller B8:8A:60:D8:17:D7 SupportedInstances: 0x04
[CHG] Controller B8:8A:60:D8:17:D7 ActiveInstances: 0x01
Advertising object registered
Tx Power: off
Name: off
Apperance: off
Discoverable: off
[bluetooth]#

bluetoothd[6103]: src/advertising.c:client_create() Adding proxy for
/org/bluez/advertising
bluetoothd[6103]: src/advertising.c:register_advertisement()
Registered advertisement at path /org/bluez/advertising
bluetoothd[6103]: src/advertising.c:refresh_adv() Refreshing
advertisement: /org/bluez/advertising
bluetoothd[6103]: src/advertising.c:add_adv_callback() Advertisement
registered: /org/bluez/advertising


> For reference, I have put below what I am currently  putting on the
> org.bluez.LEAdvertisement1 interface.
>
> Thanks,
> Barry
>
>
> $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> org.freedesktop.DBus.ObjectManager GetManagedObjects
> a{oa{sa{sv}}} 1 "/ukBaz/bluezero/advertisement1" 5
> "org.freedesktop.DBus.Properties" 0
> "org.freedesktop.DBus.Introspectable" 0 "org.freedesktop.DBus.Peer" 0
> "org.freedesktop.DBus.ObjectManager" 0 "org.bluez.LEAdvertisement1" 6
> "Type" s "broadcast" "ServiceUUIDs" as 0 "ManufacturerData" a{sv} 0
> "SolicitUUIDs" as 0 "ServiceData" a{sv} 1 "FEAA" ay 18 16 8 3 117 107
> 66 97 122 46 103 105 116 104 117 98 46 105 111 "IncludeTxPower" b
> false

Not sure if that is the problem but usually ObjectManager is suppose
to be on the '/' (root) path.

> $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> org.freedesktop.DBus.Properties GetAll s org.bluez.LEAdvertisement1
> a{sv} 6 "Type" s "broadcast" "ServiceUUIDs" as 0 "ManufacturerData"
> a{sv} 0 "SolicitUUIDs" as 0 "ServiceData" a{sv} 1 "FEAA" ay 18 16 8 3
> 117 107 66 97 122 46 103 105 116 104 117 98 46 105 111
> "IncludeTxPower" b false
>
> $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> org.freedesktop.DBus.Introspectable Introspect
> s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> Introspection 1.0//EN\"\n
> \"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<!--
> GDBus 2.60.4 -->\n<node>\n  <interface
> name=\"org.freedesktop.DBus.Properties\">\n    <method name=\"Get\">\n
>      <arg type=\"s\" name=\"interface_name\" direction=\"in\"/>\n
> <arg type=\"s\" name=\"property_name\" direction=\"in\"/>\n      <arg
> type=\"v\" name=\"value\" direction=\"out\"/>\n    </method>\n
> <method name=\"GetAll\">\n      <arg type=\"s\"
> name=\"interface_name\" direction=\"in\"/>\n      <arg type=\"a{sv}\"
> name=\"properties\" direction=\"out\"/>\n    </method>\n    <method
> name=\"Set\">\n      <arg type=\"s\" name=\"interface_name\"
> direction=\"in\"/>\n      <arg type=\"s\" name=\"property_name\"
> direction=\"in\"/>\n      <arg type=\"v\" name=\"value\"
> direction=\"in\"/>\n    </method>\n    <signal
> name=\"PropertiesChanged\">\n      <arg type=\"s\"
> name=\"interface_name\"/>\n      <arg type=\"a{sv}\"
> name=\"changed_properties\"/>\n      <arg type=\"as\"
> name=\"invalidated_properties\"/>\n    </signal>\n  </interface>\n
> <interface name=\"org.freedesktop.DBus.Introspectable\">\n    <method
> name=\"Introspect\">\n      <arg type=\"s\" name=\"xml_data\"
> direction=\"out\"/>\n    </method>\n  </interface>\n  <interface
> name=\"org.freedesktop.DBus.Peer\">\n    <method name=\"Ping\"/>\n
> <method name=\"GetMachineId\">\n      <arg type=\"s\"
> name=\"machine_uuid\" direction=\"out\"/>\n    </method>\n
> </interface>\n  <interface
> name=\"org.freedesktop.DBus.ObjectManager\">\n    <method
> name=\"GetManagedObjects\">\n      <arg type=\"a{oa{sa{sv}}}\"
> name=\"object_paths_interfaces_and_properties\" direction=\"out\">\n
>    </arg>\n    </method>\n    <signal name=\"InterfacesAdded\">\n
> <arg type=\"o\" name=\"object_path\">\n      </arg>\n      <arg
> type=\"a{sa{sv}}\" name=\"interfaces_and_properties\">\n      </arg>\n
>    </signal>\n    <signal name=\"InterfacesRemoved\">\n      <arg
> type=\"o\" name=\"object_path\">\n      </arg>\n      <arg type=\"as\"
> name=\"interfaces\">\n      </arg>\n    </signal>\n  </interface>\n
> <interface name=\"org.bluez.LEAdvertisement1\">\n    <annotation
> name=\"org.freedesktop.DBus.Properties.PropertiesChanged\"
> value=\"const\">\n    </annotation>\n    <method name=\"Release\">\n
>    <annotation name=\"org.freedesktop.DBus.Method.NoReply\"
> value=\"true\">\n      </annotation>\n    </method>\n    <property
> type=\"s\" name=\"Type\" access=\"read\">\n    </property>\n
> <property type=\"as\" name=\"ServiceUUIDs\" access=\"read\">\n
> </property>\n    <property type=\"a{sv}\" name=\"ManufacturerData\"
> access=\"read\">\n    </property>\n    <property type=\"as\"
> name=\"SolicitUUIDs\" access=\"read\">\n    </property>\n    <property
> type=\"a{sv}\" name=\"ServiceData\" access=\"read\">\n
> </property>\n    <property type=\"b\" name=\"IncludeTxPower\"
> access=\"read\">\n    </property>\n  </interface>\n</node>\n"



-- 
Luiz Augusto von Dentz
