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
			create visitor.make
			create document.make

			
		end

end
