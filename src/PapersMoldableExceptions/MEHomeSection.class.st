Class {
	#name : #MEHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'PapersMoldableExceptions-Section'
}

{ #category : #card }
MEHomeSection >> moldableExceptionsHomeCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard lazy
		title: 'Moldable Exceptions';
		description: 'Moldable Exceptions Paper';
		databaseName: 'feenkcom/papers-moldable-exceptions/lepiter';
		pageName: 'Moldable Exceptions Paper';
		loadLepiter: [ BaselineOfPapersMoldableExceptions loadLepiter ];
		priority: 10;
		assertInvariant;
		yourself
]

{ #category : #initialialize }
MEHomeSection >> sectionTitle [
	^ 'Moldable Exceptions Paper'
]
