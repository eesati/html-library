note
	description: "Summary description for {A_CONTAINER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	A_CONTAINER

inherit
	A_COMPOSITE

-- Public
feature {ANY}
	addChild(child: A_COMPOSITE)
	do
		children.extend (child)
	end

	getChildren: LINKED_LIST[A_COMPOSITE]
	do
		Result := children
	end


-- Private
feature
	children: LINKED_LIST[A_COMPOSITE]

end
