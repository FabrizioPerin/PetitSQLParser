Class {
	#name : #PetitSQLiteASTNodesParserTests,
	#superclass : #PetitSQLiteGrammarTest,
	#category : #'PetitSQLite-Tests-Parser'
}

{ #category : #accessing }
PetitSQLiteASTNodesParserTests >> parserClass [
	^PetitSQLiteASTNodesParser
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableAddConstraintMultipleFKs [

	super testAlterTableAddConstraintMultipleFKs.
	
	self assert: (result isKindOf: SQLAlterTableStmtNode).
	self assert: (result nameOfTableToAlter = 'M_INSN_LT').

	self deny: (result constraints isEmpty).
	self assert: (result constraints first isKindOf: SQLTableConstraintNode).
	self assert: (result constraints first name = 'FK_CRL_ID').
	self assert: (result constraints first isFKConstraint).
	self deny: (result constraints first isPKConstraint).
	self assert: (result constraints first referencedTableName = 'CM_R_IP_RL' ).
	self assert: (result constraints first fkColumnNames size = 4).
	self assert: (result constraints first fkColumnNames allSatisfy: [:el | el isString]).
	self assert: (result constraints first pkColumnNames size =4).
	self assert: (result constraints first pkColumnNames allSatisfy: [:el | el isString]).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableAddConstraintMultiplePKs [

	super testAlterTableAddConstraintMultiplePKs.

	self assert: (result isKindOf: SQLAlterTableStmtNode).
	self assert: (result nameOfTableToAlter = 'M_INSN_LT').

	self deny: (result constraints isEmpty).
	self assert: (result constraints first isKindOf: SQLTableConstraintNode).
	self assert: (result constraints first name = 'PK_IP_RELATION_CTRL_ID').
	self deny: (result constraints first isFKConstraint).
	self assert: (result constraints first isPKConstraint).
	self assert: (result constraints first referencedTableName = nil ).
	self assert: (result constraints first fkColumnNames size = 0).
	self assert: (result constraints first pkColumnNames size =3).
	self assert: (result constraints first pkColumnNames first = 'IP_CTRL_ID_PARENT').
	self assert: (result constraints first pkColumnNames second = 'IP_CTRL_ID_CHILD').
	self assert: (result constraints first pkColumnNames third = 'RELATION_TYPE_CD').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableAddConstraintOnePK [

	super testAlterTableAddConstraintOnePK.
	
	self assert: (result isKindOf: SQLAlterTableStmtNode).
	self assert: (result nameOfTableToAlter = 'M_INSN_LT').

	self deny: (result constraints isEmpty).
	self assert: (result constraints first isKindOf: SQLTableConstraintNode).
	self assert: (result constraints first name = 'PK_M_INS_LT').
	self deny: (result constraints first isFKConstraint).
	self assert: (result constraints first isPKConstraint).
	self assert: (result constraints first referencedTableName = nil ).
	self assert: (result constraints first fkColumnNames size = 0).
	self assert: (result constraints first pkColumnNames size =1).
	self assert: (result constraints first pkColumnNames first = 'SCHUTIT_KEY').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableAddConstraintUnique [ 

	super testAlterTableAddConstraintUnique.
	
	self assert: (result isKindOf: SQLAlterTableStmtNode).
	self assert: (result nameOfTableToAlter = 'UDF_TEST').

	self deny: (result constraints isEmpty).
	self assert: (result constraints first isKindOf: SQLTableConstraintNode).
	self assert: (result constraints first name = 'BIN$hFqLFqNzTUaOtkmeJTbToQ').
	self deny: (result constraints first isFKConstraint).
	self deny: (result constraints first isPKConstraint).
	self assert: (result constraints first isUnique).  
	self assert: (result constraints first referencedTableName = nil ).
	self assert: (result constraints first fkColumnNames size = 0).
	self assert: (result constraints first pkColumnNames size = 0).
	self assert: (result constraints first uniqueColumnNames size = 1).
	self assert: (result constraints first uniqueColumnNames first = 'UDF_TEST_PK').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintFKOracleNoName [

	super testAlterTableConstraintFKOracleNoName.
	
	self assert: (result isKindOf: SQLTableConstraintNode).
	self assert: (result name = nil).
	self assert: (result isFKConstraint).
	self deny: (result isPKConstraint).
	self assert: (result referencedTableName = 'CM_R_IP_RL' ).
	self assert: (result fkColumnNames size = 4).
	self assert: (result fkColumnNames allSatisfy: [:el | el isString]).
	self assert: (result pkColumnNames size =4).
	self assert: (result fkColumnNames allSatisfy: [:el | el isString]).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintFKOracleSeveralColumns [

	super testAlterTableConstraintFKOracleSeveralColumns.

	self assert: (result isKindOf: SQLTableConstraintNode).
	self assert: (result name = 'FK_CRL_ID').
	self assert: (result isFKConstraint).
	self deny: (result isPKConstraint).
	self assert: (result referencedTableName = 'CM_R_IP_RL' ).
	self assert: (result fkColumnNames size = 4).
	self assert: (result fkColumnNames allSatisfy: [:el | el isString]).
	self assert: (result pkColumnNames size =4).
	self assert: (result fkColumnNames allSatisfy: [:el | el isString]).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintPKOracleNoName [

	super testAlterTableConstraintPKOracleNoName.
	
	self assert: (result isKindOf: SQLTableConstraintNode).
	self assert: (result name = nil).
	self deny: (result isFKConstraint).
	self assert: (result isPKConstraint).
	self assert: (result referencedTableName = nil ).
	self assert: (result fkColumnNames size = 0).
	self assert: (result pkColumnNames size =3).
	self assert: (result pkColumnNames first = 'IP_CTRL_ID_PARENT').
	self assert: (result pkColumnNames second = 'IP_CTRL_ID_CHILD').
	self assert: (result pkColumnNames third = 'RELATION_TYPE_CD').
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintPKOracleOneColumn [

	super testAlterTableConstraintPKOracleOneColumn.		

	self assert: (result isKindOf: SQLTableConstraintNode).
	self assert: (result name = 'PK_M_INS_LT').
	self deny: (result isFKConstraint).
	self assert: (result isPKConstraint).
	self assert: (result referencedTableName = nil ).
	self assert: (result fkColumnNames size = 0).
	self assert: (result pkColumnNames size =1).
	self assert: (result pkColumnNames first = 'SCHUTIT_KEY').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintPKOracleSeveralColumns [

	super testAlterTableConstraintPKOracleSeveralColumns.
	
	self assert: (result isKindOf: SQLTableConstraintNode).
	self assert: (result name = 'PK_IP_RELATION_CTRL_ID').
	self deny: (result isFKConstraint).
	self assert: (result isPKConstraint).
	self assert: (result referencedTableName = nil ).
	self assert: (result fkColumnNames size = 0).
	self assert: (result pkColumnNames size =3).
	self assert: (result pkColumnNames first = 'IP_CTRL_ID_PARENT').
	self assert: (result pkColumnNames second = 'IP_CTRL_ID_CHILD').
	self assert: (result pkColumnNames third = 'RELATION_TYPE_CD').
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableConstraintUnique [

	super testAlterTableConstraintUnique.
	
	self assert: (result isKindOf: SQLTableConstraintNode).

	self deny: (result isFKConstraint).
	self deny: (result isPKConstraint).
	self deny: (result isCheck).
	self assert: (result isUnique).
	self assert: (result uniqueColumnNames size =1).
	self assert: (result uniqueColumnNames first = 'ITEMS_ID').	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testAlterTableRenameTable [
	
	super testAlterTableRenameTable.
	
	self assert: (result isKindOf: SQLAlterTableStmtNode).
	self assert: result isRename.
	self assert: (result nameOfTableToAlter = 'M_INSN_LT').
	self assert: (result newTableName = 'TEstName').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testColumnConstraintDefaultNumbersWithQuotes [
	super testColumnConstraintDefaultNumbersWithQuotes.
	
	self assert: (result isMemberOf: SQLColumnConstraintNode).
	self assert: (result name = nil).
	self assert: (result defaultValue = '0000').
	self assert: (result isUnique = nil).
	self assert: (result isPK = nil).
	self assert: (result canBeNull = nil).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testColumnDefJustColName [
	super testColumnDefJustColName.
	
	self assert: (result isMemberOf: SQLColumnDefNode).  	
	self assert: result name equals: 'colName'.
	self assert: result type equals: nil.
	self assert: (result constraints isMemberOf: Array).
	self assert: result constraints size equals: 0.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testColumnDefWithEnable [
	super testColumnDefWithEnable.
	
	self assert: (result isMemberOf: SQLColumnDefNode).  	
	self assert: (result name = 'ABLAUFID').
	self assert: (result type = 'NUMBER').
	self assert: (result constraints isMemberOf: Array).
	self assert: result constraints size equals: 1.
	self assert: (result constraints first isMemberOf: SQLColumnConstraintNode).
	self assert: (result constraints first name = nil).
	self assert: (result constraints first defaultValue = nil).
	self assert: (result constraints first isUnique = nil).
	self assert: (result constraints first isPK = nil).
	self assert: (result constraints first canBeNull = false).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testColumnDefWithLongDefault [
	super testColumnDefWithLongDefault.
	
	self assert: (result isMemberOf: SQLColumnDefNode).  	
	self assert: (result name = 'Year').
	self assert: (result type = 'VARCHAR2').
	self assert: (result constraints isMemberOf: Array).
	
	self assert: (result constraints first isMemberOf: SQLColumnConstraintNode).
	self assert: (result constraints first defaultValue = '0000').
	self assert: (result constraints first isUnique = nil).
	self assert: (result constraints first isPK = nil).
	self assert: (result constraints first canBeNull = nil).
	
	self assert: (result constraints second isMemberOf: SQLColumnConstraintNode).
	self assert: (result constraints second defaultValue = nil).
	self assert: (result constraints second isUnique = nil).
	self assert: (result constraints second isPK = nil).
	self assert: (result constraints second canBeNull = false).
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testCreateTableBigWithPrimaryKeyConstr [
	super testCreateTableBigWithPrimaryKeyConstr.
	
	self assert: (result isMemberOf: SQLCreateTableStmtNode).
	self assert: (result constraints isArray).
	self assert: (result constraints first second isMemberOf: SQLTableConstraintNode).
	self assert: (result constraints first second isPKConstraint).
	self assert: (result constraints first second pkColumnNames size = 1).  
	self assert: (result constraints first second pkColumnNames first = 'A_xxx_yyy_ID').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testCreateTableWith9Columns [
	super testCreateTableWith9Columns.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testCreateTableWithConstraints [
	
	super testCreateTableWithConstraints.
	
	self assert: (result isMemberOf: SQLCreateTableStmtNode).
	self assert: result name equals: 'mydb.Delegation'.
	
	self assert: result constraints size equals: 2.
	self assert: result constraints first second isPKConstraint.
	self assert: result constraints second second isFKConstraint.

]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testDeleteStatementSimple [
	super testDeleteStatementSimple.
	
	self assert: (result isMemberOf: SQLDeleteStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: result from size equals: 1.
	self assert: result from first equals: 'TABLEName'.
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testDeleteStatementWithComplexWhere [
	super testDeleteStatementWithComplexWhere.
	
	self assert: (result isMemberOf: SQLDeleteStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: result from size equals: 1.
	self assert: result from first equals: 'APPLOCK'.
	
	self assert: (result where isMemberOf: OrderedCollection).
	self assert: result where size equals: 1.
	self assert: (result where first isMemberOf: Array).
	self assert: result where first first equals: 'not exists'.
	self assert: result where first second equals: '(select LOGINID from APPLOGIN where LOGINID = APPLOCK.LOGINID and STATE = ''BUSY'')'.
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testDeleteStatementWithSimpleWhere [
	super testDeleteStatementWithSimpleWhere.
	
	self assert: (result isMemberOf: SQLDeleteStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: result from size equals: 1.
	self assert: result from first equals: 'APPLOCK'.
	
	self assert: (result where isMemberOf: OrderedCollection).
	self assert: result where size equals: 1.
	self assert: (result where first isMemberOf: Array).
	self assert: result where first first equals: 'not exists'.
	self assert: result where first second equals: 'APP'.
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testInsertStatmentIntoSpecificField [
	"'INSERT INTO table_name (column1) VALUES (value1)'"
	super testInsertStatmentIntoSpecificField.
	
	self assert: (result isMemberOf: SQLInsertStatementNode).
	self assert: result table equals: 'table_name'.
	self assert: result affectedColumns size equals: 1.
	self assert: result affectedColumns first equals: 'column1'.
	self assert: result values size equals: 1.
	self assert: result values first equals: 'value1'.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testInsertStatmentIntoSpecificFields [

	"'INSERT INTO table_name (column1, column2, column3) VALUES (value1, ''value2'', value3)'"
	super testInsertStatmentIntoSpecificFields.

	self assert: (result isMemberOf: SQLInsertStatementNode).
	self assert: result table equals: 'table_name'.
	
	self assert: result affectedColumns size equals: 3.
	self assert: result affectedColumns first equals: 'column1'.
	self assert: result affectedColumns second equals: 'column2'.
	self assert: result affectedColumns third equals: 'column3'.
	
	self assert: result values size equals: 3.
	self assert: result values first equals: 'value1'.
	self assert: result values second equals: '''value2'''.
	self assert: result values third equals: '''value3'''.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testInsertStatmentIntoSpecificFieldsVariousTypes [
	"'INSERT INTO Persons VALUES (4,''Nilsen'', ''Johan'', ''Bakken2'', ''Stavanger'')'"
	super testInsertStatmentIntoSpecificFieldsVariousTypes.
	
	
	self assert: (result isMemberOf: SQLInsertStatementNode).
	self assert: result table equals: 'Persons'.
	
	self assert: result affectedColumns size equals: 0.
	
	self assert: result values size equals: 5.
	self assert: result values first equals: '4'.
	self assert: result values second equals: '''Nilsen'''.
	self assert: result values third equals: '''Johan'''.
	self assert: (result values at: 4) equals: '''Bakken2'''.
	self assert: (result values at: 5) equals: '''Stavanger'''.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testInsertStatmentIntoThreeValues [
	"'INSERT INTO table_name VALUES (value1, value2, value3)'"
	super testInsertStatmentIntoThreeValues.
	
	self assert: (result isMemberOf: SQLInsertStatementNode).
	self assert: result table equals: 'table_name'.
	
	self assert: result affectedColumns size equals: 0.
	
	self assert: result values size equals: 3.
	self assert: result values first equals: 'value1'.
	self assert: result values second equals: 'value2'.
	self assert: result values third equals: 'value3'.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testInsertStatmentOneValue [
	"'INSERT INTO table_name VALUES (value1)'"
	super testInsertStatmentOneValue.

	self assert: (result isMemberOf: SQLInsertStatementNode).
	self assert: result table equals: 'table_name'.
	
	self assert: result affectedColumns size equals: 0.
	
	self assert: result values size equals: 1.
	self assert: result values first equals: 'value1'.
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectCoreWithComplexFrom [

	super testSelectCoreWithComplexFrom.
	
	self assert: result from size = 1.
	self assert: result from first = 'prefix.TABLE'
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectCoreWithMoreTablesAndColumns [

	super testSelectCoreWithMoreTablesAndColumns.
			
	self assert: (result isKindOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 2).
	self assert: (result from first = 'testTable').
	self assert: (result from second = 'testTable2').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectCoreWithQuestionMarksIntoTheWhere [

	super testSelectCoreWithQuestionMarksIntoTheWhere.
		
	self assert: (result isMemberOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 1).
	self assert: (result from first = 'APPDEFAULT').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectCoreWithStar [ 
	
	super testSelectCoreWithStar.
			
	self assert: (result isKindOf: SQLSelectStmtNode ).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 1).
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectCoreWithWhere [
	super testSelectCoreWithWhere.
	
	self assert: (result isMemberOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 1).
	self assert: (result from first = 'usertable').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectStatementComplex [
	super testSelectStatementComplex.
		
	self assert: (result isMemberOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 2).
	self assert: (result from first = 'USR_TAB_C').
	self assert: (result from second = 'USR_T_C').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectStatementComplexWithCountStar [
	
	super testSelectStatementComplexWithCountStar.
		
	self assert: (result isMemberOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 1)    
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSelectStatementComplexWithOneTable [
	
	super testSelectStatementComplexWithOneTable.
		
	self assert: (result isMemberOf: SQLSelectStmtNode).
	self assert: (result from isMemberOf: OrderedCollection).
	self assert: (result from size = 1)    
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumberMultipleDigitsWithMinusSign [
	super testSignedNumberMultipleDigitsWithMinusSign.
	
	self assert: (result = #(-3558)).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumberMultipleDigitsWithPlusSign [
	
	super testSignedNumberMultipleDigitsWithPlusSign.
	
	self assert: (result = #(3558)).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumberMultipleDigitsWithoutSign [
	super testSignedNumberMultipleDigitsWithoutSign.
	
	self assert: (result = #(3558)).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumbersSingleDigitWithMinusSign [
	super testSignedNumbersSingleDigitWithMinusSign.
	
	self assert: (result = #(-5)).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumbersSingleDigitWithPlusSign [
	super testSignedNumbersSingleDigitWithPlusSign.
	
	self assert: (result = #(8)). 
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testSignedNumbersSingleDigitWithoutPlusSign [
	super testSignedNumbersSingleDigitWithoutPlusSign.
	
	self assert: (result = #(8)).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintCheckPart [ 
	super testTableConstraintCheckPart.
	
	self assert: (result isMemberOf: SQLTableConstraintNode).
	self assert: (result isCheck).  
	self deny: (result expressionString isNil).
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintForeignKeyPartMoreFKs [
	super testTableConstraintForeignKeyPartMoreFKs.
	
	self assert: (result isMemberOf: SQLTableConstraintNode).
	self deny: result isPKConstraint.
	self assert: result isFKConstraint.
	self deny: result isUnique.
	self assert: (result fkColumnNames size = 2).
	self assert: (result fkColumnNames first = 'ColFirst').
	self assert: (result fkColumnNames second = 'colSecond').
	self assert: (result referencedTableName = 'tableName').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintForeignKeyPartOneFK [
	super testTableConstraintForeignKeyPartOneFK.
	
	self assert: (result isMemberOf: SQLTableConstraintNode ).
	self deny: result isPKConstraint.
	self assert: result isFKConstraint.
	self deny: result isUnique.
	self assert: (result fkColumnNames size = 1).
	self assert: (result fkColumnNames first = 'ColFirst').
	self assert: (result referencedTableName = 'tableName').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintPrimaryKeyPartMoreColumns [
	super testTableConstraintPrimaryKeyPartMoreColumns.
	
	self assert: (result isMemberOf: SQLTableConstraintNode).
	self assert: result isPKConstraint.
	self deny: result isFKConstraint.
	self assert: (result pkColumnNames size = 2).
	self assert: (result pkColumnNames first = 'ColFirst').
	self assert: (result pkColumnNames second = 'colSecond').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintPrimaryKeyPartMoreUniqueColumns [
	super testTableConstraintPrimaryKeyPartMoreUniqueColumns.
	
	self assert: (result isMemberOf: SQLTableConstraintNode).
	self deny: result isPKConstraint.
	self deny: result isFKConstraint.
	self assert: result isUnique.
	self assert: (result uniqueColumnNames size = 2).
	self assert: (result uniqueColumnNames first = 'ColFirst').
	self assert: (result uniqueColumnNames second = 'colSecond').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintPrimaryKeyPartOneColumn [
	super testTableConstraintPrimaryKeyPartOneColumn.

	self assert: (result isMemberOf: SQLTableConstraintNode).
	self assert: result isPKConstraint.
	self deny: result isFKConstraint.
	self assert: (result pkColumnNames size = 1).
	self assert: (result pkColumnNames first = 'ColFirst').
	
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testTableConstraintPrimaryKeyPartOneUniqueColumn [
	super testTableConstraintPrimaryKeyPartOneUniqueColumn.
	
	self assert: (result isMemberOf: SQLTableConstraintNode).
	self deny: result isPKConstraint.
	self deny: result isFKConstraint.
	self assert: result isUnique.  
	self assert: (result uniqueColumnNames size = 1).
	self assert: (result uniqueColumnNames first = 'ColFirst').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testUpdateStatement [
	super testUpdateStatement.
	
	self assert: (result isMemberOf: SQLUpdateStatementNode).
	self assert: (result table = 'P_xxx_CH_BLA_MO').
]

{ #category : #tests }
PetitSQLiteASTNodesParserTests >> testUpdateStatementLongerWhere [
	super testUpdateStatementLongerWhere.

	self assert: (result isMemberOf: SQLUpdateStatementNode).
	self assert: (result table = 'P_xxx_BLABLA_MO').
]
