-- 스택 카테고리 삽입
INSERT INTO stack_category(category_name) VALUES ('language');
INSERT INTO stack_category(category_name) VALUES ('framework');
INSERT INTO stack_category(category_name) VALUES ('DB');
INSERT INTO stack_category(category_name) VALUES ('Library');
INSERT INTO stack_category(category_name) VALUES ('OS');

-- 개발언어 데이터 삽입
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'JavaScript');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Java');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Python');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'PHP');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'C#');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'TypeScript');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Swift');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Objective-C');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Go');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'R');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'SQL');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Julia');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Ruby');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'C');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'C++');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Dart');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Kotlin');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Rust');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'Solidity');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'language'), 'XML');

-- 데이터베이스 데이터 삽입
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'MySQL');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'PostgreSQL');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'MariaDB');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Oracle Database');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Microsoft SQL Server');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'MongoDB');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'CouchDB');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Firebase Realtime Database');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Redis');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Cassandra');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'DB'), 'Elasticsearch');

-- 프레임워크 데이터 삽입
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'React');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Angular');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'ASP.NET');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'JSP');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Vue.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Node.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Django');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Express.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'FastAPI');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Flask');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Flutter');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Foundation');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Framework7');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Ionic');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Laminas');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Laravel');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Material-UI');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Materialize');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Next.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Qt');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'ReactNative');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Spring');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Swing');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'WPF');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Xamarin');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Angular JS');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Codelgniter');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'framework'), 'Electron');

-- 라이브러리 데이터 삽입
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Bootstrap');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'jQuery');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Sass');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Bulma');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Material-UI');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Lodash');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'D3.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Chart.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Three.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Ajax');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Axios');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Moment.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Anime.js');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'RxJS');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'Library'), 'Tailwind CSS');

-- 운영체제 데이터 삽입
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'OS'), 'iOS');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'OS'), 'Android');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'OS'), 'Windows');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'OS'), 'macOS');
INSERT INTO stack (stack_category_id, stack_name) 
VALUES ((SELECT category_id FROM stack_category WHERE category_name = 'OS'), 'Linux');
