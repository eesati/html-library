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

feature {NONE}
	make
	do
		firstSeen := false
	end

feature {NONE}
	firstSeen: BOOLEAN

feature {A_COMPOSITE}
	visitCustomElement(customelement: CUSTOMELEMENT): STRING
	do
		Result := getnewline + customelement.getbody
	end

	visitDocument(document: DOCUMENT): STRING
	do
		Result := ""
		across document.getChildren as child loop
			Result := Result + child.item.accept(Current)
		end
	end

	visitDocumentLink(documentlink: DOCUMENTLINKNODE): STRING
	do
		Result := getnewline + "[" + documentlink.getbody + "](" + documentlink.getdocument.getname + "/)"

		firstSeen := true
	end

	visitExternalLink(externallink: EXTERNALLINKNODE): STRING
	do
		Result := getnewline + "[" + externallink.getbody + "](" + externallink.getlink + ")"

		firstSeen := true
	end

	visitHeading(heading: HEADINGNODE): STRING
	local
		counter: INTEGER
	do
		from
			counter := 0
			Result := getnewline
		until
			counter >= heading.getlevel
		loop
			Result := Result + "#"
			counter := counter + 1
		end
		Result := Result + " " + heading.getbody

		firstSeen := true
	end

	visitImage(image: IMAGENODE): STRING
	do
		Result := getnewline + "![" + image.getalt + "](" + image.getsource + ")"

		firstSeen := true
	end

	visitList(list: LISTNODE): STRING
	do
		Result := ""
		across list.getchildren as child loop
			Result := Result + child.item.accept (Current)
		end
	end

	visitListItem(listitem: LISTITEMNODE): STRING
	do
		Result := getnewline + "- " + listitem.getbody

		firstSeen := true
	end

	visitTable(table: TABLENODE): STRING
	do
		Result := getnewline + getnewline + "<table>"
		firstSeen := true

		across table.getchildren as child loop
			Result := Result + child.item.accept (Current)
		end
		Result := Result + getnewline + "</table>" + getnewline
	end

	visitTableRow(tablerow: TABLEROWNODE): STRING
	do
		Result := getnewline + "<tr>"
		across tablerow.getchildren as child loop
			Result := Result + child.item.accept (Current)
		end
		Result := Result + getnewline + "</tr>"
	end

	visitTableCell(tablecell: TABLECELLNODE): STRING
	do
		Result := getnewline + "<td>" + tablecell.getbody + "</td>"
	end

	visitText(text: TEXTNODE): STRING
	do
		Result := getnewline + text.getbody

		firstSeen := true
	end

feature {NONE}
	getNewline: STRING
	do
		if firstSeen then
			Result := "%N"
		else
			Result := ""
		end
	end

end
