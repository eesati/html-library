note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	MARKDOWN_VISITOR_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Global objects
	string1: STRING = "hello world and so on, let's see if this works with something like that!"
	string2: STRING = "andsoon"
	link: STRING = "https://www.google.com"
	customMarkdown: STRING = "$$I = \int \rho R^{2} dV$$"

	document: DOCUMENT
	doc2: DOCUMENT
	custom: CUSTOMELEMENT
	documentlink: DOCUMENTLINKNODE
	extlink: EXTERNALLINKNODE
	heading: HEADINGNODE
	image: IMAGENODE
	list: LISTNODE
	listitem1: LISTITEMNODE
	listitem2: LISTITEMNODE
	table: TABLENODE
	tablerow: TABLEROWNODE
	tablecell1: TABLECELLNODE
	tablecell2: TABLECELLNODE
	text: TEXTNODE

	visitor: MARKDOWN_VISITOR


feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			create document.make(string1)
			create doc2.make(string2)

			create custom.make
			custom.addtext (customMarkdown)

			create documentlink.make (string1, doc2)
			create extlink.make (string1, link)

			create heading.make (string1, 3)

			create image.makealt (link, string2)

			create list.make
			create listitem1.make (string1)
			create listitem2.make (string2)
			list.addchild (listitem1)
			list.addchild (listitem2)

			create table.make
			create tablerow.make
			create tablecell1.make (string1)
			create tablecell2.make (string2)
			tablerow.addchild (tablecell1)
			tablerow.addchild (tablecell2)
			table.addchild (tablerow)

			create text.make (string1)

			create visitor.make
		end

feature -- Test routines

	document_test
			-- New test routine
		note
			testing:  "covers/{DOCUMENT}.accept", "covers/{MARKDOWN_VISITOR}.visitDocument"
		local
			expected: STRING
		do
			expected := ""
			assert ("visit Document", document.accept (visitor).is_equal (expected))
		end

	custom_element_test
		note
			testing: "covers/{CUSTOMELEMENT}.accept", "covers/{MARKDOWN_VISITOR}.visitCustom"
		local
			expected: STRING
		do
			expected := customMarkdown
			io.put_string (custom.accept (visitor))
			io.put_new_line
			io.put_string (expected)
			assert ("visit custom element", custom.accept (visitor).is_equal (expected))
		end

	document_link_test
		note
			testing: "covers/{DOCUMENTLINKNODE}.accept", "covers/{MARKDOWN_VISITOR}.visitDocumentLink"
		local
			expected: STRING
		do
			expected := "%N" + "[hello world and so on, let's see if this works with something like that!](andsoon/)"
			io.put_string (documentlink.accept(visitor))
			io.put_new_line
			io.put_string (expected)
			assert ("visit document link", documentlink.accept (visitor).is_equal (expected))
		end

	extlink_test
		note
			testing: "covers/{EXTERNALLINKNODE}.accept", "covers/{MARKDOWN_VISITOR}.visitExternalLink"
		local
			expected: STRING
		do
			expected := "[hello world and so on, let's see if this works with something like that!](https://www.google.com)"
			assert ("visit external link", extlink.accept (visitor).is_equal (expected))
		end

	heading_test
		note
			testing: "covers/{HEADINGNODE}.accept", "covers/{MARKDOWN_VISITOR}.visitHeading"
		local
			expected: STRING
		do
			expected := "%N" + "### hello world and so on, let's see if this works with something like that!"
			io.put_string (heading.accept(visitor))
			io.put_new_line
			io.put_string (expected)
			assert ("visit heading", heading.accept (visitor).is_equal (expected))
		end

	image_test
		note
			testing: "covers/{IMAGENODE}.accept", "covers/{MARKDOWN_VISITOR}.visitImage"
		local
			expected: STRING
		do
			expected := "![andsoon](https://www.google.com)"
			assert ("visit image", image.accept (visitor).is_equal (expected))
		end

	list_test
		note
			testing: "covers/{LISTNODE}.accept", "covers/{MARKDOWN_VISITOR}.visitImage", "covers/{LISTITEMNODE}.accept"
		local
			expected: STRING
		do
			expected := "%N" + "- hello world and so on, let's see if this works with something like that!%N- andsoon"
			io.put_string (list.accept(visitor))
			io.put_new_line
			io.put_string (expected)
			assert ("visit list", list.accept (visitor).is_equal (expected))
		end

	table_test
		note
			testing: "covers/{TABLENODE}.accept", "covers/{MARKDOWN_VISITOR}.visitImage", "covers/{TABLEROWNODE}.accept", "covers/{TABLECELLNODE}.accept"
		local
			expected: STRING
		do
			expected := "%N%N" + "<table>%N<tr>%N<td>" + string1 + "</td>%N<td>" + string2 + "</td>%N</tr>%N</table>%N"
			io.put_string (table.accept (visitor))
			io.put_string (expected)
			assert ("visit table", table.accept (visitor).is_equal (expected))
		end

end


