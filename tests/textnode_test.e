note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEXTNODE_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "TEXT-A"
	NAME2: STRING = ""
	DOCNAME: STRING = "DOCUMENT-A"
	ALT: STRING = "This is my alt text!"

feature -- Test routines

	textnode_test
			-- New test routine
		note
			testing:  "covers/{TEXTNODE}.make", "covers/{DOCUMENT}.addchild"
			testcase: "T.3.1.2.008"
		local
			text: TEXTNODE
			text2: TEXTNODE
			document: DOCUMENT
		do
			create text.make (NAME)
			create text.make (NAME2)
			create document.make(DOCNAME)
			document.addchild (text)
			assert ("Correct text", text.getbody.is_equal (NAME))
			assert ("Correct text", text.getbody.is_equal (NAME2))
			assert ("Alternative image text", document.getchildren.at(1).is_equal (text))
		end

end


