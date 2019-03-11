/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/22 16:20:12                          */
/*==============================================================*/


drop table if exists Apply;

drop table if exists BBSInfo;

drop table if exists BBSTalk;

drop table if exists CheckOutPoint;

drop table if exists CheckPoint;

drop table if exists FreedomMode;

drop table if exists Guardian;

drop table if exists Student;

/*==============================================================*/
/* Table: Apply                                                 */
/*==============================================================*/
create table Apply
(
   guardianID           int not null,
   studentID            int not null,
   applyDate            datetime,
   applySubmit          bool,
   primary key (guardianID, studentID)
);

/*==============================================================*/
/* Table: BBSInfo                                               */
/*==============================================================*/
create table BBSInfo
(
   bbsID                int not null,
   studentID            int not null,
   postDate             datetime,
   theme                varchar(50),
   primary key (bbsID)
);

/*==============================================================*/
/* Table: BBSTalk                                               */
/*==============================================================*/
create table BBSTalk
(
   talkID               int not null,
   studentID            int not null,
   bbsID                int not null,
   talkTo               int,
   likeCount            int,
   BBSTalkMessage       varchar(200),
   primary key (talkID)
);

/*==============================================================*/
/* Table: CheckOutPoint                                         */
/*==============================================================*/
create table CheckOutPoint
(
   checkOutPointID      int not null,
   studentID            int not null,
   toalTime             time,
   program              varchar(500),
   primary key (checkOutPointID)
);

/*==============================================================*/
/* Table: CheckPoint                                            */
/*==============================================================*/
create table CheckPoint
(
   checkPointID         int not null,
   checkPointName       varchar(20),
   checkPointLevel      int,
   checkPointCate       int,
   primary key (checkPointID)
);

/*==============================================================*/
/* Table: FreedomMode                                           */
/*==============================================================*/
create table FreedomMode
(
   freeModeID           int not null,
   program              varchar(500),
   source               varchar(40),
   primary key (freeModeID)
);

/*==============================================================*/
/* Table: Guardian                                              */
/*==============================================================*/
create table Guardian
(
   guardianID           int not null,
   guardianName         varchar(30),
   guardianPassword     varchar(30),
   guardianEmail        varchar(30),
   primary key (guardianID)
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   studentID            int not null,
   studentName          varchar(30),
   studentPassword      varchar(30),
   studentGender        varchar(1),
   studentAccount      varchar(30) unique,
   primary key (studentID)
);



alter table Apply add constraint  foreign key (guardianID)
      references Guardian (guardianID) on delete restrict on update restrict;

alter table Apply add constraint  foreign key (studentID)
      references Student (studentID) on delete restrict on update restrict;

alter table BBSInfo add constraint  foreign key (studentID)
      references Student (studentID) on delete restrict on update restrict;

alter table BBSTalk add constraint  foreign key (bbsID)
      references BBSInfo (bbsID) on delete restrict on update restrict;

alter table BBSTalk add constraint foreign key (studentID)
      references Student (studentID) on delete restrict on update restrict;
      
alter table CheckOutPoint add constraint foreign key (studentID)
      references Student (studentID) on delete restrict on update restrict;

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `code`.`student`
CHANGE COLUMN `studentID` `studentID` INT(11) NOT NULL AUTO_INCREMENT ;

/*==============================================================*/
/* 2019.3.10  rgzhang增加：关卡的描述信息                         */
/*==============================================================*/
ALTER TABLE `code`.`checkpoint` 
ADD COLUMN `checkpointMessage` VARCHAR(300) NULL DEFAULT NULL AFTER `checkPointCate`;
