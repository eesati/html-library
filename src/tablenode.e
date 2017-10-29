note
	description: "Summary description for {TABLENODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TABLENODE

inherit
	A_CONTAINER
	redefine
		children,
		addChild
	end

create
	make

feature
	children: LINKED_LIST[TABLEROWNODE]

-- Constructor
feature {NONE}
	make do
		create children.make
	end


feature {ANY}
	accept(visitor: A_VISITOR) do
		visitor.visitTable(Current)
	end

	addChild(tablerow: TABLEROWNODE)
	do
		children.extend (tablerow)
	end

end
