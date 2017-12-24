note
	description: "Summary description for {BINAR_OBSERVER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	OCTAL_OBSERVER

--	inherit OBSERVER

create
make
feature
make (subject1:SUBJECT)
local

	do
	--	create octals1
		subject1.attach(Current)

	end
feature
update
local
sub:SUBJECT
gets:INTEGER
do
	create sub.make
	gets:=sub.getstate
	io.put_integer(57)

end
end
