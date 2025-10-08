extends Resource 

class_name Inventory

signal update

@export var slots: Array[InventorySlot]

func insert(item: InventoryItem):
	# if item in slot is same as item being picked up, 
	# add item to slot and stack
	var item_slots = slots.filter(func(slot): return slot.item == item)
	if !item_slots.is_empty():
		item_slots[0].amount += 1
	# else, add to a new slot
	else:
		var empty_slots = slots.filter(func(slot): return slot.item == null)
		if !empty_slots.is_empty():
			empty_slots[0].item = item
			empty_slots[0].amount = 1
	update.emit()

func remove(slot: InventorySlot):
	slots[slot].amount -= 1
