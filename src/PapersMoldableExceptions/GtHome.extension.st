Extension { #name : #GtHome }

{ #category : #'*PapersMoldableExceptions' }
GtHome >> moldableExceptionsSection [
	<gtHomeSection>
	<gtExample>
	<noTest>
	^ MEHomeSection new
		priority: 10;
		yourself
]

{ #category : #'*PapersMoldableExceptions' }
GtHome >> oscarSection [
	<gtHomeSection>
	<gtExample>
	<noTest>
	^ OscarHomeSection new
		priority: 5;
		yourself
]
