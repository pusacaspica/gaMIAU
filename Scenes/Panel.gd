extends Panel

var item
 
var grid = {}
var cell_size = 32
var grid_width = 0
var grid_height = 0
 
var full : bool = false

func _ready():
	pass
 
func insert_item(inserted_item : TextureRect):
	if !full:
		inserted_item.rect_global_position = self.rect_global_position
		item = inserted_item
		full = true
		return true
	else:
		return false
 
func grab_item(pos):
	var item_held = get_item_under_pos(pos)
	print(item)
	if item == null:
		return null
	
	item = null
	full = false
	return item_held
	
 
func pos_to_grid_coord(pos):
    var local_pos = pos - rect_global_position
    var results = {}
    results.x = int(local_pos.x / cell_size)
    results.y = int(local_pos.y / cell_size)
    return results
 
 
func get_item_under_pos(pos):
	if item.get_global_rect().has_point(pos):
		return item
	return null
 
func insert_item_at_first_available_spot(item):
    for y in range(grid_height):
        for x in range(grid_width):
            if !grid[x][y]:
                item.rect_global_position = rect_global_position + Vector2(x, y) * cell_size
                if insert_item(item):
                    return true
    return false