extends Label

func _on_Area2D_area_entered(area):
	set("custom_colors/font_color", Color(0,1,0))
	text = "Open"
