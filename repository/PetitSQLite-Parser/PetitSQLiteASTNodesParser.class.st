Class {
	#name : #PetitSQLiteASTNodesParser,
	#superclass : #PetitSQLiteGrammar,
	#category : #'PetitSQLite-Parser'
}

{ #category : #'as yet unclassified' }
PetitSQLiteASTNodesParser class >> ignoredNames [
	
	^super ignoredNames , #('blackBoard')
]

{ #category : #statements }
PetitSQLiteASTNodesParser >> alterTable [
	^super alterTable ==> [ :token | 

		| alterTableNode |
		
		alterTableNode := SQLAlterTableStmtNode new.
		
		alterTableNode nameOfTableToAlter: (token at: 4).

		((token at: 5) first matches: 'rename') ifTrue:[
			alterTableNode isRename: true.
			alterTableNode newTableName: (token at: 5) second].
		
		((token at: 5) first matches: 'add') ifTrue: [
				alterTableNode isAddConstraint: true.
				alterTableNode addConstraint: (token at: 5) second].

		alterTableNode]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> alterTableConstraintFKOracle [
	^super alterTableConstraintFKOracle ==> [ :token | 
		| newConstr |
		
		newConstr := SQLTableConstraintNode new.
		
		token first isNil 
			ifFalse: [
				newConstr name: token first second].
	
		(token second matches: 'FOREIGN KEY') 
			ifTrue: [
				newConstr isFKConstraint: true.
				newConstr isPKConstraint: false.
				newConstr isUnique: false].
		
		(token at: 4) do: [:el | el isString ifTrue: [newConstr addFKColumnName: el]].
			
		((token at: 6) first matches: 'references') 
			ifTrue: [newConstr referencedTableName: (token at: 6) second].
		
		((token at: 6) third second) do: [:el | 
			el isCollection ifTrue: [newConstr addPKColumnName: el first]].
		
		newConstr.]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> alterTableConstraintPKOracle [
	^super alterTableConstraintPKOracle ==> [ :token | 
		| newConstr |
		
		newConstr := SQLTableConstraintNode new.
		
		token first isNil
			ifFalse: [newConstr name: token first second].
		
		newConstr isPKConstraint: true.
				
		(token at: 4) do: [:el | el isString ifTrue: [newConstr addPKColumnName: el]].

		newConstr].

]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> alterTableConstraintUnique [
	^super alterTableConstraintUnique ==> [ :token | 
		| newConstr |
		
		newConstr := SQLTableConstraintNode new.
		
		token first isNil
			ifFalse: [newConstr name: token first second].
		
		newConstr isUnique: true.
				
		(token at: 4) do: [:el | el isString ifTrue: [newConstr addUniqueColumnName: el]].
		
		newConstr].

]

{ #category : #statements }
PetitSQLiteASTNodesParser >> columnConstraint [

	^super columnConstraint ==> [ :token | 
		| const |
		
		const := SQLColumnConstraintNode new.
		
		token second do: [:colConstraint | 
								colConstraint do: [:each |
									(each asString match: 'default') ifTrue: [
										(colConstraint second size > 1)
											ifTrue: [const defaultValue:  colConstraint second second] 
											ifFalse: [const defaultValue:  colConstraint second first]].
									(each asString match: 'primary key') ifTrue: [const isPK: true].
									(each asString match: 'not null') ifTrue: [const canBeNull: false.].
									(each asString match: 'unique') ifTrue: [const isUnique: true]]].
		const]
]

{ #category : #statements }
PetitSQLiteASTNodesParser >> columnDef [
	^super columnDef ==> [ :token | 
		| colNode |

		colNode := SQLColumnDefNode new.
		
		colNode name: token second.
		colNode type: token third first.		
		colNode constraints: (token at: 4).
		
		colNode]
]

{ #category : #statements }
PetitSQLiteASTNodesParser >> createTable [

	^super createTable ==> [ :token | 
		| tableNode |
		tableNode := SQLCreateTableStmtNode new.		
		
		
		tableNode name: (token at: 6).

		tableNode columns: (((token at: 7) third first first) select: [:each | each isMemberOf: SQLColumnDefNode]).

		tableNode constraints: (token at: 7) third first second.
		
		tableNode]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> floatingPointLiteral [ 
	^super floatingPointLiteral ==> [ :token | (token first , token second asString , token third) value asNumber. ].

]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> joinSource [  
	^super joinSource ==> [ :token |
		| selectNode | 
		selectNode := SQLSelectFromPartNode new.
token
		]
]

{ #category : #initialization }
PetitSQLiteASTNodesParser >> selectCore [ 
	
	^super selectCore ==> [:token |
			| selectStmt |

			selectStmt := SQLSelectStmtNode new.

			token do: [:each |
				each isArray ifTrue: [
					(('from' compare: each first asString caseSensitive: false) = 2)
					ifTrue: [
						each second do:[:tables |
							tables isEmpty not ifTrue:[
								tables first isArray 
									ifTrue: [
										tables do: [:el |
											selectStmt addFrom: el second second]
										] 
									ifFalse: [selectStmt addFrom: tables second]. 
						]]]].
				(('select' compare: each asString caseSensitive: false) = 2)
					ifTrue: [
						token third isArray 
							ifTrue: [
								token third do: [:fields | 
									fields isArray 
										ifTrue: [ selectStmt addColumn: fields first]
										ifFalse: [(fields ~= $,) ifTrue:[selectStmt addColumn: fields]]]]]].
			selectStmt ast: token.
			selectStmt].
]

{ #category : #initialization }
PetitSQLiteASTNodesParser >> selectStatement [ 
	^super selectStatement ==> [:token | token first first]
]

{ #category : #initialization }
PetitSQLiteASTNodesParser >> signedNumber [  
	^super signedNumber ==> [ :token | 
		(token first isNil or: [token first = $+])
			ifTrue: [Array with: token second asNumber]
			ifFalse: [Array with: (token first asString , token second asString ) asNumber]
		]
]

{ #category : #initialization }
PetitSQLiteASTNodesParser >> tableConstraint [
	^super tableConstraint ==> [:token | 
		token second name: token first second.
		token second].
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> tableConstraintCheckPart [
	^super tableConstraintCheckPart ==> [:token | 
		| newConstr |

		newConstr := SQLTableConstraintNode new.
		
		newConstr isCheck: true.		
		newConstr expressionString: token third.

		newConstr]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> tableConstraintForeignKeyPart [ 
	^super tableConstraintForeignKeyPart ==> [:token | 
		| newConstr |

		newConstr := SQLTableConstraintNode new.

		newConstr isFKConstraint: true.
				
		token third do: [:el | el isString ifTrue: [newConstr addFKColumnName: el]].
		
		newConstr referencedTableName: (token at: 5) second.	

		newConstr]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> tableConstraintPrimaryKeyPart [
	^super tableConstraintPrimaryKeyPart ==> [:token | 
		| newConstr |
		
		newConstr := SQLTableConstraintNode new.

		(token first matches: 'PRIMARY KEY') 
			ifTrue: [
				newConstr isPKConstraint: true.
				newConstr isFKConstraint: false.
				newConstr isUnique: false.
				
				token third do: [:el | el isArray 
								ifTrue: [el first isString 
											ifTrue: [newConstr addPKColumnName: el first]]]].
		
		(token first matches: 'UNIQUE') 
			ifTrue: [
				newConstr isPKConstraint: false.
				newConstr isFKConstraint: false.
				newConstr isUnique: true.
				
				token third do: [:el | el isArray 
								ifTrue: [el first isString 
											ifTrue: [newConstr addUniqueColumnName: el first]]]].
				
		newConstr]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> typeName [ 
	^super typeName ==> [ :token |
		token second isNil
			ifTrue: [Array with: token first value]
			ifFalse: [ token second size = 3 
				ifTrue:[ Array with: token first value with: (token second at: 2) first. ]
				ifFalse: [
					Array 
						with: token first value 
						with: ((token second at: 2) isArray 
									ifTrue: [(token second at: 2) first]
									ifFalse:[token second at: 2])  
						with: ((token second at: 4) isArray 
									ifTrue: [(token second at: 4) first]
									ifFalse:[token second at: 4])]
			]
		]
]

{ #category : #'statements-elements' }
PetitSQLiteASTNodesParser >> updateStatement [
	^super updateStatement ==>[:token |
		| updateStmt |
		
		updateStmt := SQLUpdateStatementNode new.
		
		updateStmt table: token third second.

		updateStmt].
	
]