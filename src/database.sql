create database football;
use football;

create table userList (
id int not null auto_increment primary key ,
name varchar(255) not null ,
email varchar(255) not null ,
password varchar(255) not null ,
role varchar(50) not null
);

insert into userList(name, email, password, role) value ('thinh', 'thinh@codegym.vn', '123456', 'admin');
insert into userList(name, email, password, role) value ('phuong', 'phuong@codegym.vn', '123456', 'user');
insert into userList(name, email, password, role) value ('ha', 'ha@codegym.vn', '123456', 'user');

create table userLibrary (
    user_id int,
    footballItem_id int,
    foreign key (user_id) references userList(id)
);

drop table userLibrary;
alter table userLibrary change footballItem_id total_bills int(255);

create table itemList (
    id int not null auto_increment primary key ,
    name varchar(255) not null ,
    category varchar(255) not null ,
    description varchar(1000) not null ,
    price double default null,
    discount double default null,
    imgItem varchar(255) default null
);

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
    ('Barca', 'kit', 'Barca 2010-2011 home kit', 250000, 5, 'view/component/img/kit/barca.png');

UPDATE itemList set price = 47 where id = 1;

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('ManUnited', 'kit', 'MU 2007-2008 home kit', 40, 8, 'view/component/img/kit/mu.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Arsenal', 'kit', 'Arsenal 2003-2004 home kit', 43, 5, 'view/component/img/kit/arsenal.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Bayern', 'kit', 'Bayern 2012-2013 home kit', 40, 5, 'view/component/img/kit/bayern.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Chelsea', 'kit', 'The Blues 2011-2012 home kit', 50, 5, 'view/component/img/kit/chelsea.png');

delete from itemList where id = 5;

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Liverpool', 'kit', 'The Kop 2004-2005 home kit', 47, 5, 'view/component/img/kit/kop.png');



INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Messi', 'shoe', 'adidas shoes of M10', 100, 5, 'view/component/img/shoe/messi.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Cr7', 'shoe', 'nike shoes of Cr7', 98, 4, 'view/component/img/shoe/cr7.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Suarez', 'shoe', 'puma shoes of Suarez', 102, 5, 'view/component/img/shoe/suarez.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Zlatan', 'shoe', 'nike shoes of Ibra', 97, 5, 'view/component/img/shoe/zlatan.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Lewy', 'shoe', 'nike shoes of Lewy', 101, 5, 'view/component/img/shoe/lewy.png');


INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('BarcaBall', 'ball', 'ball with Barca icon', 66, 5, 'view/component/img/ball/ballBarca.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('C1Ball', 'ball', 'ball with C1 icon', 70, 10, 'view/component/img/ball/ballC1.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('ChelseaBall', 'ball', 'ball with Chelsea icon', 69, 8, 'view/component/img/ball/ballChelsea.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('RealBall', 'ball', 'ball with Real icon', 68, 7, 'view/component/img/ball/ballReal.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('FifaBallonDor', 'ball', 'Fifa Ballon Dor of France Football', 70, 5, 'view/component/img/ball/QBV.png');


INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('C1', 'trophy', 'C1 trophy', 30, 5, 'view/component/img/trophy/C1.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('VL', 'trophy', 'VL trophy', 26, 6, 'view/component/img/trophy/VL.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('WorldCup', 'trophy', 'Fifa WC trophy', 35, 3, 'view/component/img/trophy/WC.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('EPL', 'trophy', 'EPL trophy', 29, 5, 'view/component/img/trophy/EPL.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('LaLiga', 'trophy', 'LaLiga trophy', 27, 4, 'view/component/img/trophy/LL.png');



INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Cr7UDW', 'others', 'Quan sip thuong hieu cr7', 10, 5, 'view/component/img/others/UDW.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Scarf', 'others', 'Quan sip thuong hieu cr7', 18, 3, 'view/component/img/others/Scarf.png');

UPDATE itemList set description = 'Khan choang co logo cac doi bong' where id = 23;

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('Key', 'others', 'Keychains with logo of famous teams', 6, 8, 'view/component/img/others/Key.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('TeaCup', 'others', 'Coc uong nuoc', 4, 5, 'view/component/img/others/TeaCup.png');

INSERT INTO itemlist(name, category, description, price, discount, imgItem) VALUES
('MousePad', 'others', 'Mouse pad with logo of famous teams', 5, 5, 'view/component/img/others/MP.png');

