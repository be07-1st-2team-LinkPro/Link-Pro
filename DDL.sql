CREATE TABLE client
(
    client_id BIGINT primary key auto_increment,
    client_name VARCHAR(30),
    client_nick VARCHAR(30) unique,
    client_email VARCHAR(100) unique,
    client_pw VARCHAR(30) not null,
    client_phone VARCHAR(13) unique,
    client_score decimal(2,1) default 0.0,
    client_cash int default 0,
    client_region_id int,
    foreign key (client_region_id) references region(region_id)
);

create table `order`
(
    order_id BIGINT primary key auto_increment,
    order_client_id bigint,
    order_pro_id bigint,
    order_name varchar(30) not null,
    order_start_date datetime,
    order_end_date datetime,
    order_reside enum('Y', 'N'),
    order_state enum('standby', 'reject', 'accept', 'done') default 'standby',
    order_price int not null,
    foreign key (order_client_id) references client(client_id),
    foreign key (order_pro_id) references pro(pro_id)
);

create table review
(
    review_id bigint primary key auto_increment,
    review_order_id bigint not null,
    review_client_id bigint not null,
    review_pro_id bigint not null,
    review_order_state enum('Accept','Done'),
    review_score int check(review_score<=5),
    review_contents varchar(1000) not null,
    review_created_time datetime default current_timestamp,
    foreign key (review_client_id) references client(client_id),
    foreign key (review_pro_id) references pro(pro_id),
    foreign key (review_order_id) references `order`(order_id)
);

create table client_like_score
(
    c_like_score_id bigint primary key auto_increment,
    c_like_score_client_id bigint not null,
    c_like_score_review_id bigint not null,
    c_like_score int check(c_like_score <= 5),
    foreign key (c_like_score_client_id) references client(client_id),
    foreign key (c_like_score_review_id) references review(review_id)
);

create table pro_like_score
(
    p_like_score_id bigint primary key auto_increment,
    p_like_score_pro_id bigint not null,
    p_like_score_review_id bigint not null,
    p_like_score int check(p_like_score <= 5),
    foreign key (p_like_score_pro_id) references pro(pro_id),
    foreign key (p_like_score_review_id) references review(review_id)
);