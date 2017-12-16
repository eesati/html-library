note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BULLETLIST_TEST

inherit
	EQA_TEST_SET

feature -- Test routines

feature {NONE} -- Well known field values
	TEXT: STRING = "List item text"
	TEXT2: STRING = ""

feature -- Test routines

	bulletlist_test
			-- New test routine
		note
			testing:  "covers/{LISTITEMNODE}.make", "covers/{LISTNODE}.make", "covers/{LISTITEMNODE}.addchild"
			testcase: "T.3.1.2.006"
		local
			listitem: LISTITEMNODE
			listitem2: LISTITEMNODE
			list: LISTNODE
		do
			create listitem.make (TEXT)
			create listitem2.make (TEXT2)
			create list.make
			list.addchild (listitem)
			assert ("List item text 1", listitem.getbody.is_equal (Text))
			assert ("List item text 2", listitem2.getbody.is_equal (Text2))
		    assert ("Correct listitem in list", list.getchildren.at(1).is_equal (listitem))

		end

end


