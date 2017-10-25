note
	description: "Summary description for {A_LEAF}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	A_LEAF

inherit
	A_COMPOSITE

-- Fields
feature {NONE}
	body: STRING

-- Public
feature {ANY}
	getBody: STRING
	do
		Result := body
	end

-- Private
feature {NONE}

end
