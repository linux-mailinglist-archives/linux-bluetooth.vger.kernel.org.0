Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF28184A83
	for <lists+linux-bluetooth@lfdr.de>; Wed,  7 Aug 2019 13:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbfHGLTO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 7 Aug 2019 07:19:14 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33932 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729348AbfHGLTN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 7 Aug 2019 07:19:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id n5so102800975otk.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 07 Aug 2019 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=shs0CzjEWaGe9WlIaZWJ1tAeeGn9L9ux4McjfkHrOFs=;
        b=ZTbbUJWuBY1L7KUI11Iv9cu/x5q8XAUj23q0fIk4f6EUpF3mbxnGNiu1tQH0HgNX98
         TAEFSbEYSyQdHgqFlGEHBrcfuMp6xh6UuhEGCpfypSWQ4FKQa6GbNQIKhuS9n8I+YrHQ
         w8X3ZbQRCxlZ86fbhu29aCrEbyQXe0iZLcpJhYwWgYquC/5DCzUB1HIcDmwWnhGmGzAR
         cSLJvRGXboRIoj+QANDq1KXU+b+Jf54DNOFDsAJyM7BNv0Bk7zpNxUFHK7LaOpigKJnB
         b7L9s2hzIJZUKEqF2cuGuxEgQXqTSdZb3nvdhCASswn9bIOnAKa6ohZ/89eycpenNLK6
         1onA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shs0CzjEWaGe9WlIaZWJ1tAeeGn9L9ux4McjfkHrOFs=;
        b=jhOWl5yQ+wsPyhP5rLlMpTAtEGJ1IkzMUxzs/dESUlRu6jKFlDtgT4/tgTY5FSYH5p
         OOGhUzBx9VL8F3xZzQusFF7bwULw/YNHqB14+qt+14TxpNblQVS5qAo0cLf4Z8p6Ctxg
         K+S5e4vri6fDGgdaj+NtyVV3qpFWXqOb1vpuLwl7L0KQ0a3cfmVLmWQvq+VORXd9du/L
         1EphFpRnpN1Y0ZDwOp/r7U83/Zf7OvVG++JD57bF+ci+d1m0Zlcv0WdecjhZnbEU+8uS
         8E53Oxqvc53d7O2ABzLgu53mqhu8mNnzsddp0y1hsgPvJi3Pq8PwjUiG+t1ItjdxbJ+N
         sqVA==
X-Gm-Message-State: APjAAAW+Rp6RoJ9eBV6gzvdWaBTty+dVa14w2U40Z5/3e1jxN0PoJiO6
        3+D1nN4SXd1bRb5H9gGfolFjUJkH5e7KNytb9QE=
X-Google-Smtp-Source: APXvYqy4WaP1y7TtdxJx97HgfNxwlqXmRxY7WU4KbGyUQBhxg5+V1WGMzNAGP94P2B0lvi8TGZqNFgeSzqxGQE6cco4=
X-Received: by 2002:aca:bb45:: with SMTP id l66mr5781686oif.108.1565176750500;
 Wed, 07 Aug 2019 04:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190807064747.6725-1-inga.stotland@intel.com> <20190807064747.6725-2-inga.stotland@intel.com>
In-Reply-To: <20190807064747.6725-2-inga.stotland@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 7 Aug 2019 14:18:57 +0300
Message-ID: <CABBYNZJcQoowK5KVbwXys0WJf98-6A1WbkDKTXXZcwHkA759WA@mail.gmail.com>
Subject: Re: [PATCH BlueZ 1/2] shared/shell: Add ell based shell implementation
To:     Inga Stotland <inga.stotland@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        "Gix, Brian" <brian.gix@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Inga,

On Wed, Aug 7, 2019 at 9:47 AM Inga Stotland <inga.stotland@intel.com> wrote:
>
> This adds the functionality of bt_shell that uses ell
> mainloop.
> ---
>  Makefile.am            |   13 +-
>  src/shared/shell-ell.c | 1320 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1330 insertions(+), 3 deletions(-)
>  create mode 100644 src/shared/shell-ell.c
>
> diff --git a/Makefile.am b/Makefile.am
> index 9d25a815b..0ce3048ad 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -187,9 +187,6 @@ shared_sources = src/shared/io.h src/shared/timeout.h \
>                         src/shared/log.h src/shared/log.c \
>                         src/shared/tty.h
>
> -if READLINE
> -shared_sources += src/shared/shell.c src/shared/shell.h
> -endif
>
>  src_libshared_glib_la_SOURCES = $(shared_sources) \
>                                 src/shared/io-glib.c \
> @@ -205,11 +202,21 @@ src_libshared_mainloop_la_SOURCES = $(shared_sources) \
>                                 src/shared/mainloop-notify.h \
>                                 src/shared/mainloop-notify.c
>
> +if READLINE
> +shared_sources += src/shared/shell.h
> +src_libshared_glib_la_SOURCES += src/shared/shell.c
> +src_libshared_mainloop_la_SOURCES += src/shared/shell.c
> +endif
> +
>  if LIBSHARED_ELL
>  noinst_LTLIBRARIES += src/libshared-ell.la
>
>  src_libshared_ell_la_SOURCES = $(shared_sources) \
>                                 src/shared/io-ell.c
> +
> +if READLINE
> +src_libshared_ell_la_SOURCES += src/shared/shell-ell.c
> +endif
>  endif
>
>  attrib_sources = attrib/att.h attrib/att-database.h attrib/att.c \
> diff --git a/src/shared/shell-ell.c b/src/shared/shell-ell.c
> new file mode 100644
> index 000000000..1b481e04e
> --- /dev/null
> +++ b/src/shared/shell-ell.c
> @@ -0,0 +1,1320 @@
> +/*
> + *
> + *  BlueZ - Bluetooth protocol stack for Linux
> + *
> + *  Copyright (C) 2017-2019  Intel Corporation. All rights reserved.
> + *
> + *
> + *  This library is free software; you can redistribute it and/or
> + *  modify it under the terms of the GNU Lesser General Public
> + *  License as published by the Free Software Foundation; either
> + *  version 2.1 of the License, or (at your option) any later version.
> + *
> + *  This library is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + *  Lesser General Public License for more details.
> + *
> + */
> +
> +#ifdef HAVE_CONFIG_H
> +#include <config.h>
> +#endif
> +
> +#define _GNU_SOURCE
> +#include <stdio.h>
> +#include <errno.h>
> +#include <syslog.h>
> +#include <unistd.h>
> +#include <stdlib.h>
> +#include <stdarg.h>
> +#include <stdbool.h>
> +#include <signal.h>
> +#include <sys/signalfd.h>
> +#include <wordexp.h>
> +#include <getopt.h>
> +
> +#include <readline/readline.h>
> +#include <readline/history.h>
> +
> +#include "ell/ell.h"
> +
> +#include "src/shared/util.h"
> +#include "src/shared/log.h"
> +#include "src/shared/shell.h"
> +
> +#define CMD_LENGTH     48
> +#define print_text(color, fmt, args...) \
> +               printf(color fmt COLOR_OFF "\n", ## args)
> +#define print_menu(cmd, args, desc) \
> +               printf(COLOR_HIGHLIGHT "%s %-*s " COLOR_OFF "%s\n", \
> +                       cmd, (int)(CMD_LENGTH - strlen(cmd)), args, desc)
> +#define print_submenu(cmd, desc) \
> +               printf(COLOR_BLUE "%s %-*s " COLOR_OFF "%s\n", \
> +                       cmd, (int)(CMD_LENGTH - strlen(cmd)), "", desc)
> +
> +struct bt_shell_env {
> +       char *name;
> +       void *value;
> +};
> +
> +static char *cmplt = "help";
> +
> +struct bt_shell_prompt_input {
> +       char *str;
> +       bt_shell_prompt_input_func func;
> +       void *user_data;
> +};
> +
> +static struct {
> +       bool init;
> +       char *name;
> +       char history[256];
> +       int argc;
> +       char **argv;
> +       bool mode;
> +       bool monitor;
> +       int timeout;
> +       struct l_io *input;
> +
> +       bool saved_prompt;
> +       bt_shell_prompt_input_func saved_func;
> +       void *saved_user_data;
> +
> +       struct l_queue *prompts;
> +
> +       const struct bt_shell_menu *menu;
> +       const struct bt_shell_menu *main;
> +       struct l_queue *submenus;
> +       const struct bt_shell_menu_entry *exec;
> +
> +       struct l_queue *envs;
> +} data;
> +
> +static void shell_print_menu(void);
> +
> +static void cmd_version(int argc, char *argv[])
> +{
> +       bt_shell_printf("Version %s\n", VERSION);
> +
> +       return bt_shell_noninteractive_quit(EXIT_SUCCESS);
> +}
> +
> +static void cmd_quit(int argc, char *argv[])
> +{
> +       l_main_quit();
> +}
> +
> +static void print_cmds(void)
> +{
> +       const struct bt_shell_menu_entry *entry;
> +       const struct l_queue_entry *submenu;
> +
> +       if (!data.menu)
> +               return;
> +
> +       printf("Commands:\n");
> +
> +       for (entry = data.menu->entries; entry->cmd; entry++) {
> +               printf("\t%s%s\t%s\n", entry->cmd,
> +                       strlen(entry->cmd) < 8 ? "\t" : "", entry->desc);
> +       }
> +
> +       for (submenu = l_queue_get_entries(data.submenus); submenu;
> +                                       submenu = submenu->next) {
> +               struct bt_shell_menu *menu = submenu->data;
> +
> +               printf("\n\t%s.:\n", menu->name);
> +
> +               for (entry = menu->entries; entry->cmd; entry++) {
> +                       printf("\t\t%s%s\t%s\n", entry->cmd,
> +                               strlen(entry->cmd) < 8 ? "\t" : "",
> +                               entry->desc);
> +               }
> +       }
> +}
> +
> +static void cmd_help(int argc, char *argv[])
> +{
> +       if (argv[0] == cmplt)
> +               print_cmds();
> +       else
> +               shell_print_menu();
> +
> +       return bt_shell_noninteractive_quit(EXIT_SUCCESS);
> +}
> +
> +static const struct bt_shell_menu *find_menu(const char *name, size_t len)
> +{
> +       const struct l_queue_entry *entry;
> +
> +       for (entry = l_queue_get_entries(data.submenus); entry;
> +                                               entry = entry->next) {
> +               struct bt_shell_menu *menu = entry->data;
> +
> +               if (!strncmp(menu->name, name, len))
> +                       return menu;
> +       }
> +
> +       return NULL;
> +}
> +
> +static char *menu_generator(const char *text, int state)
> +{
> +       static unsigned int index, len;
> +       static struct l_queue_entry *entry;
> +
> +       if (!state) {
> +               index = 0;
> +               len = strlen(text);
> +               entry = (void *) l_queue_get_entries(data.submenus);
> +       }
> +
> +       for (; entry; entry = entry->next) {
> +               struct bt_shell_menu *menu = entry->data;
> +
> +               index++;
> +
> +               if (!strncmp(menu->name, text, len)) {
> +                       entry = entry->next;
> +                       return strdup(menu->name);
> +               }
> +       }
> +
> +       return NULL;
> +}
> +
> +static void cmd_menu(int argc, char *argv[])
> +{
> +       const struct bt_shell_menu *menu;
> +
> +       if (argc < 2 || !strlen(argv[1])) {
> +               bt_shell_printf("Missing name argument\n");
> +               return bt_shell_noninteractive_quit(EXIT_FAILURE);
> +       }
> +
> +       menu = find_menu(argv[1], strlen(argv[1]));
> +       if (!menu) {
> +               bt_shell_printf("Unable find menu with name: %s\n", argv[1]);
> +               return bt_shell_noninteractive_quit(EXIT_FAILURE);
> +       }
> +
> +       bt_shell_set_menu(menu);
> +
> +       shell_print_menu();
> +
> +       return bt_shell_noninteractive_quit(EXIT_SUCCESS);
> +}
> +
> +static bool cmd_menu_exists(const struct bt_shell_menu *menu)
> +{
> +       /* Skip menu command if not on main menu or if there are no
> +        * submenus.
> +        */
> +       if (menu != data.main || l_queue_isempty(data.submenus))
> +               return false;
> +
> +       return true;
> +}
> +
> +static void cmd_back(int argc, char *argv[])
> +{
> +       if (data.menu == data.main) {
> +               bt_shell_printf("Already on main menu\n");
> +               return;
> +       }
> +
> +       bt_shell_set_menu(data.main);
> +
> +       shell_print_menu();
> +}
> +
> +static bool cmd_back_exists(const struct bt_shell_menu *menu)
> +{
> +       /* Skip back command if on main menu */
> +       if (menu == data.main)
> +               return false;
> +
> +       return true;
> +}
> +
> +static void cmd_export(int argc, char *argv[])
> +{
> +       const struct l_queue_entry *entry;
> +
> +       entry = l_queue_get_entries(data.envs);
> +
> +       for (; entry; entry = entry->next) {
> +               struct bt_shell_env *env = entry->data;
> +
> +               print_text(COLOR_HIGHLIGHT, "%s=%p", env->name, env->value);
> +       }
> +}
> +
> +static const struct bt_shell_menu_entry default_menu[] = {
> +       { "back",         NULL,       cmd_back, "Return to main menu", NULL,
> +                                                       NULL, cmd_back_exists },
> +       { "menu",         "<name>",   cmd_menu, "Select submenu",
> +                                                       menu_generator, NULL,
> +                                                       cmd_menu_exists},
> +       { "version",      NULL,       cmd_version, "Display version" },
> +       { "quit",         NULL,       cmd_quit, "Quit program" },
> +       { "exit",         NULL,       cmd_quit, "Quit program" },
> +       { "help",         NULL,       cmd_help,
> +                                       "Display help about this program" },
> +       { "export",       NULL,       cmd_export,
> +                                               "Print evironment variables" },
> +       { }
> +};
> +
> +static void shell_print_help(void)
> +{
> +       print_text(COLOR_HIGHLIGHT,
> +               "\n"
> +               "Use \"help\" for a list of available commands in a menu.\n"
> +               "Use \"menu <submenu>\" if you want to enter any submenu.\n"
> +               "Use \"back\" if you want to return to menu main.");
> +}
> +
> +static void shell_print_menu(void)
> +{
> +       const struct bt_shell_menu_entry *entry;
> +       const struct l_queue_entry *submenu;
> +
> +       if (!data.menu)
> +               return;
> +
> +       print_text(COLOR_HIGHLIGHT, "Menu %s:", data.menu->name);
> +       print_text(COLOR_HIGHLIGHT, "Available commands:");
> +       print_text(COLOR_HIGHLIGHT, "-------------------");
> +
> +       if (data.menu == data.main) {
> +               for (submenu = l_queue_get_entries(data.submenus); submenu;
> +                                               submenu = submenu->next) {
> +                       struct bt_shell_menu *menu = submenu->data;
> +
> +                       print_submenu(menu->name, menu->desc ? menu->desc :
> +                                                               "Submenu");
> +               }
> +       }
> +
> +       for (entry = data.menu->entries; entry->cmd; entry++)
> +               print_menu(entry->cmd, entry->arg ? : "", entry->desc ? : "");
> +
> +       for (entry = default_menu; entry->cmd; entry++) {
> +               if (entry->exists && !entry->exists(data.menu))
> +                       continue;
> +
> +               print_menu(entry->cmd, entry->arg ? : "", entry->desc ? : "");
> +       }
> +}
> +
> +static int parse_args(char *arg, wordexp_t *w, char *del, int flags)
> +{
> +       char *str;
> +
> +       str = strdelimit(arg, del, '"');
> +
> +       if (wordexp(str, w, flags)) {
> +               free(str);
> +               return -EINVAL;
> +       }
> +
> +       /* If argument ends with ... set we_offs bypass strict checks */
> +       if (w->we_wordc && !strsuffix(w->we_wordv[w->we_wordc - 1], "..."))
> +               w->we_offs = 1;
> +
> +       free(str);
> +
> +       return 0;
> +}
> +
> +static int cmd_exec(const struct bt_shell_menu_entry *entry,
> +                                       int argc, char *argv[])
> +{
> +       wordexp_t w;
> +       size_t len;
> +       char *man, *opt;
> +       int flags = WRDE_NOCMD;
> +       bool optargs = false;
> +
> +       if (!entry->arg || entry->arg[0] == '\0') {
> +               if (argc > 1) {
> +                       print_text(COLOR_HIGHLIGHT, "Too many arguments");
> +                       return -EINVAL;
> +               }
> +               goto exec;
> +       }
> +
> +       /* Find last mandatory arguments */
> +       man = strrchr(entry->arg, '>');
> +       if (!man) {
> +               opt = strdup(entry->arg);
> +               goto optional;
> +       }
> +
> +       len = man - entry->arg;
> +       if (entry->arg[0] == '<')
> +               man = strndup(entry->arg, len + 1);
> +       else {
> +               /* Find where mandatory arguments start */
> +               opt = strrchr(entry->arg, '<');
> +               /* Skip if mandatory arguments are not in the right format */
> +               if (!opt || opt > man) {
> +                       opt = strdup(entry->arg);
> +                       goto optional;
> +               }
> +               man = strndup(opt, man - opt + 1);
> +               optargs = true;
> +       }
> +
> +       if (parse_args(man, &w, "<>", flags) < 0) {
> +               print_text(COLOR_HIGHLIGHT,
> +                       "Unable to parse mandatory command arguments: %s", man);
> +               free(man);
> +               return -EINVAL;
> +       }
> +
> +       free(man);
> +
> +       /* Check if there are enough arguments */
> +       if ((unsigned int) argc - 1 < w.we_wordc) {
> +               print_text(COLOR_HIGHLIGHT, "Missing %s argument",
> +                                               w.we_wordv[argc - 1]);
> +               goto fail;
> +       }
> +
> +       flags |= WRDE_APPEND;
> +       opt = strdup(entry->arg + len + 1);
> +
> +optional:
> +       if (parse_args(opt, &w, "[]", flags) < 0) {
> +               print_text(COLOR_HIGHLIGHT,
> +                       "Unable to parse optional command arguments: %s", opt);
> +               free(opt);
> +               return -EINVAL;
> +       }
> +
> +       free(opt);
> +
> +       /* Check if there are too many arguments */
> +       if (!optargs && ((unsigned int) argc - 1 > w.we_wordc && !w.we_offs)) {
> +               print_text(COLOR_HIGHLIGHT, "Too many arguments: %d > %zu",
> +                                       argc - 1, w.we_wordc);
> +               goto fail;
> +       }
> +
> +       w.we_offs = 0;
> +       wordfree(&w);
> +
> +exec:
> +       data.exec = entry;
> +
> +       if (entry->func)
> +               entry->func(argc, argv);
> +
> +       data.exec = NULL;
> +
> +       return 0;
> +
> +fail:
> +       w.we_offs = 0;
> +       wordfree(&w);
> +       return -EINVAL;
> +}
> +
> +static int menu_exec(const struct bt_shell_menu_entry *entry,
> +                                       int argc, char *argv[])
> +{
> +       for (; entry->cmd; entry++) {
> +               if (strcmp(argv[0], entry->cmd))
> +                       continue;
> +
> +               /* Skip menu command if not on main menu */
> +               if (data.menu != data.main && !strcmp(entry->cmd, "menu"))
> +                       continue;
> +
> +               /* Skip back command if on main menu */
> +               if (data.menu == data.main && !strcmp(entry->cmd, "back"))
> +                       continue;
> +
> +               return cmd_exec(entry, argc, argv);
> +       }
> +
> +       return -ENOENT;
> +}
> +
> +static int submenu_exec(int argc, char *argv[])
> +{
> +       char *name;
> +       int len, tlen;
> +       const struct bt_shell_menu *submenu;
> +
> +       if (data.menu != data.main)
> +               return -ENOENT;
> +
> +       name = strchr(argv[0], '.');
> +       if (!name)
> +               return -ENOENT;
> +
> +       tlen = strlen(argv[0]);
> +       len = name - argv[0];
> +       name[0] = '\0';
> +
> +       submenu = find_menu(argv[0], strlen(argv[0]));
> +       if (!submenu)
> +               return -ENOENT;
> +
> +       /* Replace submenu.command with command */
> +       memmove(argv[0], argv[0] + len + 1, tlen - len - 1);
> +       memset(argv[0] + tlen - len - 1, 0, len + 1);
> +
> +       return menu_exec(submenu->entries, argc, argv);
> +}
> +
> +static int shell_exec(int argc, char *argv[])
> +{
> +       int err;
> +
> +       if (!data.menu || !argv[0])
> +               return -EINVAL;
> +
> +       err  = menu_exec(default_menu, argc, argv);
> +       if (err == -ENOENT) {
> +               err  = menu_exec(data.menu->entries, argc, argv);
> +               if (err == -ENOENT) {
> +                       err = submenu_exec(argc, argv);
> +                       if (err == -ENOENT) {
> +                               print_text(COLOR_HIGHLIGHT,
> +                                       "Invalid command in menu %s: %s",
> +                                       data.menu->name, argv[0]);
> +                               shell_print_help();
> +                       }
> +               }
> +       }
> +
> +       return err;
> +}
> +
> +void bt_shell_printf(const char *fmt, ...)
> +{
> +       va_list args;
> +       bool save_input;
> +       char *saved_line;
> +       int saved_point;
> +
> +       if (!data.input)
> +               return;
> +
> +       if (data.mode) {
> +               va_start(args, fmt);
> +               vprintf(fmt, args);
> +               va_end(args);
> +               return;
> +       }
> +
> +       save_input = !RL_ISSTATE(RL_STATE_DONE);
> +
> +       if (save_input) {
> +               saved_point = rl_point;
> +               saved_line = rl_copy_text(0, rl_end);
> +               if (!data.saved_prompt)
> +                       rl_save_prompt();
> +               rl_replace_line("", 0);
> +               rl_redisplay();
> +       }
> +
> +       va_start(args, fmt);
> +       vprintf(fmt, args);
> +       va_end(args);
> +
> +       if (data.monitor) {
> +               va_start(args, fmt);
> +               bt_log_vprintf(0xffff, data.name, LOG_INFO, fmt, args);
> +               va_end(args);
> +       }
> +
> +       if (save_input) {
> +               if (!data.saved_prompt)
> +                       rl_restore_prompt();
> +               rl_replace_line(saved_line, 0);
> +               rl_point = saved_point;
> +               rl_forced_update_display();
> +               free(saved_line);
> +       }
> +}
> +
> +static void print_string(const char *str, void *user_data)
> +{
> +       bt_shell_printf("%s\n", str);
> +}
> +
> +void bt_shell_hexdump(const unsigned char *buf, size_t len)
> +{
> +       util_hexdump(' ', buf, len, print_string, NULL);
> +}
> +
> +void bt_shell_usage(void)
> +{
> +       if (!data.exec)
> +               return;
> +
> +       bt_shell_printf("Usage: %s %s\n", data.exec->cmd,
> +                                       data.exec->arg ? data.exec->arg : "");
> +}
> +
> +static void prompt_input(const char *str, bt_shell_prompt_input_func func,
> +                                                       void *user_data)
> +{
> +       data.saved_prompt = true;
> +       data.saved_func = func;
> +       data.saved_user_data = user_data;
> +
> +       rl_save_prompt();
> +       bt_shell_set_prompt(str);
> +}
> +
> +void bt_shell_prompt_input(const char *label, const char *msg,
> +                       bt_shell_prompt_input_func func, void *user_data)
> +{
> +       char *str;
> +
> +       if (!data.init || data.mode)
> +               return;
> +
> +       if (data.saved_prompt) {
> +               struct bt_shell_prompt_input *prompt;
> +
> +               prompt = l_new(struct bt_shell_prompt_input, 1);
> +
> +               if (asprintf(&str, COLOR_HIGHLIGHT "[%s] %s " COLOR_OFF, label,
> +                                                               msg) < 0) {
> +                       free(prompt);
> +                       return;
> +               }
> +
> +               prompt->func = func;
> +               prompt->user_data = user_data;
> +
> +               l_queue_push_tail(data.prompts, prompt);
> +
> +               return;
> +       }
> +
> +       if (asprintf(&str, COLOR_HIGHLIGHT "[%s] %s " COLOR_OFF, label,
> +                                                               msg) < 0)
> +               return;
> +
> +       prompt_input(str, func, user_data);
> +
> +       free(str);
> +}
> +
> +static void prompt_free(void *data)
> +{
> +       struct bt_shell_prompt_input *prompt = data;
> +
> +       free(prompt->str);
> +       free(prompt);
> +}
> +
> +int bt_shell_release_prompt(const char *input)
> +{
> +       struct bt_shell_prompt_input *prompt;
> +       bt_shell_prompt_input_func func;
> +       void *user_data;
> +
> +       if (!data.saved_prompt)
> +               return -1;
> +
> +       data.saved_prompt = false;
> +
> +       rl_restore_prompt();
> +
> +       func = data.saved_func;
> +       user_data = data.saved_user_data;
> +
> +       prompt = l_queue_pop_head(data.prompts);
> +       if (prompt)
> +               data.saved_prompt = true;
> +
> +       data.saved_func = NULL;
> +       data.saved_user_data = NULL;
> +
> +       func(input, user_data);
> +
> +       if (prompt) {
> +               prompt_input(prompt->str, prompt->func, prompt->user_data);
> +               prompt_free(prompt);
> +       }
> +
> +       return 0;
> +}
> +
> +static void rl_handler(char *input)
> +{
> +       wordexp_t w;
> +
> +       if (!input) {
> +               rl_insert_text("quit");
> +               rl_redisplay();
> +               rl_crlf();
> +               l_main_quit();
> +               return;
> +       }
> +
> +       if (!strlen(input))
> +               goto done;
> +
> +       if (!bt_shell_release_prompt(input))
> +               goto done;
> +
> +       if (history_search(input, -1))
> +               add_history(input);
> +
> +       if (data.monitor)
> +               bt_log_printf(0xffff, data.name, LOG_INFO, "%s", input);
> +
> +       if (wordexp(input, &w, WRDE_NOCMD))
> +               goto done;
> +
> +       if (w.we_wordc == 0) {
> +               wordfree(&w);
> +               goto done;
> +       }
> +
> +       shell_exec(w.we_wordc, w.we_wordv);
> +       wordfree(&w);
> +done:
> +       free(input);
> +}
> +
> +static char *find_cmd(const char *text,
> +                       const struct bt_shell_menu_entry *entry, int *index)
> +{
> +       const struct bt_shell_menu_entry *tmp;
> +       int len;
> +
> +       len = strlen(text);
> +
> +       while ((tmp = &entry[*index])) {
> +               (*index)++;
> +
> +               if (!tmp->cmd)
> +                       break;
> +
> +               if (tmp->exists && !tmp->exists(data.menu))
> +                       continue;
> +
> +               if (!strncmp(tmp->cmd, text, len))
> +                       return strdup(tmp->cmd);
> +       }
> +
> +       return NULL;
> +}
> +
> +static char *cmd_generator(const char *text, int state)
> +{
> +       static int index;
> +       static bool default_menu_enabled, submenu_enabled;
> +       static const struct bt_shell_menu *menu;
> +       char *cmd;
> +
> +       if (!state) {
> +               index = 0;
> +               menu = NULL;
> +               default_menu_enabled = true;
> +               submenu_enabled = false;
> +       }
> +
> +       if (default_menu_enabled) {
> +               cmd = find_cmd(text, default_menu, &index);
> +               if (cmd)
> +                       return cmd;
> +
> +               index = 0;
> +               menu = data.menu;
> +               default_menu_enabled = false;
> +       }
> +
> +       if (!submenu_enabled) {
> +               cmd = find_cmd(text, menu->entries, &index);
> +               if (cmd || menu != data.main)
> +                       return cmd;
> +
> +               cmd = strrchr(text, '.');
> +               if (!cmd)
> +                       return NULL;
> +
> +               menu = find_menu(text, cmd - text);
> +               if (!menu)
> +                       return NULL;
> +
> +               index = 0;
> +               submenu_enabled = true;
> +       }
> +
> +       cmd = find_cmd(text + strlen(menu->name) + 1, menu->entries, &index);
> +       if (cmd) {
> +               int err;
> +               char *tmp;
> +
> +               err = asprintf(&tmp, "%s.%s", menu->name, cmd);
> +
> +               free(cmd);
> +
> +               if (err < 0)
> +                       return NULL;
> +
> +               cmd = tmp;
> +       }
> +
> +       return cmd;
> +}
> +
> +static wordexp_t args;
> +
> +static char *arg_generator(const char *text, int state)
> +{
> +       static unsigned int index, len;
> +       const char *arg;
> +
> +       if (!state) {
> +               index = 0;
> +               len = strlen(text);
> +       }
> +
> +       while (index < args.we_wordc) {
> +               arg = args.we_wordv[index];
> +               index++;
> +
> +               if (!strncmp(arg, text, len))
> +                       return strdup(arg);
> +       }
> +
> +       return NULL;
> +}
> +
> +static char **args_completion(const struct bt_shell_menu_entry *entry, int argc,
> +                                                       const char *text)
> +{
> +       char **matches = NULL;
> +       char *str;
> +       int index;
> +
> +       index = text[0] == '\0' ? argc - 1 : argc - 2;
> +       if (index < 0)
> +               return NULL;
> +
> +       if (!entry->arg)
> +               goto end;
> +
> +       str = strdup(entry->arg);
> +
> +       if (parse_args(str, &args, "<>[]", WRDE_NOCMD))
> +               goto done;
> +
> +       /* Check if argument is valid */
> +       if ((unsigned int) index > args.we_wordc - 1)
> +               goto done;
> +
> +       /* Check if there are multiple values */
> +       if (!strrchr(entry->arg, '/'))
> +               goto done;
> +
> +       free(str);
> +
> +       /* Split values separated by / */
> +       str = strdelimit(args.we_wordv[index], "/", ' ');
> +
> +       args.we_offs = 0;
> +       wordfree(&args);
> +
> +       if (wordexp(str, &args, WRDE_NOCMD))
> +               goto done;
> +
> +       rl_completion_display_matches_hook = NULL;
> +       matches = rl_completion_matches(text, arg_generator);
> +
> +done:
> +       free(str);
> +end:
> +       if (!matches && text[0] == '\0')
> +               bt_shell_printf("Usage: %s %s\n", entry->cmd,
> +                                       entry->arg ? entry->arg : "");
> +
> +       args.we_offs = 0;
> +       wordfree(&args);
> +       return matches;
> +}
> +
> +static char **menu_completion(const struct bt_shell_menu_entry *entry,
> +                               const char *text, int argc, char *input_cmd)
> +{
> +       char **matches = NULL;
> +
> +       for (; entry->cmd; entry++) {
> +               if (strcmp(entry->cmd, input_cmd))
> +                       continue;
> +
> +               if (!entry->gen) {
> +                       matches = args_completion(entry, argc, text);
> +                       break;
> +               }
> +
> +               rl_completion_display_matches_hook = entry->disp;
> +               matches = rl_completion_matches(text, entry->gen);
> +               break;
> +       }
> +
> +       return matches;
> +}
> +
> +static char **shell_completion(const char *text, int start, int end)
> +{
> +       char **matches = NULL;
> +
> +       if (!data.menu)
> +               return NULL;
> +
> +       if (start > 0) {
> +               wordexp_t w;
> +
> +               if (wordexp(rl_line_buffer, &w, WRDE_NOCMD))
> +                       return NULL;
> +
> +               matches = menu_completion(default_menu, text, w.we_wordc,
> +                                                       w.we_wordv[0]);
> +               if (!matches)
> +                       matches = menu_completion(data.menu->entries, text,
> +                                                       w.we_wordc,
> +                                                       w.we_wordv[0]);
> +
> +               wordfree(&w);
> +       } else {
> +               rl_completion_display_matches_hook = NULL;
> +               matches = rl_completion_matches(text, cmd_generator);
> +       }
> +
> +       if (!matches)
> +               rl_attempted_completion_over = 1;
> +
> +       return matches;
> +}
> +
> +static void io_hup(struct l_io *io, void *user_data)
> +{
> +       l_main_quit();
> +}
> +
> +static void signal_callback(unsigned int signum, void *user_data)
> +{
> +       static bool terminated;
> +
> +       switch (signum) {
> +       case SIGINT:
> +               if (data.input && !data.mode) {
> +                       rl_replace_line("", 0);
> +                       rl_crlf();
> +                       rl_on_new_line();
> +                       rl_redisplay();
> +                       return;
> +               }
> +
> +               /*
> +                * If input was not yet setup up that means signal was received
> +                * while daemon was not yet running. Since user is not able
> +                * to terminate client by CTRL-D or typing exit treat this as
> +                * exit and fall through.
> +                */
> +
> +               /* fall through */
> +       case SIGTERM:
> +               if (!terminated) {
> +                       if (!data.mode) {
> +                               rl_replace_line("", 0);
> +                               rl_crlf();
> +                       }
> +                       l_main_quit();
> +               }
> +
> +               terminated = true;
> +               break;
> +       }
> +}
> +
> +static void rl_init_history(void)
> +{
> +       const char *name;
> +       char *dir;
> +
> +       memset(data.history, 0, sizeof(data.history));
> +
> +       name = strrchr(data.name, '/');
> +       if (!name)
> +               name = data.name;
> +       else
> +               name++;
> +
> +       dir = getenv("XDG_CACHE_HOME");
> +       if (dir) {
> +               snprintf(data.history, sizeof(data.history), "%s/.%s_history",
> +                                                       dir, name);
> +               goto done;
> +       }
> +
> +       dir = getenv("HOME");
> +       if (dir) {
> +               snprintf(data.history, sizeof(data.history),
> +                               "%s/.cache/.%s_history", dir, name);
> +               goto done;
> +       }
> +
> +       dir = getenv("PWD");
> +       if (dir) {
> +               snprintf(data.history, sizeof(data.history), "%s/.%s_history",
> +                                                       dir, name);
> +               goto done;
> +       }
> +
> +       return;
> +
> +done:
> +       read_history(data.history);
> +       using_history();
> +       bt_shell_set_env("HISTORY", data.history);
> +}
> +
> +static void rl_init(void)
> +{
> +       if (data.mode)
> +               return;
> +
> +       /* Allow conditional parsing of the ~/.inputrc file. */
> +       rl_readline_name = data.name;
> +
> +       setlinebuf(stdout);
> +       rl_attempted_completion_function = shell_completion;
> +
> +       rl_erase_empty_line = 1;
> +       rl_callback_handler_install(NULL, rl_handler);
> +
> +       rl_init_history();
> +}
> +
> +static const struct option main_options[] = {
> +       { "version",    no_argument, 0, 'v' },
> +       { "help",       no_argument, 0, 'h' },
> +       { "timeout",    required_argument, 0, 't' },
> +       { "monitor",    no_argument, 0, 'm' },
> +};
> +
> +static void usage(int argc, char **argv, const struct bt_shell_opt *opt)
> +{
> +       unsigned int i;
> +
> +       printf("%s ver %s\n", data.name, VERSION);
> +       printf("Usage:\n"
> +               "\t%s [--options] [commands]\n", data.name);
> +
> +       printf("Options:\n");
> +
> +       for (i = 0; opt && opt->options[i].name; i++)
> +               printf("\t--%s \t%s\n", opt->options[i].name, opt->help[i]);
> +
> +       printf("\t--monitor \tEnable monitor output\n"
> +               "\t--timeout \tTimeout in seconds for non-interactive mode\n"
> +               "\t--version \tDisplay version\n"
> +               "\t--help \t\tDisplay help\n");
> +}
> +
> +void bt_shell_init(int argc, char **argv, const struct bt_shell_opt *opt)
> +{
> +       int c, index = -1;
> +       struct option options[256];
> +       char optstr[256];
> +       size_t offset;
> +
> +       offset = sizeof(main_options) / sizeof(struct option);
> +
> +       memcpy(options, main_options, sizeof(struct option) * offset);
> +
> +       if (opt) {
> +               memcpy(options + offset, opt->options,
> +                               sizeof(struct option) * opt->optno);
> +               snprintf(optstr, sizeof(optstr), "+mhvt:%s", opt->optstr);
> +       } else
> +               snprintf(optstr, sizeof(optstr), "+mhvt:");
> +
> +       data.name = strrchr(argv[0], '/');
> +       if (!data.name)
> +               data.name = strdup(argv[0]);
> +       else
> +               data.name = strdup(++data.name);
> +
> +       while ((c = getopt_long(argc, argv, optstr, options, &index)) != -1) {
> +               switch (c) {
> +               case 'v':
> +                       printf("%s: %s\n", data.name, VERSION);
> +                       exit(EXIT_SUCCESS);
> +                       return;
> +               case 'h':
> +                       usage(argc, argv, opt);
> +                       data.argc = 1;
> +                       data.argv = &cmplt;
> +                       data.mode = 1;
> +                       goto done;
> +               case 't':
> +                       data.timeout = atoi(optarg);
> +                       break;
> +               case 'm':
> +                       data.monitor = true;
> +                       if (bt_log_open() < 0) {
> +                               data.monitor = false;
> +                               printf("Unable to open logging channel\n");
> +                       }
> +                       break;
> +               default:
> +                       if (index < 0) {
> +                               for (index = 0; options[index].val; index++) {
> +                                       if (c == options[index].val)
> +                                               break;
> +                               }
> +                       }
> +
> +                       if (c != opt->options[index - offset].val) {
> +                               usage(argc, argv, opt);
> +                               exit(EXIT_SUCCESS);
> +                               return;
> +                       }
> +
> +                       *opt->optarg[index - offset] = optarg;
> +               }
> +
> +               index = -1;
> +       }
> +
> +       bt_shell_set_env("SHELL", data.name);
> +
> +       data.argc = argc - optind;
> +       data.argv = argv + optind;
> +       optind = 0;
> +       data.mode = (data.argc > 0);
> +
> +done:
> +       if (data.mode)
> +               bt_shell_set_env("NON_INTERACTIVE", &data.mode);
> +
> +       l_main_init();
> +
> +       rl_init();
> +
> +       data.init = true;
> +       data.prompts = l_queue_new();
> +}
> +
> +static void rl_cleanup(void)
> +{
> +       if (data.mode)
> +               return;
> +
> +       if (data.history[0] != '\0')
> +               write_history(data.history);
> +
> +       rl_message("");
> +       rl_callback_handler_remove();
> +}
> +
> +static void env_destroy(void *data)
> +{
> +       struct bt_shell_env *env = data;
> +
> +       free(env->name);
> +       free(env);
> +}
> +
> +int bt_shell_run(void)
> +{
> +       int status;
> +
> +       status = l_main_run_with_signal(signal_callback, NULL);
> +
> +       bt_shell_cleanup();
> +
> +       l_main_exit();
> +
> +       return status;
> +}
> +
> +void bt_shell_cleanup(void)
> +{
> +       bt_shell_release_prompt("");
> +       bt_shell_detach();
> +
> +       if (data.envs) {
> +               l_queue_destroy(data.envs, env_destroy);
> +               data.envs = NULL;
> +       }
> +
> +       if (data.monitor)
> +               bt_log_close();
> +
> +       rl_cleanup();
> +
> +       l_queue_destroy(data.prompts, prompt_free);
> +       data.prompts = NULL;
> +
> +       data.init = false;
> +       free(data.name);
> +}
> +
> +void bt_shell_quit(int status)
> +{
> +       l_main_quit();
> +}
> +
> +void bt_shell_noninteractive_quit(int status)
> +{
> +       if (!data.mode || data.timeout)
> +               return;
> +
> +       bt_shell_quit(status);
> +}
> +
> +bool bt_shell_set_menu(const struct bt_shell_menu *menu)
> +{
> +       if (!menu)
> +               return false;
> +
> +       data.menu = menu;
> +
> +       if (!data.main)
> +               data.main = menu;
> +
> +       return true;
> +}
> +
> +bool bt_shell_add_submenu(const struct bt_shell_menu *menu)
> +{
> +       if (!menu)
> +               return false;
> +
> +       if (!data.submenus)
> +               data.submenus = l_queue_new();
> +
> +       l_queue_push_tail(data.submenus, (void *) menu);
> +
> +       return true;
> +}
> +
> +void bt_shell_set_prompt(const char *string)
> +{
> +       if (!data.init || data.mode)
> +               return;
> +
> +       rl_set_prompt(string);
> +       rl_redisplay();
> +}
> +
> +static bool input_read(struct l_io *io, void *user_data)
> +{
> +       rl_callback_read_char();
> +       return true;
> +}
> +
> +static void quit_on_timeout(struct l_timeout *timeout, void *user_data)
> +{
> +       l_main_quit();
> +}
> +
> +bool bt_shell_attach(int fd)
> +{
> +       struct l_io *io;
> +
> +       /* TODO: Allow more than one input? */
> +       if (data.input)
> +               return false;
> +
> +       io = l_io_new(fd);
> +
> +       if (!data.mode)
> +               l_io_set_read_handler(io, input_read, NULL, NULL);
> +
> +       l_io_set_disconnect_handler(io, io_hup, NULL, NULL);

There is an io abstraction to implement this, afaik most of the things
here are just copy+paste of shell.c just with a different mainloop and
IO while the io.h and mainloop.h are exactly to abstract these so I
wonder why you took this alternative.

> +       data.input = io;
> +
> +       if (data.mode) {
> +               if (shell_exec(data.argc, data.argv) < 0) {
> +                       bt_shell_noninteractive_quit(EXIT_FAILURE);
> +                       return true;
> +               }
> +
> +
> +               if (data.timeout)
> +                       l_timeout_create(data.timeout, quit_on_timeout, NULL,
> +                                                               NULL);
> +       }
> +
> +       return true;
> +}
> +
> +bool bt_shell_detach(void)
> +{
> +       if (!data.input)
> +               return false;
> +
> +       l_io_destroy(data.input);
> +       data.input = NULL;
> +
> +       return true;
> +}
> +
> +static bool match_env(const void *data, const void *user_data)
> +{
> +       const struct bt_shell_env *env = data;
> +       const char *name = user_data;
> +
> +       return !strcmp(env->name, name);
> +}
> +
> +void bt_shell_set_env(const char *name, void *value)
> +{
> +       struct bt_shell_env *env;
> +
> +       if (!data.envs) {
> +               if (!value)
> +                       return;
> +               data.envs = l_queue_new();
> +               goto done;
> +       }
> +
> +       env = l_queue_remove_if(data.envs, match_env, (void *) name);
> +       if (env)
> +               env_destroy(env);
> +
> +       /* Don't create an env if value is not set */
> +       if (!value)
> +               return;
> +
> +done:
> +       env = l_new(struct bt_shell_env, 1);
> +       env->name = strdup(name);
> +       env->value = value;
> +
> +       l_queue_push_tail(data.envs, env);
> +}
> +
> +void *bt_shell_get_env(const char *name)
> +{
> +       const struct bt_shell_env *env;
> +
> +       if (!data.envs)
> +               return NULL;
> +
> +       env = l_queue_find(data.envs, match_env, name);
> +       if (!env)
> +               return NULL;
> +
> +       return env->value;
> +}
> --
> 2.21.0
>


-- 
Luiz Augusto von Dentz
