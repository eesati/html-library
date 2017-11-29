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

-- Private fields
feature {NONE}
	name: STRING

-- Constructor
feature {NONE}
	make(a_name: STRING)
		do
			create children.make
			name := a_name
		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitDocument(Current)
	end

	getName: STRING
	do
		Result := name
	end


-- Private
feature {NONE}


end
