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

			document.addchild (create {TEXTNODE}.make("Hallo Welt"))
			document.accept (visitor)
			print(visitor.content)
		end

end
