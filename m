Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846B93D3569
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jul 2021 09:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbhGWG6J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Jul 2021 02:58:09 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41650 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhGWG6J (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Jul 2021 02:58:09 -0400
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
        by mail.holtmann.org (Postfix) with ESMTPSA id AABC1CECF6;
        Fri, 23 Jul 2021 09:38:41 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [BlueZ PATCH v2 1/3] error: BR/EDR and LE connection failure
 reasons
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CALWDO_V6y0sCVOGJjCfn7eqQ3RAc4NHqsFbXxRmGvnzGxU26ZQ@mail.gmail.com>
Date:   Fri, 23 Jul 2021 09:38:40 +0200
Cc:     Miao-chen Chou <mcchou@chromium.org>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Alain Michaud <alainm@chromium.org>,
        Howard Chung <howardchung@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <5350EBBD-7F81-448E-B96A-A1C09F8EC676@holtmann.org>
References: <20210626052152.2543526-1-mcchou@chromium.org>
 <20210625222111.BlueZ.v2.1.If79c3f0720cc893be1770c6853fe2fbe626f2caa@changeid>
 <086ED9D7-96E6-46AB-88B6-F2E71ACD1B15@holtmann.org>
 <CABmPvSHyt0LfMRJeaWzEMUZZNGnnNnZTnw_0iU4CyxQMd8jy1w@mail.gmail.com>
 <AF4F82B4-E735-4629-A01E-F8FB512652D8@holtmann.org>
 <CABmPvSH-ux_mo2EY_+Wmr_sDfk+Ai4BV+kPaZQLEL3hm_dYi6Q@mail.gmail.com>
 <CALWDO_V6y0sCVOGJjCfn7eqQ3RAc4NHqsFbXxRmGvnzGxU26ZQ@mail.gmail.com>
To:     Alain Michaud <alainmichaud@google.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

>>>>>> The source of Connect() failures can be divided into the following
>>>>>> three.
>>>>>> - bluetoothd's device interface state transition and profile state
>>>>>> transition
>>>>>> - Kernel's L2CAP layer state transition
>>>>>> - Potential HCI error codes returned by the remote device
>>>>>> 
>>>>>> This also added error-code.txt to describe these error codes.
>>>>>> 
>>>>>> Reviewed-by: Alain Michaud <alainm@chromium.org>
>>>>>> Reviewed-by: Howard Chung <howardchung@google.com>
>>>>>> ---
>>>>>> 
>>>>>> Changes in v2:
>>>>>> - Add error-code.txt
>>>>>> - Remove BtdError from return string
>>>>>> 
>>>>>> doc/error-code.txt | 266 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>> src/error.c        | 111 +++++++++++++++++++
>>>>>> src/error.h        |  52 +++++++++
>>>>>> 3 files changed, 429 insertions(+)
>>>>>> create mode 100644 doc/error-code.txt
>>>>> 
>>>>> please split documentation and code changes into separate patches.
>>>>> 
>>>>> 
>>>>>> 
>>>>>> diff --git a/doc/error-code.txt b/doc/error-code.txt
>>>>>> new file mode 100644
>>>>>> index 000000000..e91324855
>>>>>> --- /dev/null
>>>>>> +++ b/doc/error-code.txt
>>>>>> @@ -0,0 +1,266 @@
>>>>>> +D-Bus Method Return Error Codes
>>>>>> +===============================
>>>>>> +
>>>>>> +The motivation of having detailed error codes is to provide context-based
>>>>>> +failure reasons along with D-Bus method return so that D-Bus clients can
>>>>>> +build metrics and optimize their application based on these failure reasons.
>>>>>> +For instance, a client can build retry mechanism for a connection failure or
>>>>>> +improve the bottleneck of use scenario based on actionable metrics.
>>>>>> +
>>>>>> +These error codes are context-based but not necessarily tied to interface or
>>>>>> +method calls. For instance, if a pairing request failed due to connection
>>>>>> +failure, connection error would be attached to the method return of Pair().
>>>>>> +
>>>>>> +BR/EDR connection already connected
>>>>>> +===================================
>>>>>> +     code:   0x0001
>>>>>> +     errno:  EALREADY, EISCONN
>>>>> 
>>>>> I would rather see connnection-already-connected instead of 0x0001 in the D-Bus error message.
>>>> Having a code attached instead of a string description makes it easier
>>>> for a D-Bus client to interpret and map to corresponding handlers IMO.
>>>> For instead, a client can simplily use the code in a switch case to
>>>> perform retry or error reporting.
>>> 
>>> this argument has been made since forever. However D-Bus is heavily string based and we also have our API heavily string and descriptive. So I rather keep it that way.
>>> 
>>>>> 
>>>>>> +
>>>>>> +Either the profile is already connected or ACL connection is in place.
>>>>>> +
>>>>>> +BR/EDR connection page timeout
>>>>>> +==============================
>>>>>> +     code:   0x0002
>>>>>> +     errno:  EHOSTDOWN
>>>>>> +
>>>>>> +Failed due to page timeout.
>>>>>> +
>>>>>> +BR/EDR connection profile unavailable
>>>>>> +=====================================
>>>>>> +     code:   0x0003
>>>>>> +     errno:  ENOPROTOOPT
>>>>>> +
>>>>>> +Failed to find connectable services or the target service.
>>>>>> +
>>>>>> +BR/EDR connection SDP search
>>>>>> +============================
>>>>>> +     code:   0x0004
>>>>>> +     errno:  none
>>>>>> +
>>>>>> +Failed to complete the SDP search.
>>>>>> +
>>>>>> +BR/EDR connection create socket
>>>>>> +===============================
>>>>>> +     code:   0x0005
>>>>>> +     errno:  EIO
>>>>>> +
>>>>>> +Failed to create or connect to BT IO socket. This can also indicate hardware
>>>>>> +failure in the controller.
>>>>>> +
>>>>>> +BR/EDR connection invalid arguments
>>>>>> +===================================
>>>>>> +     code:   0x0006
>>>>>> +     errno:  EHOSTUNREACH
>>>>>> +
>>>>>> +Failed due to invalid arguments.
>>>>>> +
>>>>>> +BR/EDR connection not powered
>>>>>> +=============================
>>>>>> +     code:   0x0007
>>>>>> +     errno:  EHOSTUNREACH
>>>>>> +
>>>>>> +Failed due to adapter not powered.
>>>>>> +
>>>>>> +BR/EDR connection not supported
>>>>>> +===============================
>>>>>> +     code:   0x0008
>>>>>> +     errno:  EOPNOTSUPP, EPROTONOSUPPORT
>>>>>> +
>>>>>> +Failed due to unsupported state transition of L2CAP channel or other features
>>>>>> +either by the local host or the remote.
>>>>>> +
>>>>>> +BR/EDR connection bad socket
>>>>>> +============================
>>>>>> +     code:   0x0009
>>>>>> +     errno:  EBADFD
>>>>>> +
>>>>>> +Failed due to the socket is in bad state.
>>>>>> +
>>>>>> +BR/EDR connection memory allocation
>>>>>> +===================================
>>>>>> +     code:   0x000A
>>>>>> +     errno:  EBADFD
>>>>>> +
>>>>>> +Failed to allocate memory in either host stack or controller.
>>>>> 
>>>>> If this happens, then the code is wrong. Should be an ENOMEM.
>>>> My mistake, this should be ENOMEM. Corrected in v3.
>>>>> 
>>>>>> +
>>>>>> +BR/EDR connection busy
>>>>>> +======================
>>>>>> +     code:   0x000B
>>>>>> +     errno:  EBUSY
>>>>>> +
>>>>>> +Failed due to other ongoing operations, such as pairing, busy L2CAP channel or
>>>>>> +the operation disallowed by the controller.
>>>>>> +
>>>>>> +BR/EDR connection concurrent connection limit
>>>>>> +=============================================
>>>>>> +     code:   0x000C
>>>>>> +     errno:  EMLINK
>>>>>> +
>>>>>> +Failed due to reaching the concurrent connection limit to a device.
>>>>>> +
>>>>>> +BR/EDR connection timeout
>>>>>> +=========================
>>>>>> +     code:   0x000D
>>>>>> +     errno:  ETIMEDOUT
>>>>>> +
>>>>>> +Failed due to connection timeout
>>>>>> +
>>>>>> +BR/EDR connection refused
>>>>>> +=========================
>>>>>> +     code:   0x000E
>>>>>> +     errno:  ECONNREFUSED
>>>>>> +
>>>>>> +Refused by the remote device due to limited resource, security reason or
>>>>>> +unacceptable address type.
>>>>>> +
>>>>>> +BR/EDR connection aborted by remote
>>>>>> +===================================
>>>>>> +     code:   0x000F
>>>>>> +     errno:  ECONNRESET
>>>>>> +
>>>>>> +Terminated by the remote device due to limited resource or power off.
>>>>>> +
>>>>>> +BR/EDR connection aborted by local
>>>>>> +==================================
>>>>>> +     code:   0x0010
>>>>>> +     errno:  ECONNABORTED
>>>>>> +
>>>>>> +Aborted by the local host.
>>>>>> +
>>>>>> +BR/EDR connection protocol error
>>>>>> +================================
>>>>>> +     code:   0x0011
>>>>>> +     errno:  EPROTO
>>>>>> +
>>>>>> +Failed due to LMP protocol error.
>>>>>> +
>>>>>> +BR/EDR connection canceled
>>>>>> +==========================
>>>>>> +     code:   0x0012
>>>>>> +     errno:  none
>>>>>> +
>>>>>> +Failed due to cancellation caused by adapter drop, unexpected device drop, or
>>>>>> +incoming disconnection request before connection request is completed.
>>>>>> +
>>>>>> +BR/EDR connection unknown error
>>>>>> +===============================
>>>>>> +     code:   0x0013
>>>>>> +     errno:  ENOSYS
>>>>>> +
>>>>>> +Failed due to unknown reason.
>>>>>> +
>>>>>> +LE connection invalid arguments
>>>>>> +===============================
>>>>>> +     code:   0x0101
>>>>>> +     errno:  EINVAL
>>>>>> +
>>>>>> +Failed due to invalid arguments.
>>>>>> +
>>>>>> +LE connection not powered
>>>>>> +=========================
>>>>>> +     code:   0x0102
>>>>>> +     errno:  EHOSTUNREACH
>>>>>> +
>>>>>> +Failed due to adapter not powered.
>>>>>> +
>>>>>> +LE connection not supported
>>>>>> +===========================
>>>>>> +     code:   0x0103
>>>>>> +     errno:  EOPNOTSUPP, EPROTONOSUPPORT
>>>>>> +
>>>>>> +Failed due to unsupported state transition of L2CAP channel or other features
>>>>>> +(e.g. LE features) either by the local host or the remote.
>>>>>> +
>>>>>> +LE connection already connected
>>>>>> +===============================
>>>>>> +     code:   0x0104
>>>>>> +     errno: EALREADY, EISCONN
>>>>>> +
>>>>>> +Either the BT IO is already connected or LE link connection in place.
>>>>>> +
>>>>>> +LE connection bad socket
>>>>>> +========================
>>>>>> +     code:   0x0105
>>>>>> +     errno: EBADFD
>>>>>> +
>>>>>> +Failed due to the socket is in bad state.
>>>>>> +
>>>>>> +LE connection memory allocation
>>>>>> +===============================
>>>>>> +     code:   0x0106
>>>>>> +     errno: ENOMEM
>>>>>> +
>>>>>> +Failed to allocate memory in either host stack or controller.
>>>>>> +
>>>>>> +LE connection busy
>>>>>> +==================
>>>>>> +     code:   0x0107
>>>>>> +     errno:  EBUSY
>>>>>> +
>>>>>> +Failed due to other ongoing operations, such as pairing, connecting, busy
>>>>>> +L2CAP channel or the operation disallowed by the controller.
>>>>>> +
>>>>>> +LE connection refused
>>>>>> +=====================
>>>>>> +     code:   0x0108
>>>>>> +     errno:  ECONNREFUSED
>>>>>> +
>>>>>> +Failed due to that LE is not enabled or the attempt is refused by the remote
>>>>>> +device due to limited resource, security reason or unacceptable address type.
>>>>>> +
>>>>>> +LE connection create socket
>>>>>> +===========================
>>>>>> +     code:   0x0109
>>>>>> +     errno:  EIO
>>>>>> +
>>>>>> +Failed to create or connect to BT IO socket. This can also indicate hardware
>>>>>> +failure in the controller.
>>>>>> +
>>>>>> +LE connection timeout
>>>>>> +=====================
>>>>>> +     code:   0x010A
>>>>>> +     errno:  ETIMEDOUT
>>>>>> +
>>>>>> +Failed due to connection timeout
>>>>>> +
>>>>>> +LE connection concurrent connection limit
>>>>>> +=========================================
>>>>>> +     code:   0x010B
>>>>>> +     errno:  EMLINK
>>>>>> +
>>>>>> +Failed due to reaching the synchronous connection limit to a device.
>>>>>> +
>>>>>> +LE connection abort by remote
>>>>>> +=============================
>>>>>> +     code:   0x010C
>>>>>> +     errno:  ECONNRESET
>>>>>> +
>>>>>> +Aborted by the remote device due to limited resource or power off.
>>>>>> +
>>>>>> +LE connection abort by local
>>>>>> +============================
>>>>>> +     code:   0x010D
>>>>>> +     errno:  ECONNABORTED
>>>>>> +
>>>>>> +Aborted by the local host.
>>>>>> +
>>>>>> +LE connection link layer protocol error
>>>>>> +=======================================
>>>>>> +     code:   0x010E
>>>>>> +     errno:  EPROTO
>>>>>> +
>>>>>> +Failed due to link layer protocol error.
>>>>>> +
>>>>>> +LE connection GATT browsing
>>>>>> +===========================
>>>>>> +     code:   0x010F
>>>>>> +     errno:  none
>>>>>> +
>>>>>> +Failed to complete the GATT browsing.
>>>>>> +
>>>>>> +LE connection unknown error
>>>>>> +===========================
>>>>>> +     code:   0x0110
>>>>>> +     errno:  ENOSYS
>>>>>> +
>>>>>> + Failed due to unknown reason.
>>>>>> diff --git a/src/error.c b/src/error.c
>>>>>> index 89517075e..73602c4bf 100644
>>>>>> --- a/src/error.c
>>>>>> +++ b/src/error.c
>>>>>> @@ -27,6 +27,7 @@
>>>>>> #include <config.h>
>>>>>> #endif
>>>>>> 
>>>>>> +#include <stdio.h>
>>>>>> #include "gdbus/gdbus.h"
>>>>>> 
>>>>>> #include "error.h"
>>>>>> @@ -43,6 +44,12 @@ DBusMessage *btd_error_invalid_args_str(DBusMessage *msg, const char *str)
>>>>>>                                     "%s", str);
>>>>>> }
>>>>>> 
>>>>>> +DBusMessage *btd_error_invalid_args_err(DBusMessage *msg, uint16_t err)
>>>>>> +{
>>>>>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".InvalidArguments",
>>>>>> +                                     "0x%04X", err);
>>>>>> +}
>>>>>> +
>>>>>> DBusMessage *btd_error_busy(DBusMessage *msg)
>>>>>> {
>>>>>>     return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress",
>>>>>> @@ -79,12 +86,24 @@ DBusMessage *btd_error_in_progress(DBusMessage *msg)
>>>>>>                                     "In Progress");
>>>>>> }
>>>>>> 
>>>>>> +DBusMessage *btd_error_in_progress_err(DBusMessage *msg, uint16_t err)
>>>>>> +{
>>>>>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".InProgress", "0x%04X",
>>>>>> +                                     err);
>>>>>> +}
>>>>>> +
>>>>>> DBusMessage *btd_error_not_available(DBusMessage *msg)
>>>>>> {
>>>>>>     return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable",
>>>>>>                                     "Operation currently not available");
>>>>>> }
>>>>>> 
>>>>>> +DBusMessage *btd_error_not_available_err(DBusMessage *msg, uint16_t err)
>>>>>> +{
>>>>>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".NotAvailable",
>>>>>> +                                     "0x%04X", err);
>>>>>> +}
>>>>>> +
>>>>>> DBusMessage *btd_error_does_not_exist(DBusMessage *msg)
>>>>>> {
>>>>>>     return g_dbus_create_error(msg, ERROR_INTERFACE ".DoesNotExist",
>>>>>> @@ -121,8 +140,100 @@ DBusMessage *btd_error_not_ready(DBusMessage *msg)
>>>>>>                                     "Resource Not Ready");
>>>>>> }
>>>>>> 
>>>>>> +DBusMessage *btd_error_not_ready_err(DBusMessage *msg, uint16_t err)
>>>>>> +{
>>>>>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".NotReady", "0x%04X",
>>>>>> +                                     err);
>>>>>> +}
>>>>>> +
>>>>>> DBusMessage *btd_error_failed(DBusMessage *msg, const char *str)
>>>>>> {
>>>>>>     return g_dbus_create_error(msg, ERROR_INTERFACE
>>>>>>                                     ".Failed", "%s", str);
>>>>>> }
>>>>>> +
>>>>>> +DBusMessage *btd_error_failed_err(DBusMessage *msg, uint16_t err)
>>>>>> +{
>>>>>> +     return g_dbus_create_error(msg, ERROR_INTERFACE ".Failed", "0x%04X",
>>>>>> +                                     err);
>>>>>> +}
>>>>>> +
>>>>>> +uint16_t btd_error_bredr_conn_from_errno(int errno_code)
>>>>>> +{
>>>>>> +     switch (-errno_code) {
>>>>>> +     case EALREADY:
>>>>>> +     case EISCONN: // Fall through
>>>>> 
>>>>> Don’t do this Fall through. It is actually not a fall through per se. This is just a statement with two case labels. That is perfectly normal and no compiler should complain. And frankly no C-programmer should be confused if this was intentional or not.
>>>> Corrected in v3.
>>>>> 
>>>>>> +             return BTD_ERR_BREDR_CONN_ALREADY_CONNECTED;
>>>>>> +     case EHOSTDOWN:
>>>>>> +             return BTD_ERR_BREDR_CONN_PAGE_TIMEOUT;
>>>>>> +     case ENOPROTOOPT:
>>>>>> +             return BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE;
>>>>>> +     case EIO:
>>>>>> +             return BTD_ERR_BREDR_CONN_CREATE_SOCKET;
>>>>>> +     case EINVAL:
>>>>>> +             return BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS;
>>>>>> +     case EHOSTUNREACH:
>>>>>> +             return BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED;
>>>>>> +     case EOPNOTSUPP:
>>>>>> +     case EPROTONOSUPPORT: // Fall through
>>>>>> +             return BTD_ERR_BREDR_CONN_NOT_SUPPORTED;
>>>>>> +     case EBADFD:
>>>>>> +             return BTD_ERR_BREDR_CONN_BAD_SOCKET;
>>>>>> +     case ENOMEM:
>>>>>> +             return BTD_ERR_BREDR_CONN_MEMORY_ALLOC;
>>>>>> +     case EBUSY:
>>>>>> +             return BTD_ERR_BREDR_CONN_BUSY;
>>>>>> +     case EMLINK:
>>>>>> +             return BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT;
>>>>>> +     case ETIMEDOUT:
>>>>>> +             return BTD_ERR_BREDR_CONN_TIMEOUT;
>>>>>> +     case ECONNREFUSED:
>>>>>> +             return BTD_ERR_BREDR_CONN_REFUSED;
>>>>>> +     case ECONNRESET:
>>>>>> +             return BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE;
>>>>>> +     case ECONNABORTED:
>>>>>> +             return BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL;
>>>>>> +     case EPROTO:
>>>>>> +             return BTD_ERR_BREDR_CONN_PROTO_ERROR;
>>>>>> +     default:
>>>>>> +             return BTD_ERR_BREDR_CONN_UNKNOWN;
>>>>>> +     }
>>>>>> +}
>>>>>> +
>>>>>> +uint16_t btd_error_le_conn_from_errno(int errno_code)
>>>>>> +{
>>>>>> +     switch (-errno_code) {
>>>>>> +     case EINVAL:
>>>>>> +             return BTD_ERR_LE_CONN_INVALID_ARGUMENTS;
>>>>>> +     case EHOSTUNREACH:
>>>>>> +             return BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED;
>>>>>> +     case EOPNOTSUPP:
>>>>>> +     case EPROTONOSUPPORT: // Fall through
>>>>>> +             return BTD_ERR_LE_CONN_NOT_SUPPORTED;
>>>>>> +     case EALREADY:
>>>>>> +     case EISCONN: // Fall through
>>>>>> +             return BTD_ERR_LE_CONN_ALREADY_CONNECTED;
>>>>>> +     case EBADFD:
>>>>>> +             return BTD_ERR_LE_CONN_BAD_SOCKET;
>>>>>> +     case ENOMEM:
>>>>>> +             return BTD_ERR_LE_CONN_MEMORY_ALLOC;
>>>>>> +     case EBUSY:
>>>>>> +             return BTD_ERR_LE_CONN_BUSY;
>>>>>> +     case ECONNREFUSED:
>>>>>> +             return BTD_ERR_LE_CONN_REFUSED;
>>>>>> +     case EIO:
>>>>>> +             return BTD_ERR_LE_CONN_CREATE_SOCKET;
>>>>>> +     case ETIMEDOUT:
>>>>>> +             return BTD_ERR_LE_CONN_TIMEOUT;
>>>>>> +     case EMLINK:
>>>>>> +             return BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT;
>>>>>> +     case ECONNRESET:
>>>>>> +             return BTD_ERR_LE_CONN_ABORT_BY_REMOTE;
>>>>>> +     case ECONNABORTED:
>>>>>> +             return BTD_ERR_LE_CONN_ABORT_BY_LOCAL;
>>>>>> +     case EPROTO:
>>>>>> +             return BTD_ERR_LE_CONN_PROTO_ERROR;
>>>>>> +     default:
>>>>>> +             return BTD_ERR_LE_CONN_UNKNOWN;
>>>>>> +     }
>>>>>> +}
>>>>>> diff --git a/src/error.h b/src/error.h
>>>>>> index 7c8cad066..74d433aca 100644
>>>>>> --- a/src/error.h
>>>>>> +++ b/src/error.h
>>>>>> @@ -24,22 +24,74 @@
>>>>>> */
>>>>>> 
>>>>>> #include <dbus/dbus.h>
>>>>>> +#include <stdint.h>
>>>>>> 
>>>>>> #define ERROR_INTERFACE "org.bluez.Error"
>>>>>> 
>>>>>> +/* BR/EDR connection failure reasons
>>>>>> + * BT_ERR_* should be used as one of the parameters to btd_error_*_err().
>>>>>> + */
>>>>>> +#define BTD_ERR_BREDR_CONN_ALREADY_CONNECTED 0x0001
>>>>>> +#define BTD_ERR_BREDR_CONN_PAGE_TIMEOUT              0x0002
>>>>>> +#define BTD_ERR_BREDR_CONN_PROFILE_UNAVAILABLE       0x0003
>>>>>> +#define BTD_ERR_BREDR_CONN_SDP_SEARCH                0x0004
>>>>>> +#define BTD_ERR_BREDR_CONN_CREATE_SOCKET     0x0005
>>>>>> +#define BTD_ERR_BREDR_CONN_INVALID_ARGUMENTS 0x0006
>>>>>> +#define BTD_ERR_BREDR_CONN_ADAPTER_NOT_POWERED       0x0007
>>>>>> +#define BTD_ERR_BREDR_CONN_NOT_SUPPORTED     0x0008
>>>>>> +#define BTD_ERR_BREDR_CONN_BAD_SOCKET                0x0009
>>>>>> +#define BTD_ERR_BREDR_CONN_MEMORY_ALLOC              0x000A
>>>>>> +#define BTD_ERR_BREDR_CONN_BUSY                      0x000B
>>>>>> +#define BTD_ERR_BREDR_CONN_CNCR_CONNECT_LIMIT        0x000C
>>>>>> +#define BTD_ERR_BREDR_CONN_TIMEOUT           0x000D
>>>>>> +#define BTD_ERR_BREDR_CONN_REFUSED           0x000E
>>>>>> +#define BTD_ERR_BREDR_CONN_ABORT_BY_REMOTE   0x000F
>>>>>> +#define BTD_ERR_BREDR_CONN_ABORT_BY_LOCAL    0x0010
>>>>>> +#define BTD_ERR_BREDR_CONN_PROTO_ERROR               0x0011
>>>>>> +#define BTD_ERR_BREDR_CONN_CANCELED          0x0012
>>>>>> +#define BTD_ERR_BREDR_CONN_UNKNOWN           0x0013
>>>>>> +
>>>>>> +/* LE connection failure reasons
>>>>>> + * BT_ERR_* should be used as one of the parameters to btd_error_*_err().
>>>>>> + */
>>>>>> +#define BTD_ERR_LE_CONN_INVALID_ARGUMENTS    0x0101
>>>>>> +#define BTD_ERR_LE_CONN_ADAPTER_NOT_POWERED  0x0102
>>>>>> +#define BTD_ERR_LE_CONN_NOT_SUPPORTED                0x0103
>>>>>> +#define BTD_ERR_LE_CONN_ALREADY_CONNECTED    0x0104
>>>>>> +#define BTD_ERR_LE_CONN_BAD_SOCKET           0x0105
>>>>>> +#define BTD_ERR_LE_CONN_MEMORY_ALLOC         0x0106
>>>>>> +#define BTD_ERR_LE_CONN_BUSY                 0x0107
>>>>>> +#define BTD_ERR_LE_CONN_REFUSED                      0x0108
>>>>>> +#define BTD_ERR_LE_CONN_CREATE_SOCKET                0x0109
>>>>>> +#define BTD_ERR_LE_CONN_TIMEOUT                      0x010A
>>>>>> +#define BTD_ERR_LE_CONN_SYNC_CONNECT_LIMIT   0x010B
>>>>>> +#define BTD_ERR_LE_CONN_ABORT_BY_REMOTE              0x010C
>>>>>> +#define BTD_ERR_LE_CONN_ABORT_BY_LOCAL               0x010D
>>>>>> +#define BTD_ERR_LE_CONN_PROTO_ERROR          0x010E
>>>>>> +#define BTD_ERR_LE_CONN_GATT_BROWSE          0x010F
>>>>>> +#define BTD_ERR_LE_CONN_UNKNOWN                      0x0110
>>>>>> +
>>>>> 
>>>>> What is the intention to split BR/EDR and LE here. You do know up-front what connection type you are. Trying to figure out from the error code what connection you have been trying to establish is plain wrong.
>>>> In fact the up-front connection type is not necessarily known. In the
>>>> case of dual-mode devices, such as Bose QC35, a D-Bus client can issue
>>>> Connect(), and it depends on the timing of connection request (adv
>>>> usually arrive first compared to inquiry result), it can be either
>>>> BR/EDR or LE link being established. Another aspect of this is the
>>>> metrics collection, where knowing transport can be handy. For
>>>> instance, we can associate the certain error to particular use cases
>>>> at application layer, and that can help targeting the bottleneck to
>>>> tackle.
>>> 
>>> Then we need to find a different way to convey the transport chosen. Doing this by error message is a bad idea.
>>> 
>>>>> 
>>>>> The description is that you want to know exactly where the connection failed. And I think that can be established independent from the transport.
>>>> Indeed the intention is to know where it failed exactly. However, as
>>>> mentioned above, transport information is also an important piece of
>>>> information to know.
>>> 
>>> We need to find a different way to inform about which transport failed (or better which was chosen in the first place).
> I would love to hear your thoughts on an alternative.  Many of the
> Apis are transport agnostic (Connect/Pair may end up connecting to
> either available transports for dual mode devices), but yet the error
> that results from them are not.  Errors from one transport doesn't
> make sense for one and vice versa.  A platform wanting to leverage
> telemetry and metrics to drive ecosystem improvements would ultimately
> need to know the difference even if the applications may not need to
> care.

and we might have made a mistake in the API design and should have given the caller more control. We need to review the API design and see if things have to change. Just glueing things on at the end makes me suspicious.

Regards

Marcel

