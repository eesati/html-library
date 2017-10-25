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

	make(a_text: STRING)
		do
			text := a_text
		end

-- Public
feature {ANY}
	accept(visitor: A_VISITOR)
	do
		visitor.visitText(Current)
	end

	getText: STRING
	do
		Result := text
	end

-- Private
feature {NONE}
	text: STRING

end
