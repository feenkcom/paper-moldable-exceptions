I went through the article, and I really like it. Most of its parts are very well written, making it easy and entertaining to read.

# Major comments

** I would add that a similar (albeit much less expressive) behavior could be achieved in other languages by simply overriding toString() to an exception. It is a common practice to have a detailed textual description of exceptions. 

One example:

- [NamingException.java#L400](https://github.com/openjdk/jdk/blob/896107705615a3b9363b7a0a3e6703b20fedef70/src/java.naming/share/classes/javax/naming/NamingException.java#L400)
- [NamingException.java#L424](https://github.com/openjdk/jdk/blob/896107705615a3b9363b7a0a3e6703b20fedef70/src/java.naming/share/classes/javax/naming/NamingException.java#L424)

This textual description is used by the classical Java debugger, but this is limited to a textual representation. Your approach goes much further by having a specific interface and specific actions. Maybe you could mention this in the related work, or in the introduction.

** Section 3 is difficult to read. I am not sure what exactly you mean by "domain-specific debugger interface" actually. Are we talking about user-interface?

# Minor comments

The abstract implies that "Contextual debugging views" are "custom debuggers". I agree, but it is difficult to grasp from the text.

Line 40: "There have been numerous efforts to develop custom debuggers for various application domains and domain-specific languages." => Can be reinforced with a ref, such as this one: Object-Centric Debugging -- Jorge Ressia, Alexandre Bergel, Oscar Nierstrasz. Proceedings of the 34th International Conference on Software Engineering (ICSE'12)

Line 205: "for each each custom"

Line 273: "the old debugger" => "the standard debugger"

Line 354: I do not follow the link between the scripter preview and the previous Ludo example. Why a notebook page has been created?

Line 374: What the graphical tree view is about?

Line 578: "it is method" => "it is a method"



