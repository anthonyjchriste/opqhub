# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table alert (
  primary_key               bigint not null,
  alert_type                integer,
  alert_value               double,
  timestamp                 bigint,
  alert_duration            bigint,
  device_primary_key        bigint,
  external_event_primary_key bigint,
  constraint ck_alert_alert_type check (alert_type in (0,1,2)),
  constraint pk_alert primary key (primary_key))
;

create table alert_notification (
  primary_key               bigint not null,
  voltage_alert_notification boolean,
  frequency_alert_notification boolean,
  alert_via_email           boolean,
  notification_email        varchar(255),
  alert_via_sms             boolean,
  sms_carrier               varchar(255),
  sms_number                varchar(255),
  min_acceptable_voltage    double,
  max_acceptable_voltage    double,
  min_acceptable_frequency  double,
  max_acceptable_frequency  double,
  device_primary_key        bigint,
  constraint pk_alert_notification primary key (primary_key))
;

create table external_event (
  primary_key               bigint not null,
  event_type                varchar(255),
  event_description         varchar(255),
  timestamp                 bigint,
  duration                  bigint,
  constraint pk_external_event primary key (primary_key))
;

create table measurement (
  primary_key               bigint not null,
  timestamp                 bigint,
  voltage                   double,
  frequency                 double,
  device_primary_key        bigint,
  constraint pk_measurement primary key (primary_key))
;

create table opq_device (
  primary_key               bigint not null,
  device_id                 bigint,
  description               varchar(255),
  state                     varchar(255),
  city                      varchar(255),
  zip                       varchar(255),
  street_name               varchar(255),
  street_number             varchar(255),
  longitude                 double,
  latitude                  double,
  participating_in_cdsi     boolean,
  person_primary_key        bigint,
  constraint pk_opq_device primary key (primary_key))
;

create table person (
  primary_key               bigint not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  email                     varchar(255),
  password_hash             varbinary(255),
  state                     varchar(255),
  city                      varchar(255),
  zip                       varchar(255),
  street_name               varchar(255),
  street_number             varchar(255),
  constraint pk_person primary key (primary_key))
;

create sequence alert_seq;

create sequence alert_notification_seq;

create sequence external_event_seq;

create sequence measurement_seq;

create sequence opq_device_seq;

create sequence person_seq;

alter table alert add constraint fk_alert_device_1 foreign key (device_primary_key) references opq_device (primary_key) on delete restrict on update restrict;
create index ix_alert_device_1 on alert (device_primary_key);
alter table alert add constraint fk_alert_externalEvent_2 foreign key (external_event_primary_key) references external_event (primary_key) on delete restrict on update restrict;
create index ix_alert_externalEvent_2 on alert (external_event_primary_key);
alter table alert_notification add constraint fk_alert_notification_device_3 foreign key (device_primary_key) references opq_device (primary_key) on delete restrict on update restrict;
create index ix_alert_notification_device_3 on alert_notification (device_primary_key);
alter table measurement add constraint fk_measurement_device_4 foreign key (device_primary_key) references opq_device (primary_key) on delete restrict on update restrict;
create index ix_measurement_device_4 on measurement (device_primary_key);
alter table opq_device add constraint fk_opq_device_person_5 foreign key (person_primary_key) references person (primary_key) on delete restrict on update restrict;
create index ix_opq_device_person_5 on opq_device (person_primary_key);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists alert;

drop table if exists alert_notification;

drop table if exists external_event;

drop table if exists measurement;

drop table if exists opq_device;

drop table if exists person;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists alert_seq;

drop sequence if exists alert_notification_seq;

drop sequence if exists external_event_seq;

drop sequence if exists measurement_seq;

drop sequence if exists opq_device_seq;

drop sequence if exists person_seq;
