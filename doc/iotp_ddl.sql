------------------------------------------
-- Export file for user IOTP            --
-- Created by yao on 2014/5/7, 14:19:42 --
------------------------------------------

spool iotp_ddl.log

prompt
prompt Creating table BASEINFO
prompt =======================
prompt
create table BASEINFO
(
  id   INTEGER not null,
  name VARCHAR2(50) not null,
  sort INTEGER not null
)
;
comment on table BASEINFO
  is '���Ż�������';
comment on column BASEINFO.id
  is 'ID������';
comment on column BASEINFO.name
  is '����������';
comment on column BASEINFO.sort
  is '����
0-�������1-����״����2-ְ��
3-��ͬ���ͣ�4-�Ļ��̶ȣ�5-ְ�ƣ�6-������ò��7-�豸�ͺţ�8-����';
alter table BASEINFO
  add constraint PK_BASEINFO primary key (ID);

prompt
prompt Creating table CAR_OFFLINE
prompt ==========================
prompt
create table CAR_OFFLINE
(
  id            INTEGER not null,
  cardno        VARCHAR2(15),
  cardid        VARCHAR2(20),
  cardtype      VARCHAR2(20),
  cardstate     VARCHAR2(20),
  empno         VARCHAR2(20),
  empname       VARCHAR2(50),
  carlicense    VARCHAR2(50),
  machnum       VARCHAR2(6),
  inorout       VARCHAR2(10),
  parkname      VARCHAR2(100),
  inouttime     VARCHAR2(20),
  inoutposition VARCHAR2(200)
)
;
comment on table CAR_OFFLINE
  is '����������¼�����ڳ�����';
comment on column CAR_OFFLINE.id
  is 'ID������';
comment on column CAR_OFFLINE.cardno
  is '�������';
comment on column CAR_OFFLINE.cardid
  is '�����';
comment on column CAR_OFFLINE.cardtype
  is '����';
comment on column CAR_OFFLINE.cardstate
  is '��״̬';
comment on column CAR_OFFLINE.empno
  is 'Ա�����';
comment on column CAR_OFFLINE.empname
  is 'Ա������';
comment on column CAR_OFFLINE.carlicense
  is '���ƺ���';
comment on column CAR_OFFLINE.machnum
  is '��������������';
comment on column CAR_OFFLINE.inorout
  is '�������򣨽�������';
comment on column CAR_OFFLINE.parkname
  is '����ͣ��������';
comment on column CAR_OFFLINE.inouttime
  is '����ʱ��';
comment on column CAR_OFFLINE.inoutposition
  is '������λ��';
alter table CAR_OFFLINE
  add constraint PK_CAR_OFFLINE primary key (ID);

prompt
prompt Creating table CAR_PARK
prompt =======================
prompt
create table CAR_PARK
(
  id          INTEGER not null,
  cardno      VARCHAR2(15),
  cardid      VARCHAR2(20),
  cardtype    VARCHAR2(20),
  cardstate   VARCHAR2(20),
  empno       VARCHAR2(20),
  empname     VARCHAR2(50),
  carlicense  VARCHAR2(50),
  intime      VARCHAR2(20),
  inmachnum   VARCHAR2(6),
  inposition  VARCHAR2(200),
  outtime     VARCHAR2(20),
  outmachnum  VARCHAR2(6),
  outposition VARCHAR2(200),
  parkname    VARCHAR2(200),
  memo        VARCHAR2(200)
)
;
comment on table CAR_PARK
  is '��������ͳ�Ʊ����������¼��';
comment on column CAR_PARK.id
  is 'ID������';
comment on column CAR_PARK.cardno
  is '�������';
comment on column CAR_PARK.cardid
  is '�����';
comment on column CAR_PARK.cardtype
  is '����';
comment on column CAR_PARK.cardstate
  is '��״̬';
comment on column CAR_PARK.empno
  is 'Ա�����';
comment on column CAR_PARK.empname
  is 'Ա������';
comment on column CAR_PARK.carlicense
  is '���ƺ���';
comment on column CAR_PARK.intime
  is '�볡ʱ��';
comment on column CAR_PARK.inmachnum
  is '�볡����';
comment on column CAR_PARK.inposition
  is '�볡�ص�';
comment on column CAR_PARK.outtime
  is '����ʱ��';
comment on column CAR_PARK.outmachnum
  is '��������';
comment on column CAR_PARK.outposition
  is '�����ص�';
comment on column CAR_PARK.parkname
  is 'ͣ��������';
comment on column CAR_PARK.memo
  is '��ע';
alter table CAR_PARK
  add constraint PK_CAR_PARK primary key (ID);

prompt
prompt Creating table DEPARTMENT
prompt =========================
prompt
create table DEPARTMENT
(
  id         INTEGER not null,
  depid      VARCHAR2(20),
  depname    VARCHAR2(100),
  upid       INTEGER default 0,
  upname     VARCHAR2(100) default '����',
  deptype    VARCHAR2(255),
  d_telphone VARCHAR2(30),
  d_fax      VARCHAR2(30),
  d_address  VARCHAR2(255),
  d_postcode VARCHAR2(20),
  d_memo     VARCHAR2(255)
)
;
comment on table DEPARTMENT
  is '���ű�';
comment on column DEPARTMENT.id
  is 'ID,����';
comment on column DEPARTMENT.depid
  is '���ű��';
comment on column DEPARTMENT.depname
  is '��������';
comment on column DEPARTMENT.upid
  is '��������ID�������ϼ�����ID��';
comment on column DEPARTMENT.upname
  is '�ϼ����ŵ�����';
comment on column DEPARTMENT.deptype
  is '�������';
comment on column DEPARTMENT.d_telphone
  is '���ŵ绰����';
comment on column DEPARTMENT.d_fax
  is '���Ŵ���';
comment on column DEPARTMENT.d_address
  is '���ŵ�ַ';
comment on column DEPARTMENT.d_postcode
  is '������������';
comment on column DEPARTMENT.d_memo
  is '��ע';
alter table DEPARTMENT
  add constraint PK_DEPARTMENT primary key (ID);

prompt
prompt Creating table DEV_INFO
prompt =======================
prompt
create table DEV_INFO
(
  dev_id           NUMBER(10) not null,
  dev_name         VARCHAR2(100),
  dev_desc         VARCHAR2(200),
  dev_class_id     NUMBER(10),
  room_id          NUMBER(10),
  dev_role         NUMBER(1),
  network_addr     VARCHAR2(50),
  mac_addr         VARCHAR2(50),
  dev_status       NUMBER(1),
  position_x       NUMBER(4),
  position_y       NUMBER(4),
  alarm_status     NUMBER(2),
  alarm_receiver   VARCHAR2(20),
  alaram_switch    NUMBER(2),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table DEV_INFO
  is '����豸�Ļ���������Ϣ';
comment on column DEV_INFO.dev_id
  is '�豸���';
comment on column DEV_INFO.dev_name
  is '�豸����';
comment on column DEV_INFO.dev_desc
  is '�豸��ϸ����';
comment on column DEV_INFO.dev_class_id
  is '�豸���ͣ�����豸���ͱ�';
comment on column DEV_INFO.room_id
  is '�豸���ڷ�����';
comment on column DEV_INFO.dev_role
  is '�豸��ɫ��0-Э������1-·�ɣ�2-�ն�';
comment on column DEV_INFO.network_addr
  is '�����ַ';
comment on column DEV_INFO.mac_addr
  is '�����ַ';
comment on column DEV_INFO.dev_status
  is '0-����1-�أ�2-���ϣ�3-ͣ��';
comment on column DEV_INFO.position_x
  is 'λ��X����';
comment on column DEV_INFO.position_y
  is 'λ��Y����';
comment on column DEV_INFO.alarm_status
  is '�澯״̬��1-���� 2-�澯';
comment on column DEV_INFO.alarm_receiver
  is '�澯������';
comment on column DEV_INFO.alaram_switch
  is '�澯���أ�0-�ر� 1-����';
comment on column DEV_INFO.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column DEV_INFO.create_time
  is '����ʱ��';
comment on column DEV_INFO.last_modify_by
  is '����һ���޸���';
comment on column DEV_INFO.last_modify_time
  is '����һ���޸�ʱ��';
alter table DEV_INFO
  add constraint PK_DEV_INFO primary key (DEV_ID);

prompt
prompt Creating table DEV_ALARM_CONFIG_INFO
prompt ====================================
prompt
create table DEV_ALARM_CONFIG_INFO
(
  id             NUMBER(10) not null,
  dev_id         NUMBER(10) not null,
  attr_key       VARCHAR2(50) not null,
  attr_min_value VARCHAR2(20),
  attr_max_value VARCHAR2(20)
)
;
comment on column DEV_ALARM_CONFIG_INFO.dev_id
  is '�豸���';
comment on column DEV_ALARM_CONFIG_INFO.attr_key
  is '���Լ�';
comment on column DEV_ALARM_CONFIG_INFO.attr_min_value
  is '������Сֵ';
comment on column DEV_ALARM_CONFIG_INFO.attr_max_value
  is '�������ֵ';
alter table DEV_ALARM_CONFIG_INFO
  add constraint PK_DEV_ALARM_CONFIG_INFO primary key (ID);
alter table DEV_ALARM_CONFIG_INFO
  add constraint FK_DEV_ALAR_REFERENCE_DEV_INFO foreign key (DEV_ID)
  references DEV_INFO (DEV_ID);

prompt
prompt Creating table DEV_ALARM_LOG
prompt ============================
prompt
create table DEV_ALARM_LOG
(
  id             NUMBER(10) not null,
  dev_id         NUMBER(10),
  dev_class_id   NUMBER(10),
  room_id        NUMBER(10),
  alarm_type     NUMBER(2),
  alarm_time     VARCHAR2(14),
  alarm_desc     VARCHAR2(100),
  status         NUMBER(1),
  receiver_name  VARCHAR2(50),
  receiver_phone CHAR(10),
  dispose_time   VARCHAR2(14)
)
;
comment on table DEV_ALARM_LOG
  is '����豸�ĸ澯��־';
comment on column DEV_ALARM_LOG.id
  is '�澯��Ϣ���';
comment on column DEV_ALARM_LOG.dev_id
  is '�豸����';
comment on column DEV_ALARM_LOG.dev_class_id
  is '�豸���ͣ�����豸���ͱ�';
comment on column DEV_ALARM_LOG.room_id
  is '������';
comment on column DEV_ALARM_LOG.alarm_type
  is '�澯���ͣ�
1-����澯��
2-������ȼ������澯��
3-���ܸ澯��
4-�¶ȸ澯��
5-ʪ�ȸ澯��';
comment on column DEV_ALARM_LOG.alarm_time
  is '�澯ʱ��(YYYYMMDDHHMISS)';
comment on column DEV_ALARM_LOG.alarm_desc
  is '�澯����';
comment on column DEV_ALARM_LOG.status
  is '�澯��Ϣ״̬��0-δ����1-�Ѵ���';
comment on column DEV_ALARM_LOG.receiver_name
  is '�澯������';
comment on column DEV_ALARM_LOG.receiver_phone
  is '�澯�����ߺ���';
comment on column DEV_ALARM_LOG.dispose_time
  is '����ʱ��(YYYYMMDDHHMISS)';
alter table DEV_ALARM_LOG
  add constraint PK_DEV_ALARM_LOG primary key (ID);

prompt
prompt Creating table DEV_CLASS_GROUP_INFO
prompt ===================================
prompt
create table DEV_CLASS_GROUP_INFO
(
  group_id   NUMBER(10) not null,
  group_name VARCHAR2(50)
)
;
comment on column DEV_CLASS_GROUP_INFO.group_id
  is '����������';
comment on column DEV_CLASS_GROUP_INFO.group_name
  is '�豸���ͷ�������';
alter table DEV_CLASS_GROUP_INFO
  add constraint PK_DEV_CLASS_GROUP_INFO primary key (GROUP_ID);

prompt
prompt Creating table DEV_CLASS_INFO
prompt =============================
prompt
create table DEV_CLASS_INFO
(
  dev_class_id     NUMBER(10) not null,
  group_id         NUMBER(10),
  class_name       VARCHAR2(100),
  class_desc       VARCHAR2(200),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14),
  open_class       VARCHAR2(50),
  close_class      VARCHAR2(50),
  alarm_class      VARCHAR2(50),
  invalid_class    VARCHAR2(50)
)
;
comment on table DEV_CLASS_INFO
  is '����豸�����Ͷ�����Ϣ';
comment on column DEV_CLASS_INFO.group_id
  is '����������';
comment on column DEV_CLASS_INFO.class_name
  is '�豸��������';
comment on column DEV_CLASS_INFO.class_desc
  is '�豸������ϸ����';
comment on column DEV_CLASS_INFO.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column DEV_CLASS_INFO.create_time
  is '����ʱ��';
comment on column DEV_CLASS_INFO.last_modify_by
  is '����һ���޸���';
comment on column DEV_CLASS_INFO.last_modify_time
  is '����һ���޸�ʱ��';
alter table DEV_CLASS_INFO
  add constraint PK_DEV_CLASS_INFO primary key (DEV_CLASS_ID);
alter table DEV_CLASS_INFO
  add constraint FK_DEV_CLAS_REFERENCE_DEV_CLAS foreign key (GROUP_ID)
  references DEV_CLASS_GROUP_INFO (GROUP_ID);

prompt
prompt Creating table DEV_ATTRIBUTES
prompt =============================
prompt
create table DEV_ATTRIBUTES
(
  attr_key         VARCHAR2(50) not null,
  dev_class_id     NUMBER(10),
  attr_name        VARCHAR2(100),
  attr_desc        VARCHAR2(200),
  attr_measurement VARCHAR2(20),
  allow_edit       NUMBER(1),
  attr_status      NUMBER(1),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table DEV_ATTRIBUTES
  is '��Ÿ����豸�����Զ�����Ϣ';
comment on column DEV_ATTRIBUTES.attr_key
  is '���Ա�ţ��ַ���';
comment on column DEV_ATTRIBUTES.dev_class_id
  is '�豸����ID';
comment on column DEV_ATTRIBUTES.attr_name
  is '�豸��������';
comment on column DEV_ATTRIBUTES.attr_desc
  is '�豸������ϸ����';
comment on column DEV_ATTRIBUTES.attr_measurement
  is '������ʾ��λ';
comment on column DEV_ATTRIBUTES.allow_edit
  is '�Ƿ�ɱ༭��0-��1-��';
comment on column DEV_ATTRIBUTES.attr_status
  is '����״̬��0-���� ,1-ʹ�ã�';
comment on column DEV_ATTRIBUTES.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column DEV_ATTRIBUTES.create_time
  is '����ʱ��';
comment on column DEV_ATTRIBUTES.last_modify_by
  is '����һ���޸���';
comment on column DEV_ATTRIBUTES.last_modify_time
  is '����һ���޸�ʱ��';
alter table DEV_ATTRIBUTES
  add constraint PK_DEV_ATTRIBUTES primary key (ATTR_KEY);
alter table DEV_ATTRIBUTES
  add constraint FK_DEV_ATTR_REFERENCE_DEV_CLAS foreign key (DEV_CLASS_ID)
  references DEV_CLASS_INFO (DEV_CLASS_ID);

prompt
prompt Creating table DEV_ATTR_HISTORY_INFO
prompt ====================================
prompt
create table DEV_ATTR_HISTORY_INFO
(
  id          NUMBER(10) not null,
  dev_id      NUMBER(10) not null,
  attr_key    VARCHAR2(50) not null,
  attr_value  VARCHAR2(20),
  update_time VARCHAR2(14)
)
;
comment on table DEV_ATTR_HISTORY_INFO
  is '����豸����ʷ��չ��Ϣ';
comment on column DEV_ATTR_HISTORY_INFO.id
  is '��չ��Ϣ���';
comment on column DEV_ATTR_HISTORY_INFO.dev_id
  is '�豸���';
comment on column DEV_ATTR_HISTORY_INFO.attr_key
  is '���Ա�ţ��ַ���';
comment on column DEV_ATTR_HISTORY_INFO.attr_value
  is '����ֵ';
comment on column DEV_ATTR_HISTORY_INFO.update_time
  is '����ʱ��';
alter table DEV_ATTR_HISTORY_INFO
  add constraint PK_DEV_ATTR_HISTORY_INFO primary key (ID);
alter table DEV_ATTR_HISTORY_INFO
  add constraint FK_DEV_ATTR_HIS_REF_DEV_INFO foreign key (DEV_ID)
  references DEV_INFO (DEV_ID);

prompt
prompt Creating table DEV_ATTR_INFO
prompt ============================
prompt
create table DEV_ATTR_INFO
(
  id          NUMBER(10) not null,
  dev_id      NUMBER(10) not null,
  attr_key    VARCHAR2(50) not null,
  attr_value  VARCHAR2(20),
  update_time VARCHAR2(14)
)
;
comment on table DEV_ATTR_INFO
  is '����豸����չ��Ϣ';
comment on column DEV_ATTR_INFO.id
  is '��չ��Ϣ���';
comment on column DEV_ATTR_INFO.dev_id
  is '�豸���';
comment on column DEV_ATTR_INFO.attr_key
  is '���Ա�ţ��ַ���';
comment on column DEV_ATTR_INFO.attr_value
  is '����ֵ';
comment on column DEV_ATTR_INFO.update_time
  is '����ʱ��';
alter table DEV_ATTR_INFO
  add constraint PK_DEV_ATTR_INFO primary key (ID);
alter table DEV_ATTR_INFO
  add constraint FK_DEV_ATTR_REFERENCE_DEV_INFO foreign key (DEV_ID)
  references DEV_INFO (DEV_ID);

prompt
prompt Creating table DEV_STATUS
prompt =========================
prompt
create table DEV_STATUS
(
  id               NUMBER(10) not null,
  dev_class_id     NUMBER(10),
  dev_status       NUMBER(2),
  dev_status_name  VARCHAR2(50),
  icon             VARCHAR2(200),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table DEV_STATUS
  is '����豸��UI�ϸ���״̬��ʾ��ͼ�궨��';
comment on column DEV_STATUS.dev_class_id
  is '�豸����';
comment on column DEV_STATUS.dev_status
  is '�豸��״̬';
comment on column DEV_STATUS.dev_status_name
  is '�豸״̬����';
comment on column DEV_STATUS.icon
  is '��Ӧ״̬��ʾ��ͼ��';
comment on column DEV_STATUS.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column DEV_STATUS.create_time
  is '����ʱ��';
comment on column DEV_STATUS.last_modify_by
  is '����һ���޸���';
comment on column DEV_STATUS.last_modify_time
  is '����һ���޸�ʱ��';
alter table DEV_STATUS
  add constraint PK_DEV_STATUS primary key (ID);
alter table DEV_STATUS
  add constraint FK_DEV_STAT_REFERENCE_DEV_CLAS foreign key (DEV_CLASS_ID)
  references DEV_CLASS_INFO (DEV_CLASS_ID);

prompt
prompt Creating table EMPLOYEE
prompt =======================
prompt
create table EMPLOYEE
(
  id             INTEGER not null,
  depid          INTEGER,
  empno          VARCHAR2(20),
  empname        VARCHAR2(20),
  e_photo        BLOB,
  e_sex          VARCHAR2(4),
  id_card        VARCHAR2(30),
  e_birthday     VARCHAR2(20),
  e_nationality  VARCHAR2(30),
  e_political    VARCHAR2(30),
  e_education    VARCHAR2(30),
  e_school       VARCHAR2(255),
  e_marital      VARCHAR2(30),
  family_place   VARCHAR2(255),
  badgeid        VARCHAR2(20),
  hukou          VARCHAR2(255),
  office_phone   VARCHAR2(30),
  e_mobile       VARCHAR2(30),
  homeaddress    VARCHAR2(255),
  e_postcode     VARCHAR2(20),
  hiredate       VARCHAR2(20),
  separatedate   VARCHAR2(20),
  separatereason VARCHAR2(255),
  zhiwu          VARCHAR2(30),
  e_title        VARCHAR2(30),
  e_contract     VARCHAR2(50),
  e_salary       VARCHAR2(50),
  e_state        VARCHAR2(20),
  e_profession   VARCHAR2(50),
  carno          VARCHAR2(20),
  driverno       VARCHAR2(50),
  e_memo         VARCHAR2(255)
)
;
comment on table EMPLOYEE
  is '���±�';
comment on column EMPLOYEE.id
  is 'ID������';
comment on column EMPLOYEE.depid
  is '���ڲ���';
comment on column EMPLOYEE.empno
  is 'Ա������';
comment on column EMPLOYEE.empname
  is '����';
comment on column EMPLOYEE.e_photo
  is 'Ա����Ƭ';
comment on column EMPLOYEE.e_sex
  is '�Ա�';
comment on column EMPLOYEE.id_card
  is '���֤��';
comment on column EMPLOYEE.e_birthday
  is '��������';
comment on column EMPLOYEE.e_nationality
  is '����';
comment on column EMPLOYEE.e_political
  is '������ò';
comment on column EMPLOYEE.e_education
  is '�Ļ��̶�';
comment on column EMPLOYEE.e_school
  is '��ҵѧУ';
comment on column EMPLOYEE.e_marital
  is '����״��';
comment on column EMPLOYEE.family_place
  is '��ͥסַ';
comment on column EMPLOYEE.badgeid
  is 'Ա���ֿ�����';
comment on column EMPLOYEE.hukou
  is '�������ڵ�';
comment on column EMPLOYEE.office_phone
  is '�칫�ҵ绰';
comment on column EMPLOYEE.e_mobile
  is '�ֻ�����';
comment on column EMPLOYEE.homeaddress
  is '��ͥסַ2';
comment on column EMPLOYEE.e_postcode
  is '��������';
comment on column EMPLOYEE.hiredate
  is '��ְ����';
comment on column EMPLOYEE.separatedate
  is '��ְ����';
comment on column EMPLOYEE.separatereason
  is '��ְԭ��';
comment on column EMPLOYEE.zhiwu
  is 'ְ��';
comment on column EMPLOYEE.e_title
  is 'ְ��';
comment on column EMPLOYEE.e_contract
  is '��ͬ����';
comment on column EMPLOYEE.e_salary
  is 'н�����';
comment on column EMPLOYEE.e_state
  is 'Ա��״̬��
��ְ��Ա����ְ��Ա��������Ա��
��ְ��Ա����Ƹ��Ա��������Ա';
comment on column EMPLOYEE.e_profession
  is 'רҵ';
comment on column EMPLOYEE.carno
  is '���ƺ���';
comment on column EMPLOYEE.driverno
  is '��ʻ֤����';
comment on column EMPLOYEE.e_memo
  is '��ע';
alter table EMPLOYEE
  add constraint PK_EMPLOYEE primary key (ID);

prompt
prompt Creating table MAP_BUILDING_INFO
prompt ================================
prompt
create table MAP_BUILDING_INFO
(
  building_id      NUMBER(10) not null,
  parent_id        NUMBER(10),
  building_name    VARCHAR2(100),
  building_desc    VARCHAR2(200),
  position         VARCHAR2(200),
  building_type    NUMBER(1),
  floor_num        NUMBER(2),
  status           NUMBER(1),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table MAP_BUILDING_INFO
  is '��Ž��������Ϣ';
comment on column MAP_BUILDING_INFO.building_id
  is '��������';
comment on column MAP_BUILDING_INFO.parent_id
  is '�����︸�ڵ���';
comment on column MAP_BUILDING_INFO.building_name
  is '����������';
comment on column MAP_BUILDING_INFO.building_desc
  is '����������';
comment on column MAP_BUILDING_INFO.position
  is '������GIS/�ȵ�λ��';
comment on column MAP_BUILDING_INFO.building_type
  is '���������ͣ�
1-С��/ѧУ
2-��¥';
comment on column MAP_BUILDING_INFO.floor_num
  is '������¥������';
comment on column MAP_BUILDING_INFO.status
  is '״̬��
0-��Ч
1-��Ч';
comment on column MAP_BUILDING_INFO.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column MAP_BUILDING_INFO.create_time
  is '����ʱ��';
comment on column MAP_BUILDING_INFO.last_modify_by
  is '����һ���޸���';
comment on column MAP_BUILDING_INFO.last_modify_time
  is '����һ���޸�ʱ��';
alter table MAP_BUILDING_INFO
  add constraint PK_MAP_BUILDING_INFO primary key (BUILDING_ID);

prompt
prompt Creating table MAP_ROOM_INFO
prompt ============================
prompt
create table MAP_ROOM_INFO
(
  room_id          NUMBER(10) not null,
  buliding_id      NUMBER(10),
  room_name        VARCHAR2(100),
  room_desc        VARCHAR2(200),
  room_type        NUMBER(2),
  room_image       VARCHAR2(250),
  floor_no         NUMBER(2),
  position         VARCHAR2(200),
  status           NUMBER(1),
  scene_id         NUMBER(10),
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table MAP_ROOM_INFO
  is '��ŷ������Ϣ';
comment on column MAP_ROOM_INFO.room_id
  is '������';
comment on column MAP_ROOM_INFO.buliding_id
  is '�������ڽ�����';
comment on column MAP_ROOM_INFO.room_name
  is '��������';
comment on column MAP_ROOM_INFO.room_desc
  is '��������';
comment on column MAP_ROOM_INFO.room_type
  is '�������ͣ�
1-����
2-������
3-ʵ����
4-Уʷ��
5-¥��
7-�칫��
8-����
9-ʳ��
10-����';
comment on column MAP_ROOM_INFO.room_image
  is '����ͼƬλ�ã����·��';
comment on column MAP_ROOM_INFO.floor_no
  is '����¥��';
comment on column MAP_ROOM_INFO.position
  is '�����ȵ�λ��';
comment on column MAP_ROOM_INFO.status
  is '״̬��
0-��Ч
1-��Ч';
comment on column MAP_ROOM_INFO.scene_id
  is '��ǰʹ�ó���ID';
comment on column MAP_ROOM_INFO.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column MAP_ROOM_INFO.create_time
  is '����ʱ��';
comment on column MAP_ROOM_INFO.last_modify_by
  is '����һ���޸���';
comment on column MAP_ROOM_INFO.last_modify_time
  is '����һ���޸�ʱ��';
alter table MAP_ROOM_INFO
  add constraint PK_MAP_ROOM_INFO primary key (ROOM_ID);
alter table MAP_ROOM_INFO
  add constraint FK_MAP_ROOM_REFERENCE_MAP_BUIL foreign key (BULIDING_ID)
  references MAP_BUILDING_INFO (BUILDING_ID);

prompt
prompt Creating table MEETING_INFO
prompt ===========================
prompt
create table MEETING_INFO
(
  meeting_id         NUMBER(10) not null,
  room_id            NUMBER(10),
  meeting_name       VARCHAR2(100),
  meeting_desc       VARCHAR2(200),
  start_time         VARCHAR2(12),
  end_time           VARCHAR2(12),
  notice_flag        NUMBER(2),
  notice_content     VARCHAR2(200),
  notice_status      NUMBER(2),
  subscribe_by       VARCHAR2(50),
  subscribe_time     VARCHAR2(14),
  scene_flag         NUMBER(2),
  scene_id           NUMBER(10),
  scene_early_time   NUMBER(4),
  scene_status       NUMBER(2),
  screen_flag        NUMBER(2),
  screen_early_time  NUMBER(4),
  screen_status      NUMBER(2),
  screen_file_path   VARCHAR2(200),
  screen_ids         VARCHAR2(200),
  meeting_status     NUMBER(1),
  prepare_by         VARCHAR2(500),
  subscribe_id       NUMBER(10),
  prepare_early_time NUMBER(4),
  prepare_status     NUMBER(2)
)
;
comment on table MEETING_INFO
  is '��Ż���Ԥ����Ϣ';
comment on column MEETING_INFO.meeting_id
  is '������';
comment on column MEETING_INFO.room_id
  is '������';
comment on column MEETING_INFO.meeting_name
  is '��������';
comment on column MEETING_INFO.meeting_desc
  is '��������';
comment on column MEETING_INFO.start_time
  is '���鿪ʼʱ�䣨YYYYMMDDHHMI��';
comment on column MEETING_INFO.end_time
  is '�������ʱ�䣨YYYYMMDDHHMI��';
comment on column MEETING_INFO.notice_flag
  is '����֪ͨ 0-������ 1-����';
comment on column MEETING_INFO.notice_content
  is '����֪ͨ����';
comment on column MEETING_INFO.notice_status
  is '����֪ͨ״̬ 0-δ���� 1-�ѷ���';
comment on column MEETING_INFO.subscribe_by
  is 'Ԥ����';
comment on column MEETING_INFO.subscribe_time
  is 'Ԥ��ʱ�䣨YYYYMMDDHHMISS��';
comment on column MEETING_INFO.scene_flag
  is '�Ƿ�Ӧ�ó���0-Ӧ�� 1-Ӧ��';
comment on column MEETING_INFO.scene_id
  is 'Ӧ�ó���ID';
comment on column MEETING_INFO.scene_early_time
  is '������ǰӦ��ʱ�䣨��λ�����ӣ�';
comment on column MEETING_INFO.scene_status
  is '����Ӧ��״̬ 0-δӦ�� 1-��Ӧ��';
comment on column MEETING_INFO.screen_flag
  is '�Ƿ�Ӧ����ʾ�� 0-Ӧ�� 1-Ӧ��';
comment on column MEETING_INFO.screen_early_time
  is '��ʾ����ǰӦ��ʱ�䣨��λ�����ӣ�';
comment on column MEETING_INFO.screen_status
  is '��ʾ��Ӧ��״̬ 0-δӦ�� 1-��Ӧ��';
comment on column MEETING_INFO.screen_file_path
  is '��ʾ�������ļ�·��';
comment on column MEETING_INFO.screen_ids
  is 'Ӧ�õ���Щ��ʾ�������֮���Զ��ŷָ�';
comment on column MEETING_INFO.meeting_status
  is '״̬��
0-ȡ����
1-������
2-������';
comment on column MEETING_INFO.prepare_by
  is '����ﱸ��';
comment on column MEETING_INFO.subscribe_id
  is 'Ԥ����ID';
comment on column MEETING_INFO.prepare_early_time
  is '��ǰ�ﱸʱ�䣨��λ�����ӣ�';
alter table MEETING_INFO
  add constraint PK_MEETING_INFO primary key (MEETING_ID);

prompt
prompt Creating table MEETING_TARGET_INFO
prompt ==================================
prompt
create table MEETING_TARGET_INFO
(
  id         NUMBER(10) not null,
  meeting_id NUMBER(10),
  login_id   NUMBER(10) not null
)
;
comment on table MEETING_TARGET_INFO
  is '��Ż����������Ϣ';
comment on column MEETING_TARGET_INFO.id
  is '����������';
comment on column MEETING_TARGET_INFO.meeting_id
  is '����Ԥ�����';
comment on column MEETING_TARGET_INFO.login_id
  is '���������';
alter table MEETING_TARGET_INFO
  add constraint PK_MEETING_TARGET_INFO primary key (ID);

prompt
prompt Creating table SCENE_INFO
prompt =========================
prompt
create table SCENE_INFO
(
  scene_id          NUMBER(10) not null,
  room_id           NUMBER(10),
  scene_name        VARCHAR2(100),
  scene_desc        VARCHAR2(200),
  scene_type        NUMBER(2),
  scene_start_time  VARCHAR2(14),
  scene_end_time    VARCHAR2(14),
  valid_start_date  VARCHAR2(14),
  valid_end_date    VARCHAR2(14),
  trigger_type      NUMBER(2),
  trigger_condition NUMBER(2),
  trigger_value     VARCHAR2(20),
  scene_status      NUMBER(2)
)
;
comment on table SCENE_INFO
  is '��ų���������Ϣ';
comment on column SCENE_INFO.room_id
  is '������';
comment on column SCENE_INFO.scene_name
  is '��������';
comment on column SCENE_INFO.scene_desc
  is '��������';
comment on column SCENE_INFO.scene_type
  is '��������
1-�ֶ�����
2-�Զ�����';
comment on column SCENE_INFO.scene_start_time
  is '����������ʼʱ�� HHMM';
comment on column SCENE_INFO.scene_end_time
  is '������������ʱ�� HHMM';
comment on column SCENE_INFO.valid_start_date
  is '������Ч�ڿ�ʼ���� YYYYMMDD';
comment on column SCENE_INFO.valid_end_date
  is '������Ч�ڽ������� YYYYMMDD';
comment on column SCENE_INFO.trigger_type
  is '������������:1-�¶� 2-ʪ��';
comment on column SCENE_INFO.trigger_condition
  is '���������жϣ�1-���� 2-���ڵ��� 3-С�� 4-С�ڵ���';
comment on column SCENE_INFO.trigger_value
  is '��������ֵ';
comment on column SCENE_INFO.scene_status
  is '״̬�� 0-ͣ�� 1-��Ч';
alter table SCENE_INFO
  add constraint PK_SCENE_INFO primary key (SCENE_ID);

prompt
prompt Creating table SCENE_CONFIG_INFO
prompt ================================
prompt
create table SCENE_CONFIG_INFO
(
  id         NUMBER(10) not null,
  scene_id   NUMBER(10),
  dev_id     NUMBER(10),
  attr_key   VARCHAR2(50),
  attr_value VARCHAR2(20)
)
;
comment on table SCENE_CONFIG_INFO
  is '��ų���������Ϣ';
comment on column SCENE_CONFIG_INFO.id
  is 'ID';
comment on column SCENE_CONFIG_INFO.scene_id
  is '����ID';
comment on column SCENE_CONFIG_INFO.dev_id
  is '�豸ID';
comment on column SCENE_CONFIG_INFO.attr_key
  is '����ID';
comment on column SCENE_CONFIG_INFO.attr_value
  is '����ֵ';
alter table SCENE_CONFIG_INFO
  add constraint PK_SCENE_CONFIG_INFO primary key (ID);
alter table SCENE_CONFIG_INFO
  add constraint FK_SCENE_CO_REFERENCE_SCENE_IN foreign key (SCENE_ID)
  references SCENE_INFO (SCENE_ID);

prompt
prompt Creating table SMS_TASK
prompt =======================
prompt
create table SMS_TASK
(
  id          NUMBER(10) not null,
  terminalids VARCHAR2(1000) not null,
  content     VARCHAR2(200),
  task_type   NUMBER(1) default 1,
  sign        VARCHAR2(100),
  status      NUMBER(1)
)
;
alter table SMS_TASK
  add constraint PK_SMS_TASK primary key (ID);

prompt
prompt Creating table SYS_CORP
prompt =======================
prompt
create table SYS_CORP
(
  corp_id          NUMBER(10) not null,
  parent_corp_id   NUMBER(10) not null,
  corp_name        VARCHAR2(50) not null,
  corp_type        NUMBER(2) not null,
  corp_desc        VARCHAR2(200),
  status           NUMBER(2) not null,
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table SYS_CORP
  is '��ŵ�λ��Ϣ';
comment on column SYS_CORP.corp_id
  is 'ID������';
comment on column SYS_CORP.parent_corp_id
  is 'ʡ��˾�ϼ���λ���Ϊ-1';
comment on column SYS_CORP.corp_name
  is '��λ����';
comment on column SYS_CORP.corp_type
  is '1 - ��λ
2 - ����
';
comment on column SYS_CORP.corp_desc
  is '��λ����';
comment on column SYS_CORP.status
  is '״̬
0����Ч
1����Ч';
comment on column SYS_CORP.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column SYS_CORP.create_time
  is '����ʱ��';
comment on column SYS_CORP.last_modify_by
  is '����һ���޸���';
comment on column SYS_CORP.last_modify_time
  is '����һ���޸�ʱ��';
alter table SYS_CORP
  add constraint PK_SYS_CORP primary key (CORP_ID);

prompt
prompt Creating table SYS_DEPT
prompt =======================
prompt
create table SYS_DEPT
(
  dept_id          NUMBER(10) not null,
  dept_name        VARCHAR2(50),
  corp_id          NUMBER(10) not null,
  status           NUMBER(2) not null,
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14),
  parent_dept_id   NUMBER(10)
)
;
comment on column SYS_DEPT.dept_id
  is '���ű��';
comment on column SYS_DEPT.dept_name
  is '��������';
comment on column SYS_DEPT.corp_id
  is '��λ���';
comment on column SYS_DEPT.status
  is '״̬
0����Ч
1����Ч';
comment on column SYS_DEPT.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column SYS_DEPT.create_time
  is '����ʱ��';
comment on column SYS_DEPT.last_modify_by
  is '����һ���޸���';
comment on column SYS_DEPT.last_modify_time
  is '����һ���޸�ʱ��';
comment on column SYS_DEPT.parent_dept_id
  is '�ϼ����ű��';
alter table SYS_DEPT
  add constraint PK_SYS_DEPT primary key (DEPT_ID);

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  log_id         NUMBER(10) not null,
  oper_user_id   NUMBER(10) not null,
  oper_user_name VARCHAR2(50) not null,
  oper_type      NUMBER(2) not null,
  oper_time      VARCHAR2(14) not null,
  oper_ip        VARCHAR2(20) not null,
  oper_desc      VARCHAR2(200),
  system_id      NUMBER(2) not null
)
;
comment on table SYS_LOG
  is 'ϵͳ��־��-��¼ϵͳ�е���ɾ�Ĳ��¼�Ȳ���';
comment on column SYS_LOG.log_id
  is '��־���';
comment on column SYS_LOG.oper_user_id
  is '������ID';
comment on column SYS_LOG.oper_user_name
  is '����������';
comment on column SYS_LOG.oper_type
  is '��������0����¼ ��1�����ӣ�2��ɾ����3���޸�';
comment on column SYS_LOG.oper_time
  is '����ʱ�䣺��YYYYMMDDHHMISS��';
comment on column SYS_LOG.oper_ip
  is '������ip��192.168.1.1';
comment on column SYS_LOG.oper_desc
  is '�Ե�ǰ��������ϸ������';
comment on column SYS_LOG.system_id
  is '��־����ϵͳ';
alter table SYS_LOG
  add constraint PK_SYS_LOG primary key (LOG_ID);

prompt
prompt Creating table SYS_LOGIN
prompt ========================
prompt
create table SYS_LOGIN
(
  login_id         NUMBER(10) not null,
  login_name       VARCHAR2(50) not null,
  login_pwd        VARCHAR2(32) not null,
  user_name        VARCHAR2(20),
  user_type        NUMBER(2) not null,
  corp_id          NUMBER(10),
  dept_id          NUMBER(10),
  system_id        NUMBER(2) not null,
  email            VARCHAR2(100),
  tel              VARCHAR2(21),
  valid_tag        CHAR(1),
  valid_date       VARCHAR2(14),
  user_remark      VARCHAR2(200),
  record_corp_id   NUMBER(10),
  login_last_time  VARCHAR2(14),
  status           NUMBER(2) not null,
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14),
  car_no           VARCHAR2(20),
  user_code        VARCHAR2(50)
)
;
comment on table SYS_LOGIN
  is '�����¼�ʺ���Ϣ';
comment on column SYS_LOGIN.login_id
  is 'ID������';
comment on column SYS_LOGIN.login_name
  is '��¼�û���';
comment on column SYS_LOGIN.login_pwd
  is '��¼����';
comment on column SYS_LOGIN.user_name
  is ' �û���ʵ����';
comment on column SYS_LOGIN.user_type
  is '0����������Ա
1������Ա
2������Ա';
comment on column SYS_LOGIN.corp_id
  is '�û�������λ���';
comment on column SYS_LOGIN.dept_id
  is '�û��������ű��';
comment on column SYS_LOGIN.system_id
  is '�û�����ϵͳ';
comment on column SYS_LOGIN.email
  is '�û�email��ַ';
comment on column SYS_LOGIN.tel
  is '��ϵ�绰';
comment on column SYS_LOGIN.valid_tag
  is '�Ƿ�������Ч
Y��������Ч
N����ʱ������';
comment on column SYS_LOGIN.valid_date
  is '��Ч���ڣ����Ƿ�������ЧΪNʱ���ֶβ���ֵ';
comment on column SYS_LOGIN.user_remark
  is '�û�����';
comment on column SYS_LOGIN.record_corp_id
  is '�û��Ĵ�����λ��Ĭ��˭����˭����';
comment on column SYS_LOGIN.login_last_time
  is '���һ�ε�¼ʱ��';
comment on column SYS_LOGIN.status
  is '״̬
0����Ч
1����Ч';
comment on column SYS_LOGIN.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column SYS_LOGIN.create_time
  is '����ʱ��';
comment on column SYS_LOGIN.last_modify_by
  is '����һ���޸���';
comment on column SYS_LOGIN.last_modify_time
  is '����һ���޸�ʱ��';
comment on column SYS_LOGIN.car_no
  is '���ƺ�';
comment on column SYS_LOGIN.user_code
  is '�û����';
alter table SYS_LOGIN
  add constraint PK_SYS_LOGIN primary key (LOGIN_ID);
alter table SYS_LOGIN
  add constraint FK_SYS_LOGI_REFERENCE_SYS_CORP foreign key (CORP_ID)
  references SYS_CORP (CORP_ID);
alter table SYS_LOGIN
  add constraint FK_SYS_LOGI_REFERENCE_SYS_DEPT foreign key (DEPT_ID)
  references SYS_DEPT (DEPT_ID);

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SYS_ROLE
(
  role_id          NUMBER(10) not null,
  role_name        VARCHAR2(50) not null,
  role_desc        VARCHAR2(200),
  corp_id          NUMBER(10) not null,
  system_id        NUMBER(2) not null,
  status           NUMBER(2) not null,
  create_by        VARCHAR2(50),
  create_time      VARCHAR2(14),
  last_modify_by   VARCHAR2(50),
  last_modify_time VARCHAR2(14)
)
;
comment on table SYS_ROLE
  is '����ϵͳ��ɫ��Ϣ����ɫ��һ��Ȩ�޵ļ���';
comment on column SYS_ROLE.role_id
  is 'ID������';
comment on column SYS_ROLE.role_name
  is '��ɫ����';
comment on column SYS_ROLE.role_desc
  is '��ɫ����';
comment on column SYS_ROLE.corp_id
  is '��ɫ������λ���';
comment on column SYS_ROLE.system_id
  is '��ɫ����ϵͳ
';
comment on column SYS_ROLE.status
  is '״̬
0����Ч
1����Ч';
comment on column SYS_ROLE.create_by
  is '������
ϵͳ�Զ�������˴�Ϊsystem';
comment on column SYS_ROLE.create_time
  is '����ʱ��';
comment on column SYS_ROLE.last_modify_by
  is '����һ���޸���';
comment on column SYS_ROLE.last_modify_time
  is '����һ���޸�ʱ��';
alter table SYS_ROLE
  add constraint PK_SYS_ROLE primary key (ROLE_ID);

prompt
prompt Creating table SYS_LOGIN_ROLE
prompt =============================
prompt
create table SYS_LOGIN_ROLE
(
  id       NUMBER(10) not null,
  role_id  NUMBER(10),
  login_id NUMBER(10)
)
;
comment on table SYS_LOGIN_ROLE
  is '�����¼�����ɫ�Ĺ�����ϵ��һ����¼�߿�����һ��������ɫ';
comment on column SYS_LOGIN_ROLE.id
  is 'ID������';
comment on column SYS_LOGIN_ROLE.role_id
  is 'ID������';
comment on column SYS_LOGIN_ROLE.login_id
  is 'ID������';
alter table SYS_LOGIN_ROLE
  add constraint PK_SYS_LOGIN_ROLE primary key (ID);
alter table SYS_LOGIN_ROLE
  add constraint FK_SYS_LOGI_REFERENCE_SYS_LOGI foreign key (LOGIN_ID)
  references SYS_LOGIN (LOGIN_ID);
alter table SYS_LOGIN_ROLE
  add constraint FK_SYS_LOGI_REFERENCE_SYS_ROLE foreign key (ROLE_ID)
  references SYS_ROLE (ROLE_ID);

prompt
prompt Creating table SYS_PERMISSION
prompt =============================
prompt
create table SYS_PERMISSION
(
  permission_id        NUMBER(10) not null,
  permission_name      VARCHAR2(50) not null,
  permission_type      NUMBER(2) not null,
  permission_url       VARCHAR2(250),
  permission_sort      NUMBER(10) not null,
  parent_permission_id NUMBER(10),
  system_id            NUMBER(2) not null,
  status               NUMBER(2) not null,
  permission_ico       VARCHAR2(100)
)
;
comment on column SYS_PERMISSION.permission_id
  is 'ID������';
comment on column SYS_PERMISSION.permission_name
  is 'Ȩ������';
comment on column SYS_PERMISSION.permission_type
  is 'Ȩ������
1���˵�
2������';
comment on column SYS_PERMISSION.permission_url
  is '��Ȩ������Ϊ�˵�ʱ���ô���ʾ�˵���URL
��Ȩ������Ϊ����ʱ���ô���ʾ������Ӧ�İ�ť����';
comment on column SYS_PERMISSION.permission_sort
  is '����չ�ֵ�����˳������
1
   11
   12
2
   21
   22';
comment on column SYS_PERMISSION.parent_permission_id
  is '�ϼ�Ȩ��ID';
comment on column SYS_PERMISSION.system_id
  is '�ò˵�������ϵͳ';
comment on column SYS_PERMISSION.status
  is '״̬
0����Ч
1����Ч';
alter table SYS_PERMISSION
  add constraint PK_SYS_PERMISSION primary key (PERMISSION_ID);

prompt
prompt Creating table SYS_ROLE_PERMISSION
prompt ==================================
prompt
create table SYS_ROLE_PERMISSION
(
  id            NUMBER(10) not null,
  permission_id NUMBER(10),
  role_id       NUMBER(10)
)
;
comment on table SYS_ROLE_PERMISSION
  is '�����ɫ��Ȩ�޵Ĺ�����ϵ��һ����ɫ������һ������Ȩ��';
comment on column SYS_ROLE_PERMISSION.id
  is 'ID������';
comment on column SYS_ROLE_PERMISSION.permission_id
  is '�˵�ID������';
comment on column SYS_ROLE_PERMISSION.role_id
  is 'ID������';
alter table SYS_ROLE_PERMISSION
  add constraint PK_SYS_ROLE_PERMISSION primary key (ID);
alter table SYS_ROLE_PERMISSION
  add constraint FK_SYS_ROLE_REFERENCE_SYS_PERM foreign key (PERMISSION_ID)
  references SYS_PERMISSION (PERMISSION_ID);
alter table SYS_ROLE_PERMISSION
  add constraint FK_SYS_ROLE_REFERENCE_SYS_ROLE foreign key (ROLE_ID)
  references SYS_ROLE (ROLE_ID);

prompt
prompt Creating table SYS_ROLE_ROOM
prompt ============================
prompt
create table SYS_ROLE_ROOM
(
  id            NUMBER(10) not null,
  role_id       NUMBER(10),
  room_id       NUMBER(10),
  controll_flag NUMBER(2)
)
;
comment on column SYS_ROLE_ROOM.id
  is 'ID,����';
comment on column SYS_ROLE_ROOM.role_id
  is 'ID������';
comment on column SYS_ROLE_ROOM.room_id
  is '����ID';
comment on column SYS_ROLE_ROOM.controll_flag
  is '�Ƿ�ɿ��� 0-���ɿ��� 1-�ɿ���';
alter table SYS_ROLE_ROOM
  add constraint PK_SYS_ROLE_ROOM primary key (ID);
alter table SYS_ROLE_ROOM
  add constraint FK_SYS_ROLE_REF_ROLE_ROOM foreign key (ROLE_ID)
  references SYS_ROLE (ROLE_ID);

prompt
prompt Creating sequence SEQ_DEV_ALARM_CONFIG
prompt ======================================
prompt
create sequence SEQ_DEV_ALARM_CONFIG
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_ALARM_LOG
prompt ===================================
prompt
create sequence SEQ_DEV_ALARM_LOG
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_ATTRIBUTES
prompt ====================================
prompt
create sequence SEQ_DEV_ATTRIBUTES
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_ATTR_HISTORY_INFO
prompt ===========================================
prompt
create sequence SEQ_DEV_ATTR_HISTORY_INFO
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_ATTR_INFO
prompt ===================================
prompt
create sequence SEQ_DEV_ATTR_INFO
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_CLASS_GROUP
prompt =====================================
prompt
create sequence SEQ_DEV_CLASS_GROUP
minvalue 1
maxvalue 9999999999
start with 1020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_CLASS_INFO
prompt ====================================
prompt
create sequence SEQ_DEV_CLASS_INFO
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_INFO
prompt ==============================
prompt
create sequence SEQ_DEV_INFO
minvalue 1
maxvalue 9999999999
start with 1240
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_DEV_STATUS
prompt ================================
prompt
create sequence SEQ_DEV_STATUS
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MAP_BUILDING_INFO
prompt =======================================
prompt
create sequence SEQ_MAP_BUILDING_INFO
minvalue 1
maxvalue 9999999999
start with 1020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MAP_ROOM_INFO
prompt ===================================
prompt
create sequence SEQ_MAP_ROOM_INFO
minvalue 1
maxvalue 9999999999
start with 1020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING
prompt =============================
prompt
create sequence SEQ_MEETING
minvalue 1
maxvalue 9999999999
start with 1280
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING_TARGET
prompt ====================================
prompt
create sequence SEQ_MEETING_TARGET
minvalue 1
maxvalue 9999999999
start with 3040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SCENE_CONFIG
prompt ==================================
prompt
create sequence SEQ_SCENE_CONFIG
minvalue 1
maxvalue 9999999999
start with 1240
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SCENE_INFO
prompt ================================
prompt
create sequence SEQ_SCENE_INFO
minvalue 1
maxvalue 9999999999
start with 1160
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SMS_TASK
prompt ==============================
prompt
create sequence SEQ_SMS_TASK
minvalue 1
maxvalue 999999999999999999999999999
start with 1061
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_CORP
prompt ==============================
prompt
create sequence SEQ_SYS_CORP
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_DEPT
prompt ==============================
prompt
create sequence SEQ_SYS_DEPT
minvalue 1
maxvalue 9999999999
start with 1060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_LOG
prompt =============================
prompt
create sequence SEQ_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 3480
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_LOGIN
prompt ===============================
prompt
create sequence SEQ_SYS_LOGIN
minvalue 1
maxvalue 9999999999
start with 9980
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_LOGIN_ROLE
prompt ====================================
prompt
create sequence SEQ_SYS_LOGIN_ROLE
minvalue 1
maxvalue 99999999999
start with 10020
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_PERMISSION
prompt ====================================
prompt
create sequence SEQ_SYS_PERMISSION
minvalue 1
maxvalue 9999999999
start with 1000
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE
prompt ==============================
prompt
create sequence SEQ_SYS_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1040
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE_PERMISSION
prompt =========================================
prompt
create sequence SEQ_SYS_ROLE_PERMISSION
minvalue 1
maxvalue 999999999999999
start with 1060
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE_ROOM
prompt ===================================
prompt
create sequence SEQ_SYS_ROLE_ROOM
minvalue 1
maxvalue 99999999999
start with 1060
increment by 1
cache 20;


spool off
