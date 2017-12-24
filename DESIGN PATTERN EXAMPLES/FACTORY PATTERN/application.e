note
	description: "factorypattern application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
		create shapefactory
		shape1:= shapefactory.circle("CIRCLE")
		shape1.draw
			print ("Hello Eiffel World!%N")
		end

shapefactory:SHAPE_FACTORY

shape1:SHAPE
--shap2:SHAPE

end
