note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	HTML_VISITOR_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Global objects
	string1: STRING = "hello world and so on, let's see if this works with something like that!"
	string2: STRING = "andsoon"
	link: STRING = "https://www.google.com"
	customHTML: STRING = "<p>Hallo Welt, was für ein schöner Tag!</p>"



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

	visitor: HTML_VISITOR


feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			create document.make(string1)
			create doc2.make(string2)

			create custom.make
			custom.addtext (customHTML)

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
			testing:  "covers/{DOCUMENT}.accept", "covers/{HTML_VISITOR}.visitDocument"
		local
			expected: STRING
		do
			expected := "<!DOCTYPE html>%N<html>%N  <head>%N  </head>%N  <body>%N  </body>%N</html>"
			assert ("visit Document", document.accept (visitor).is_equal (expected))
		end

	custom_element_test
		note
			testing: "covers/{CUSTOMELEMENT}.accept", "covers/{HTML_VISITOR}.visitCustom"
		local
			expected: STRING
		do
			expected := "%N" + customHTML
			assert ("visit custom element", custom.accept (visitor).is_equal (expected))
		end

	document_link_test
		note
			testing: "covers/{DOCUMENTLINKNODE}.accept", "covers/{HTML_VISITOR}.visitDocumentLink"
		local
			expected: STRING
		do
			expected := "%N" + "<a href=%"" + string2 + "%">" + string1 + "</a>"
			assert ("visit document link", documentlink.accept (visitor).is_equal (expected))
		end

	extlink_test
		note
			testing: "covers/{EXTERNALLINKNODE}.accept", "covers/{HTML_VISITOR}.visitExternalLink"
		local
			expected: STRING
		do
			expected := "%N" + "<a href=%"" + link + "%">" + string1 + "</a>"
			assert ("visit external link", extlink.accept (visitor).is_equal (expected))
		end

	heading_test
		note
			testing: "covers/{HEADINGNODE}.accept", "covers/{HTML_VISITOR}.visitHeading"
		local
			expected: STRING
		do
			expected := "%N" + "<h3>" + string1 + "</h3>"
			assert ("visit external link", heading.accept (visitor).is_equal (expected))
		end

	image_test
		note
			testing: "covers/{IMAGENODE}.accept", "covers/{HTML_VISITOR}.visitImage"
		local
			expected: STRING
		do
			expected := "%N" + "<img alt=%"" + string2 + "%" src=%"" + link + "%" />"
			assert ("visit external link", image.accept (visitor).is_equal (expected))
		end

	list_test
		note
			testing: "covers/{LISTNODE}.accept", "covers/{HTML_VISITOR}.visitImage", "covers/{LISTITEMNODE}.accept"
		local
			expected: STRING
		do
			expected := "%N" + "<ul>%N  <li>" + string1 + "</li>%N  <li>" + string2 + "</li>%N</ul>"
			assert ("visit external link", list.accept (visitor).is_equal (expected))
		end

	table_test
		note
			testing: "covers/{TABLENODE}.accept", "covers/{HTML_VISITOR}.visitImage", "covers/{TABLEROWNODE}.accept", "covers/{TABLECELLNODE}.accept"
		local
			expected: STRING
		do
			expected := "%N" + "<table>%N  <tr>%N    <td>" + string1 + "</td>%N    <td>" + string2 + "</td>%N  </tr>%N</table>"
			assert ("visit external link", table.accept (visitor).is_equal (expected))
		end

end


