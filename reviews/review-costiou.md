
## General

- In the abstract, you say "the standard debugger". Perhaps it is an English subtility that I do not understand and it means "any standard debugger". The problems you mention concern the vast majority of debuggers, everywhere. Even Smalltalk debuggers are in fact very similar to the java debugger and others.

- Following the first remark, l.39  you say all debuggers show us the same things, but they also provide us with the same actions: step, break, etc. and it is very limited as you say later for investigating problem-specific things. It also introduces a gap: when investigating specific, non-conventional debugging problems, we have to transform somehow our debugging questions to a sequence of steps and breakpoints etc. that bring us to the information we seek, but it's difficult as it's like using a hammer to break nuts

- I wonder if the debugger view from Fig. 2 is really generic. I don't recognize it (not a critic), I think it is already a customized view. Are we seeing the source code of each method on the stack? Perhaps it would be more precise to specify "The generic GT debugger view with common standard debugging actions" (but I don't know)

- Line 145 it does not seem correct that you present "numerous" examples. I did not count but I think you have some examples for each scenario. To me "numerous" implies "a lot", but my english is not that good --- like many reviewers ;)

- Why, in the script from line 250, the method does not have a `<gtView>` pragma while the one from line 325 does? I would suggest removing the `<gtView>` pragma since it is not explained and it does not serve the explanations of the idea

- I do not understand the result of the priority "10" in line 254 when I look at the screenshot. Perhaps change it to priority "1"?

- line 273 "old debugger" -> "standard debugger" I think that in many cases customized debugger views might come as complement to the standard debugger. Since there can sometimes be no dedicated actions in views, they can serve as additional visualization tools to find and understand data that helps taking a decision in the standard debugger.

- line 323 I find the transition between examples a bit rough, perhaps paragraphs with identified titles could help

- By "interfaces" (line 345) do you mean "Human Machine Interfaces" or just views? I understand it is just views, because there are no actions visible in the example and it follows the previous sections where you reused views and here you create new ones. In that case I suggest keeping the vocabulary consistent because HMI = views + actions + user experience design, while here it is only a view. I think also the title section could be stronger: you are actually "building" rather than "providing" debugger views. Perhaps changing the title to "Building domain-specific debugger views"? (it would be consistent with the previous section)

- line 435 you say that the "run-time stack does not do a good job telling you how the events have been triggered". Perhaps worth adding that it is because it provides a generic view over the execution of any program, while you are in need of a view providing very specific information.

- line 438 you ask "How hard is it to implement a domain-specific debugging interface?" -> I feel like this paragraph misses some comparison with how difficult it would be to do it with a standard debugger. That particular point is not covered in the related work either. For instance, with Pharo (before we implemented a similar moldable exception mechanism after Andrei explained to us, even if much less moldable than GT on the view part), we literally would have to implement a new debugger, probably by subclassing the existing one, having to deal with complex implementation problems to integrate a specific view, and then we would have to know when to choose the standard debugger and when to choose that specific one. Worse, if we use the specific one, and if we encounter another problem (imagine a DNU), since that debugger is specific to the example it would not be able to handle the DNU and allow me to debug it. This means extra implementation logic to handle such case... so tedious... 

- Just thinking now about the screenshots: they are small and we can't read much of the code. I understand that might not be that important such as in Fig. 12 where the point is showing the short amount of lines of code. It is however frustrating for the reader that cannot not see that there is code :P but I don't know what you can do there...

- Fig. 14 and 15, it is not clear if the `aView` text that is highlighted is a modification of the picture that you did or a feature of GT (I think it is the latter). I would clarify it perhaps to not let the reader think that you try to show something without explaining what it is, but that it is just the (awesome) tool that does that. Or I'm wrong and you forgot to tell why you highlighted it ;)

- Line 623, you say that "moldable exceptions only provide alternative views and actions but not alternative ways to step through the execution". I think you are partly wrong (sorry :P) but I think I heard someone saying or writing that GT was Pharo10-based. In Pharo10, if GT did not removed parts of the original system, you have Sindarin, which is exactly what we use it for. From our debugger extensions we use the API to script the stepping to write new stepping operators. In latest Pharo (11+12) we have for example an extended command that can skip part of code execution. So provided you write Sindarin scripts, you have this capability for free (does not mean it is simple, the smacc debugger stepping logic does not seem trivial to implement but I never tried). Perhaps what you meant there is that you do not have a "built-in" way in the moldable exceptions to build new stepping logics. But since it requires controlling the execution, at some point, you need to touch something low level (the interpreter) or use an API.


## Related Work

After reading your related work I was thinking that there are other ways to extend debuggers that you did not mention. I'm writing from memory, so I hope I'm putting exact things.

The Java Platform Debugger Architecture (JPDA) provides a 3-level architecture to build debuggers. The highest level is Java Debug Interface, basically you write a Java program that consumes VM stepping (and other) events. In the middle you have an interface to connect to the back end. Those two are to build new debuggers. With the lowest level, Java Virtual Machine Tools Interface (JVMTI), you can write agents that you attach to your debugger. In that sense, you can extend your debugger with new features. However with JVMTI you can only write in C or C++ (don't remember) so you have to write a debugger extension in another language than the one you debug and so you have to change worlds and manipulate very low-level concepts (cognitive cost) each time you observe something in your "home" language for which you want to extend your debugger. If you need a specific view, you need to build it from scratch and integrate it in your environment.

The VSCode debugger follows another philosophy, where you have a very standard debugger with very standard actions, but you can extend that debugger to support another back end for the language of your choice, so that your very specific language can benefit from super generic operations. For that it provides a protocol named Debugger Adapter Protocol (DAP).

The work of Bousse et al [1] follow the same path but for DSLs. They provide an environment to build DSLs execution engines, and for every DSL built with the environment, the environment provides a generic (time-traveling) debugger with the same features for all DSLs, except that the debugger will adapt to the stepping semantics of each DSLs. That semantic must be defined while designing and building the DSL, and is rather expansive to do (it is way harder than using introspection and intercession in Pharo like in the old GT-Debugger paper). They try to cope with that later by providing a "generic architecture" that allows them to build/extend specific debugging tools for DSLs [2] (they specifically speak about "Reducing the development cost of interactive debugger for DSLs"). They use the DAP to provide these new controls in VSCode. I don't think they provide views however. I'm not strong on this particular work though, it's worth re-reading it.

[1] Omniscient Debugging for Executable DSLs, https://inria.hal.science/hal-01662336/file/jss17-debugging.pdf
[2] Protocol-Based Interactive Debugging for Domain-Specific Languages, https://hal.science/hal-04124727/document

In OUPS [3] a few years ago (that's an IWST paper, I like it but it's not top quality paper), we redesigned the way Pharo dealt with exceptions. It evolved since then and is better designed and more stable than at the time. We conditioned the opening of a debugger to the acceptance of both the debugger and the exception. In short, when an exception is raised the debugger system takes a list of available debuggers sorted by a priority property, and try to open the exception with each one of them until one debugger accepts the exception, and the exception accepts to be debugged by the debugger. We obtained two new capabilities: 

- First at that time I was heavily working on the development of the current Pharo debugger, and it was unstable. When there was a bug in the debugger (which was often) I had no way to debug it. Fortunately, the GTDebugger was still there in the system. We created some kind of "meta-error", that was raised if an error originated from the opening of a debugger. That meta-error was debugged with the next-in-line debugger, so we could use another debugger to debug the failing debugger. For a long time that scenario was working so nice: I had a bug in the spec debugger, so it opened the GT-debugger that I used to debug the spec debugger and upon proceeding, the spec debugger opened working perfectly. GT was later removed.

- Second, we wanted to use it to open specific debuggers for specific exceptions. So you could have a domain exception that would accept only a specific debugger, or a specific debugger that would accept only specific exceptions. The problem is that we have to build complete debuggers for that (ie, at worst one debugger for each problem), which is why I guess we never applied this in real scenarios.

[3] Handling Error-Handling Errors: dealing with debugger bugs in Pharo, https://inria.hal.science/hal-02992644/document

A bit distant maybe, the work of Van de Vanter at al ([4]and [5]) where they extend the Truffle language implementation framework with "probes" that can extend the AST with introspection and (I think) intercession features. There are no views involved, but I remember the idea of extending the AST with new probes to easily build new debugging tools without touching low-level language concepts. 

[4] Fast, Flexible, Polyglot Instrumentation Support for Debuggers
and other Tools, https://arxiv.org/ftp/arxiv/papers/1803/1803.10201.pdf
[5] Building Debuggers and Other Tools: We Can “Have it All”, https://vandevanter.net/mlvdv/publications/2015-icooolps.pdf

## Typos

l.63 doesn't -> does not
l.111+112 don't -> do not
l.211 -> "when when"
l.242 we'd -> we would
l.243 it's -> it is
l/258 let's -> let us