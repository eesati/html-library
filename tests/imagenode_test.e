note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	IMAGENODE_TEST

inherit
	EQA_TEST_SET

feature {NONE} -- Well known field values
	SOURCE: STRING = "https://www.google.com"
	ALT: STRING = "This is my alt text!"

feature -- Test routines

	image_node_test
			-- New test routine
		note
			testing:  "covers/{IMAGENODE}.make"
		local
			image: IMAGENODE
		do
			create image.make (SOURCE)
			assert ("Source correctly set", image.getsource.is_equal (SOURCE))
		end

end


