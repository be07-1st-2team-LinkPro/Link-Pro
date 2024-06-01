CREATE TABLE IF NOT EXISTS `stack_category` (
    `category_id` INT(11) NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`category_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `stack` (
    `stack_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `stack_category_id` INT(11) NOT NULL,
    `stack_name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`stack_id`),
    UNIQUE INDEX `stack_name` (`stack_name` ASC) VISIBLE,
    INDEX `stack_category_id_idx` (`stack_category_id` ASC) VISIBLE,
    CONSTRAINT `stack_category_id`
      FOREIGN KEY (`stack_category_id`)
      REFERENCES `project`.`stack_category` (`category_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;

