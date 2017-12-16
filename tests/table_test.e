note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TABLE_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare
--			on_clean
		end

feature -- Well known field values
	cell1text: STRING = "myValue"
	cell2text: STRING = "myNextValue"
	cell3text: STRING = ""
	cell4text: STRING = "Hello Table world!"

	table: TABLENODE
	row1: TABLEROWNODE
	row2: TABLEROWNODE

	cell1: TABLECELLNODE
	cell2: TABLECELLNODE
	cell3: TABLECELLNODE
	cell4: TABLECELLNODE

feature -- Buildup and teardown
	on_prepare
		do
			-- Table
			create table.make

			-- First row
			create row1.make
			create cell1.make (cell1text)
			row1.addchild (cell1)
			create cell2.make (cell2text)
			row1.addchild (cell2)
			table.addchild (row1)

			-- Second Row
			create row2.make
			create cell3.make(cell3text)
			row2.addchild (cell3)
			create cell4.make(cell4text)
			row2.addchild (cell4)
			table.addchild (row2)
		end


feature -- Test routines

	tables_test
			-- New test routine
		note
			testing:  "covers/{TABLECELLNODE}.make", "covers/{TABLEROWNODE}.make", "covers/{TABLENODE}.make"
			testcase: "T.3.2.2.007"
		local
		do
			assert ("Table contains two rows", table.getchildren.count.is_equal (2))
			assert ("Row1 contains two cells", row1.getchildren.count.is_equal (2))
			assert ("Row2 contains two cells", row1.getchildren.count.is_equal (2))

			assert("cell1 is at position 1 of row 1", row1.getchildren.at (1).is_equal(cell1))
			assert("cell2 has correct text", cell2.getbody.is_equal (cell2text))

			assert("Header rows - not implemented!", false)
		end

end


