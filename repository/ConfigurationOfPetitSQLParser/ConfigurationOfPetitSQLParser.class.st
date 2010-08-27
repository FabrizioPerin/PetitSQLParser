Class {
	#name : #ConfigurationOfPetitSQLParser,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#category : #ConfigurationOfPetitSQLParser
}

{ #category : #private }
ConfigurationOfPetitSQLParser class >> ensureMetacello [
	Smalltalk at: #MetacelloProject ifAbsent: [
		Gofer new
				url: 'http://seaside.gemstone.com/ss/metacello';
				package: 'ConfigurationOfMetacello';
				load.
		(Smalltalk at: #ConfigurationOfMetacello) loadLatestVersion ]
]

{ #category : #'metacello tool support' }
ConfigurationOfPetitSQLParser class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfPetitSQLParser class >> loadDefault [

	(self project version: 'default') load.


]

{ #category : #accessing }
ConfigurationOfPetitSQLParser class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> default: spec [ 
	<version: 'default'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.squeaksource.com/PetitSQLParser'.
		spec 
			package: 'Petit-SQL-Core';
			package: 'Petit-SQL-DraftObjects';
			package: 'Petit-SQL-Parser' with: [spec requires: #('Petit-SQL-DraftObjects' 'Petit-SQL-Core')];
			package: 'Petit-SQL-Tests-Core' with: [spec requires: #('Petit-SQL-Core')];
			package: 'Petit-SQL-Tests-Parser' with: [spec requires: #('Petit-SQL-Parser')].
		spec group: 'Core' with: #( 'Petit-SQL-Core' 'Petit-SQL-DraftObjects' 'Petit-SQL-Parser').
		spec group: 'Parser' with: #( 'Petit-SQL-Core').
		spec group: 'Tests' with: #( 'Petit-SQL-Tests-Core' 'Petit-SQL-Tests-Parser' ).
		spec group: 'default' with: #('Core' 'Parser' 'Tests').

	]
]

{ #category : #accessing }
ConfigurationOfPetitSQLParser >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project]
]
