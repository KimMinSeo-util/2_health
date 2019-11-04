-- [ CREATE ]

--[ HealthBoard ���� ]
drop table healthBoard CASCADE CONSTRAINTS;


CREATE TABLE healthBoard (
postno  NUMBER(5) PRIMARY KEY,      
groupno NUMBER(5) ,                              
grouporder NUMBER(2),                             
depth NUMBER(2),                                  
title VARCHAR2(100),
writer VARCHAR2 (100),
content VARCHAR2 (3000),
reg_date DATE,
count NUMBER(3) DEFAULT 0

);

drop sequence postseq;


 create sequence postseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;


-- [ FileVO ���� ]
DROP TABLE files;

create table files(
fno NUMBER(3) PRIMARY KEY,
postno NUMBER(5) REFERENCES healthBoard(postno) ON DELETE CASCADE,
filename VARCHAR2(200),
fileOriName VARCHAR2(300),
fileurl VARCHAR2(500)
);

DROP SEQUENCE fileseq;

 create sequence fileseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;



-- [ HealthComment ���� ]

drop table healthComment;

CREATE TABLE healthComment(
  commentno NUMBER(3) PRIMARY KEY,
  postno NUMBER(3),
  content VARCHAR2 (1000),
  writer VARCHAR2 (20),
  reg_date DATE
);


drop sequence commentseq;

 create sequence commentseq
 MINVALUE 0
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100;



-- [ INSERT ]
--�� ����
--1
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����1', '�۾���1','����1', SYSDATE);



--2
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����2', '�۾���2','����2', SYSDATE);

--3
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date ) 
values (postseq.nextval, (select nvl(max(groupno),0)+1 from healthBoard), 0, 0, '����3', '�۾���3','����3', SYSDATE);


--�� 1�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE, 0);

--��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);


--��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 1 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 1, 1, 1, '���3', '��۾���3', '��۳���3',SYSDATE);





--�� 2�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE);

--?��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);

--?��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���3', '��۾���3', '��۳���3', SYSDATE);


--?��� ����4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 2 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 2, 1, 1, '���4', '��۾���4', '��۳���4', SYSDATE);


--�� 3�� ���� ���
--��� ����1
--UPDATE
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
--INSERT??
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���1', '��۾���1', '��۳���1', SYSDATE);

--?��� ����2
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���2', '��۾���2', '��۳���2', SYSDATE);

--?��� ����3
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���3', '��۾���3', '��۳���3', SYSDATE);


--?��� ����4
UPDATE healthBoard set grouporder = grouporder + 1, depth = depth +1 WHERE groupno = 3 AND grouporder > 0 ;
INSERT INTO healthBoard(postno, groupno, grouporder, depth, title, writer, content, reg_date)
VALUES (postseq.nextval, 3, 1, 1, '���4', '��۾���4', '��۳���4', SYSDATE);


--����
--�亯�ִ��� Ȯ��
select* from healthboard where groupno = 1 AND grouporder = 2 AND depth =2;

--�亯������ ���� UPDATE
update healthBoard set title = '[ ������ ���Դϴ� ]', writer = null, reg_date = null, count = null where postno= 1;


commit;
