note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HEADINGNODE_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "HEADING-A"
	NAME2: STRING = ""
	LEVEL: INTEGER = 1
	LEVEL2: INTEGER = -1

feature -- Test routines

	headingnode_test
			-- New test routine
		note
			testing:  "covers/{HEADINGNODE}.make"
			testcase: "T.3.1.2.009"
		local
			heading: HEADINGNODE
			heading2: HEADINGNODE
			document: DOCUMENT
		do
			create heading.make(NAME, LEVEL)
			create heading2.make(NAME2, LEVEL2)
			create document.make("DOCUMENT-A")
			document.addchild (heading)
			assert ("Heading name", heading.getbody.is_equal (NAME))
			assert ("Heading name", heading.getbody.is_equal (NAME2))
			assert ("Heading level", heading.getlevel.is_equal (LEVEL))
			assert ("Heading level", heading.getlevel.is_equal (LEVEL2))
			assert ("Right child", document.getchildren.at (1).is_equal (heading))

		end

end


