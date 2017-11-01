note
	description: "Summary description for {DOCUMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DOCUMENT

inherit
	A_CONTAINER

create
	make

-- Constructor
feature {NONE}
	make
		do
			create children.make
		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitDocument(Current)
	end


-- Private
feature {NONE}


end
