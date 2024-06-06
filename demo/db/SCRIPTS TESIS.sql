CREATE DATABASE  IF NOT EXISTS `seminario-final` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `seminario-final`;

create table ROLES(
   ROL_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   ROL_NOMBRE VARCHAR(50) NOT NULL,
   ROL_USU_ID_ALTA INT UNSIGNED,
   ROL_USU_ID_BAJA INT UNSIGNED,
   ROL_USU_ID_MODIFICACION INT UNSIGNED,
   ROL_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   ROL_FECHA_BAJA DATETIME,
   ROL_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( ROL_ID )
 );

create table USUARIOS(
   USU_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   USU_NOMBRE VARCHAR(50) NOT NULL,
   USU_USUARIOS VARCHAR(50) NOT NULL,
   USU_CONTRASENA VARCHAR(50) NOT NULL,
   USU_ROL_ID INT UNSIGNED NOT NULL,
   USU_ID_ALTA INT UNSIGNED NOT NULL,
   USU_ID_BAJA INT UNSIGNED,
   USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   USU_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   USU_FECHA_BAJA DATETIME,
   USU_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( USU_ID ),
   FOREIGN KEY (USU_ROL_ID)
        REFERENCES ROLES (ROL_ID)
 );

create table PERFILES(
   PRF_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   PRF_USU_ID INT UNSIGNED NOT NULL,
   PRF_NOMBRE VARCHAR(50) NOT NULL,
   PRF_INGREDIENTES_PROHIBIDOS VARCHAR(500) NOT NULL,
   PRF_FECHA_NACIMIENTO DATETIME,
   PRF_ES_PRINCIPAL TINYINT(1) DEFAULT 0 NOT NULL,
   PRF_USU_ID_ALTA INT UNSIGNED NOT NULL,
   PRF_USU_ID_BAJA INT UNSIGNED,
   PRF_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   PRF_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   PRF_FECHA_BAJA DATETIME,
   PRF_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( PRF_ID ),
   FOREIGN KEY (PRF_USU_ID)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (PRF_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (PRF_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (PRF_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
 );

create table TIPOS_PORCION(
   TPO_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   TPO_NOMBRE VARCHAR(200) NOT NULL,
   TPO_USU_ID_ALTA INT UNSIGNED NOT NULL,
   TPO_USU_ID_BAJA INT UNSIGNED,
   TPO_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   TPO_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   TPO_FECHA_BAJA DATETIME,
   TPO_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( TPO_ID ),
   FOREIGN KEY (TPO_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (TPO_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (TPO_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table PRODUCTOS(
   PRO_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   PRO_NOMBRE VARCHAR(200) NOT NULL,
   PRO_PORCION INT UNSIGNED,
   PRO_INGREDIENTES VARCHAR(1000) NOT NULL,
   PRO_TPO_ID INT UNSIGNED,
   PRO_USU_ID_ALTA INT UNSIGNED NOT NULL,
   PRO_USU_ID_BAJA INT UNSIGNED,
   PRO_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   PRO_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   PRO_FECHA_BAJA DATETIME,
   PRO_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( PRO_ID ),
   FOREIGN KEY (PRO_TPO_ID)
        REFERENCES TIPOS_PORCION (TPO_ID),
   FOREIGN KEY (PRO_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (PRO_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (PRO_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table NUTRIENTES(
   NUT_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   NUT_NOMBRE VARCHAR(200) NOT NULL,
   NUT_ES_OPCIONAL TINYINT(1),
   NUT_ES_CRITICO TINYINT(1),
   NUT_TIPO_NUTRIENTE SMALLINT UNSIGNED,
   NUT_USU_ID_ALTA INT UNSIGNED NOT NULL,
   NUT_USU_ID_BAJA INT UNSIGNED,
   NUT_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   NUT_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   NUT_FECHA_BAJA DATETIME,
   NUT_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( NUT_ID ),
   FOREIGN KEY (NUT_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (NUT_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (NUT_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table TIPOS_ALERTA(
   TAL_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   TAL_NOMBRE VARCHAR(200) NOT NULL,
   TAL_COLOR VARCHAR(6) NOT NULL,
   TAL_FORMA SMALLINT(1) UNSIGNED NOT NULL,
   TAL_ES_GENERICA SMALLINT(1) UNSIGNED DEFAULT 0 NOT NULL,
   TAL_USU_ID_ALTA INT UNSIGNED NOT NULL,
   TAL_USU_ID_BAJA INT UNSIGNED,
   TAL_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   TAL_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   TAL_FECHA_BAJA DATETIME,
   TAL_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( TAL_ID ),
   FOREIGN KEY (TAL_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (TAL_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (TAL_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table ALERTAS(
   ALE_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   ALE_NOMBRE VARCHAR(200) NOT NULL,
   ALE_LEYENDA VARCHAR(200) NOT NULL,
   ALE_TAL_ID INT UNSIGNED NOT NULL,
   ALE_USU_ID_ALTA INT UNSIGNED NOT NULL,
   ALE_USU_ID_BAJA INT UNSIGNED,
   ALE_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   ALE_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   ALE_FECHA_BAJA DATETIME,
   ALE_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( ALE_ID ),
   FOREIGN KEY (ALE_TAL_ID)
        REFERENCES TIPOS_ALERTA (TAL_ID),
   FOREIGN KEY (ALE_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (ALE_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (ALE_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table TIPOS_CALCULO(
   TCA_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   TCA_NOMBRE VARCHAR(200) NOT NULL,
   TCA_NOMBRE_ENUM VARCHAR(200) NOT NULL,
   TCA_USU_ID_ALTA INT UNSIGNED NOT NULL,
   TCA_USU_ID_BAJA INT UNSIGNED,
   TCA_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   TCA_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   TCA_FECHA_BAJA DATETIME,
   TCA_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( TCA_ID ),
   FOREIGN KEY (TCA_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (TCA_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (TCA_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table ALERTAS_X_NUTRIENTE(
   ANU_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   ANU_ALE_ID INT UNSIGNED NOT NULL,
   ANU_NUT_ID INT UNSIGNED NOT NULL,
   ANU_TCA_ID INT UNSIGNED NOT NULL,
   ANU_OPERADOR CHAR NOT NULL,
   ANU_VALOR_CRITICO SMALLINT(3) NOT NULL,
   ANU_USU_ID_ALTA INT UNSIGNED NOT NULL,
   ANU_USU_ID_BAJA INT UNSIGNED,
   ANU_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   ANU_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   ANU_FECHA_BAJA DATETIME,
   ANU_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( ANU_ID ),
   FOREIGN KEY (ANU_ALE_ID)
        REFERENCES ALERTAS (ALE_ID),
   FOREIGN KEY (ANU_NUT_ID)
        REFERENCES NUTRIENTES (NUT_ID),
   FOREIGN KEY (ANU_TCA_ID)
        REFERENCES TIPOS_CALCULO (TCA_ID),
   FOREIGN KEY (ANU_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (ANU_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (ANU_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );

create table ANALISIS_HISTORICOS(
   AHI_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   AHI_PRO_ID INT UNSIGNED NOT NULL,
   AHI_FECHA DATETIME DEFAULT now() NOT NULL,
   AHI_USU_ID_ALTA INT UNSIGNED NOT NULL,
   AHI_USU_ID_BAJA INT UNSIGNED,
   AHI_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   AHI_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   AHI_FECHA_BAJA DATETIME,
   AHI_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( AHI_ID ),
   FOREIGN KEY (AHI_PRO_ID)
        REFERENCES PRODUCTOS (PRO_ID),
   FOREIGN KEY (AHI_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (AHI_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (AHI_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );
  
  create table NUTRIENTES_X_PRODUCTOS(
   NPR_ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
   NPR_PRO_ID INT UNSIGNED NOT NULL,
   NPR_NUT_ID INT UNSIGNED NOT NULL,
   NPR_CANTIDAD_POR_PORCION DOUBLE UNSIGNED NOT NULL,
   NPR_USU_ID_ALTA INT UNSIGNED NOT NULL,
   NPR_USU_ID_BAJA INT UNSIGNED,
   NPR_USU_ID_MODIFICACION INT UNSIGNED NOT NULL,
   NPR_FECHA_ALTA DATETIME DEFAULT now() NOT NULL,
   NPR_FECHA_BAJA DATETIME,
   NPR_FECHA_MODIFICACION DATETIME DEFAULT now() NOT NULL,
   PRIMARY KEY ( NPR_ID ),
   FOREIGN KEY (NPR_PRO_ID)
        REFERENCES PRODUCTOS (PRO_ID),
   FOREIGN KEY (NPR_NUT_ID)
        REFERENCES NUTRIENTES (NUT_ID),
   FOREIGN KEY (NPR_USU_ID_ALTA)
        REFERENCES USUARIOS (USU_ID),
  FOREIGN KEY (NPR_USU_ID_BAJA)
        REFERENCES USUARIOS (USU_ID),
   FOREIGN KEY (NPR_USU_ID_MODIFICACION)
        REFERENCES USUARIOS (USU_ID)
   );
  