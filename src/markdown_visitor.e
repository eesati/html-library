note
	description: "Summary description for {MARKDOWN_VISITOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MARKDOWN_VISITOR

inherit
	A_VISITOR

	create make

feature
	make
	do
	end

	visitDocument(document: DOCUMENT): STRING
	do
		Result := "<!DOCTYPE html>"
		Result := Result + "<html>"

		across document.getChildren as child loop
			Result := Result + child.item.accept(Current)
		end

		Result := Result + "</html>"
	end

	visitDocumentLink(documentlink: DOCUMENTLINKNODE): STRING
	do
		Result := ""
	end

	visitExternalLink(externallink: EXTERNALLINKNODE): STRING
	do
		Result := ""
	end

	visitHeading(heading: HEADINGNODE): STRING
	do
		Result := ""
	end

	visitImage(image: IMAGENODE): STRING
	do
		Result := "<![Alt text](/>"
	end

	visitList(list: LISTNODE): STRING
	do
		Result := ""
	end

	visitListItem(listitem: LISTITEMNODE): STRING
	do
		Result := ""
	end

	visitTable(table: TABLENODE): STRING
	do
		Result := ""
	end

	visitTableRow(tablerow: TABLEROWNODE): STRING
	do
		Result := ""
	end

	visitTableCell(tablecell: TABLECELLNODE): STRING
	do
		Result := ""
	end

	visitText(text: TEXTNODE): STRING
	do
		Result := ""
	end

end
