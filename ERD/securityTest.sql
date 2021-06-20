DROP TABLE authorities CASCADE CONSTRAINTS;
DROP TABLE users CASCADE CONSTRAINTS;

CREATE TABLE users(
	userid varchar2(50) NOT NULL PRIMARY KEY,
	userpw varchar2(100) NOT NULL,
	username varchar2(50) NOT NULL,
	regdate date DEFAULT SYSDATE,
	updatedate date DEFAULT SYSDATE,
	enabled char(1) DEFAULT '1'
);

CREATE TABLE authorities(
	userid varchar2(50) NOT NULL,
	auth varchar2(50) NOT NULL,
	CONSTRAINT fk_member_auth FOREIGN KEY(userid) REFERENCES users(userid),
	PRIMARY KEY(userid, auth)
);


SELECT u.userid, u.userpw, u.enabled, a.auth
FROM users u, authorities a
WHERE u.userid = a.userid;