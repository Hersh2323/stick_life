# The script must inherit from Event or
# any subclass that inherits from it.
extends Event
# you can give it a class_name if you want

# Overwrite _execute() method
# It will be called when EventManager arrives at this event.
func _execute() -> void:
	# Here will be the body of our event.
	# Whatever you want to happen, define it in this function
	print("Hello everyone!")
	
	# Notify that your event is done and can continue to
	# the next event.
	finish()
