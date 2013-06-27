"
This class is based on the SQLite grammar. Refer to http://www.sqlite.org/about.html for more information about the sintax. 

IMPORTANT: It can be that the implementation does not fit really all the parts of the SQLite grammar. So eventually extend this class to satisfy  your needed.

This class should be extended to define the behaviour of the production action to perform.

Instance Variables:
	whitespace	<ProtoObject | PseudoContext>
	identifier	<Heap | PPParser | RecordingControlsMorph>
	createDatabase	<PPParser>
	table	<Heap | PPParser | RecordingControlsMorph>
	database	<ProtoObject | PseudoContext>
	createTable	<PPParser>
	create	<Heap | PPParser | RecordingControlsMorph>
	creator	<BalloonBezierSimulation | BalloonLineSimulation | Character class | ECMenuMorph | FMSingleEdgeStrategy | GLMSelectedTextChanged | LineSegment | MABreadthFirstSearchPath | MADijkstra | PPParser | REPHudson | SHRange | Stopwatch | Timespan>
"
Class {
	#name : #PetitSQLiteGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'whitespace',
		'identifier',
		'createDatabase',
		'table',
		'database',
		'createTable',
		'create',
		'ifNotExists',
		'temp',
		'temporary',
		'columnDef',
		'tableConstraint',
		'as',
		'selectStatement',
		'typeName',
		'columnConstraint',
		'constraint',
		'primaryKey',
		'asc',
		'desc',
		'conflictClause',
		'autoincrement',
		'notNull',
		'unique',
		'check',
		'expression',
		'default',
		'signedNumber',
		'literalValue',
		'collate',
		'foreignKeyClause',
		'indexedColumn',
		'foreignKey',
		'onConflict',
		'rollback',
		'abort',
		'fail',
		'ignore',
		'replace',
		'integerLiteral',
		'floatingPointLiteral',
		'references',
		'notElem',
		'on',
		'update',
		'delete',
		'set',
		'null',
		'restrict',
		'cascade',
		'noAction',
		'match',
		'deferrable',
		'initially',
		'deferred',
		'immediate',
		'foreignKeyClauseOnPart',
		'foreignKeyClauseNotPart',
		'blobLiteral',
		'currentTime',
		'currentDate',
		'currentTimestamp',
		'tableConstraintPrimaryKeyPart',
		'tableConstraintForeignKeyPart',
		'tableConstraintCheckPart',
		'columnTypes',
		'explain',
		'queryPlan',
		'sqlStatement',
		'sqlStatementList',
		'tableColumnsDefinition',
		'columnConstraintPrimaryKey',
		'alter',
		'alterTable',
		'renameTo',
		'add',
		'column',
		'alterTableConstraintPKOracle',
		'alterTableConstraintFKOracle',
		'expressionTerm',
		'index',
		'createIndex',
		'select',
		'distinct',
		'all',
		'resultColumn',
		'selectCore',
		'from',
		'where',
		'groupBy',
		'joinSource',
		'singleSource',
		'joinOperator',
		'indexed',
		'by',
		'notIndexed',
		'joinConstraint',
		'orderingTerm',
		'compoundOperator',
		'alterTableConstraintUnique',
		'updateStatement',
		'keywords',
		'keyword',
		'qualifiedTableName',
		'deleteStatement',
		'insert',
		'or',
		'into',
		'values',
		'insertStatement',
		'complexIdentifier',
		'singleSourceJoinSourceInRBPart',
		'singleSourceSelectStmtInRBPart',
		'singleSourceIdentifierPart',
		'defaultConstraint',
		'notNullConstraint',
		'unsigned',
		'indexedColumnsInRoundParentheses',
		'expressionInRoundParentheses',
		'identifiersInRoundParentheses',
		'char',
		'byte',
		'timestamp',
		'date',
		'time',
		'view',
		'createView',
		'timestampOracleFormat',
		'timestampDB2Format',
		'comment',
		'label'
	],
	#category : #'PetitSQLite-Parser'
}

{ #category : #'as yet unclassified' }
PetitSQLiteGrammar class >> ignoredNames [
	
	^super ignoredNames , #('keywords' 'initializeKeywords')
]

{ #category : #tokens }
PetitSQLiteGrammar >> abort [
	^'ABORT' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> add [
	^'ADD' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> all [
	^'ALL' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> alter [
	^'ALTER' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTable [
	"http://www.sqlite.org/lang_altertable.html"
	"modified to add the oracle defintion of contraints on PK and FK"
	^alter , table , 
		complexIdentifier , 
		( (renameTo , identifier) / (add , ( alterTableConstraintPKOracle / alterTableConstraintFKOracle / alterTableConstraintUnique / ( column optional, columnDef trim) trim))).
	

]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintFKOracle [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of an oracle constraint"
	^(	(constraint , identifier) optional , 
		foreignKey , $( asParser trim optional , (identifier separatedBy: $, asParser trim) , $) asParser trim optional , 
		foreignKeyClause).
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintPKOracle [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of an oracle constraint"
	^( (constraint , identifier) optional , 
	primaryKey , $( asParser trim optional , (identifier separatedBy: $, asParser trim) , $) asParser trim optional , (('USING' asParser caseInsensitive , index) / ('ENABLE' asParser caseInsensitive , 'NOVALIDATE' asParser caseInsensitive)) optional ) trim 
]

{ #category : #tokens }
PetitSQLiteGrammar >> alterTableConstraintUnique [
	"Modified the standard grammar of the SQLite alter table to accept also the definition of a unique constraint"
	^( (constraint , identifier) optional , 
	unique , $( asParser trim optional , (identifier separatedBy: $, asParser trim) , $) asParser trim optional , (('USING' asParser caseInsensitive , index) / ('ENABLE' asParser caseInsensitive , 'NOVALIDATE' asParser caseInsensitive)) optional ) trim 
]

{ #category : #tokens }
PetitSQLiteGrammar >> as [
	^'AS' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> asc [
	^'ASC' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> autoincrement [
	^'AUTOINCREMENT' asParser caseInsensitive trim
]

{ #category : #clause }
PetitSQLiteGrammar >> blobLiteral [
	^'BLOB' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> by [
	^'BY' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> byte [
	^'BYTE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> cascade [
	^'CASCADE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> char [
	^'CHAR' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> check [
	^'CHECK' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> collate [
	^'COLLATE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> column [ 
	^'COLUMN' asParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> columnConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^	(constraint , identifier) optional ,
	( columnConstraintPrimaryKey /
	notNullConstraint /
	null / "added MySQL specific Constraint"
	( unique , conflictClause ) /
	( check , expressionInRoundParentheses ) /
	defaultConstraint /
	( collate , identifier ) /
	unsigned / "MySQL specific constraint"
	foreignKeyClause ).
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> columnConstraintPrimaryKey [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	
	^primaryKey , (asc / desc) optional , conflictClause , autoincrement optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> columnDef [
	"http://www.sqlite.org/syntaxdiagrams.html#column-def"
	"constraint negate has been putted to mismatch the starting of a tableConstraint definition"
	"petit hint: negate consume one character instead not doesn't consume the input e.g tableConstraint negate -> $c 'onfig_key' instead with tableConstraint not -> nil 'config_key' "
	^tableConstraint not , identifier , typeName optional , columnConstraint star.
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> columnTypes [ 
	^
	'VARCHAR2' asParser caseInsensitive trim /
	'VARCHAR' asParser caseInsensitive trim / "MySQL specific type"
	'CLOB' asParser caseInsensitive trim / 
	'timestamp' asParser caseInsensitive trim /
	'NUMBER' asParser caseInsensitive trim / 
	'DATE' asParser caseInsensitive trim / 
	'integer' asParser caseInsensitive trim / 
	'boolean' asParser caseInsensitive trim / 
	'blob' asParser caseInsensitive trim / 
	'CHARACTER' asParser caseInsensitive trim / "postgress specfic type"
	'char' asParser caseInsensitive trim / 
	'int' asParser caseInsensitive trim /
	'NVARCHAR2' asParser caseInsensitive trim /
	'FLOAT' asParser caseInsensitive trim /
	'RAW' asParser caseInsensitive trim /
	'longtext' asParser caseInsensitive trim / "MySQL specific type"
	'LONG' asParser caseInsensitive trim /
	'NUMERIC' asParser caseInsensitive trim / "postgress specfic type"
	'bytea' asParser caseInsensitive trim / "postgress specfic type"
	'text' asParser caseInsensitive trim / "postgress specfic type"
	'name' asParser caseInsensitive trim / "postgress specfic type"
	'bigint' asParser caseInsensitive trim / "MySQL specific type"
	'bit' asParser caseInsensitive trim / "MySQL specific type"
	'varbinary' asParser caseInsensitive trim / "MySQL specific type"
	'double' asParser caseInsensitive trim / "MySQL specific type"
	'decimal' asParser caseInsensitive trim / "MySQL specific type"
	'smallint' asParser caseInsensitive trim. "MySQL specific type"
]

{ #category : #statements }
PetitSQLiteGrammar >> comment [
	"http://www.sqlite.org/syntaxdiagrams.html#create-table-stmt"
	^'COMMENT ON' asParser , $; asParser negate plus
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> complexIdentifier [
	^ (identifier , $. asParser) optional , identifier
]

{ #category : #tokens }
PetitSQLiteGrammar >> compoundOperator [ 
	"http://www.sqlite.org/syntaxdiagrams.html#compound-operator"

	^(	('UNION' asParser caseInsensitive trim , all optional ) /
		'INTERSECTION' asParser caseInsensitive trim /
		'EXCEPT' asParser caseInsensitive trim )
]

{ #category : #clause }
PetitSQLiteGrammar >> conflictClause [
	^(onConflict , ( rollback / abort / fail / ignore / replace ) ) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> constraint [
	^'CONSTRAINT' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> create [
	^'CREATE' asParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> createDatabase [
	^create , database , identifier
]

{ #category : #statements }
PetitSQLiteGrammar >> createIndex [
	"http://www.sqlite.org/syntaxdiagrams.html#create-index-stmt"
	^create , 
		unique optional ,  
	index ,  
		ifNotExists optional ,
	complexIdentifier,
	on ,
	complexIdentifier,
	indexedColumnsInRoundParentheses
]

{ #category : #statements }
PetitSQLiteGrammar >> createTable [
	"http://www.sqlite.org/syntaxdiagrams.html#create-table-stmt"
	^create , 
		(temp / temporary) optional,  
	table ,  
		ifNotExists optional ,
	complexIdentifier , 
	( ($( asParser trim , whitespace optional , tableColumnsDefinition plus , whitespace optional , $) asParser trim ) | 
	( as , selectStatement ) ) 
]

{ #category : #statements }
PetitSQLiteGrammar >> createView [
	"http://www.sqlite.org/syntaxdiagrams.html#create-view-stmt"
	^create , 
		(temp / temporary) optional,  
	view ,  
		ifNotExists optional ,
	complexIdentifier , 
		( $( asParser trim , whitespace optional , tableColumnsDefinition plus , whitespace optional , $) asParser trim ) optional ,
	as,
	selectStatement
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentDate [ 
	^'CURRENT_DATE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentTime [
	^'CURRENT_TIME' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> currentTimestamp [ 
	^'CURRENT_TIMESTAMP' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> database [
	^'DATABASE' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> date [
	"Oracle format"
	^(#digit asParser times: 4) flatten , $- asParser , (#digit asParser times: 2) flatten , $- asParser , (#digit asParser times: 2) flatten
]

{ #category : #tokens }
PetitSQLiteGrammar >> default [
	^'DEFAULT' asParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> defaultConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^default , ( signedNumber / literalValue / expressionInRoundParentheses )
]

{ #category : #tokens }
PetitSQLiteGrammar >> deferrable [
	^'DEFERRABLE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> deferred [
	^'DEFERRED' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> delete [
	^'DELETE' asParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> deleteStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#delete-stmt"
	^delete , from , (qualifiedTableName ==> #second) , (where , expression) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> desc [
	^'DESC' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> distinct [
	^'DISTINCT' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> explain [
	^'EXPLAIN' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> expression [
	"Complete implementation of http://www.sqlite.org/lang_expr.html"

	^  PPExpressionParser new
		term: expressionTerm;
		group: [ :g |
			g prefix: '-' do: [ :op :a | { op. a } ].
			g prefix: '+' do: [ :op :a | { op. a } ].
			g prefix: '~' do: [ :op :a | { op. a } ].
			g prefix: 'NOT ' do: [ :op :a | { op. a } ] ];
		group: [ :g |
			g left: '||' asParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '*' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '/' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '%' asParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '+' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '-' asParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '<<' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>>' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '&' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '|' asParser trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: '==' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '!=' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '=' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<>' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<=' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>=' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '<' asParser trim do: [ :a :op :b | { a. op. b } ].
			g left: '>' asParser trim do: [ :a :op :b | { a. op. b } ]. ];
		group: [ :g |
			g left: 'IS NOT ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'IS ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'IN ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'LIKE ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'GLOB ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'MATCH ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ].
			g left: 'REGEXP ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: 'AND ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g |
			g left: 'OR ' asParser caseInsensitive trim do: [ :a :op :b | { a. op. b } ] ];
		group: [ :g | "Add here the extra functions "
			g prefix: 'NOT EXISTS' asParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'EXISTS' asParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'COUNT' asParser caseInsensitive trim do: [ :op :b | { op. b } ].
			g prefix: 'TRIM' asParser caseInsensitive trim do: [ :op :b | { op. b } ]. ];
		yourself
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> expressionInRoundParentheses [
	
	^$( asParser trim , expression , $) asParser trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> expressionTerm [
	^( 
	($( asParser trim ,  selectStatement , $) asParser trim) /
	($( asParser trim ,  (expressionTerm / $) asParser negate) star , $) asParser trim) /
	(literalValue , ($( asParser trim ,  (expressionTerm / $) asParser negate) star , $) asParser trim)) / "In the case we have a function invocation"
	(((literalValue , $. asParser) min: 0 max: 2), literalValue)) flatten
]

{ #category : #tokens }
PetitSQLiteGrammar >> fail [
	^'FAIL' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> floatingPointLiteral [
	self flag: #TODO.
	^integerLiteral , $. asParser trim , integerLiteral
]

{ #category : #tokens }
PetitSQLiteGrammar >> foreignKey [
	^'FOREIGN KEY' asParser caseInsensitive trim
]

{ #category : #clause }
PetitSQLiteGrammar >> foreignKeyClause [
	"http://www.sqlite.org/syntaxdiagrams.html#foreign-key-clause"

	^references , complexIdentifier , indexedColumnsInRoundParentheses optional ,
	(foreignKeyClauseOnPart / ( match , identifier )) star , foreignKeyClauseNotPart optional.
]

{ #category : #'clause-elements' }
PetitSQLiteGrammar >> foreignKeyClauseNotPart [

	^notElem optional , deferrable , ( (initially , deferred) / (initially , immediate) ) optional
]

{ #category : #'clause-elements' }
PetitSQLiteGrammar >> foreignKeyClauseOnPart [

	^on , (delete / update ) ,
	( ( set , null ) /
	( set , default ) /
	cascade /
	restrict /
	noAction )
]

{ #category : #tokens }
PetitSQLiteGrammar >> from [
	^'FROM' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> groupBy [
	^'GROUP BY' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> identifier [
	^ (keyword not , ((#letter asParser / $_ asParser / #digit asParser / $$ asParser / '://' asParser / $< asParser / $% asParser / $# asParser / $> asParser / $@ asParser ) plus flatten trim)) ==>  #second
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> identifiersInRoundParentheses [
	
	^$( asParser trim , ( identifier separatedBy: $, asParser ) , $) asParser trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> ifNotExists [
	^'IF NOT EXISTS' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> ignore [
	^'IGNORE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> immediate [
	^'IMMEDIATE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> index [
	^'INDEX' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> indexed [
	^'INDEXED' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> indexedColumn [
	^ identifier , ( collate , identifier ) optional , ( asc / desc ) optional.
]

{ #category : #elementsInParentheses }
PetitSQLiteGrammar >> indexedColumnsInRoundParentheses [

	^$( asParser trim , (indexedColumn separatedBy: $, asParser trim ) , $) asParser trim
]

{ #category : #statements }
PetitSQLiteGrammar >> initialize [
	super initialize.

	self initializeKeywords.
]

{ #category : #statements }
PetitSQLiteGrammar >> initializeKeywords [

	| vals |
	keywords := Dictionary new.
	vals := #('CROSS' 'INNER' 'JOIN' 'LEFT' 'NATURAL' 'OUTER' 'WHERE' 'NOT' 'BLOB' 'ORDER BY' 'OR' 'FROM' 'COUNT').
	
	vals do: [:eachKeyword |
		keywords at: eachKeyword 
			put: (PPUnresolvedParser named: ('keyword', eachKeyword first asUppercase asString , eachKeyword allButFirst))].
	
	keywords keysAndValuesDo:  [:key :value |
		(keywords at: key) def: (key asParser caseInsensitive ,  (#punctuation asParser optional , #word asParser) not ) token]
]

{ #category : #tokens }
PetitSQLiteGrammar >> initially [
	^'INITIALLY' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> insert [
	^'INSERT' asParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> insertStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#insert-stmt"

	^
	(replace / 
	(insert , 
		(or , (rollback / abort / replace / fail / ignore)) optional)) , 
	into , 
	(identifier , $. asParser trim) optional , identifier , "databaseName . tableName "
	(
	(default , values) /
		(identifiersInRoundParentheses optional ,
	((values , $( asParser trim , (expression separatedBy: $, asParser trim) , $) asParser trim) /
	selectStatement))
	)
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> integerLiteral [
	^#digit asParser plus flatten trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> into [
	^'INTO' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinConstraint [ 
	"http://www.sqlite.org/syntaxdiagrams.html#join-constraint"
	^(	(on , expression) /
		('USING' asParser caseInsensitive trim , identifiersInRoundParentheses)) optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinOperator [
	"http://www.sqlite.org/syntaxdiagrams.html#join-op"
	^$, asParser trim /
		('NATURAL' asParser caseInsensitive trim optional ,
		(('LEFT' asParser caseInsensitive trim , 'OUTER' asParser caseInsensitive trim optional ) /
		'INNER' asParser caseInsensitive trim /
		'CROSS' asParser caseInsensitive trim) optional ,
	'JOIN' asParser caseInsensitive trim).
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> joinSource [
	"http://www.sqlite.org/syntaxdiagrams.html#join-source"
	^singleSource ,
	(joinOperator , singleSource , joinConstraint) star 
]

{ #category : #tokens }
PetitSQLiteGrammar >> keyword [

	| keywordParsers |
	
	keywordParsers := keywords keysSortedSafely 
								collect: [:eachKey | keywords at: eachKey ].
	
	^(keywordParsers reduce: [ :a :b | a / b ]) token trimBlanks
	

]

{ #category : #statements }
PetitSQLiteGrammar >> label [
	^'LABEL ON' asParser , $; asParser negate plus
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> literalValue [
	"http://www.sqlite.org/syntaxdiagrams.html#literal-value"
	"It is really important the order how those elements because most of them are prefix for someone else "
	^
	null / 
	currentTimestamp / 
	currentDate / 
	currentTime / 
	$? asParser trim / 
	($' asParser trim , $' asParser trim ) /
	($' asParser trim optional , (timestamp / date / floatingPointLiteral /  integerLiteral / identifier / blobLiteral) , $' asParser trim optional ) 

]

{ #category : #tokens }
PetitSQLiteGrammar >> match [
	^'MATCH' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> noAction [
	^'NO ACTION' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> notElem [
	^'NOT' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> notIndexed [
	^notElem , indexed 
]

{ #category : #tokens }
PetitSQLiteGrammar >> notNull [
	^'NOT NULL' asParser caseInsensitive trim
]

{ #category : #constraints }
PetitSQLiteGrammar >> notNullConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#column-constraint"
	"Added ENABLE after NOT NULL to cover a column constraint from some sql dialects"
	
	^notNull , 'ENABLE' asParser caseInsensitive optional , conflictClause
]

{ #category : #tokens }
PetitSQLiteGrammar >> null [
	^'NULL' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> on [
	^'ON' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> onConflict [
	^'ON CONFLICT' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> or [
	^'OR' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> orderingTerm [ 
	"http://www.sqlite.org/syntaxdiagrams.html#ordering-term"
	^
	expression ,
	(collate , identifier) optional ,
	(asc / desc) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> primaryKey [
	^'PRIMARY KEY' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> qualifiedTableName [
	^(identifier , $. asParser) optional , identifier , ((indexed , by , identifier) / notIndexed) optional 
]

{ #category : #tokens }
PetitSQLiteGrammar >> queryPlan [
	^'QUERY PLAN' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> references [
	^'REFERENCES' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> renameTo [
	^'RENAME TO' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> replace [
	^'REPLACE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> restrict [
	^'RESTRICT' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> resultColumn [
	"http://www.sqlite.org/syntaxdiagrams.html#result-column"

	^(	$* asParser trim /
		((identifier , $. asParser , identifier) trim , (as , identifier ) optional) /
		(identifier , $. asParser , $* asParser) trim /
		(expression , (as optional , identifier ) optional)
		 ).
]

{ #category : #tokens }
PetitSQLiteGrammar >> rollback [
	^'ROLLBACK' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> select [
	^'SELECT' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> selectCore [
	"http://www.sqlite.org/syntaxdiagrams.html#select-core"
	^ select , 
		(distinct / all) optional ,
	(resultColumn separatedBy: $, asParser trim) ,
	(from , joinSource) optional ,
	(where , expression ) optional ,
	(groupBy , (orderingTerm separatedBy: $, asParser trim), ('HAVING' asParser caseInsensitive trim , expression) optional ) optional 
]

{ #category : #statements }
PetitSQLiteGrammar >> selectStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#select-stmt"
	^	(selectCore separatedBy: compoundOperator) ,
		('ORDER BY' asParser caseInsensitive trim , (orderingTerm separatedBy: $, asParser trim)) optional ,
		('LIMIT' asParser caseInsensitive trim , expression , ( ('OFFSET' asParser caseInsensitive trim / $, asParser trim) , expression ) optional ) optional
]

{ #category : #tokens }
PetitSQLiteGrammar >> set [
	^'SET' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> signedNumber [
	^($+ asParser trim / $- asParser trim ) optional , ( floatingPointLiteral / integerLiteral ) trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSource [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^
	singleSourceJoinSourceInRBPart /
	singleSourceSelectStmtInRBPart /
	singleSourceIdentifierPart
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceIdentifierPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^complexIdentifier , (as optional , identifier) optional , ((indexed , by , identifier) / notIndexed ) optional
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceJoinSourceInRBPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^$( asParser trim , joinSource , $) asParser trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> singleSourceSelectStmtInRBPart [
	"http://www.sqlite.org/syntaxdiagrams.html#single-source"
	
	^$( asParser trim , selectStatement , $) asParser trim ,  as optional , identifier optional
]

{ #category : #statements }
PetitSQLiteGrammar >> sqlStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#sql-stmt"
	^(explain optional , queryPlan optional , (
	createTable /
	createDatabase /
	createIndex /
	alterTable /
	selectStatement /
	updateStatement /
	deleteStatement /
	insertStatement /
	createView /
	comment /
	label
	))
]

{ #category : #statements }
PetitSQLiteGrammar >> sqlStatementList [
	^(sqlStatement separatedBy: $; asParser trim)
]

{ #category : #statements }
PetitSQLiteGrammar >> start [
	^ sqlStatementList end
]

{ #category : #tokens }
PetitSQLiteGrammar >> table [
	^'TABLE' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> tableColumnsDefinition [
	^( ( columnDef separatedBy: $, asParser trim ) ,  ( $, asParser trim , tableConstraint ) star )
]

{ #category : #constraints }
PetitSQLiteGrammar >> tableConstraint [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"

	^( constraint , identifier ) optional ,
	(tableConstraintPrimaryKeyPart /
	tableConstraintForeignKeyPart /
	tableConstraintCheckPart ).
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintCheckPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^check , expressionInRoundParentheses
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintForeignKeyPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^ foreignKey , identifiersInRoundParentheses , foreignKeyClause
]

{ #category : #'constraints-elements' }
PetitSQLiteGrammar >> tableConstraintPrimaryKeyPart [
	"http://www.sqlite.org/syntaxdiagrams.html#table-constraint"
	
	^( primaryKey / unique ) , indexedColumnsInRoundParentheses , conflictClause
]

{ #category : #tokens }
PetitSQLiteGrammar >> temp [
	^'TEMP' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> temporary [
	^'TEMPORARY' asParser caseInsensitive trim
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> time [
	"Oracle format"
	^(#digit asParser times: 2) flatten , $: asParser , (#digit asParser times: 2) flatten , $: asParser , (#digit asParser times: 2) flatten
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestamp [
	^timestampOracleFormat / timestampDB2Format
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestampDB2Format [
	^date , $- asParser , ((#digit asParser times: 2) flatten , $. asParser , (#digit asParser times: 2) flatten , $. asParser , (#digit asParser times: 2) flatten , ($. asParser , #digit asParser plus) optional flatten)
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> timestampOracleFormat [
	"Oracle format"
	 ^date , whitespace , time
]

{ #category : #'statements-elements' }
PetitSQLiteGrammar >> typeName [
	"http://www.sqlite.org/syntaxdiagrams.html#type-name"
	^columnTypes , (	($( asParser trim , signedNumber , $, asParser trim , signedNumber , $) asParser trim) /
						($( asParser trim , signedNumber , $) asParser trim) / 
						($( asParser trim , signedNumber , ( char / byte ) , $) asParser trim) / 
						($( asParser trim , $* asParser trim , $, asParser trim , signedNumber , $) asParser trim)) optional
]

{ #category : #tokens }
PetitSQLiteGrammar >> unique [
	^'UNIQUE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> unsigned [
	^'UNSIGNED' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> update [
	^'UPDATE' asParser caseInsensitive trim
]

{ #category : #statements }
PetitSQLiteGrammar >> updateStatement [
	"http://www.sqlite.org/syntaxdiagrams.html#update-stmt"
	^(update , 
		('or' asParser caseInsensitive trim , (rollback / abort / replace / fail / ignore)) optional ,
	qualifiedTableName ,
	set , ((identifier , '=' asParser caseInsensitive trim , expression) separatedBy: $, asParser trim) ,
		(where , expression) optional)
]

{ #category : #tokens }
PetitSQLiteGrammar >> values [
	^'VALUES' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> view [
	^'VIEW' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> where [
	^'WHERE' asParser caseInsensitive trim
]

{ #category : #tokens }
PetitSQLiteGrammar >> whitespace [
	^Character space asParser
]
