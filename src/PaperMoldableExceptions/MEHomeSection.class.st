Class {
	#name : #MEHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'PaperMoldableExceptions-Section'
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
		loadLepiter: [ BaselineOfPaperMoldableExceptions loadLepiter ];
		priority: 10;
		assertInvariant;
		yourself
]

{ #category : #initialialize }
MEHomeSection >> sectionTitle [
	^ 'Moldable Exceptions Paper'
]
