/* =========================
   TABLES
========================= */

CREATE TABLE `admin_menu`
(
    `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `parent_id`  INT(11) NOT NULL DEFAULT 0,
    `order`      INT(11) NOT NULL DEFAULT 0,
    `title`      VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `icon`       VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `uri`        VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `permission` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_operation_log`
(
    `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id`    INT(11) NOT NULL,
    `path`       VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `method`     VARCHAR(10) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `ip`         VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `input`      TEXT COLLATE utf8mb4_unicode_ci         NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY          `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_permissions`
(
    `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `slug`        VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `http_method` VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `http_path`   TEXT COLLATE utf8mb4_unicode_ci,
    `created_at`  TIMESTAMP NULL DEFAULT NULL,
    `updated_at`  TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `admin_permissions_name_unique` (`name`),
    UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_roles`
(
    `id`         INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `slug`       VARCHAR(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `admin_roles_name_unique` (`name`),
    UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_users`
(
    `id`             INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `username`       VARCHAR(190) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password`       VARCHAR(60) COLLATE utf8mb4_unicode_ci  NOT NULL,
    `name`           VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `avatar`         VARCHAR(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`     TIMESTAMP NULL DEFAULT NULL,
    `updated_at`     TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


/* =========================
   PIVOT TABLES
========================= */

CREATE TABLE `admin_role_menu`
(
    `role_id`    INT(11) NOT NULL,
    `menu_id`    INT(11) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    KEY          `admin_role_menu_role_id_menu_id_index` (`role_id`, `menu_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_role_permissions`
(
    `role_id`       INT(11) NOT NULL,
    `permission_id` INT(11) NOT NULL,
    `created_at`    TIMESTAMP NULL DEFAULT NULL,
    `updated_at`    TIMESTAMP NULL DEFAULT NULL,
    KEY             `admin_role_permissions_role_id_permission_id_index` (`role_id`, `permission_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_role_users`
(
    `role_id`    INT(11) NOT NULL,
    `user_id`    INT(11) NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    `updated_at` TIMESTAMP NULL DEFAULT NULL,
    KEY          `admin_role_users_role_id_user_id_index` (`role_id`, `user_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin_user_permissions`
(
    `user_id`       INT(11) NOT NULL,
    `permission_id` INT(11) NOT NULL,
    `created_at`    TIMESTAMP NULL DEFAULT NULL,
    `updated_at`    TIMESTAMP NULL DEFAULT NULL,
    KEY             `admin_user_permissions_user_id_permission_id_index` (`user_id`, `permission_id`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


/* =========================
   OTHER TABLES
========================= */

CREATE TABLE `migrations`
(
    `id`        INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `batch`     INT(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `password_resets`
(
    `email`      VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `token`      VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` TIMESTAMP NULL DEFAULT NULL,
    KEY          `password_resets_email_index` (`email`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `users`
(
    `id`             INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email`          VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password`       VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` VARCHAR(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `username`       VARCHAR(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at`     TIMESTAMP NULL DEFAULT NULL,
    `updated_at`     TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;


/* =========================
   SEED DATA
========================= */

INSERT INTO `admin_menu`
(`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES (1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
       (2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
       (3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
       (4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
       (5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
       (6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
       (7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL);


INSERT INTO `admin_permissions`
(`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES (1, 'All permission', '*', '', '*', NULL, NULL),
       (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
       (3, 'Login', 'auth.login', '', '/auth/login\n/auth/logout', NULL, NULL),
       (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
       (5, 'Auth management', 'auth.management', '',
        '/auth/roles\n/auth/permissions\n/auth/menu\n/auth/logs', NULL, NULL);


INSERT INTO `admin_roles`
    (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES (1, 'Administrator', 'administrator', '2026-01-08 04:08:03', '2026-01-08 04:08:03');


INSERT INTO `admin_users`
(`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES (1, 'admin',
        '$2y$10$RtdtZ6Y4PjdpRxurLauqiu3mrwgvET40pfe7Auy9vWgCKYYwBqI.q',
        'Administrator',
        'images/z7367844709771_46db8018361df8214f75c386d41fe95c.png',
        '171G169ZhDFghmPsge6TLZygoTr9BkO13QndoopwYsKNlmCV3Dbx2vF4H5mL',
        '2026-01-08 04:08:03',
        '2026-01-08 07:04:47');


INSERT INTO `admin_role_menu`
VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_permissions`
VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users`
VALUES (1, 1, NULL, NULL);
