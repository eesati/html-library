note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	EXTERNALLINKNODE_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	NAME: STRING = "LINK-A"
	LINK: STRING = "http://www.google.ch"
	NAME2: STRING = ""
	LINK2: STRING = ""

feature -- Test routines

	externallinknode_test
			-- New test routine
		note
			testing:  "covers/{EXTERNALLINKNODE}.make",  "covers/{DOCUMENT}.addchild"
			testcase: "T.3.1.2.003"
		local
			linknode: EXTERNALLINKNODE
			linknode2: EXTERNALLINKNODE
			document: DOCUMENT

		do
			create linknode.make(NAME, LINK)
			create linknode2.make(NAME2, LINK2)
			create document.make("DOCUMENT-A")
			document.addchild (linknode)
			assert ("Link name", linknode.getbody.is_equal (NAME))
			assert ("Link name", linknode2.getbody.is_equal (NAME2))
			assert ("Link url", linknode.getlink.is_equal (LINK))
			assert ("Link url", linknode2.getlink.is_equal (LINK2))
			assert ("Right child", document.getchildren.at (1).is_equal (linknode))

		end

end


