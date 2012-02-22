Class {
	#name : #PetitSQLiteGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitSQLite-Tests-Parser'
}

{ #category : #accessing }
PetitSQLiteGrammarTest >> parserClass [
	^PetitSQLiteGrammar
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAbort [
	self 
		parse: ' Abort ' "result should be 'Abort' "
		rule: #abort.

	self 
		parse: 'ABORT ' "result should be 'ABORT' "
		rule: #abort.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAdd [
	self 
		parse: ' ADD ' "result should be 'ADD' "
		rule: #add.

	self 
		parse: ' Add ' "result should be 'Add' "
		rule: #add.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAll [
	self 
		parse: ' ALL ' "result should be 'ALL' "
		rule: #all.

	self 
		parse: ' All ' "result should be 'All' "
		rule: #all.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlter [
	self 
		parse: ' Alter ' "result should be 'Alter' "
		rule: #alter.

	self 
		parse: 'ALTER ' "result should be 'ALTER' "
		rule: #alter.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintMultipleFKs [

	self 
		parse: 'ALTER TABLE M_INSN_LT ADD CONSTRAINT FK_CRL_ID
		FOREIGN KEY (IP_CTL, CM_CTL_I, AR_CL_I, CM_AR_I_DIN_RE_I) REFERENCES CM_R_IP_RL (IP_RL_ID, C_CT_ID, A_CL_ID, CM_R_IP_DN_R_ID)
		ON DELETE CASCADE'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintMultiplePKs [

	self 
		parse: 'ALTER TABLE M_INSN_LT ADD CONSTRAINT PK_IP_RELATION_CTRL_ID 
		PRIMARY KEY (IP_CTRL_ID_PARENT, IP_CTRL_ID_CHILD, RELATION_TYPE_CD)'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintMultiplePKsWithOtherConstraints [

	self 
		parse: 'ALTER TABLE APPABLAUF ADD  CONSTRAINT APPABLAUF_PK PRIMARY KEY (ABLAUFID, STEP) USING INDEX'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintOneFK [

	self 
		parse: 'ALTER TABLE M_INSN_LT ADD CONSTRAINT FK_S_IP_CL_ID
		FOREIGN KEY (IP_CL_ID) REFERENCES IP_CL (IP_CL_ID)
		ON DELETE CASCADE'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintOnePK [

	self 
		parse: 'ALTER TABLE M_INSN_LT ADD CONSTRAINT PK_M_INS_LT 
		PRIMARY KEY (SCHUTIT_KEY)'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintUnique [

	self
		parse: 'ALTER TABLE UDF_TEST ADD  CONSTRAINT BIN$hFqLFqNzTUaOtkmeJTbToQ UNIQUE (UDF_TEST_PK) '
		rule: #alterTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableAddConstraintWithComplexIdentifier [

	self
		parse: 'ALTER TABLE UDF_TEST ADD  CONSTRAINT BIN$hFqLFqNzTUaOtkmeJTbToQ PRIMARY KEY (UDF_TEST_PK) USING INDEX'
		rule: #alterTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintFKOracleNoName [
		
	self 
		parse: '	FOREIGN KEY (IP_CTL, CM_CTL_I, AR_CL_I, CM_AR_I_DIN_RE_I) REFERENCES CM_R_IP_RL (IP_RL_ID, C_CT_ID, A_CL_ID, CM_R_IP_DN_R_ID)
		ON DELETE CASCADE'
		rule: #alterTableConstraintFKOracle.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintFKOracleOneColumn [
		
	self 
		parse: 'CONSTRAINT FK_S_IP_CL_ID
		FOREIGN KEY (IP_CL_ID) REFERENCES IP_CL (IP_CL_ID)
		ON DELETE CASCADE'
		rule: #alterTableConstraintFKOracle.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintFKOracleSeveralColumns [
		
	self 
		parse: 'CONSTRAINT FK_CRL_ID
		FOREIGN KEY (IP_CTL, CM_CTL_I, AR_CL_I, CM_AR_I_DIN_RE_I) REFERENCES CM_R_IP_RL (IP_RL_ID, C_CT_ID, A_CL_ID, CM_R_IP_DN_R_ID)
		ON DELETE CASCADE'
		rule: #alterTableConstraintFKOracle.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintPKOracleNoName [

	self 
		parse: '
		PRIMARY KEY (IP_CTRL_ID_PARENT, IP_CTRL_ID_CHILD, RELATION_TYPE_CD)'
		rule: #alterTableConstraintPKOracle.
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintPKOracleOneColumn [

	self 
		parse: 'CONSTRAINT PK_M_INS_LT 
		PRIMARY KEY (SCHUTIT_KEY)'
		rule: #alterTableConstraintPKOracle.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintPKOracleOneColumnStrangeName [

	self 
		parse: 'CONSTRAINT BIN$hFqLFqNzTUaOtkmeJTbToQ PRIMARY KEY (UDF_TEST_PK) USING INDEX'
		rule: #alterTableConstraintPKOracle.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintPKOracleSeveralColumns [

	self 
		parse: 'CONSTRAINT PK_M_INS_LT 
		PRIMARY KEY (SCHUTIT_KEY)'
		rule: #alterTableConstraintPKOracle.

	self 
		parse: 'CONSTRAINT PK_IP_RELATION_CTRL_ID 
		PRIMARY KEY (IP_CTRL_ID_PARENT, IP_CTRL_ID_CHILD, RELATION_TYPE_CD)'
		rule: #alterTableConstraintPKOracle.
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableConstraintUnique [

	self 
		parse: 'UNIQUE (ITEMS_ID) USING INDEX'
		rule: #alterTableConstraintUnique.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableRenameTable [

	self 
		parse: 'ALTER TABLE M_INSN_LT RENAME TO TEstName'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAlterTableUsingIndex [
	
	self 
		parse: 'ALTER TABLE PX_KM_ALLERGY ADD  CONSTRAINT PX_KM_ALLERGY_PK PRIMARY KEY (PATID, FORMID, RECORDID) USING INDEX'
		rule: #alterTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAs [
	self 
		parse: ' as ' "result should be 'as' "
		rule: #as.

	self 
		parse: 'AS ' "result should be 'AS' "
		rule: #as.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAsc [
	self 
		parse: ' ASC' "result should be 'ASC' "
		rule: #asc.

	self 
		parse: 'asc ' "result should be 'asc' "
		rule: #asc.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testAutoincrement [
	self 
		parse: ' AUTOINCREMENT' "result should be 'AUTOINCREMENT' "
		rule: #autoincrement.

	self 
		parse: 'Autoincrement ' "result should be 'Autoincrement' "
		rule: #autoincrement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testBlobLiteral [
	self 
		parse:' Blob ' 
	 	rule: #blobLiteral.
	self 
		parse:' BLOB ' 
	 	rule: #blobLiteral
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testBy [
	self 
		parse: ' BY ' "result should be 'BY' "
		rule: #by.

	self 
		parse: 'By ' "result should be 'By' "
		rule: #by.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCascade [
	self 
		parse: ' CASCADE ' "result should be 'CASCADE' "
		rule: #cascade.

	self 
		parse: 'Cascade ' "result should be 'Cascade' "
		rule: #cascade.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCheck [
	self 
		parse: ' CHECK' "result should be 'CHECK' "
		rule: #check.

	self 
		parse: 'Check ' "result should be 'Check' "
		rule: #check.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCollate [
	self 
		parse: ' COLLATE ' "result should be 'COLLATE' "
		rule: #collate.

	self 
		parse: 'Collate ' "result should be 'Collate' "
		rule: #collate.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumn [
	self 
		parse: ' COLUMN ' "result should be 'COLUMN' "
		rule: #column.

	self 
		parse: ' Column ' "result should be 'Column' "
		rule: #column.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintCheck [

	self 
		parse: 'CHECK(IsFilledRectangle in (''Y'',''N''))' 
		rule: #columnConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintDefaultEmptyString [

	self 
		parse: ' DEFAULT '''''
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintDefaultLiteral [

	self 
		parse: ' DEFAULT test'
		rule: #columnConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintDefaultNumbersWithQuotes [

		self 
		parse: ' default ''0000'' '
		rule: #columnConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintIsCollate [

	self 
		parse: ' CONSTRAINT PK_CONFI_ID  collate identifier '
		rule: #columnConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintIsNotNull [

	self 
		parse: ' NOT NULL'
		rule: #columnConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintIsPKConstraint [

	self 
		parse: ' CONSTRAINT PK_CONFI_ID 
	PRIMARY KEY ' 
		rule: #columnConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintIsUniqueConstraint [

	self 
		parse: ' CONSTRAINT PK_CONFI_ID  unique '
		rule: #columnConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintPrimaryKey [

	self 
		parse: '	PRIMARY KEY ' 
		rule: #columnConstraintPrimaryKey.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintPrimaryKeyOthers [

	self 
		parse: '	PRIMARY KEY asc autoincrement ' 
		rule: #columnConstraintPrimaryKey.
	self 
		parse: '	PRIMARY KEY desc on conflict ignore autoincrement ' 
		rule: #columnConstraintPrimaryKey.
	self 
		parse: '	PRIMARY KEY on conflict ignore autoincrement ' 
		rule: #columnConstraintPrimaryKey.
	self 
		parse: '	PRIMARY KEY on conflict abort ' 
		rule: #columnConstraintPrimaryKey.
	self 
		parse: '	PRIMARY KEY desc on conflict ignore ' 
		rule: #columnConstraintPrimaryKey.
	
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintWithDefaultWithParenthesis [

	self 
		parse: ' default ( test ) '
		rule: #columnConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnConstraintWithdefaultWithNumber [

	self 
		parse: 'DEFAULT 0' 
		rule: #columnConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefComplex [
	self 
		parse: '  IsFilledRectangle CHAR(1) DEFAULT ''N'' NOT NULL CHECK(IsFilledRectangle in (''Y'',''N''))'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefJustColName [
	self 
		parse: ' colName'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithEnable [
	self 
		parse: 'ABLAUFID NUMBER(10, 0) NOT NULL ENABLE'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithLongDefault [
			
	self 
		parse: 'Year              VARCHAR2(4)      DEFAULT ''0000'' NOT NULL'
		rule:#columnDef
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithPrimaryKey [
	
	self 
		parse: ' colName PRIMARY KEY '
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithStar [
	self 
		parse: 'TASKRESOURCEID NUMBER(*,0) NOT NULL ENABLE'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithType [

	self 
		parse: ' colName integer'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithTypeAndPrimaryKey [
	
	self 
		parse: ' colName number PRIMARY KEY '
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefWithVarChar2 [
	self 
		parse: ' RELTYPNAME VARCHAR2(255 CHAR)'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnDefwithDefault [
	
    	self 
		parse: 'Posted                   CHAR(1)           DEFAULT ''N'' NOT NULL'
		rule: #columnDef.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesBLOB [

	self 
		parse: ' blob' 
		rule: #columnTypes.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesBoolean [
	self 
		parse: ' boolean' 
		rule: #columnTypes.
	
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesChar [
	self 
		parse: ' char'
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesClob [
	self 
		parse: ' CLOB' 
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesDate [
	self 
		parse: ' DATE' 
		rule: #columnTypes.
	
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesFloat [
	self
		parse: ' FLOAT'
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesInt [
	self 
		parse: ' int ' 
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesInteger [
	self 
		parse: ' integer'
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesLong [
	self
		parse: ' long'
		rule: #columnTypes	.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesNVarChar2 [
	self 
		parse: ' NVARCHAR2 ' 
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesNumber [
	self 
		parse: ' NUMBER'
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesRaw [
	self
		parse: ' RAW'
		rule: #columnTypes.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesTimestamp [
	self 
		parse: ' timestamp'
		rule: #columnTypes.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testColumnTypesVarChar2 [
	self 
		parse: ' VARCHAR2 ' 
		rule: #columnTypes.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCompoundOperatorExcept [
	self 
		parse: 'EXCEPT ' 
		rule: #compoundOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCompoundOperatorIntersection [
	self 
		parse: 'INTERSECTION ' 
		rule: #compoundOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCompoundOperatorUnion [
	self 
		parse: ' UNION '
		rule: #compoundOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCompoundOperatorUnionAll [
	self 
		parse: 'UNION ALL '
		rule: #compoundOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseAbort [
	self 
		parse: ' ON CONFLICT abort'
		rule: #conflictClause.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseEmpty [
	self 
		parse: '' "result should be nil"
		rule: #conflictClause.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseFail [
	self 
		parse: ' ON conflict FAIL'
		rule: #conflictClause.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseIgnore [
	self 
		parse: ' on CONFLICT ignore'
		rule: #conflictClause.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseReplace [
	self 
		parse: ' ON CONFLICT Replace'
		rule: #conflictClause.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConflictClauseRollback [
	self 
		parse: ' ON CONFLICT Rollback'
		rule: #conflictClause.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testConstraint [
	self 
		parse: ' CONSTRAINT '
		rule: #constraint.

	self 
		parse: 'Constraint '
		rule: #constraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreate [
	self 
		parse: ' create ' "result should be 'create' "
		rule: #create.

	self 
		parse: 'Create ' "result should be 'Create' "
		rule: #create.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateDatabase [
	self 
		parse: 'CREATE DATABASE dbName' "result should be #('CREATE' 'DATABASE' 'dbName')"
		rule: #createDatabase.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndex [

	self 
		parse:	'CREATE INDEX CounterCount_PageURL ON W_CounterCount(AD_Client_ID)'
		rule: #createIndex.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndexIfNotExists [

	self 
		parse:	'CREATE INDEX  IF NOT EXISTS dbName.W_CounterCount_PageURL ON W_CounterCount(AD_Client_ID, PageURL)'
		rule: #createIndex.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndexOnMultipleColumns [

	self 
		parse: 'CREATE INDEX AD_Archive_Documents ON AD_Archive(AD_Table_ID,AD_Process_ID)'
		rule: #createIndex.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndexOnMultipleColumnsWithSpaces [

	self 
		parse: 'CREATE INDEX W_ClickCount_TargetURL ON W_ClickCount(AD_Client_ID, TargetURL)'
		rule: #createIndex.
	
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndexUnique [

	self 
		parse:	'CREATE UNIQUE INDEX W_CounterCount_PageURL ON W_CounterCount(AD_Client_ID)'
		rule: #createIndex.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateIndexUniqueIfNotExists [

	self 
		parse:	'CREATE UNIQUE INDEX  IF NOT EXISTS W_CounterCount_PageURL ON W_CounterCount(AD_Client_ID,PageURL)'
		rule: #createIndex.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTable3 [

	self 
		parse:	'CREATE TABLE AD_PrintFormatItem(
    AD_PrintFormatItem_ID     NUMBER(10, 0)      NOT NULL,
    AD_Client_ID              NUMBER(10, 0)      NOT NULL,
    AD_Org_ID                 NUMBER(10, 0)      NOT NULL,
    Created                   DATE               DEFAULT SYSDATE NOT NULL,
    CreatedBy                 NUMBER(10, 0)      NOT NULL,
    Updated                   DATE               DEFAULT SYSDATE NOT NULL,
    UpdatedBy                 NUMBER(10, 0)      NOT NULL,
    AD_PrintFormat_ID         NUMBER(10, 0)      NOT NULL,
    Name                      NVARCHAR2(60)      NOT NULL,
    PrintName                 NVARCHAR2(2000)    NOT NULL,
    PrintNameSuffix           NVARCHAR2(60),
    PrintAreaType             CHAR(1)            NOT NULL,
    SeqNo                     NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    PrintFormatType           CHAR(1)            NOT NULL,
    AD_Column_ID              NUMBER(10, 0),
    AD_PrintFormatChild_ID    NUMBER(10, 0),
    AD_PrintGraph_ID          NUMBER(10, 0),
    BelowColumn               NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    Xspace                    NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    Yspace                    NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    Xposition                 NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    Yposition                 NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    MaxWidth                  NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    MaxHeight                 NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    FieldAlignmentType        CHAR(1)            NOT NULL,
    LineAlignmentType         CHAR(1)            NOT NULL,
    AD_PrintColor_ID          NUMBER(10, 0),
    AD_PrintFont_ID           NUMBER(10, 0),
    SortNo                    NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    RunningTotalLines         NUMBER(10, 0)      DEFAULT 0 NOT NULL,
    ImageURL                  NVARCHAR2(120),
    IsFilledRectangle         CHAR(1)            DEFAULT ''N'' NOT NULL
                              CHECK (IsFilledRectangle in (''Y'',''N'')),
    LineWidth                 NUMBER(10, 0)      DEFAULT 0,
    ArcDiameter               NUMBER(10, 0)      DEFAULT 0,
    ShapeType                 CHAR(1),
    CONSTRAINT AS_PrintFormatItem_Key PRIMARY KEY (AD_PrintFormatItem_ID)
)'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTable4 [

	self 
		parse:	'CREATE TABLE AD_Archive(
    AD_Archive_ID    NUMBER(10, 0)      NOT NULL,
    AD_Client_ID     NUMBER(10, 0)      NOT NULL,
    AD_Org_ID        NUMBER(10, 0)      NOT NULL,
    IsActive         CHAR(1)            DEFAULT ''Y'' NOT NULL
                     CHECK (IsActive in (''Y'',''N'')),
    Created          DATE               DEFAULT SYSDATE NOT NULL,
    CreatedBy        NUMBER(10, 0)      NOT NULL,
    Updated          DATE               DEFAULT SYSDATE NOT NULL,
    UpdatedBy        NUMBER(10, 0)      NOT NULL,
    Name             NVARCHAR2(60)      NOT NULL,
    Description      NVARCHAR2(255),
    Help             NVARCHAR2(2000),
    IsReport         CHAR(1)            DEFAULT ''N'' NOT NULL
                     CHECK (IsReport in (''Y'',''N'')),
    AD_Table_ID      NUMBER(10, 0),
    Record_ID        NUMBER(10, 0),
    AD_Process_ID    NUMBER(10, 0),
    C_BPartner_ID    NUMBER(10, 0),
    BinaryData       BLOB,
    CONSTRAINT AD_Archive_Key PRIMARY KEY (AD_Archive_ID)
)'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTable5 [

	self 
		parse:	'CREATE TABLE AD_Sequence_No(
    AD_Sequence_ID    NUMBER(10, 0)    NOT NULL,
    Year              VARCHAR2(4)      DEFAULT ''0000'' NOT NULL,
    AD_Client_ID      NUMBER(10, 0)    NOT NULL,
    AD_Org_ID         NUMBER(10, 0)    NOT NULL,
    Created           DATE             DEFAULT SYSDATE NOT NULL,
    CreatedBy         NUMBER(10, 0)    NOT NULL,
    Updated           DATE             DEFAULT SYSDATE NOT NULL,
    UpdatedBy         NUMBER(10, 0)    NOT NULL,
    CurrentNext       NUMBER(10, 0)    DEFAULT 0 NOT NULL,
    CONSTRAINT AD_Sequence_No_Key PRIMARY KEY (AD_Sequence_ID, Year)
)'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTable6 [

	self 
		parse:	'CREATE TABLE APPCAREACTION (AKTIONSNR NUMBER(10, 0) NOT NULL ENABLE, ORDERID NUMBER(10, 0) NOT NULL ENABLE, AKTION VARCHAR2(2) NOT NULL ENABLE, AKTIONSDATUM DATE NOT NULL ENABLE, ANZ1 NUMBER(10, 0), ANZ2 NUMBER(10, 0), ANZ3 NUMBER(10, 0), ANZ4 NUMBER(10, 0), DOSSCHEMA NUMBER(10, 0), TIME1 DATE, TIME2 DATE, TIME3 DATE, TIME4 DATE, INDIVIDUELLTXT VARCHAR2(255), EINNAHME NUMBER(10, 0), ANZAHL NUMBER(10, 0), MAXANZAHL NUMBER(10, 0), BEMERKUNG VARCHAR2(255), ERFDAT DATE NOT NULL ENABLE, ERFID NUMBER(10, 0) NOT NULL ENABLE, MUTDAT DATE NOT NULL ENABLE, MUTID NUMBER(10, 0) NOT NULL ENABLE, ANZ5 FLOAT(126), ANZ6 FLOAT(126), ANZ7 FLOAT(126), ANZ8 FLOAT(126), TIME5 DATE, TIME6 DATE, TIME7 DATE, TIME8 DATE, DURATION NUMBER(10, 0), NUMBEROFNURSES NUMBER(10, 0), NUMBEROFPATIENTS NUMBER(10, 0), EXTENSIONS CLOB)'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTable7 [

	self 
		parse:	'CREATE TABLE PXG3_N_PR (ID NUMBER(19, 0) NOT NULL ENABLE, CASE_ID NUMBER(19, 0), CATALOG_ITEM_TYPE VARCHAR2(2 CHAR), CATALOG_ID VARCHAR2(255 CHAR), CATALOG_ITEM_ID VARCHAR2(255 CHAR), CATALOG_ITEM_NAME VARCHAR2(255 CHAR), CREATION_DATE TIMESTAMP (6), CREATOR VARCHAR2(255 CHAR), DOSSIER_ID NUMBER(19, 0), FROM_DATE TIMESTAMP (6), PATIENT_ID NUMBER(19, 0), PRESCRIPTION_COMMENT VARCHAR2(255 CHAR), TO_DATE TIMESTAMP (6), ACTION_USER VARCHAR2(255 CHAR), ESC_PERSISTED TIMESTAMP (6), TREATMENT_TYPE NUMBER(22, 0))'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTableBigWithPrimaryKeyConstr [
	
	self 
		parse: 'CREATE TABLE A_xxx_yyy(
    A_xxx_yyy_ID        NUMBER(10, 0)     NOT NULL,
    Cr                  DATE              DEFAULT SYSDATE NOT NULL,
    CrBy                NUMBER(10, 0)     NOT NULL,
    xxT               CHAR(1)           NOT NULL,
    ChDt               DATE              NOT NULL,
    Desc              NVARCHAR2(255),
    UseYears             NUMBER(10, 0)     DEFAULT 0 NOT NULL,
    LifeUnits             NUMBER,
    A_blabla_ID    NUMBER(10, 0),
    AssetxxxAmt      NUMBER            DEFAULT 0 NOT NULL,
    C_Cur_ID            NUMBER(10, 0),
    Proc               CHAR(1),
    Pos                   CHAR(1)           DEFAULT ''N'' NOT NULL,
    CONSTRAINT A_xxx_yyy_Key PRIMARY KEY (A_xxx_yyy_ID)
)'
		rule: #createTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTableFooAsSelect [

	self 
		parse: '
		CREATE Table foo 
		
		as select * from anotherTable'
		rule: #createTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTableWith9Columns [
	
	self 
		parse: '  CREATE TABLE ciao.TP_CO
(
	CO_KEY          VARCHAR2(100) NOT NULL,
	CO_NAME         VARCHAR2(100),
	CO_DESCRIPTION  VARCHAR2(255),
	CO_VALUE        CLOB NOT NULL,
	CO_DAT          TIMESTAMP NOT NULL,
	CO_USER_ID      NUMBER(10) NOT NULL,
	CO_DAT          TIMESTAMP,
	CO_USERs      NUMBER(10),
	CO             NUMBER(10) DEFAULT 0 NOT NULL
)'
		rule: #createTable.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCreateTableWithConstraints [

	self 
		parse:	'CREATE  TABLE IF NOT EXISTS mydb.Delegation (
  idDelegation INT NOT NULL ,
  name VARCHAR(45) NOT NULL ,
  region INT NOT NULL ,
  idCrop INT NULL ,
  PRIMARY KEY (idDelegation) ,
  
  CONSTRAINT region
    FOREIGN KEY (region )
    REFERENCES mydb.Region (idRegion )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)'
		rule:#createTable
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCurrentDate [
	self 
		parse:' current_DATE ' 
	 	rule: #currentDate.
	self 
		parse:' CURRENT_DATE ' 
	 	rule: #currentDate.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCurrentTime [
	self 
		parse:' current_TIME ' 
	 	rule: #currentTime.
	self 
		parse:' CURRENT_TIME '
		rule: #currentTime.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testCurrentTimestamp [
	self 
		parse:' current_TIMESTAMP ' 
	 	rule: #currentTimestamp.
	self 
		parse:' CURRENT_TIMESTAMP ' 
	 	rule: #currentTimestamp
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDatabase [
	self 
		parse: ' DATABASE' "result should be 'DATABASE' "
		rule: #database.
	
	self 
		parse: 'DataBase ' "result should be 'DataBase' "
		rule: #database.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefault [
	self 
		parse: ' DEFAULT ' "result should be 'DEFAULT' "
		rule: #default.

	self 
		parse: 'Default ' "result should be 'Default' "
		rule: #default.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintLiteralWithQuotes [
		
	self
		parse: 'DEFAULT ''a'''
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintLiteralWithoutQuotes [
	
	self
		parse: 'DEFAULT a'
		rule: #defaultConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintNegativeNumber [

	self 
		parse: ' default -45 '
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintNumberWithQuotes [

	self
		parse: 'DEFAULT ''0'''
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintNumberWithoutQuotes [

	self
		parse: 'DEFAULT 0'
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDefaultConstraintWithQuotes [
	self 
		parse: ' default ''0000'' '
		rule: #defaultConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDeferred [
	self 
		parse: ' DEFERRED ' "result should be 'DEFERRED' "
		rule: #deferred.

	self 
		parse: ' Deferred ' "result should be 'Deferred' "
		rule: #deferred.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDelete [
	self 
		parse: ' DELETE ' "result should be 'DELETE' "
		rule: #delete.

	self 
		parse: 'Delete ' "result should be 'Delete' "
		rule: #delete.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDeleteStatementSimple [

	self 
		parse: 'DELETE FROM TABLEName'
		rule: #deleteStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDeleteStatementWithComplexWhere [

	self 
		parse: 'delete from APPLOCK where not exists (select LOGINID from APPLOGIN where LOGINID = APPLOCK.LOGINID and STATE = ''BUSY'')'
		rule: #deleteStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDeleteStatementWithSimpleWhere [

	self 
		parse: 'delete from APPLOCK where not exists APP'
		rule: #deleteStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDesc [
	self 
		parse: 'DESC' "result should be 'DESC' "
		rule: #desc.

	self 
		parse: 'desc ' "result should be 'desc' "
		rule: #desc.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testDistinct [
	self 
		parse: ' DISTINCT ' "result should be 'DISTINCT' "
		rule: #distinct.

	self 
		parse: ' Distinct ' "result should be 'Distinct' "
		rule: #distinct.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExplain [
	self 
		parse: ' EXPLAIN ' "result should be 'EXPLAIN' "
		rule: #explain.

	self 
		parse: 'Explain ' "result should be 'Explain' "
		rule: #explain.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExpression [
	"self flag: #TODO."
	self 
		parse: 'IsActive'
		rule: #expression.
	
	self 
		parse: 'IsActive in (''Y'',''N'')'
		rule: #expression.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExpressionIN [

	self 
		parse: 'IsActive in (''Y'',''N'')'
		rule: #expression.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExpressionWithEqual [
	self 
		parse: 'blabla = <%BLA_MO>'
		rule: #expression.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExpressionWithUnequalOperator [
	self 
		parse: 'blabla <> 123'
		rule: #expression.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testExpressionWithWithNameDotName [
	
	self 
		parse: 'i.blobid'
		rule: #expression.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFail [
	self 
		parse: ' Fail ' "result should be 'Fail' "
		rule: #fail.

	self 
		parse: 'FAIL ' "result should be 'FAIL' "
		rule: #fail.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFloatingPointLiteralBig [

	self 
		parse: ' 3558.1235 '
		rule: #floatingPointLiteral.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFloatingPointLiteralWithOneDecimal [
	self 
		parse: ' 3.558 '
		rule: #floatingPointLiteral.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFloatingPointLiteralWithSpaces [

	self 
		parse: ' 05 . 878 '
		rule: #floatingPointLiteral.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFloatingPointLiteralZeroDotSomething [

	self 
		parse: ' 0.8 '
		rule: #floatingPointLiteral.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKey [
	self 
		parse: ' FOREIGN KEY' "result should be 'FOREIGN KEY "
		rule: #foreignKey.

	self 
		parse: 'Foreign key ' "result should be 'Foreign key' "
		rule: #foreignKey.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClause [
	
	self 
		parse: 'REFERENCES A_USER (A_ID)'
		rule: #foreignKeyClause.
	self 
		parse: 'REFERENCES A_USER (A_ID , testName)'
		rule: #foreignKeyClause.
	
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) ON DELETE restrict'
		rule: #foreignKeyClause.
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) ON UPDATE set default'
		rule: #foreignKeyClause.
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) ON DELETE restrict match identifierName'
		rule: #foreignKeyClause.
		
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) ON DELETE restrict match identifierName NOT DEFERRABLE'
		rule: #foreignKeyClause.
	
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) NOT DEFERRABLE initially deferred'
		rule: #foreignKeyClause.	
	self 
		parse: 'REFERENCES A_USER (A_ID , testName) DEFERRABLE'
		rule: #foreignKeyClause.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseNotPartDeferrable [
	
	self 
		parse: 'Deferrable '
		rule: #foreignKeyClauseNotPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseNotPartDeferrableInitiallyDeferred [

	self 
		parse: 'Deferrable initially deferred'
		rule: #foreignKeyClauseNotPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseNotPartNotDeferrable [
	
	self 
		parse: 'not Deferrable '
		rule: #foreignKeyClauseNotPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseNotPartNotDeferrableInitiallyImmediate [
	self 
		parse: 'not Deferrable initially immediate'
		rule: #foreignKeyClauseNotPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseOnPartDeleteCascade [
	
	self 
		parse: ' ON DELETE cascade'
		rule: #foreignKeyClauseOnPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseOnPartDeleteNoAction [

	self 
		parse: 'ON DELETE No aCtion'
		rule: #foreignKeyClauseOnPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseOnPartDeleteSetDefault [
	self 
		parse: 'ON DELETE SET Default '
		rule: #foreignKeyClauseOnPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseOnPartUpdateRestrict [
	self 
		parse: 'ON UPDATE restrict'
		rule: #foreignKeyClauseOnPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testForeignKeyClauseOnPartUpdatesetNull [
	self 
		parse: 'ON UPDATE Set null'
		rule: #foreignKeyClauseOnPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testFrom [
	self 
		parse: ' From ' "result should be 'From' "
		rule: #from.

	self 
		parse: 'FROM ' "result should be 'FROM' "
		rule: #from.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testGroupBy [
	self 
		parse: ' Group by ' "result should be 'Group by' "
		rule: #groupBy.

	self 
		parse: 'GROUP BY ' "result should be 'GROUP BY' "
		rule: #groupBy.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierLongWithSymbols [

	self 
		parse: ' BIN$hFqLFqNzTUaOtkmeJTbToQ'
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierSimple [
	self 
		parse: 'AbdffDF '
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithBrachets [
	self 
		parse: '<%BLA_MO> '
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithKeyword [
	self 
		fail: 'FROM'
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithKeywordAsPrefix [
	self 
		parse: 'FROMASDFQEW'
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithKeywordAsPrefixWithPunctuation [
	self 
		parse: 'FROM_ASDFQEW'
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithNumbers [
	self 
		parse: '  A18b_dff_  '
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithUnderscore [
	self 
		parse: 'Ab_dff_DF '
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithUnderscoreAtTheBeginning [
	self 
		parse: ' _dffDF'
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIdentifierWithUnderscoreAtTheEnd [
	self 
		parse: '  Ab_dff_  '
		rule: #identifier.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIfNotExists [
	self 
		parse: ' IF NOT EXISTS' "result should be 'IF NOT EXISTS' "
		rule: #ifNotExists.
	
	self 
		parse: 'If Not ExiStS ' "result should be 'If Not EciStS' "
		rule: #ifNotExists.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIgnore [
	self 
		parse: ' Replace ' "result should be 'Replace' "
		rule: #replace.

	self 
		parse: 'REPLACE ' "result should be 'REPLACE' "
		rule: #replace.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testImmediate [
	self 
		parse: ' IMMEDIATE ' "result should be 'IMMEDIATE' "
		rule: #immediate.

	self 
		parse: ' Immediate ' "result should be 'Immediate' "
		rule: #immediate.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndex [
	self 
		parse: ' Index ' "result should be 'Index' "
		rule: #index.

	self 
		parse: 'INDEX ' "result should be 'INDEX' "
		rule: #index.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexed [
	self 
		parse: ' INDEXED ' "result should be 'INDEXED' "
		rule: #indexed.

	self 
		parse: 'Indexed ' "result should be 'Indexed' "
		rule: #indexed.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexedColumnAsc [

	self 
		parse: ' colName asc ' "result should be #(' colName ' nil 'asc')"
		rule: #indexedColumn.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexedColumnCollate [

	self 
		parse: ' colName collate collateNAme ' "result should be #(' colName ' #('collate' 'collateNAme ') nil) "
		rule: #indexedColumn.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexedColumnCollateAsc [

	self 
		parse: ' colName collate collateNAme asc ' "result should be #(' colName ' #('collate' 'collateNAme ') 'asc') "
		rule: #indexedColumn.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexedColumnDesc [

	self 
		parse: ' colName desc' "result should be #(' colName ' nil 'desc') "
		rule: #indexedColumn.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIndexedColumnJustColName [

	self 
		parse: ' colName ' "result should be #(' colName ' nil nil) "
		rule: #indexedColumn.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInitally [
	self 
		parse: ' INITIALLY ' "result should be 'INITIALLY' "
		rule: #initially.

	self 
		parse: ' Initially ' "result should be 'Initally' "
		rule: #initially.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsert [
	self 
		parse: ' INSERT ' "result should be 'INSERT' "
		rule: #insert.

	self 
		parse: ' Insert ' "result should be 'Insert' "
		rule: #insert.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsertStatmentIntoSpecificField [
	self 
		parse: 'INSERT INTO table_name (column1) VALUES (value1)'
		rule: #insertStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsertStatmentIntoSpecificFields [
	self 
		parse: 'INSERT INTO table_name (column1, column2, column3) VALUES (value1, ''value2'', ''value3'')'
		rule: #insertStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsertStatmentIntoSpecificFieldsVariousTypes [
	self 
		parse: 'INSERT INTO Persons VALUES (4,''Nilsen'', ''Johan'', ''Bakken2'', ''Stavanger'')'
		rule: #insertStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsertStatmentIntoThreeValues [
	self 
		parse: 'INSERT INTO table_name VALUES (value1, value2, value3)'
		rule: #insertStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInsertStatmentOneValue [
	self 
		parse: 'INSERT INTO table_name VALUES (value1)'
		rule: #insertStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIntegerLiteral [
	self 
		parse: '1' "result should be '1' "
		rule: #integerLiteral.


]

{ #category : #tests }
PetitSQLiteGrammarTest >> testIntegerLiteralLong [
	self 
		parse: '1234567890 ' "result should be1234567890' "
		rule: #integerLiteral.
	

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testInto [
	self 
		parse: ' INTO ' "result should be 'INTO' "
		rule: #into.

	self 
		parse: ' Into ' "result should be 'Into' "
		rule: #into.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinConstraintEmpty [

	self 
		parse: ''
		rule: #joinConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinConstraintONAndExpression [
	
	self 
		parse: 'ON test in active (''Y'',''N'')'
		rule: #joinConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinConstraintUsing [

	self 
		parse: ' USING ( col1 ,col2 , col3 )'
		rule: #joinConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorComma [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"
	
	self
		parse: ',' 
		rule: #joinOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorCrossJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"

	self
		parse: 'CROSS JOIN' 
		rule: #joinOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorInnerJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"		
	self
		parse: 'INNER JOIN' 
		rule: #joinOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"

	self
		parse: 'JOIN' 
		rule: #joinOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorLeftJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"
	self
		parse: 'LEFT JOIN' 
		rule: #joinOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorLeftOuterJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"

	self
		parse: 'LEFT Outer JOIN' 
		rule: #joinOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorNaturalCrossJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"

	self
		parse: 'NATURAL CROSS JOIN' 
		rule: #joinOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorNaturalJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"

	self
		parse: 'NATURAL JOIN' 
		rule: #joinOperator.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinOperatorNaturalLeftOuterJoin [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"
		
	self
		parse: 'NATURAL LEFT Outer JOIN' 
		rule: #joinOperator.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinSource [
	
	self 
		parse: 'tab1.col natural join anotherCol' 
		rule: #joinSource
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testJoinSourceWithJoinOperation [
	
	self 
		parse: 'tab1.col natural join anotherCol' 
		rule: #joinSource
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueAnotherString [

	self 
		parse: '''N'''
	 	rule: #literalValue.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueBlob [
	
	self 
		parse: ' BLOb'
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueCurrentDate [
	
	self 
		parse: 'CUrrent_DATE '
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueCurrentTime [

	self 
		parse: ' CUrrent_time '
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueCurrentTimestamp [
	self 
		parse: ' CUrrent_timestamp '
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueFloat [
	self 
		parse: ' 23 . 45 '
	 	rule: #literalValue.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueNull [
	self 
		parse: ' null '
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueNumbers [
	self 
		parse: ' 2345'
	 	rule: #literalValue.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testLiteralValueString [
	self 
		parse: 'something '
	 	rule: #literalValue.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testMatch [
	self 
		parse: ' MATCH ' "result should be 'MATCH' "
		rule: #match.

	self 
		parse: 'Match ' "result should be 'Match' "
		rule: #match.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNoAction [
	self 
		parse: ' NO ACTION ' "result should be 'CASCADE' "
		rule: #noAction.

	self 
		parse: 'No aCtion ' "result should be 'No aCtion' "
		rule: #noAction.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNotElem [
	self 
		parse: ' NOT ' "result should be 'NOT' "
		rule: #notElem.

	self 
		parse: 'Not ' "result should be 'Not' "
		rule: #notElem.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNotIndexed [
	self 
		parse: 'not indexed'
		rule: #notIndexed.
		
	self 
		parse: 'NOT INDEXED'
		rule: #notIndexed.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNotNull [
	self 
		parse: ' NOT NULL' "result should be 'NOT NULL' "
		rule: #notNull.

	self 
		parse: 'not Null ' "result should be 'not Null' "
		rule: #notNull.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNotNullConstraintNoClauses [

	self 
		parse: ' NOT NULL'
		rule: #notNullConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNotNullConstraintWithClauses [

	self 
		parse: ' NOT NULL ON CONFLICT ROLLBACK'
		rule: #notNullConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testNull [
	self 
		parse: ' NULL ' "result should be 'NULL' "
		rule: #null.

	self 
		parse: 'Null ' "result should be 'Null' "
		rule: #null.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOn [
	self 
		parse: ' ON ' "result should be 'ON' "
		rule: #on.

	self 
		parse: 'On ' "result should be 'On' "
		rule: #on.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOnConflict [
	self 
		parse: ' ON CONFLICT ' "result should be 'ON CONFLICT' "
		rule: #onConflict.

	self 
		parse: 'On Conflict ' "result should be 'On Conflict' "
		rule: #onConflict.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOr [
	self 
		parse: ' OR' "result should be 'OR' "
		rule: #or.

	self 
		parse: 'Or ' "result should be 'Or' "
		rule: #or.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermAsc [

	self 
		parse: 'IsActive in (''Y'',''N'') asc'
	 	rule: #orderingTerm.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermCollate [
	
	self 
		parse: 'IsActive in (''Y'',''N'') collate collateID'
	 	rule: #orderingTerm.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermCollateAsc [
	
	self 
		parse: 'IsActive in (''Y'',''N'') collate collateID asc'
	 	rule: #orderingTerm.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermCollateDesc [
	
	self 
		parse: 'IsActive in (''Y'',''N'') collate collateID desc'
	 	rule: #orderingTerm.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermDesc [

	self 
		parse: 'IsActive in (''Y'',''N'') desc'
	 	rule: #orderingTerm.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testOrderingTermNoOrderingTerms [
	
	self 
		parse: 'IsActive in (''Y'',''N'')'
	 	rule: #orderingTerm.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testPrimaryKey [
	self 
		parse: ' PRIMARY KEY' "result should be 'PRIMARY KEY "
		rule: #primaryKey.

	self 
		parse: 'Primary key ' "result should be 'Primary key' "
		rule: #primaryKey.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testQualifiedTableNameIndexedBy [

	self 
		parse: 'P_xxx_CH_BLA_MO indexed by YYY_NX_N'
		rule: #qualifiedTableName.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testQualifiedTableNameNotIndexed [

	self 
		parse: 'table.P_xxx_CH_BLA_MO not indexed'
		rule: #qualifiedTableName.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testQualifiedTableNameSimple [

	self 
		parse: 'P_xxx_CH_BLA_MO'
		rule: #qualifiedTableName.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testQualifiedTableNameWithNameDotName [

	self 
		parse: 'table.P_xxx_CH_BLA_MO'
		rule: #qualifiedTableName.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testQueryPlan [
	self 
		parse: ' QUERY PLAN ' "result should be 'EXPLAIN' "
		rule: #queryPlan.

	self 
		parse: 'Query plan ' "result should be 'Explain' "
		rule: #queryPlan.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testReferences [
	self 
		parse: ' REFERENCES ' "result should be 'REFERENCES' "
		rule: #references.

	self 
		parse: 'References ' "result should be 'References' "
		rule: #references.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testRenameTo [
	self 
		parse: ' RENAME TO ' "result should be 'RENAME TO' "
		rule: #renameTo.

	self 
		parse: ' rename To ' "result should be 'rename To' "
		rule: #renameTo.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testReplace [
	self 
		parse: ' REPLACE ' "result should be 'REPLACE' "
		rule: #replace.

	self 
		parse: 'Replace ' "result should be 'Replace' "
		rule: #replace.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testRestrict [
	self 
		parse: ' RESTRICT ' "result should be 'RESTRICT' "
		rule: #restrict.

	self 
		parse: 'Restrict ' "result should be 'Restrict' "
		rule: #restrict.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testResultColumnWithAlias [

	self 
		parse: ' g.name as gname ' 
		rule: #resultColumn.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testResultColumnWithExpression [

	self 
		parse: ' IsActive in (''Y'',''N'') as testName ' 
		rule: #resultColumn.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testResultColumnWithNameDotStar [
	self 
		parse: ' tableName.* ' 
		rule: #resultColumn.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testResultColumnWithStar [

	self 
		parse: ' * ' 
		rule: #resultColumn.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testRollback [
	self 
		parse: ' Rollback ' "result should be 'Rollback' "
		rule: #rollback.

	self 
		parse: 'ROLLBACK ' "result should be 'ROLLBACK' "
		rule: #rollback.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelect [
	self 
		parse: ' SELECT ' "result should be 'SELECT' "
		rule: #select.

	self 
		parse: 'Select ' "result should be 'Select' "
		rule: #select.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectCoreWithComplexFrom [

	self 
		parse: 'select SOMETHING from prefix.TABLE where COLUMN = ''XYZ'''
		rule: #selectCore
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectCoreWithMoreTablesAndColumns [

	self 
		parse: 'Select testTable.user_id , testTable2.user_id
		from testTable, testTable2'
		rule: #selectCore.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectCoreWithQuestionMarksIntoTheWhere [

	self 
		parse: 'select NVALUE from APPDEFAULT where DEFGROUP = ? and SVALUE = ?'
		rule: #selectCore.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectCoreWithStar [
	self 
		parse: ' SELECT * 
		FROM table' 
		rule: #selectCore.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectCoreWithWhere [

	self 
		parse: 'Select user_id
		from usertable
		where user_id > 0'
		rule: #selectCore.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementComplex [
	
	self 
		parse: ' SELECT a,b,c FROM USR_TAB_C C, USR_T_C as B WHERE C.TABLE_NAME = ''A_GL'' AND C.CLMN_NAME = ''E_ID'' and test = ''1'''
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementComplexWithCountColumn [
	
	self 
		parse: ' SELECT COUNT(bla) FROM USER_TAB_COLUMNS C WHERE C.TABLE_NAME = ''A_GLOB'' AND C.COLUMN_NAME = ''ESC_ID'''
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementComplexWithCountStar [
	
	self 
		parse: ' SELECT COUNT(*) FROM USER_TAB_COLUMNS C WHERE C.TABLE_NAME = ''A_GLOB'' AND C.COLUMN_NAME = ''ESC_ID'''
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementComplexWithCountdistinct [
	
	self 
		parse: ' SELECT COUNT(distinct bla) FROM USER_TAB_COLUMNS C WHERE C.TABLE_NAME = ''A_GLOB'' AND C.COLUMN_NAME = ''ESC_ID'''
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementComplexWithOneTable [
	
	self 
		parse: ' SELECT a,b,c FROM USR_TAB_C WHERE C.TABLE_NAME = ''A_GL'' AND C.CLMN_NAME = ''E_ID'' and test = ''1'''
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementStar [
	
	self 
		parse: ' select * ' 
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementStarFrom [
	
	self 
		parse: 'select * from tableName' 
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementStarFromAnotherSelect [

	self 
		parse: ' select * from (select * from tablename) ' 
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementStarFromAnotherSelectWithTwoTables [

	self 
		parse: ' select * from (select * from tablename, pippo) ' 
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementWithAliasesIntoSelectPart [
	
	self 
		parse: 'select g.esc_id, g.groupid, g.name as gname, g.diszipid, ''role'' as kind from approleadd r left outer join appgroup g on g.esc_id = r.rolegroup where roleuser = 1 union select g.esc_id, g.groupid, g.name as gname, g.diszipid, ''maingroup'' as kind from appgroup g left outer join appuser u on g.groupid = u.groupid where u.esc_id = 1 order by gname'
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementWithBlobIntoIdentifier [
	
	self 
		parse: 'select i.blobid, name, mediatype from appimage i, appblob b where (lower(Name) like ''px state readytopublish'' or lower(Name) like ''px state readytopublish:%'') and i.blobid=b.blobid'
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementWithQuestionMarks [
	
	self 
		parse: ' select NVALUE from APPDEFAULT where DEFGROUP = ? and SVALUE = ?'
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSelectStatementWithTRIM [
	
	self 
		parse: 'select TRIM(P_NAME||'', ''||ORT||'', Tel: ''||coalesce(O_TELBUERO ,''-'')||'', Fax: ''||coalesce(O_FAX ,''-'')) str from SYS_VPERSONENROLLEN_DISPLAY where fall_id = 2000001003 and ROLLEID = 1080 and DELETED_X = 0'
		rule: #selectStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSet [
	self 
		parse: ' SET ' "result should be 'SET' "
		rule: #set.

	self 
		parse: 'Set ' "result should be 'Set' "
		rule: #set.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumberMultipleDigitsWithMinusSign [
	self 
		parse: ' -3558 '
		rule: #signedNumber.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumberMultipleDigitsWithPlusSign [
	self 
		parse: ' +3558 '
		rule: #signedNumber.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumberMultipleDigitsWithoutSign [

	self 
		parse: ' 3558 '
		rule: #signedNumber.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumbersSingleDigitWithMinusSign [
	
	self 
		parse: ' -5 '
		rule: #signedNumber.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumbersSingleDigitWithPlusSign [
	
	self 
		parse: ' +8 '
		rule: #signedNumber.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSignedNumbersSingleDigitWithoutPlusSign [

	self 
		parse: ' 8 '
		rule: #signedNumber.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceIdentifierPartComplexTableName [
	
	self 
		parse: 'db.table '
		rule: #singleSourceIdentifierPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceIdentifierPartLinearTableName [

	self 
		parse: 'table '
		rule: #singleSourceIdentifierPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceIdentifierPartNotIndexed [
	
	self 
		parse: 'table not indexed'
		rule: #singleSourceIdentifierPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceIdentifierPartTableNameWithAlias [
	
	self 
		parse: 'db.table anotherTableName'
		rule: #singleSourceIdentifierPart.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceIdentifierPartTableNameWithAsAndAlias [
	
	self 
		parse: 'db.table as anotherTableName'
		rule: #singleSourceIdentifierPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceJoinSourceInRBPartSimpleJoin [

	self 
		parse: '( tab1.col natural join anotherCol )'
		rule: #singleSourceJoinSourceInRBPart
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceJoinSourceInRBPartWithJoinAndAlias [

	self 
		parse: '( tab1.col as col natural join anotherCol )'
		rule: #singleSource.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceSelectStmtInRBPartWithSelect [

	self 
		parse: '( select * from tableName )'
		rule: #singleSourceSelectStmtInRBPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceSelectStmtInRBPartWithSelectAndAlias [

	self 
		parse: '( select * from tableName ) tb'
		rule: #singleSourceSelectStmtInRBPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSingleSourceSelectStmtInRBPartWithSelectAsAlias [

	self 
		parse: '( select * from tableName ) as tb'
		rule: #singleSourceSelectStmtInRBPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSqlStatement [
	self 
		parse: ' create database testName '
		rule: #sqlStatement.
	self 
		parse: ' explain create database testName '
		rule: #sqlStatement.
	self 
		parse: ' query plan create database testName '
		rule: #sqlStatement.
	self 
		parse: ' explain query plan create database testName '
		rule: #sqlStatement.
	self 
		parse: 'CREATE INDEX AD_Archive_Documents ON AD_Archive(AD_Table_ID, AD_Process_ID)'
		rule: #sqlStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testSqlStatementList [
	self 
		parse: ' create database testName;
			explain query plan create database testName '
		rule: #sqlStatementList.
	self 
		parse: ' explain create database testName;
				query plan create database testName;
				create table tableName (colName number(10)) '
		rule: #sqlStatementList.
	self 
		parse: ' query plan create database testName '
		rule: #sqlStatement.
		
	self 
		parse: '   create table testName as select *;
			explain query plan create database testName '
		rule: #sqlStatementList.
		
	self 
		parse: 'ALTER TABLE M_INSN_LT ADD CONSTRAINT PK_IP_RELATION_CTRL_ID 
		PRIMARY KEY (IP_CTRL_ID_PARENT, IP_CTRL_ID_CHILD, RELATION_TYPE_CD);
		ALTER TABLE M_INSN_LT ADD CONSTRAINT PK_M_INS_LT 
		PRIMARY KEY (SCHUTIT_KEY);
		ALTER TABLE M_INSN_LT ADD CONSTRAINT PK_IP_RELATION_CTRL_ID 
		PRIMARY KEY (IP_CTRL_ID_PARENT, IP_CTRL_ID_CHILD, RELATION_TYPE_CD)'
		rule: #sqlStatementList.
	
	self 
		parse: 'CREATE UNIQUE INDEX W_ClickCount_TargetURL ON W_ClickCount(AD_Client_ID, TargetURL);
		CREATE UNIQUE INDEX W_CounterCount_PageURL ON W_CounterCount(AD_Client_ID, PageURL);
ALTER TABLE A_Asset ADD CONSTRAINT AAsset_Parent 
    FOREIGN KEY (Parent_Asset_ID)
    REFERENCES A_Asset(A_Asset_ID)'
		rule: #sqlStatementList.
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTable [
	self 
		parse: ' table' "result should be 'table' "
		rule: #table.
	
	self 
		parse: 'TABLE ' "result should be 'TABLE' "
		rule: #table.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionThreeFields [

	self 
		parse: 'CO_K          VARCHAR2(100) NOT NULL,
		CH_D          TIMESTAMP,
	VER            NUMBER(10) DEFAULT 0 NOT NULL'
		rule: #tableColumnsDefinition.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionThreeFieldsWithDefaultAsLast [

	self 
		parse: 'C_Charge_ID              NUMBER(10, 0),
		Processing               CHAR(1),
    Posted                   CHAR(1)           DEFAULT ''N'' NOT NULL'
		rule: #tableColumnsDefinition.
		
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionThreeFieldsWithDefaultInBetween [

	self 
		parse: 'C_Charge_ID              NUMBER(10, 0),
		 Posted                   CHAR(1)           DEFAULT ''N'' NOT NULL,
		Processing               CHAR(1)'
		rule: #tableColumnsDefinition.
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionTwoFieldsOneConstr [

	self 
		parse: ' LeaseTerminationDate         DATE               NOT NULL,
    Processing                   CHAR(1),
    CONSTRAINT A_Asset_Key PRIMARY KEY (A_Asset_ID)'
		rule: #tableColumnsDefinition.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionTwoFieldsPrimaryKeyAndDefault [

	self 
		parse: 'CHANGE_USER_ID      NUMBER(10)  PRIMARY KEY AUTOINCREMENT,
	VERSION             NUMBER(10) DEFAULT 0 NOT NULL'
		rule: #tableColumnsDefinition.


]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableColumnsDefinitionTwoFieldsWithComplexDefault [	
	
	self
		parse: 'Year              VARCHAR2(4)      DEFAULT ''0000'' NOT NULL,
    AD_Client_ID      NUMBER(10, 0)    NOT NULL'
		rule: #tableColumnsDefinition.
		
		
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintCheck [
	self 
		parse: ' CONSTRAINT testName check (ColFirst) '
		rule: #tableConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintCheckPart [
	self 
		parse: ' check ( ColFirst ) '
		rule: #tableConstraintCheckPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintFK [
	self 
		parse: ' CONSTRAINT testName foreign key (ColFirst) references foreignTableName (foo) '
		rule: #tableConstraint.	
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintFKs [
	self 
		parse: ' CONSTRAINT testName foreign key (ColFirst, colSecond) references foreignTableName (foo) '
		rule: #tableConstraint.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartMoreFKs [

	self 
		parse: ' foreign key (ColFirst, colSecond) references tableName'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartMoreFKsAndMatchClause [

	self 
		parse: ' foreign key (ColFirst, colSecond) references tableName match testName'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartMoreFKsReferecingTableAndFoo [

	self 
		parse: ' foreign key (ColFirst, colSecond) references tableName (foo)'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartOneFK [

	self 
		parse: ' foreign key (ColFirst) references tableName'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartOneFKReferencesTable [

	self 
		parse: ' foreign key (ColFirst) references tableName'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyPartOneFKReferencesTableAndFoo [

	self 
		parse: ' foreign key (ColFirst) references tableName (foo)'
		rule: #tableConstraintForeignKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintForeignKeyWholeConstraint [

	self 
		parse: 'CONSTRAINT region
    FOREIGN KEY (region )
    REFERENCES mydb.Region (idRegion )
    ON DELETE NO ACTION
    ON UPDATE CASCADE'
		rule: #tableConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPK [

	self 
		parse: ' CONSTRAINT testName primary key (ColFirst) '
		rule: #tableConstraint.


]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPKIdentifierWithUnderscores [

	self 
		parse: ' CONSTRAINT AD_PrintFormat_Key PRIMARY KEY (AD_PrintFormat_ID) '
		rule: #tableConstraint.


]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPKsOnConflictFail [
	self 
		parse: ' CONSTRAINT testName primary key (ColFirst, colSecond) on conflict fail '
		rule: #tableConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartMoreColumns [

	self 
		parse: ' primary key (ColFirst, colSecond)'
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartMoreColumnsOnConflictFail [

	self 
		parse: ' primary key (ColFirst, colSecond) on conflict fail '
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartMoreUniqueColumns [

	self 
		parse: ' unIQUe (ColFirst, colSecond) on conflict fail '
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartOneColumn [

	self 
		parse: ' primary key (ColFirst) '
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartOneUniqueColumn [

	self 
		parse: ' unique (ColFirst) on conflict fail '
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartWithUniqueOnMoreColumns [

	self 
		parse: ' unique (ColFirst, colSecond)'
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartWithUniqueOnMoreColumnsOnConflictRollback [
	self 
		parse: ' unique (ColFirst, colSecond) on conflict rollback'
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintPrimaryKeyPartWithUniqueOnOneColumn [

	self 
		parse: ' unique ( colSecond) '
		rule: #tableConstraintPrimaryKeyPart.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTableConstraintUniques [
	self 
		parse: ' CONSTRAINT testName unique (ColFirst, colSecond) '
		rule: #tableConstraint.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTemp [
	self 
		parse: ' TEMP' "result should be 'TEMP' "
		rule: #temp.

	self 
		parse: 'Temp ' "result should be 'Temp' "
		rule: #temp.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTemporary [
	self 
		parse: 'TEMPORARY ' "result should be 'TEMPORARY' "
		rule: #temporary.
	
	self 
		parse: ' Temporary' "result should be 'Temporary' "
		rule: #temporary.

]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTypeName [

	self 
		parse: ' date '
		rule: #typeName.
	self 
		parse: ' timestamp ( 123 ) '
		rule: #typeName.
	self 
		parse: ' number ( - 1235)'
		rule: #typeName.
	self 
		parse: ' number (-1235 , 235 )'
		rule: #typeName.
	self 
		parse: ' number (-1235 , 235.43 )'
		rule: #typeName.
	self 
		parse: ' number (-1235 , -235.43 )'
		rule: #typeName.
	self 
		parse: ' RAW(254) '
		rule: #typeName.
	self 
		parse: ' VARCHAR2(255 CHAR) '
		rule: #typeName
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testTypeNameWithStar [

	self 
		parse: ' NUMBER(*,0) '
		rule: #typeName.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testUnique [
	self 
		parse: ' UNIQUE' "result should be 'UNIQUE' "
		rule: #unique.

	self 
		parse: 'Unique ' "result should be 'Unique' "
		rule: #unique.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testUpdate [
	self 
		parse: ' UPDATE ' "result should be 'UPDATE' "
		rule: #update.

	self 
		parse: 'Update ' "result should be 'Update' "
		rule: #update.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testUpdateStatement [

	self 
		parse: 'Update P_xxx_CH_BLA_MO set Y_X = 1 where YYY_NX_N = <%BLA_MO>'
		rule: #updateStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testUpdateStatementLongerWhere [
		
	self 
		parse: 'Update P_xxx_BLABLA_MO set XXX_OR_N = 100 where xxxID = <@xxxID> and yyyyID = <@yyyyID> and BLA_XX_Y = <%OrId>'
		rule: #updateStatement.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testValues [
	self 
		parse: ' VALUES ' "result should be 'VALUES' "
		rule: #values.

	self 
		parse: ' Values ' "result should be 'Values' "
		rule: #values.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testWhere [
	self 
		parse: ' Where ' "result should be 'Where' "
		rule: #where.

	self 
		parse: 'WHERE ' "result should be 'WHERE' "
		rule: #where.
]

{ #category : #tests }
PetitSQLiteGrammarTest >> testWhitespace [
	self 
		parse: ' ' "result should be Character space "
		rule: #whitespace.
]
