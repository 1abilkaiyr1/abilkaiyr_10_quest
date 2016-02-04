# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table users (
  id                        bigint auto_increment not null,
  email                     varchar(255),
  password                  varchar(255),
  constraint uq_users_email unique (email),
  constraint pk_users primary key (id))
;

create table exams (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  constraint pk_exams primary key (id))
;

create table layouts (
  id                        bigint auto_increment not null,
  template_layout_id        bigint,
  name                      varchar(255),
  constraint pk_layouts primary key (id))
;

create table layout_blocks (
  id                        bigint auto_increment not null,
  layout_id                 bigint,
  position                  integer,
  name                      varchar(255),
  checker                   varchar(255),
  content                   varchar(255),
  alingment                 varchar(255),
  orientation               varchar(255),
  repetition                varchar(255),
  delimeter                 integer,
  start_x                   integer,
  start_y                   integer,
  end_x                     integer,
  end_y                     integer,
  constraint pk_layout_blocks primary key (id))
;

create table lessons (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  constraint pk_lessons primary key (id))
;

create table roles (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  constraint pk_roles primary key (id))
;

create table students (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  surname                   varchar(255),
  birthday                  varchar(255),
  faculty                   varchar(255),
  profession                varchar(255),
  constraint pk_students primary key (id))
;

create table student_detailed_results (
  id                        bigint auto_increment not null,
  student_result_id         bigint,
  variant_lesson_id         bigint,
  student_answers           varchar(255),
  correct                   integer,
  incorrect                 integer,
  blank                     integer,
  constraint pk_student_detailed_results primary key (id))
;

create table student_results (
  id                        bigint auto_increment not null,
  exam_id                   bigint,
  student                   varchar(255),
  variant_id                bigint,
  grade                     varchar(255),
  constraint pk_student_results primary key (id))
;

create table t_layouts (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  constraint pk_t_layouts primary key (id))
;

create table t_layout_blocks (
  id                        bigint auto_increment not null,
  template_layout_id        bigint,
  position                  integer,
  name                      varchar(255),
  checker                   varchar(255),
  content                   varchar(255),
  alingment                 varchar(255),
  orientation               varchar(255),
  repetition                varchar(255),
  delimeter                 integer,
  start_x                   integer,
  start_y                   integer,
  end_x                     integer,
  end_y                     integer,
  constraint pk_t_layout_blocks primary key (id))
;

create table topics (
  id                        bigint auto_increment not null,
  lesson_id                 bigint,
  parent_id                 bigint,
  name                      varchar(255),
  constraint pk_topics primary key (id))
;

create table variants (
  id                        bigint auto_increment not null,
  name                      varchar(255),
  constraint pk_variants primary key (id))
;

create table variant_lessons (
  id                        bigint auto_increment not null,
  variant_id                bigint,
  lessson_id                bigint,
  constraint pk_variant_lessons primary key (id))
;

create table variant_answers (
  id                        bigint auto_increment not null,
  variant_lesson_id         bigint,
  topic_id                  bigint,
  answer                    varchar(255),
  constraint pk_variant_answers primary key (id))
;


create table users_roles (
  users_id                       bigint not null,
  roles_id                       bigint not null,
  constraint pk_users_roles primary key (users_id, roles_id))
;

create table exams_variants (
  exams_id                       bigint not null,
  variants_id                    bigint not null,
  constraint pk_exams_variants primary key (exams_id, variants_id))
;
alter table layouts add constraint fk_layouts_templateLayout_1 foreign key (template_layout_id) references t_layouts (id) on delete restrict on update restrict;
create index ix_layouts_templateLayout_1 on layouts (template_layout_id);
alter table layout_blocks add constraint fk_layout_blocks_layout_2 foreign key (layout_id) references layouts (id) on delete restrict on update restrict;
create index ix_layout_blocks_layout_2 on layout_blocks (layout_id);
alter table student_detailed_results add constraint fk_student_detailed_results_studentResult_3 foreign key (student_result_id) references student_results (id) on delete restrict on update restrict;
create index ix_student_detailed_results_studentResult_3 on student_detailed_results (student_result_id);
alter table student_detailed_results add constraint fk_student_detailed_results_variantLesson_4 foreign key (variant_lesson_id) references variant_lessons (id) on delete restrict on update restrict;
create index ix_student_detailed_results_variantLesson_4 on student_detailed_results (variant_lesson_id);
alter table student_results add constraint fk_student_results_exam_5 foreign key (exam_id) references exams (id) on delete restrict on update restrict;
create index ix_student_results_exam_5 on student_results (exam_id);
alter table student_results add constraint fk_student_results_variant_6 foreign key (variant_id) references variants (id) on delete restrict on update restrict;
create index ix_student_results_variant_6 on student_results (variant_id);
alter table t_layout_blocks add constraint fk_t_layout_blocks_templateLayout_7 foreign key (template_layout_id) references t_layouts (id) on delete restrict on update restrict;
create index ix_t_layout_blocks_templateLayout_7 on t_layout_blocks (template_layout_id);
alter table topics add constraint fk_topics_lesson_8 foreign key (lesson_id) references lessons (id) on delete restrict on update restrict;
create index ix_topics_lesson_8 on topics (lesson_id);
alter table topics add constraint fk_topics_parent_9 foreign key (parent_id) references topics (id) on delete restrict on update restrict;
create index ix_topics_parent_9 on topics (parent_id);
alter table variant_lessons add constraint fk_variant_lessons_variant_10 foreign key (variant_id) references variants (id) on delete restrict on update restrict;
create index ix_variant_lessons_variant_10 on variant_lessons (variant_id);
alter table variant_lessons add constraint fk_variant_lessons_lessson_11 foreign key (lessson_id) references lessons (id) on delete restrict on update restrict;
create index ix_variant_lessons_lessson_11 on variant_lessons (lessson_id);
alter table variant_answers add constraint fk_variant_answers_variantLesson_12 foreign key (variant_lesson_id) references variant_lessons (id) on delete restrict on update restrict;
create index ix_variant_answers_variantLesson_12 on variant_answers (variant_lesson_id);
alter table variant_answers add constraint fk_variant_answers_topic_13 foreign key (topic_id) references topics (id) on delete restrict on update restrict;
create index ix_variant_answers_topic_13 on variant_answers (topic_id);



alter table users_roles add constraint fk_users_roles_users_01 foreign key (users_id) references users (id) on delete restrict on update restrict;

alter table users_roles add constraint fk_users_roles_roles_02 foreign key (roles_id) references roles (id) on delete restrict on update restrict;

alter table exams_variants add constraint fk_exams_variants_exams_01 foreign key (exams_id) references exams (id) on delete restrict on update restrict;

alter table exams_variants add constraint fk_exams_variants_variants_02 foreign key (variants_id) references variants (id) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table users;

drop table users_roles;

drop table exams;

drop table exams_variants;

drop table layouts;

drop table layout_blocks;

drop table lessons;

drop table roles;

drop table students;

drop table student_detailed_results;

drop table student_results;

drop table t_layouts;

drop table t_layout_blocks;

drop table topics;

drop table variants;

drop table variant_lessons;

drop table variant_answers;

SET FOREIGN_KEY_CHECKS=1;

