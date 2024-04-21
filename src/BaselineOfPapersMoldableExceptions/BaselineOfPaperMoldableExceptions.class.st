Class {
	#name : #BaselineOfPaperMoldableExceptions,
	#superclass : #BaselineOf,
	#category : #BaselineOfPapersMoldableExceptions
}

{ #category : #loading }
BaselineOfPaperMoldableExceptions class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'papers-moldable-exceptions' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfPaperMoldableExceptions >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'PaperMoldableExceptions'
		]
]
