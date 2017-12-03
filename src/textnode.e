note
	description: "Summary description for {TEXTNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEXTNODE

inherit
	A_LEAF

create
	make

-- Constructor
feature {NONE}

	make(text: STRING)
		do
			body := text
		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitText(Current)
	end

-- Private
feature {NONE}

end
