Class {
	#name : #MEHomeSection,
	#superclass : #GtHomeMultiCardSection,
	#category : #'PaperMoldableExceptions-Section'
}

{ #category : #card }
MEHomeSection >> moldableExceptionsHomeCard [
	<gtSectionCard>
	<gtExample>
	^ GtHomeCard page
		title: 'Moldable Exceptions';
		description: 'Moldable Exceptions Paper';
		databaseName: 'feenkcom/paper-moldable-exceptions/lepiter';
		pageName: 'Moldable Exceptions Paper';
		priority: 10;
		assertInvariant;
		yourself
]

{ #category : #initialialize }
MEHomeSection >> sectionTitle [
	^ 'Moldable Exceptions Paper'
]
