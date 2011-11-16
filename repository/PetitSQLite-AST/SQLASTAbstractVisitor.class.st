Class {
	#name : #SQLASTAbstractVisitor,
	#superclass : #Object,
	#instVars : [
		'importer'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #accessing }
SQLASTAbstractVisitor >> importer [
	^ importer
]

{ #category : #accessing }
SQLASTAbstractVisitor >> importer: anObject [
	importer := anObject
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visit: anElement [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitASTNode: anElement [

]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitAlterTableStatementNode: anElement [
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitColumnConstraintNode: anElement [
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitColumnDefNode: anElement [
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitCreateTableNode: anElement [
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitSelectStmtNode: anElement [
]

{ #category : #'as yet unclassified' }
SQLASTAbstractVisitor >> visitTableConstraintNode: anElement [
]
