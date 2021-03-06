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

	INTLINK: STRING = "#myanchor"

feature -- Test routines

	externallinknode_test
			-- New test routine
		note
			testing:  "covers/{EXTERNALLINKNODE}.make"
			testcase: "T.3.1.2.003"
		local
			linknode: EXTERNALLINKNODE
			linknode2: EXTERNALLINKNODE
		do
			create linknode.make(NAME, LINK)
			create linknode2.make(NAME2, LINK2)
			assert ("Link name 1", linknode.getbody.is_equal (NAME))
			assert ("Link name 2", linknode2.getbody.is_equal (NAME2))
			assert ("Link url 1", linknode.getlink.is_equal (LINK))
			assert ("Link url 2", linknode2.getlink.is_equal (LINK2))
		end

	link_within_document
		note
			testing: "covers/{EXTERNALLINKNODE}.make"
			testcase: "T.3.2.2.001"
		local
			linknode: EXTERNALLINKNODE
		do
			create linknode.make (NAME, INTLINK)
			assert ("Link name internal", linknode.getlink.is_equal(INTLINK))
		end

end


