module ListsHelper
	def even_or_odd(index)
		index%2 == 0 ? 'even' : 'odd'
	end

	def user_id()
		current_user ? current_user.id : nil
	end

	def set_session_list_id(id)
		session[:list_id] = id
	end

	def out_of_stock_field(items, list)
		'Out of Stock' unless items.where(list_id: list.id, in_stock: false).count == 0
	end

	def in_stock_field(items, list)
		'In Stock' unless items.where(list_id: list.id, in_stock: true).count == 0
	end

	def out_of_stock_items(items, list)
		items.where(list_id: list.id, in_stock: false)
	end

	def in_stock_items(items, list)
		items.where(list_id: list.id, in_stock: true)
	end

end
