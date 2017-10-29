note
	description: "Summary description for {HTML_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_VISITOR

inherit
	A_VISITOR

create
	make

feature
	indent: INTEGER
	indentSequence: STRING

feature
	make
	do
		content := ""
		indent := 0
		indentSequence := "  "
	end

	visitDocument(document: DOCUMENT)
	do
		content := content + getIndent + "<!DOCTYPE html>"
		content := content + getIndent + "<html>"

		indent := indent + 1
		across document.getChildren as child loop
			child.item.accept(Current)
		end
		indent := indent - 1

		content := content + getIndent+ "</html>"
	end

	visitDocumentLink(documentlink: DOCUMENTLINKNODE)
	do
		content := content + getIndent + "<a href=%"%">" + documentlink.getBody + "</a>"
	end

	visitExternalLink(externallink: EXTERNALLINKNODE)
	do
		content := content + getIndent + "<a href=%"" + externallink.getLink + "%">" + externallink.getBody + "</a>"
	end

	visitHeading(heading: HEADINGNODE)
	do
		content := content + getIndent + "<h" + heading.getLevel.out + ">" + heading.getBody + "</h" + heading.getLevel.out + ">"
	end

	visitImage(image: IMAGENODE)
	do
		content := content + getIndent + "<img alt=%"" + image.getAlt + "%" src=%"" + image.getSource + "%" />"
	end

	visitList(list: LISTNODE)
	do
		content := content + getIndent + "<ul>"

		indent := indent + 1
		across list.getchildren as child loop
			child.item.accept (Current)
		end
		indent := indent - 1

		content := content + getIndent + "</ul>"
	end

	visitListItem(listItem: LISTITEMNODE)
	do
		content := content + getIndent + "<li>" + listItem.getbody + "</li>"
	end

	visitTable(table: TABLENODE)
	do
		content := content + getIndent + "<table>"

		indent := indent + 1
		across table.getchildren as child loop
			child.item.accept (Current)
		end
		indent := indent - 1

		content := content + getIndent + "</table>"
	end

	visitTableRow(tablerow: TABLEROWNODE)
	do
		content := content + getIndent + "<tr>"

		indent := indent + 1
		across tablerow.getchildren as child loop
			child.item.accept (Current)
		end
		indent := indent -1

		content := content + getIndent + "</tr>"
	end

	visitTableCell(tablecell: TABLECELLNODE)
	do
		content := content + getIndent + "<td>" + tablecell.getBody + "</td>"
	end

	visitText(text: TEXTNODE)
	do
		content := content + getIndent + "<p>" + text.getBody + "</p>"
	end



	getIndent: STRING
	local
		counter: INTEGER
	do
		if content.is_equal("") then
			Result := ""
		else
			Result := "%N"
		end

		from
			counter := 0
		until
			counter >= indent
		loop
			Result := Result + indentSequence
			counter := counter + 1
		end
	end

end
