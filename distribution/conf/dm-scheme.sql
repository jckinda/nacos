CREATE TABLE NACOS.CONFIG_INFO
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128),
CONTENT CLOB NOT NULL,
MD5 VARCHAR(32),
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
SRC_USER TEXT,
SRC_IP VARCHAR(50),
APP_NAME VARCHAR(128),
TENANT_ID VARCHAR(128) DEFAULT '',
C_DESC VARCHAR(256),
C_USE VARCHAR(64),
EFFECT VARCHAR(64),
TYPE VARCHAR(64),
C_SCHEMA TEXT,
ENCRYPTED_DATA_KEY VARCHAR(1024) DEFAULT '' NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_CONFIGINFO_DATAGROUPTENANT UNIQUE(DATA_ID, GROUP_ID, TENANT_ID))  ;

COMMENT ON TABLE NACOS.CONFIG_INFO IS 'config_info';
COMMENT ON COLUMN NACOS.CONFIG_INFO.APP_NAME IS 'app_name';
COMMENT ON COLUMN NACOS.CONFIG_INFO.CONTENT IS 'content';
COMMENT ON COLUMN NACOS.CONFIG_INFO.C_DESC IS 'configuration description';
COMMENT ON COLUMN NACOS.CONFIG_INFO.C_SCHEMA IS '配置的模式';
COMMENT ON COLUMN NACOS.CONFIG_INFO.C_USE IS 'configuration usage';
COMMENT ON COLUMN NACOS.CONFIG_INFO.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO.EFFECT IS '配置生效的描述';
COMMENT ON COLUMN NACOS.CONFIG_INFO.ENCRYPTED_DATA_KEY IS '密钥';
COMMENT ON COLUMN NACOS.CONFIG_INFO.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO.ID IS 'id';
COMMENT ON COLUMN NACOS.CONFIG_INFO.MD5 IS 'md5';
COMMENT ON COLUMN NACOS.CONFIG_INFO.SRC_IP IS 'source ip';
COMMENT ON COLUMN NACOS.CONFIG_INFO.SRC_USER IS 'source user';
COMMENT ON COLUMN NACOS.CONFIG_INFO.TENANT_ID IS '租户字段';
COMMENT ON COLUMN NACOS.CONFIG_INFO.TYPE IS '配置的类型';


CREATE TABLE NACOS.CONFIG_INFO_BETA
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128) NOT NULL,
APP_NAME VARCHAR(128),
CONTENT CLOB NOT NULL,
BETA_IPS VARCHAR(1024),
MD5 VARCHAR(32),
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
SRC_USER TEXT,
SRC_IP VARCHAR(50),
TENANT_ID VARCHAR(128) DEFAULT '',
ENCRYPTED_DATA_KEY VARCHAR(1024) DEFAULT '' NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_CONFIGINFOBETA_DATAGROUPTENANT UNIQUE(DATA_ID, GROUP_ID, TENANT_ID))  ;

COMMENT ON TABLE NACOS.CONFIG_INFO_BETA IS 'config_info_beta';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.APP_NAME IS 'app_name';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.BETA_IPS IS 'betaIps';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.CONTENT IS 'content';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.ENCRYPTED_DATA_KEY IS '密钥';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.ID IS 'id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.MD5 IS 'md5';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.SRC_IP IS 'source ip';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.SRC_USER IS 'source user';
COMMENT ON COLUMN NACOS.CONFIG_INFO_BETA.TENANT_ID IS '租户字段';


CREATE TABLE NACOS.CONFIG_INFO_GRAY
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128) NOT NULL,
CONTENT CLOB NOT NULL,
MD5 VARCHAR(32),
SRC_USER TEXT,
SRC_IP VARCHAR(100),
GMT_CREATE TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
GMT_MODIFIED TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
APP_NAME VARCHAR(128),
TENANT_ID VARCHAR(128) DEFAULT '',
GRAY_NAME VARCHAR(128) NOT NULL,
GRAY_RULE TEXT NOT NULL,
ENCRYPTED_DATA_KEY VARCHAR(256) DEFAULT '' NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_CONFIGINFOGRAY_DATAGROUPTENANTGRAY UNIQUE(DATA_ID, GROUP_ID, TENANT_ID, GRAY_NAME))  ;

COMMENT ON TABLE NACOS.CONFIG_INFO_GRAY IS 'config_info_gray';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.APP_NAME IS 'app_name';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.CONTENT IS 'content';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.ENCRYPTED_DATA_KEY IS 'encrypted_data_key';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.GMT_CREATE IS 'gmt_create';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.GMT_MODIFIED IS 'gmt_modified';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.GRAY_NAME IS 'gray_name';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.GRAY_RULE IS 'gray_rule';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.ID IS 'id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.MD5 IS 'md5';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.SRC_IP IS 'src_ip';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.SRC_USER IS 'src_user';
COMMENT ON COLUMN NACOS.CONFIG_INFO_GRAY.TENANT_ID IS 'tenant_id';


CREATE  INDEX IDX_DATAID_GMT_MODIFIED ON NACOS.CONFIG_INFO_GRAY(DATA_ID ASC,GMT_MODIFIED ASC)  ;
CREATE  INDEX IDX_GMT_MODIFIED ON NACOS.CONFIG_INFO_GRAY(GMT_MODIFIED ASC)  ;

CREATE TABLE NACOS.CONFIG_INFO_TAG
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128) NOT NULL,
TENANT_ID VARCHAR(128) DEFAULT '',
TAG_ID VARCHAR(128) NOT NULL,
APP_NAME VARCHAR(128),
CONTENT CLOB NOT NULL,
MD5 VARCHAR(32),
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
SRC_USER TEXT,
SRC_IP VARCHAR(50),
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_CONFIGINFOTAG_DATAGROUPTENANTTAG UNIQUE(DATA_ID, GROUP_ID, TENANT_ID, TAG_ID))  ;

COMMENT ON TABLE NACOS.CONFIG_INFO_TAG IS 'config_info_tag';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.APP_NAME IS 'app_name';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.CONTENT IS 'content';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.ID IS 'id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.MD5 IS 'md5';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.SRC_IP IS 'source ip';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.SRC_USER IS 'source user';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.TAG_ID IS 'tag_id';
COMMENT ON COLUMN NACOS.CONFIG_INFO_TAG.TENANT_ID IS 'tenant_id';


CREATE TABLE NACOS.CONFIG_TAGS_RELATION
(
ID BIGINT NOT NULL,
TAG_NAME VARCHAR(128) NOT NULL,
TAG_TYPE VARCHAR(64),
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128) NOT NULL,
TENANT_ID VARCHAR(128) DEFAULT '',
NID BIGINT IDENTITY(1, 1) NOT NULL,
NOT CLUSTER PRIMARY KEY(NID),
CONSTRAINT UK_CONFIGTAGRELATION_CONFIGIDTAG UNIQUE(ID, TAG_NAME, TAG_TYPE))  ;

COMMENT ON TABLE NACOS.CONFIG_TAGS_RELATION IS 'config_tag_relation';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.ID IS 'id';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.NID IS 'nid, 自增长标识';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.TAG_NAME IS 'tag_name';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.TAG_TYPE IS 'tag_type';
COMMENT ON COLUMN NACOS.CONFIG_TAGS_RELATION.TENANT_ID IS 'tenant_id';


CREATE  INDEX IDX_TENANT_ID ON NACOS.CONFIG_TAGS_RELATION(TENANT_ID ASC)  ;

CREATE TABLE NACOS.GROUP_CAPACITY
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
GROUP_ID VARCHAR(128) DEFAULT '' NOT NULL,
QUOTA BIGINT DEFAULT 0 NOT NULL,
USAGE BIGINT DEFAULT 0 NOT NULL,
MAX_SIZE BIGINT DEFAULT 0 NOT NULL,
MAX_AGGR_COUNT BIGINT DEFAULT 0 NOT NULL,
MAX_AGGR_SIZE BIGINT DEFAULT 0 NOT NULL,
MAX_HISTORY_COUNT BIGINT DEFAULT 0 NOT NULL,
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_GROUP_ID UNIQUE(GROUP_ID),
CHECK(QUOTA >= 0)
,CHECK(USAGE >= 0)
,CHECK(MAX_SIZE >= 0)
,CHECK(MAX_AGGR_COUNT >= 0)
,CHECK(MAX_AGGR_SIZE >= 0)
,CHECK(MAX_HISTORY_COUNT >= 0))  ;

COMMENT ON TABLE NACOS.GROUP_CAPACITY IS '集群、各Group容量信息表';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.GROUP_ID IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.ID IS '主键ID';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.MAX_AGGR_COUNT IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.MAX_AGGR_SIZE IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.MAX_HISTORY_COUNT IS '最大变更历史数量';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.MAX_SIZE IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.QUOTA IS '配额，0表示使用默认值';
COMMENT ON COLUMN NACOS.GROUP_CAPACITY.USAGE IS '使用量';


CREATE TABLE NACOS.HIS_CONFIG_INFO
(
ID DECIMAL(20,0) NOT NULL,
NID BIGINT IDENTITY(1, 1) NOT NULL,
DATA_ID VARCHAR(255) NOT NULL,
GROUP_ID VARCHAR(128) NOT NULL,
APP_NAME VARCHAR(128),
CONTENT CLOB NOT NULL,
MD5 VARCHAR(32),
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
SRC_USER TEXT,
SRC_IP VARCHAR(50),
OP_TYPE CHAR(10),
TENANT_ID VARCHAR(128) DEFAULT '',
ENCRYPTED_DATA_KEY VARCHAR(1024) DEFAULT '' NOT NULL,
PUBLISH_TYPE VARCHAR(50) DEFAULT 'formal',
GRAY_NAME VARCHAR(50),
EXT_INFO CLOB,
NOT CLUSTER PRIMARY KEY(NID),
CHECK(ID >= 0))  ;

COMMENT ON TABLE NACOS.HIS_CONFIG_INFO IS '多租户改造';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.APP_NAME IS 'app_name';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.CONTENT IS 'content';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.DATA_ID IS 'data_id';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.ENCRYPTED_DATA_KEY IS '密钥';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.EXT_INFO IS 'ext info';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.GRAY_NAME IS 'gray name';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.GROUP_ID IS 'group_id';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.ID IS 'id';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.MD5 IS 'md5';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.NID IS 'nid, 自增标识';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.OP_TYPE IS 'operation type';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.PUBLISH_TYPE IS 'publish type gray or formal';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.SRC_IP IS 'source ip';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.SRC_USER IS 'source user';
COMMENT ON COLUMN NACOS.HIS_CONFIG_INFO.TENANT_ID IS '租户字段';


CREATE  INDEX IDX_DID ON NACOS.HIS_CONFIG_INFO(DATA_ID ASC)  ;
CREATE  INDEX IDX_GMT_CREATE ON NACOS.HIS_CONFIG_INFO(GMT_CREATE ASC)  ;
CREATE  INDEX INDEX1925591867946532 ON NACOS.HIS_CONFIG_INFO(GMT_MODIFIED ASC)  ;

CREATE TABLE NACOS.PERMISSIONS
(
ROLE VARCHAR(50) NOT NULL,
RESOURCE VARCHAR(128) NOT NULL,
ACTION VARCHAR(8) NOT NULL,
CONSTRAINT UK_ROLE_PERMISSION UNIQUE(ROLE, RESOURCE, ACTION))  ;

COMMENT ON COLUMN NACOS.PERMISSIONS.ACTION IS 'action';
COMMENT ON COLUMN NACOS.PERMISSIONS.RESOURCE IS 'resource';
COMMENT ON COLUMN NACOS.PERMISSIONS.ROLE IS 'role';


CREATE TABLE NACOS.ROLES
(
USERNAME VARCHAR(50) NOT NULL,
ROLE VARCHAR(50) NOT NULL,
CONSTRAINT IDX_USER_ROLE UNIQUE(USERNAME, ROLE))  ;

COMMENT ON COLUMN NACOS.ROLES.ROLE IS 'role';
COMMENT ON COLUMN NACOS.ROLES.USERNAME IS 'username';


CREATE TABLE NACOS.TENANT_CAPACITY
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
TENANT_ID VARCHAR(128) DEFAULT '' NOT NULL,
QUOTA BIGINT DEFAULT 0 NOT NULL,
USAGE BIGINT DEFAULT 0 NOT NULL,
MAX_SIZE BIGINT DEFAULT 0 NOT NULL,
MAX_AGGR_COUNT BIGINT DEFAULT 0 NOT NULL,
MAX_AGGR_SIZE BIGINT DEFAULT 0 NOT NULL,
MAX_HISTORY_COUNT BIGINT DEFAULT 0 NOT NULL,
GMT_CREATE TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
GMT_MODIFIED TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP() NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_TENANT_ID UNIQUE(TENANT_ID),
CHECK(QUOTA >= 0)
,CHECK(USAGE >= 0)
,CHECK(MAX_SIZE >= 0)
,CHECK(MAX_AGGR_COUNT >= 0)
,CHECK(MAX_AGGR_SIZE >= 0)
,CHECK(MAX_HISTORY_COUNT >= 0))  ;

COMMENT ON TABLE NACOS.TENANT_CAPACITY IS '租户容量信息表';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.ID IS '主键ID';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.MAX_AGGR_COUNT IS '聚合子配置最大个数';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.MAX_AGGR_SIZE IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.MAX_HISTORY_COUNT IS '最大变更历史数量';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.MAX_SIZE IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.QUOTA IS '配额，0表示使用默认值';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.TENANT_ID IS 'Tenant ID';
COMMENT ON COLUMN NACOS.TENANT_CAPACITY.USAGE IS '使用量';


CREATE TABLE NACOS.TENANT_INFO
(
ID BIGINT IDENTITY(1, 1) NOT NULL,
KP VARCHAR(128) NOT NULL,
TENANT_ID VARCHAR(128) DEFAULT '',
TENANT_NAME VARCHAR(128) DEFAULT '',
TENANT_DESC VARCHAR(256),
CREATE_SOURCE VARCHAR(32),
GMT_CREATE BIGINT NOT NULL,
GMT_MODIFIED BIGINT NOT NULL,
NOT CLUSTER PRIMARY KEY(ID),
CONSTRAINT UK_TENANT_INFO_KPTENANTID UNIQUE(KP, TENANT_ID))  ;

COMMENT ON TABLE NACOS.TENANT_INFO IS 'tenant_info';
COMMENT ON COLUMN NACOS.TENANT_INFO.CREATE_SOURCE IS 'create_source';
COMMENT ON COLUMN NACOS.TENANT_INFO.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN NACOS.TENANT_INFO.GMT_MODIFIED IS '修改时间';
COMMENT ON COLUMN NACOS.TENANT_INFO.ID IS 'id';
COMMENT ON COLUMN NACOS.TENANT_INFO.KP IS 'kp';
COMMENT ON COLUMN NACOS.TENANT_INFO.TENANT_DESC IS 'tenant_desc';
COMMENT ON COLUMN NACOS.TENANT_INFO.TENANT_ID IS 'tenant_id';
COMMENT ON COLUMN NACOS.TENANT_INFO.TENANT_NAME IS 'tenant_name';


CREATE  INDEX INDEX1925591900828345 ON NACOS.TENANT_INFO(TENANT_ID ASC)  ;

CREATE TABLE NACOS.USERS
(
USERNAME VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(500) NOT NULL,
ENABLED TINYINT NOT NULL,
NOT CLUSTER PRIMARY KEY(USERNAME))  ;

COMMENT ON COLUMN NACOS.USERS.ENABLED IS 'enabled';
COMMENT ON COLUMN NACOS.USERS.PASSWORD IS 'password';
COMMENT ON COLUMN NACOS.USERS.USERNAME IS 'username';


