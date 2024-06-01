-- 스택 카테고리 테이블
CREATE TABLE IF NOT EXISTS `stack_category` (
    `category_id` INT(11) NOT NULL AUTO_INCREMENT,  -- 카테고리 ID (자동 증가, 기본 키)
    `category_name` VARCHAR(100) NOT NULL,  -- 카테고리 이름 (NULL 불가)
    PRIMARY KEY (`category_id`)  -- 기본 키 설정
);
