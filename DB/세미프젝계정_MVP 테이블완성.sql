-----------------해당 계정 내에 존재하는 DB 객체들 삭제하는 PLSQL문------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
------------------------------------------------------------------


CREATE TABLE "USERS" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL UNIQUE,
	"USER_PWD"	VARCHAR2(20)		NOT NULL,
	"PHONE"	VARCHAR2(13)		NOT NULL UNIQUE,
	"EMAIL"	VARCHAR2(50)		NOT NULL UNIQUE,
	"USER_NICKNAME"	VARCHAR2(20)		NOT NULL UNIQUE,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'U'	NOT NULL,
	"TASTE_NO"	NUMBER		NULL,
	"PROFILE_PATH"	VARCHAR2(200)		NULL,
	"TEAM_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "USERS"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "USERS"."USER_ID" IS '회원아이디';

COMMENT ON COLUMN "USERS"."USER_PWD" IS '회원비밀번호';

COMMENT ON COLUMN "USERS"."PHONE" IS '전화번호';

COMMENT ON COLUMN "USERS"."EMAIL" IS '이메일';

COMMENT ON COLUMN "USERS"."USER_NICKNAME" IS '회원닉네임';

COMMENT ON COLUMN "USERS"."ENROLL_DATE" IS '회원가입일';

COMMENT ON COLUMN "USERS"."MODIFY_DATE" IS '회원정보수정일';

COMMENT ON COLUMN "USERS"."STATUS" IS '회원상태(U=일반회원, A=관리자, R=탈퇴)';

COMMENT ON COLUMN "USERS"."TASTE_NO" IS '취향번호';

COMMENT ON COLUMN "USERS"."PROFILE_PATH" IS '/resources/profile/~~~~~.jpg';

COMMENT ON COLUMN "USERS"."TEAM_NO" IS '팀번호';

CREATE TABLE "TASTE" (
	"TASTE_NO"	NUMBER		NOT NULL,
	"TASTE_CODE"	VARCHAR2(4)		NOT NULL,
	"TASTE_COLOR"	VARCHAR2(10)		NOT NULL,
    "TASTE_INFO"	VARCHAR2(1000)		NOT NULL,
    "TASTE_PT"	VARCHAR2(1000)		NOT NULL
    
);

COMMENT ON COLUMN "TASTE"."TASTE_NO" IS '취향번호';

COMMENT ON COLUMN "TASTE"."TASTE_CODE" IS '취향(NDHE, VDSE, SPTF, BOFA, ETRF, CCFE, CAES, HHAL)';

COMMENT ON COLUMN "TASTE"."TASTE_INFO" IS '취향정보(서사 중심의 역사 드라마 애호가)';
COMMENT ON COLUMN "TASTE"."TASTE_PT" IS '취향상세(깊이 있는 이야기 + 역사적 배경 + 무거운 주제 + 현실 기반)';

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"BOARD_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '댓글내용';

COMMENT ON COLUMN "REPLY"."REGIST_DATE" IS '댓글작성일';

COMMENT ON COLUMN "REPLY"."STATUS" IS 'Y(유효한댓글)/N(삭제한댓글)';

COMMENT ON COLUMN "REPLY"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글번호';

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER		NOT NULL,
	"FAQ_TITLE"	VARCHAR2(50)		NOT NULL,
	"FAQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FAQ"."FAQ_NO" IS '질의응답번호';

COMMENT ON COLUMN "FAQ"."FAQ_TITLE" IS '질의응답제목';

COMMENT ON COLUMN "FAQ"."FAQ_CONTENT" IS '질의응답내용';

COMMENT ON COLUMN "FAQ"."REGIST_DATE" IS '작성일';

COMMENT ON COLUMN "FAQ"."STATUS" IS 'Y(유효한글)/N(삭제한글)';

COMMENT ON COLUMN "FAQ"."USER_NO" IS '회원번호';

CREATE TABLE "INQUIRY_BOARD" (
	"INQUIRY_NO"	NUMBER		NOT NULL,
	"INQUIRY_TITLE"	VARCHAR2(50)		NOT NULL,
	"INQUIRY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"INQUIRY_TYPE"	VARCHAR2(50)		NOT NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(2000)		NULL,
	"USER_NICKNAME"	VARCHAR2(200)		NULL,
	"REPLY_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "INQUIRY_BOARD"."INQUIRY_NO" IS '문의번호';

COMMENT ON COLUMN "INQUIRY_BOARD"."INQUIRY_TITLE" IS '문의제목';

COMMENT ON COLUMN "INQUIRY_BOARD"."INQUIRY_CONTENT" IS '문의내용';

COMMENT ON COLUMN "INQUIRY_BOARD"."INQUIRY_TYPE" IS '문의유형';

COMMENT ON COLUMN "INQUIRY_BOARD"."REGIST_DATE" IS '작성일';

COMMENT ON COLUMN "INQUIRY_BOARD"."STATUS" IS '글상태';

COMMENT ON COLUMN "INQUIRY_BOARD"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "INQUIRY_BOARD"."REPLY_CONTENT" IS '답변내용';

COMMENT ON COLUMN "INQUIRY_BOARD"."USER_NICKNAME" IS '답변자';

COMMENT ON COLUMN "INQUIRY_BOARD"."REPLY_DATE" IS '답변일';

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_TITLE"	VARCHAR2(50)		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REPORT_TYPE"	VARCHAR2(50)		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"REF_TYPE"	VARCHAR2(100)		NULL,
	"REF_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';

COMMENT ON COLUMN "REPORT"."REPORT_TITLE" IS '신고제목';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고내용';

COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '신고유형';

COMMENT ON COLUMN "REPORT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "REPORT"."REF_TYPE" IS '리뷰("RV")/댓글("RP")/게시글("BD")';

COMMENT ON COLUMN "REPORT"."REF_NO" IS '리뷰/댓글/게시글 번호 등등';

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"GRADE"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"MOVIE_NO"	NUMBER		NOT NULL,
	"REVIEW_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '리뷰번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '리뷰내용';

COMMENT ON COLUMN "REVIEW"."GRADE" IS '평점';

COMMENT ON COLUMN "REVIEW"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "REVIEW"."MOVIE_NO" IS '영화고유번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_DATE" IS '리뷰작성일';

CREATE TABLE "MOVIE" (
	"MOVIE_NO"	NUMBER		NOT NULL,
	"MOVIE_TITLE"	VARCHAR2(100)		NOT NULL,
	"MOVIE_CONTENT"	VARCHAR2(2000)		NOT NULL,
	"GENRE"	VARCHAR2(100)		NOT NULL,
	"PLAYTIME"	NUMBER		NOT NULL,
	"COUNTRY"	VARCHAR2(50)		NOT NULL,
	"AGE_LV"	VARCHAR2(50)		NOT NULL,
	"OPEN_DATE"	VARCHAR2(200)		NOT NULL,
	"DIRECTOR"	VARCHAR2(50)		NOT NULL,
	"AUDIENCE_COUNT"	NUMBER		NOT NULL,
	"ACTOR"	VARCHAR2(1000)		NOT NULL,
	"PREVIEW"	VARCHAR2(1000)		NOT NULL,
	"STATUS"	VARCHAR2(100)		NOT NULL,
	"GRADE"	NUMBER		NOT NULL,
	"TITLE_PATH"	VARCHAR2(500)		NOT NULL,
	"CONTENT_PATH"	VARCHAR2(500)		NOT NULL,
	"TASTE_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MOVIE"."MOVIE_NO" IS '영화고유번호';

COMMENT ON COLUMN "MOVIE"."MOVIE_TITLE" IS '영화제목';

COMMENT ON COLUMN "MOVIE"."MOVIE_CONTENT" IS '영화줄거리';

COMMENT ON COLUMN "MOVIE"."GENRE" IS '장르';

COMMENT ON COLUMN "MOVIE"."PLAYTIME" IS '재생시간';

COMMENT ON COLUMN "MOVIE"."COUNTRY" IS '제작국가';

COMMENT ON COLUMN "MOVIE"."AGE_LV" IS '나이 제한';

COMMENT ON COLUMN "MOVIE"."OPEN_DATE" IS '개봉일';

COMMENT ON COLUMN "MOVIE"."DIRECTOR" IS '감독';

COMMENT ON COLUMN "MOVIE"."AUDIENCE_COUNT" IS '관객수';

COMMENT ON COLUMN "MOVIE"."ACTOR" IS '배우';

COMMENT ON COLUMN "MOVIE"."PREVIEW" IS '예고편';

COMMENT ON COLUMN "MOVIE"."STATUS" IS '10(상영영화) / 20(OTT영화) / 30(삭제)';

COMMENT ON COLUMN "MOVIE"."GRADE" IS '평점';

COMMENT ON COLUMN "MOVIE"."TITLE_PATH" IS '메인이미지경로';

COMMENT ON COLUMN "MOVIE"."CONTENT_PATH" IS '상세이미지경로';

COMMENT ON COLUMN "MOVIE"."TASTE_NO" IS '취향번호';

CREATE TABLE "BOARD" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"BOARD_TYPE"	NUMBER		NOT NULL,
	"BOARD_TITLE"	VARCHAR2(200)		NOT NULL,
	"BOARD_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BOARD_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"TASTE_NO"	NUMBER		NULL,
	"MOVIE_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';

COMMENT ON COLUMN "BOARD"."BOARD_TYPE" IS '게시글유형:(0:자유게시판/ 1: 취향게시판)';

COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';

COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';

COMMENT ON COLUMN "BOARD"."BOARD_COUNT" IS '게시글조회수';

COMMENT ON COLUMN "BOARD"."REGIST_DATE" IS '게시글작성일';

COMMENT ON COLUMN "BOARD"."STATUS" IS 'Y(유효한글)/N(삭제한글)';

COMMENT ON COLUMN "BOARD"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "BOARD"."TASTE_NO" IS '취향유형:(10:HDHE/20:VDSE/30:SPTF/40:BOFA/50:ETRF/60:CCFE/70:CAES/80:HHAL)';

COMMENT ON COLUMN "BOARD"."MOVIE_NO" IS '영화고유번호';

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(200)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REGIST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	CHAR(1)	DEFAULT 'Y'	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항글번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '공지사항글제목';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '공지사항글내용';

COMMENT ON COLUMN "NOTICE"."REGIST_DATE" IS '공지사항글작성일';

COMMENT ON COLUMN "NOTICE"."STATUS" IS 'Y(유효한글)/N(삭제한글)';

COMMENT ON COLUMN "NOTICE"."USER_NO" IS '회원번호';

CREATE TABLE "FAVORITES" (
	"FAVORITES_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"MOVIE_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FAVORITES"."FAVORITES_DATE" IS '즐겨찾기 등록날짜';

COMMENT ON COLUMN "FAVORITES"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "FAVORITES"."MOVIE_NO" IS '영화고유번호';

CREATE TABLE "LIKES" (
	"USER_NO"	NUMBER		NOT NULL,
	"REVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "LIKES"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "LIKES"."REVIEW_NO" IS '리뷰번호';

CREATE TABLE "ATTACHMENT" (
	"FILE_NO"	VARCHAR(255)		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(500)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(500)		NOT NULL,
	"FILE_PATH"	VARCHAR2(500)		NOT NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REF_TYPE"	VARCHAR2(100)		NULL,
	"REF_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "ATTACHMENT"."FILE_NO" IS '파일번호';

COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '원본명';

COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '실제업로드파일명';

COMMENT ON COLUMN "ATTACHMENT"."FILE_PATH" IS '저장경로';

COMMENT ON COLUMN "ATTACHMENT"."UPLOAD_DATE" IS '업로드일';

COMMENT ON COLUMN "ATTACHMENT"."REF_TYPE" IS '1:1("IB")/공지사항("NT")/영화("MV")/게시글("BD") 등등';

COMMENT ON COLUMN "ATTACHMENT"."REF_NO" IS '1:1번호/공지사항번호/영화번호/게시글번호  등등';

CREATE TABLE "OTT_LINK" (
	"MOVIE_NO"	NUMBER		NOT NULL,
	"OTT_TYPE"	VARCHAR2(100)		NOT NULL,
	"API"	VARCHAR2(1000)		NOT NULL
);

COMMENT ON COLUMN "OTT_LINK"."MOVIE_NO" IS '영화고유번호';

COMMENT ON COLUMN "OTT_LINK"."OTT_TYPE" IS 'OTT유형';

COMMENT ON COLUMN "OTT_LINK"."API" IS '링크 또는 api에 요구하는 값';

ALTER TABLE "USERS" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "TASTE" ADD CONSTRAINT "PK_TASTE" PRIMARY KEY (
	"TASTE_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "INQUIRY_BOARD" ADD CONSTRAINT "PK_INQUIRY_BOARD" PRIMARY KEY (
	"INQUIRY_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "MOVIE" ADD CONSTRAINT "PK_MOVIE" PRIMARY KEY (
	"MOVIE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"BOARD_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "USERS" ADD CONSTRAINT "FK_TASTE_TO_USERS_1" FOREIGN KEY (
	"TASTE_NO"
)
REFERENCES "TASTE" (
	"TASTE_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_USERS_TO_REPLY_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"BOARD_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "FK_USERS_TO_FAQ_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "INQUIRY_BOARD" ADD CONSTRAINT "FK_USERS_TO_INQUIRY_BOARD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_USERS_TO_REPORT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_USERS_TO_REVIEW_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MOVIE_TO_REVIEW_1" FOREIGN KEY (
	"MOVIE_NO"
)
REFERENCES "MOVIE" (
	"MOVIE_NO"
);

ALTER TABLE "MOVIE" ADD CONSTRAINT "FK_TASTE_TO_MOVIE_1" FOREIGN KEY (
	"TASTE_NO"
)
REFERENCES "TASTE" (
	"TASTE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_USERS_TO_BOARD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_TASTE_TO_BOARD_1" FOREIGN KEY (
	"TASTE_NO"
)
REFERENCES "TASTE" (
	"TASTE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MOVIE_TO_BOARD_1" FOREIGN KEY (
	"MOVIE_NO"
)
REFERENCES "MOVIE" (
	"MOVIE_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_USERS_TO_NOTICE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "FAVORITES" ADD CONSTRAINT "FK_USERS_TO_FAVORITES_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "FAVORITES" ADD CONSTRAINT "FK_MOVIE_TO_FAVORITES_1" FOREIGN KEY (
	"MOVIE_NO"
)
REFERENCES "MOVIE" (
	"MOVIE_NO"
);

ALTER TABLE "LIKES" ADD CONSTRAINT "FK_USERS_TO_LIKES_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "USERS" (
	"USER_NO"
);

ALTER TABLE "LIKES" ADD CONSTRAINT "FK_REVIEW_TO_LIKES_1" FOREIGN KEY (
	"REVIEW_NO"
)
REFERENCES "REVIEW" (
	"REVIEW_NO"
);

ALTER TABLE "OTT_LINK" ADD CONSTRAINT "FK_MOVIE_TO_OTT_LINK_1" FOREIGN KEY (
	"MOVIE_NO"
)
REFERENCES "MOVIE" (
	"MOVIE_NO"
);

COMMIT;
