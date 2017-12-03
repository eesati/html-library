note
	description: "Summary description for {FILEWRITER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	FILEWRITER

create
	make

feature {NONE}
	path: STRING

feature {NONE}
	make(a_path: STRING)
	do
		path := a_path
	end

feature {NONE}


feature {ANY}
	write(document: DOCUMENT; a_visitor: A_VISITOR)
	local
		file: PLAIN_TEXT_FILE
	do
		create file.make_create_read_write (path + "/" + document.getname)
		file.put_string (document.accept (a_visitor))
	end

end
