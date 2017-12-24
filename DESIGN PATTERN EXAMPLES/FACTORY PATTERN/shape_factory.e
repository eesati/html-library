note
	description: "Summary description for {SHAPE_FACTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHAPE_FACTORY




feature
	circle (str:STRING):SHAPE
	local
circle2:CIRCLE
rectangle:RECTANGLE
do
if str="CIRCLE"  then

	create circle2
	Result:=circle2

else


	create rectangle
	Result:=rectangle




	end
	end
end
