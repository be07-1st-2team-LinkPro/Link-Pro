-- 스택 카테고리 테이블
CREATE TABLE IF NOT EXISTS `stack_category` (
    `category_id` INT(11) NOT NULL AUTO_INCREMENT,  -- 카테고리 ID (자동 증가, 기본 키)
    `category_name` VARCHAR(100) NOT NULL,  -- 카테고리 이름 (NULL 불가)
    PRIMARY KEY (`category_id`)  -- 기본 키 설정
);

-- 스택 테이블
CREATE TABLE IF NOT EXISTS `stack` (
    `stack_id` BIGINT(20) NOT NULL AUTO_INCREMENT,  -- 스택 ID (자동 증가, 기본 키)
    `stack_category_id` INT(11) NOT NULL,  -- 스택 카테고리 ID (NULL 불가)
    `stack_name` VARCHAR(100) NOT NULL,  -- 스택 이름 (NULL 불가)
    PRIMARY KEY (`stack_id`),  -- 기본 키 설정
    UNIQUE INDEX `stack_name` (`stack_name` ASC),  -- 스택 이름의 유니크 인덱스
    FOREIGN KEY (`stack_category_id`)  -- 외래 키 설정: 스택 카테고리 ID
    REFERENCES `stack_category` (`category_id`)  -- 참조: 스택 카테고리 테이블의 카테고리 ID
);

 