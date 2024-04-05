Class {
	#name : #BaselineOfPapersMoldableExceptions,
	#superclass : #BaselineOf,
	#category : #BaselineOfPapersMoldableExceptions
}

{ #category : #loading }
BaselineOfPapersMoldableExceptions class >> loadLepiter [
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
BaselineOfPapersMoldableExceptions >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'PapersMoldableExceptions'
		]
]
