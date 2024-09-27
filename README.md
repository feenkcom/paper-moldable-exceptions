This is the repo for a draft paper on *Moldable Exceptions* to be submitted to [Onward! 2024](https://2024.splashcon.org/track/splash-2024-Onward-papers#Call-for-Papers).
The repo contains not only the LaTeX source code, but also GT examples and Lepiter pages of notes.

## Installation

```
Metacello new
	repository: 'github://feenkcom/paper-moldable-exceptions:master/src';
	baseline: 'PaperMoldableExceptions';
	load.
#BaselineOfPaperMoldableExceptions asClass loadLepiter.
```

Preprint available on [arXiv (PDF)](https://arxiv.org/pdf/2409.00465).

ArXiv DOI: [10.48550/arXiv.2409.00465](https://doi.org/10.48550/arXiv.2409.00465)

ACM DOI: [10.1145/3689492.3690044](https://doi.org/10.1145/3689492.3690044)

# Title

Moldable Exceptions

## Authors

Andrei Chiş, Tudor Gîrba, Oscar Nierstrasz

## Abstract

Debugging is hard. Interactive debuggers are mostly the same. They show you a stack, a way to sample the state of the stack, and, if the debugger is live, a way to step through execution. The standard interactive debugger for a general-purpose programming language provided by a mainstream IDE mostly offers a low-level interface in terms of generic language constructs to track down and fix bugs. A custom debugger, such as those developed for specific application domains, offers alternative interfaces more suitable to the specific execution context of the program being debugged. Custom debuggers offering contextual debugging views and actions can greatly improve our ability to reason about the current problem. Implementing such custom debuggers, however, is non-trivial, and poses a barrier to improving the debugging experience. In this paper we introduce "moldable exceptions", a lightweight mechanism to adapt a debugger's interface based on contextual information provided by a raised exception. We present, through a series of examples, how moldable exceptions can enhance a live programming environment.

## BibTeX citation

```
@inproceedings{Chis24a,
	Annote = {internationalconference},
	Author = {Andrei Chi\c{s} and Oscar Nierstrasz and Tudor G\^irba},
	Booktitle = {Proceedings of Onward! 2024},
	Keywords = {feenk-pub Girba Chis},
	Title = {Moldable Exceptions},
	Abstract = {Debugging is hard. Interactive debuggers are mostly the same. They
		show you a stack, a way to sample the state of the stack, and, if the debugger
		is live, a way to step through execution. The standard interactive debugger for a
		general-purpose programming language provided by a mainstream IDE mostly offers a
		low-level interface in terms of generic language constructs to track down and fix
		bugs. A custom debugger, such as those developed for specific application domains,
		offers alternative interfaces more suitable to the specific execution context of
		the program being debugged. Custom debuggers offering contextual debugging views
		and actions can greatly improve our ability to reason about the current problem.
		Implementing such custom debuggers, however, is non-trivial, and poses a barrier
		to improving the debugging experience. In this paper we introduce "moldable
		exceptions", a lightweight mechanism to adapt a debugger's interface based on
		contextual information provided by a raised exception. We present, through a
		series of examples, how moldable exceptions can enhance a live programming
		environment.},
	Note = {to appear},
	eprint = {2409.00465},
	archivePrefix = {arXiv},
	primaryClass = {cs.SE},
	url = {https://arxiv.org/abs/2409.00465},
	scg-url = {http://scg.unibe.ch/archive/papers/Chis24aMoldableExceptions.pdf},
	DOI = {10.48550/arXiv.2409.00465},
	arxiv-DOI = {10.48550/arXiv.2409.00465},
	acm-DOI = {10.1145/3689492.3690044},
	Year = {2024}
}
```
