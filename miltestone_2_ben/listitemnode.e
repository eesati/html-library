note
	description: "Summary description for {LISTITEMNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LISTITEMNODE

inherit
	A_LEAF

create
	make

feature {NONE}
	make(text: STRING)
	do
		body := text
	end

feature {ANY}
	accept(visitor: A_VISITOR)
	do
		visitor.visitListItem(Current)
	end

end
