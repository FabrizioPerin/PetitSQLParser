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
	(self project version: #development) load.


]

{ #category : #loading }
ConfigurationOfPetitSQLParser class >> loadDefaultWithoutPetit [

	(self project version: 'defaultWithoutPetit') load.


]

{ #category : #loading }
ConfigurationOfPetitSQLParser class >> loadStable [
	(self project version: #stable) load.


]

{ #category : #accessing }
ConfigurationOfPetitSQLParser class >> project [

	^self new project
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline10: spec [ 
	<version: '1.0-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.squeaksource.com/PetitSQLParser'.
		spec 
			package: 'PetitSQLite-Parser' with: [spec requires: #('PetitParser for PetitSQLParser')];
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
		
		spec project: 'PetitParser for PetitSQLParser' with: [
				spec
					className: 'ConfigurationOfPetitParser';
					file: 'ConfigurationOfPetitParser';
					version: #'stable';
					repository: 'http://source.lukas-renggli.ch/petit' ].
	]
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline11: spec [ 
	<version: '1.1-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.squeaksource.com/PetitSQLParser'.
		spec 
			package: 'PetitSQLite-Parser' with: [spec requires: #('PetitParser for PetitSQLParser')];
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
		
		spec project: 'PetitParser for PetitSQLParser' with: [
				spec
					className: 'ConfigurationOfPetitParser';
					file: 'ConfigurationOfPetitParser';
					version: 'default';
					repository: 'http://source.lukas-renggli.ch/petit' ].
	]
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline12: spec [ 
	<version: '1.2-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://smalltalkhub.com/mc/Moose/PetitSQLParser/main'.
		spec description: 'creating a new baseline that loads the project from Smalltalkhub'.
		spec 
			package: 'PetitSQLite-Parser' with: [spec requires: #('PetitParser for PetitSQLParser')];
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
		
		spec project: 'PetitParser for PetitSQLParser' with: [
				spec
					className: 'ConfigurationOfPetitParser';
					file: 'ConfigurationOfPetitParser';
					version: 'default';
					repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
	]
]

{ #category : #'default-versions' }
ConfigurationOfPetitSQLParser >> default: spec [ 
	<version: 'default'>
	
	self baseline12: spec
]

{ #category : #'default-versions' }
ConfigurationOfPetitSQLParser >> defaultWithoutPetit: spec [ 
	<version: 'defaultWithoutPetit'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.squeaksource.com/PetitSQLParser'.
		spec 
			package: 'PetitSQLite-Parser';
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
	]
]

{ #category : #'symbolic-version' }
ConfigurationOfPetitSQLParser >> development: spec [ 
	<symbolicVersion: #development>
	
	spec for: #'pharo1.3.x' version: '1.0-baseline'.
	spec for: #'pharo1.4.x' version: '1.2-baseline'.
	spec for: #'pharo2.x' version: '1.2-baseline'.

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

{ #category : #'symbolic-version' }
ConfigurationOfPetitSQLParser >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'pharo1.4.x' version: '1.0'.
	spec for: #'pharo1.3.x' version: '1.0'
]

{ #category : #versions }
ConfigurationOfPetitSQLParser >> version10: spec [
	<version: '1.0' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #stable.
		spec description: 'First release'.
		spec author: 'usmambhatti'.
		spec timestamp: '03/01/2013 18:11'.
		spec project: 'PetitParser for PetitSQLParser' with: #stable.
		spec 
			package: 'PetitSQLite-Parser' with: 'PetitSQLite-Parser-TudorGirba.25';
			package: 'PetitSQLite-Tests-Parser' with: 'PetitSQLite-Tests-Parser-TudorGirba.19';
			package: 'PetitSQLite-AST' with: 'PetitSQLite-AST-TudorGirba.6'.].

]
