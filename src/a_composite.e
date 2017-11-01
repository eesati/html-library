note
	description: "Summary description for {A_COMPOSITE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	A_COMPOSITE

-- Public Features
feature {ANY}
	accept(visitor: A_VISITOR): STRING deferred end

-- Private Features
feature {NONE}


end
