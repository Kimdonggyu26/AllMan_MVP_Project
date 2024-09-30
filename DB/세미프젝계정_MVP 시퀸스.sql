CREATE SEQUENCE  "SEQ_USERNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10001 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  회원번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_MOVIENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  영화번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_BOARDNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  게시글번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_REPLYNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  댓글번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_REPORTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  신고번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_ATTACHMENTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  첨부파일 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_REVIEWNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  리뷰번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_FAQNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
-- FAQ번호 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_INQUIRYNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  1대1문의 시퀸스
--------------------------------------------------------
CREATE SEQUENCE  "SEQ_NOTICENO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  공지사항글번호 시퀸스
--------------------------------------------------------

COMMIT;