note
	description: "Summary description for {COMPONENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COMPONENT

create
	make

feature
		-- Status

		tag: STRING
				-- tag of current {COMPONENT}
		content: STRING
				-- content of current [COMPONENT]

feature
		--Settings
	make(t:STRING; c:STRING)
		do
			tag:=t
			content:=c
		end
	set_tag(t: STRING)
		require
			tag_exists: not t.is_empty
		do
			tag:= t
		end
	set_content(c: STRING)
			-- no require required, content can be empty
		do
			content := c
		end

invariant
		-- valid for all objects of class COMPONENT after they are created
		tag_exists: not tag.is_empty

end
