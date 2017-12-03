note
	description: "Summary description for {LISTNODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LISTNODE

inherit
	A_CONTAINER
	redefine
		children,
		addchild
	end

create
	make

feature {NONE}
	children: LINKED_LIST[LISTITEMNODE]

feature {NONE}
	make
	do
		create children.make
	end

feature {ANY}
	accept(visitor: A_VISITOR): STRING
	do
		Result := visitor.visitList(Current)
	end

	addChild(child: LISTITEMNODE)
	do
		children.extend (child)
	end
end
