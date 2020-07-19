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

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/PetitSQLParser/main'.
		spec project: 'PetitParser for PetitSQLParser' with: [
				spec
					className: #ConfigurationOfPetitParser;
					versionString: #'development';
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ].
		spec 
			package: 'PetitSQLite-Parser' with: [
				spec requires: #('PetitParser for PetitSQLParser' ). ];
			package: 'PetitSQLite-AST' with: [
				spec requires: #('PetitSQLite-Parser' ). ];
			package: 'PetitSQLite-Tests-Parser' with: [
				spec requires: #('PetitSQLite-Parser' ). ].
		spec 
			group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' );
			group: 'Core' with: #('PetitSQLite-Parser' );
			group: 'Tests' with: #('PetitSQLite-Tests-Parser' );
			group: 'default' with: #('Core' 'Tests' 'Ast' ). ].

]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline12: spec [ 
	<version: '1.2-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/PetitSQLParser/main'.
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
					version: '1.8-snapshot';
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ].
	]
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline13: spec [ 
	<version: '1.3-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/PetitSQLParser/main'.
		spec description: 'creating a new baseline that loads the project from Smalltalkhub'.
		spec 
			package: 'PetitSQLite-Parser' "with: [spec requires: #('PetitParser for PetitSQLParser')]";
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
		
		"spec project: 'PetitParser for PetitSQLParser' with: [
				spec
					className: 'ConfigurationOfPetitParser';
					file: 'ConfigurationOfPetitParser';
					version: #development;
					loads: #('Core' 'Tests' );
					repository: 'http://www.smalltalkhub.com/mc/Moose/PetitParser/main' ]."
	]
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline14: spec [ 
	<version: '1.4-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.smalltalkhub.com/mc/Moose/PetitSQLParser/main'.
		spec description: 'creating a new baseline that loads the project from Smalltalkhub'.
		spec 
			package: 'PetitSQLite-Parser' with: [spec requires: #('PetitParser2')];
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
		
		spec	baseline: 'PetitParser2' with: [
				spec
				 	repository: 'github://kursjan/petitparser2' ].
	]
]

{ #category : #baselines }
ConfigurationOfPetitSQLParser >> baseline15: spec [ 
	<version: '1.5-baseline'>
	
	spec for: #common do: [
		spec blessing: #default.
		spec repository: 'http://www.squeaksource.com/PetitSQLParser'.
		spec description: 'Baseline that loads the project from squeaksource'.
		spec 
			package: 'PetitSQLite-Parser' ;
			package: 'PetitSQLite-Tests-Parser' with: [spec requires: #('PetitSQLite-Parser')];
			package: 'PetitSQLite-AST' with: [spec requires: #('PetitSQLite-Parser')].
			
		spec group: 'Ast' with: #('PetitSQLite-AST' 'PetitSQLite-Parser' ).
		spec group: 'Core' with: #( 'PetitSQLite-Parser').
		spec group: 'Tests' with: #( 'PetitSQLite-Tests-Parser').
		
		spec group: 'default' with: #('Core' 'Tests' 'Ast').
	]
]

{ #category : #'default-versions' }
ConfigurationOfPetitSQLParser >> default: spec [ 
	<version: 'default'>
	
	self baseline15: spec
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
	<symbolicVersion: #'development'>

	spec for: #'pharo1.3.x' version: '1.0-baseline'.

	spec for: #'pharo1.4.x' version: '1.2-baseline'.

	spec for: #'pharo2.x' version: '1.2-baseline'.

	spec for: #'pharo3.x' version: '1.3-baseline'.

	spec for: #'pharo4.x' version: '1.3-baseline'.

	spec for: #'pharo5.x' version: #'stable'.
	
	spec for: #'pharo6.x' version: '1.4-baseline'.
	
	spec for: #'pharo7.x' version: #'stable'
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

	spec for: #'common' version: '1.3'.

	spec for: #'pharo1.3.x' version: '1.0'.

	spec for: #'pharo1.4.x' version: '1.0'.

	spec for: #'pharo3.x' version: '1.3'.

	spec for: #'pharo4.x' version: '1.3'.

	spec for: #'pharo5.x' version: '3.0'.
	
	spec for: #'pharo6.x' version: '3.0'.
	
	spec for: #'pharo7.x' version: '4.0'.

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

{ #category : #versions }
ConfigurationOfPetitSQLParser >> version13: spec [
	<version: '1.3' imports: #('1.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #stable.
		spec description: 'For Moose 5'.
		spec author: 'StephanEggermont'.
		spec timestamp: '12/12/2014 11:32'.
		spec project: 'PetitParser for PetitSQLParser' with: #stable.
		spec 
			package: 'PetitSQLite-Parser' with: 'PetitSQLite-Parser-AndreHora.35';
			package: 'PetitSQLite-Tests-Parser' with: 'PetitSQLite-Tests-Parser-FabrizioPerin.24';
			package: 'PetitSQLite-AST' with: 'PetitSQLite-AST-FabrizioPerin.12'].

]

{ #category : #versions }
ConfigurationOfPetitSQLParser >> version20: spec [
	<version: '2.0' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #stable.
		spec description: 'First release'.
		spec author: 'FabrizioPerin'.
		spec timestamp: '04/03/2014 11:00'.
		spec project: 'PetitParser for PetitSQLParser' with: #stable.
		spec 
			package: 'PetitSQLite-Parser' with: 'PetitSQLite-Parser-AndreHora.35';
			package: 'PetitSQLite-Tests-Parser' with: 'PetitSQLite-Tests-Parser-FabrizioPerin.24';
			package: 'PetitSQLite-AST' with: 'PetitSQLite-AST-FabrizioPerin.12'.].

]

{ #category : #versions }
ConfigurationOfPetitSQLParser >> version30: spec [
	<version: '3.0' imports: #('1.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Moose 6.0 release'.
		spec author: 'TudorGirba'.
		spec timestamp: '8/14/2016 20:44'.
		spec project: 'PetitParser for PetitSQLParser' with: #'stable'.
		spec 
			package: 'PetitSQLite-Parser' with: 'PetitSQLite-Parser-TudorGirba.36';
			package: 'PetitSQLite-Tests-Parser' with: 'PetitSQLite-Tests-Parser-FabrizioPerin.24';
			package: 'PetitSQLite-AST' with: 'PetitSQLite-AST-FabrizioPerin.12'. ].

]

{ #category : #versions }
ConfigurationOfPetitSQLParser >> version40: spec [
	<version: '4.0' imports: #('1.5-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Moose 7.0 release'.
		spec author: 'FabrizoPerin'.
		spec timestamp: '18/07/2020 16:00'.
		spec 
			package: 'PetitSQLite-Parser' with: 'PetitSQLite-Parser-TudorGirba.36';
			package: 'PetitSQLite-Tests-Parser' with: 'PetitSQLite-Tests-Parser-FabrizioPerin.24';
			package: 'PetitSQLite-AST' with: 'PetitSQLite-AST-FabrizioPerin.12'. ].

]
