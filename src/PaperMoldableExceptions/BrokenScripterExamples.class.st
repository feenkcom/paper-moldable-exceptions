"
I am a broken version of GtSourceCoderEditorElementByScripterExamples for demo purposes.
"
Class {
	#name : #BrokenScripterExamples,
	#superclass : #GtCoderByScripterExamples,
	#category : #'PaperMoldableExceptions-Examples'
}

{ #category : #'example - play example' }
BrokenScripterExamples >> pageOneWithClass [
	<gtExample>
	| aPage |
	aPage := LeUIByScripterExamples new pageOne.
	
	aPage snippetBuilder 
		string: '{{gtClass:Object}}';
		add.
	
	^ aPage
]

{ #category : #'example - play example' }
BrokenScripterExamples >> pageWithClassClicked [
	<gtExample>
	| aScripter |
	aScripter := self pageWithClassIntoWorldTab.

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click link container';
				id: #content;
				id: #scrollable;
				onChildAt: 1 ].

	aScripter
		clickStep: [ :s | 
			s
				label: 'Click link';
				id: #content;
				id: #scrollable;
				onChildAt: 1 ].

	aScripter
		checkStep: [ :s | 
			s
				label: 'Check that page was spawned';
				id: #content;
				onChildAt: 1;
				onChildAt: 1;
				value: [ :aPager | aPager pages size ] equals: 1 ].

	^ aScripter
]

{ #category : #'example - play example' }
BrokenScripterExamples >> pageWithClassIntoWorldTab [
	<gtExample>
	| aScripter |
	aScripter := GtWorldByScripterExamples new tabElementInScripter.

	aScripter
		doStep: [ :s | 
			s
				label: 'Show Coder space';
				block: [ :aTabElement | 
					| aStencil |
					aStencil := [ | aPage |
						aPage := self pageOneWithClass.
						LeUIByScripterExamples new pageInPager: aPage ] asStencil.

					GtWorldUtility
						showSpaceWithIcon: BrGlamorousVectorIcons transparent
						title: 'Lepiter Page'
						with: aStencil
						from: aTabElement ] ].

	aScripter
		assertStep: [ :s | 
			s
				label: 'Assert page in a new tab';
				value: [ :anElement | anElement tabs tabs size ] equals: 2 ].

	aScripter
		assertStep: [ :s | 
			s
				label: 'Assert page tab label';
				value: [ :anElement | anElement tabs tabs second widget label asString ]
					equals: 'Page One' ].

	aScripter
		assertStep: [ :s | 
			s
				label: 'Assert page tab selection';
				satisfies: [ :anElement | anElement tabs tabs second isSelected ]
					description: [ 'Page tab must be selected' ] ].

	^ aScripter
]

{ #category : #'example - play example' }
BrokenScripterExamples >> playExample [
	<gtExample>
	| aScripter |
	aScripter := self scripterWithElement.

	aScripter
		substep: 'Play example'
		do: [ :aStep | 
			aStep doStep: [ :s | 
				s 
					label: 'Remove example result cache';
					block: [ :aUIModel | aUIModel coder compiledMethod clearExampleAndTestCaches ];
					onModel
			].
		
			aStep
				assertStep: [ :s | 
					s
						label: 'Assert gray example status';
						value: [ :aStateElement | aStateElement background paint color ]
							equals: GtFilterExampleNotExecutedState default color;
						onBreadthFirstChildOfClass: GtCoderExampleStateElement ].

			aStep
				doStep: [ :s | 
					s
						label: 'Play button from model';
						block: [ :aUIModel | aUIModel coder playExample ];
						onModel ].

			aStep
				assertStep: [ :s | 
					s
						label: 'Assert green example status';
						value: [ :aStateElement | aStateElement background paint color ]
							equals: GtFilterExampleSuccessState default color;
						onBreadthFirstChildOfClass: GtCoderExampleStateElement ].

			aStep
				assertStep: [ :s | 
					s
						label: 'Assert green example status after all actions (styling)';
						value: [ :aStateElement | aStateElement background paint color ]
							equals:  GtFilterExampleNotExecutedState default color;
						onBreadthFirstChildOfClass: GtCoderExampleStateElement ] ].

	^ aScripter
]

{ #category : #'example - instance creation' }
BrokenScripterExamples >> scripterWithElement [
	<gtExample>
	| aScripter |

	aScripter := self scripter.
	aScripter substep: 'Initialize Coder Model and UI' do: [ :aStep | 		
		aStep set
			label: 'Initialize Coder Editor UI';
			element: [ GtSourceCoderEditorElementExamples new editorForExampleMethodCoder ];
			onSelf;
			play.

		aStep set
			label: 'Initialize Coder UI Model';
			model: [ :anElement | anElement textualCoderViewModel ];
			onSelf;
			play ].

	^ aScripter
]
