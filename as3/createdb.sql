create table Businesses(
	b_id	varchar(50) primary key,
	address varchar(200),
	city	varchar(50),
	reviews_count number(10),
	b_name varchar(200),
	states	varchar(5),
	stars	number(2,1)
);

create table Users(
	u_name varchar(50),
	u_id varchar(50) primary key
);

create table checkins(
	b_id varchar(50),
        checksum number(5),
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade 
);

create table MainCategories(
	b_id varchar(50),
	main_c varchar(50),
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade,
        primary key (b_id, main_c) 
);

create table SubCategories(
	b_id varchar(50),
	sub_c varchar(50),
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade, 
        primary key (b_id, sub_c)
);

create table Attributes(
	b_id varchar(50),
	attr varchar(50),
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade,
        primary key (b_id, attr) 
);

create table BusinessTime(
	b_id varchar(50),
	workingday varchar(25),
        closetime Integer,
        opentime Integer,
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade,
        primary key (b_id, workingday) 
);

create table reviews(
	f_vote	number(5),
	u_vote	number(5),
	c_vote	number(5),
	u_id	varchar(50),
	r_id	varchar(50) primary key,
	stars	number(5),
	b_id	varchar(50),
	v_date	varchar(50),
	text	long,
	foreign key(u_id) REFERENCES Users(u_id) on delete cascade,
	foreign key(b_id) REFERENCES Businesses(b_id) on delete cascade

);

CREATE INDEX indexmainc on MainCategories(main_c);
CREATE INDEX indexmainbid on MainCategories(b_id);
CREATE INDEX indexsubc on SubCategories(sub_c);
CREATE INDEX indexsubbid on SubCategories(b_id);
CREATE INDEX indexattrattr on Attributes(attr);
CREATE INDEX indexattrbid on Attributes(b_id);
CREATE INDEX indexbtwd on BusinessTime(workingday);
CREATE INDEX indexbtop on BusinessTime(opentime);
CREATE INDEX indexbtcl on BusinessTime(closetime);
CREATE INDEX indexbtbid on BusinessTime(b_id);
CREATE INDEX indexbc on Businesses(city);
CREATE INDEX indexbsta on Businesses(states);
CREATE INDEX indexrbid on Reviews(b_id);