Class {
	#name : #SQLCreateViewStmtNode,
	#superclass : #SQLASTNode,
	#instVars : [
		'columns',
		'referenceTable'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #'as yet unclassified' }
SQLCreateViewStmtNode >> accept: aVisitor [
	^aVisitor visitCreateViewNode: self
]
