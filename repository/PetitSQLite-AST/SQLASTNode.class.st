Class {
	#name : #SQLASTNode,
	#superclass : #Object,
	#instVars : [
		'name',
		'ast'
	],
	#category : #'PetitSQLite-AST'
}

{ #category : #'as yet unclassified' }
SQLASTNode >> accept: aVisitor [
	^aVisitor visit: self
]

{ #category : #accessing }
SQLASTNode >> ast [
	^ ast
]

{ #category : #accessing }
SQLASTNode >> ast: anObject [
	ast := anObject
]

{ #category : #accessing }
SQLASTNode >> children [
	^#()
]

{ #category : #accessing }
SQLASTNode >> name [
	^name
]

{ #category : #accessing }
SQLASTNode >> name: anObject [
	name := anObject
]
