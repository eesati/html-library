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


-- Private
feature {NONE}
	children: LINKED_LIST[A_COMPOSITE]

end
