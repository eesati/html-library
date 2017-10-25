note
	description: "MarkupGenerator application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

-- Root Entry Point
feature {NONE}
	make
		local
			document: DOCUMENT
			visitor: A_VISITOR
		do
			create {HTMLVISITOR} visitor.make
			create document.make

			document.addchild (create {HEADINGNODE}.make ("My Header", 1))
			document.addchild (create {TEXTNODE}.make("Hallo Welt"))
			document.addchild (create {IMAGENODE}.makealt ("//besole.ch/pictograms/logo.png", "Logo Besole"))

			document.accept (visitor)
			print(visitor.content)
		end

end
