CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `user_pw` VARCHAR(20) NOT NULL,
    `user_nickname` VARCHAR(20) NOT NULL,
    `profile_image` VARCHAR(100),
    `profile_status` VARCHAR(100),
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `channel_id` INT NOT NULL AUTO_INCREMENT,
    `channel_name` VARCHAR(20) NOT NULL,
    `created_user_id`INT NOT NULL,
    `channel_link` VARCHAR(100) NOT NULL,
    `max_capacity` INT NOT NULL,
    `is_deleted` TINYINT(1) DEFAULT 0 NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`channel_id`),
    FOREIGN KEY (`created_user_id`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `chat_id` INT NOT NULL AUTO_INCREMENT,
    `chat_content` VARCHAR(100) NOT NULL,
    `chat_user` INT NOT NULL,
    `chat_channel` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY  (`chat_id`),
    FOREIGN KEY (`chat_user`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`chat_channel`)
    REFERENCES `channels`(`channel_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `follow_id` INT NOT NULL AUTO_INCREMENT,
    `follower_id` INT NOT NULL,
    `followee_id` INT NOT NULL,
    `follow_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`follow_id`),
    FOREIGN KEY (`follower_id`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee_id`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `block_id` INT NOT NULL AUTO_INCREMENT,
    `blocker_id` INT NOT NULL,
    `blocked_id` INT NOT NULL,
    `block_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (`block_id`),
    FOREIGN KEY (`blocker_id`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_id`)
    REFERENCES `users`(`user_id`) ON DELETE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;