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
		indent := 0
		indentSequence := "  "
	end

	visitDocument(document: DOCUMENT): STRING
	do
		Result := "<!DOCTYPE html>"
		Result:= Result + getIndent + "<html>"

		indent := indent + 1
		across document.getChildren as child loop
			Result:= Result + child.item.accept(Current)
		end
		indent := indent - 1

		Result:= Result + getIndent + "</html>"
	end

	visitDocumentLink(documentlink: DOCUMENTLINKNODE): STRING
	do
		Result:= getIndent + "<a href=%"%">" + documentlink.getBody + "</a>"
	end

	visitExternalLink(externallink: EXTERNALLINKNODE): STRING
	do
		Result:= getIndent + "<a href=%"" + externallink.getLink + "%">" + externallink.getBody + "</a>"
	end

	visitHeading(heading: HEADINGNODE): STRING
	do
		Result:= getIndent + "<h" + heading.getLevel.out + ">" + heading.getBody + "</h" + heading.getLevel.out + ">"
	end

	visitImage(image: IMAGENODE): STRING
	do
		Result:= getIndent + "<img alt=%"" + image.getAlt + "%" src=%"" + image.getSource + "%" />"
	end

	visitList(list: LISTNODE): STRING
	do
		Result:= getIndent + "<ul>"

		indent := indent + 1
		across list.getchildren as child loop
			Result:= Result + child.item.accept (Current)
		end
		indent := indent - 1

		Result:= Result + getIndent + "</ul>"
	end

	visitListItem(listItem: LISTITEMNODE): STRING
	do
		Result:= getIndent + "<li>" + listItem.getbody + "</li>"
	end

	visitTable(table: TABLENODE): STRING
	do
		Result := getIndent + "<table>"

		indent := indent + 1
		across table.getchildren as child loop
			Result:= Result + child.item.accept (Current)
		end
		indent := indent - 1

		Result:= Result + getIndent + "</table>"
	end

	visitTableRow(tablerow: TABLEROWNODE): STRING
	do
		Result := getIndent + "<tr>"

		indent := indent + 1
		across tablerow.getchildren as child loop
			Result:= Result + child.item.accept (Current)
		end
		indent := indent -1

		Result:= Result + getIndent + "</tr>"
	end

	visitTableCell(tablecell: TABLECELLNODE): STRING
	do
		Result := getIndent + "<td>" + tablecell.getBody + "</td>"
	end

	visitText(text: TEXTNODE): STRING
	do
		Result := getIndent + "<p>" + text.getBody + "</p>"
	end



	getIndent: STRING
	local
		counter: INTEGER
	do
		Result := "%N"
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
