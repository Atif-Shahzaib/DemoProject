User.create(email: 'admin@devshop.com', password: '123456', isAdmin: true)
User.create(email: 'user2@devshop.com', password: '123456', isAdmin: nil)
Category.create(title: 'Dell')
Category.create(title: 'HP')
Category.create(title: 'Lenovo')
Category.create(title: 'Gaming')
Category.create(title: 'Budget')
product = Product.new(title: 'Dell Laptop', price: 450,image: File.open(Rails.root + "app/assets/images/images.jpeg"))
categories = Category.find_by_id(1)
product.categories = product.categories << categories
product.save!
