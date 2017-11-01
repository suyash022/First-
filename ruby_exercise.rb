require 'date'
module BuyerSellerData
  def self.user_info
  [
    {:first_name => 'alex', :last_name => 'newman ',  :date_of_birth => '01-05-1982',  :address => 'sapna sangeeta', :role => 'buyer'},
    {:first_name => 'alex', :last_name => 'Panc' ,  :date_of_birth => '12-04-1990',  :address => 'bhanwar kua', :role => 'seller'},
    {:first_name => 'Meena', :last_name => 'Pallanipppan ',  :date_of_birth => '03-02-1988',  :address => 'sapna sangeeta', :role => 'seller'},
    {:first_name => 'Prabhu', :last_name => 'Sharma ',  :date_of_birth => '11-02-1992',  :address => 'geeta bhawan', :role => 'seller'},
    {:first_name => 'Sundar', :last_name => 'Pichai ',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
  ]
  end
end
module ProductData
  def self.product_info
  [
    {:name => 'bicycle', :seller => 'alex', :price => 3000, :category => 'vehicle'},
    {:name => 'car', :seller => 'meena', :price => 250000, :category => 'vehicle'},
    {:name => 'jeans', :seller => 'prabhu', :price => 1800, :category => 'clothes'},
    {:name => 'shirt', :seller => 'prabhu', :price => 700, :category => 'clothes'},
    {:name => 'blue shirt', :seller => 'prabhu', :price => 1200, :category => 'clothes'},
    {:name => 't-shirt', :seller => 'prabhu', :price => 600, :category => 'clothes'},
    {:name => 'capri', :seller => 'prabhu', :price => 300, :category => 'clothes'},
    {:name => 'bike', :seller => 'meena', :price => 60000, :category => 'vehicle'},
    {:name => 'scooter', :seller => 'meena', :price => 25000, :category => 'vehicle'},
    {:name => 'maruti', :seller => 'meena', :price => 400000, :category => 'vehicle'},
    {:name => 'auto', :seller => 'meena', :price => 100000, :category => 'vehicle'},
    {:name => 'sweter', :seller => 'prabhu', :price => 1200, :category => 'clothes'},
    {:name => 'jacket', :seller => 'prabhu', :price => 3500, :category => 'clothes'},
    {:name => 'hat', :seller => 'prabhu', :price => 400, :category =>'clothes'},
    {:name => 'doll', :seller => 'alex', :price => 350, :category => 'toys'},
    {:name => 'toy car', :seller => 'alex', :price => 250, :category => 'toys'},
    {:name => 'bat', :seller => 'alex', :price => 700, :category => 'toys'},
    {:name => 'ball', :seller => 'alex', :price => 20, :category => 'toys'},
    {:name => 'batman', :seller => 'alex', :price => 300, :category => 'toys'},
    {:name => 'barbi doll', :seller => 'alex', :price => 3000, :category => 'toys'}
  ]
  end
end

class User
  include BuyerSellerData
  def self.make_object(hash)
    info = self.new
    hash.each do |key, val|
      info.return_obj(key, val)
    end
    info
  end

  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end

  BuyerSellerData.user_info.each do |h|
    user_obj = User.make_object(h)
    # print "#{user_obj.first_name} "
    # print "#{user_obj.last_name} "
    # print "#{user_obj.date_of_birth} "
    # print "#{user_obj.address} "
    # print "#{user_obj.role} "
    # puts "\n"
  end

  def full_name
    BuyerSellerData.user_info.each do |h|
      user_obj = User.make_object(h)
      print "#{user_obj.first_name} "
      print "#{user_obj.last_name} "
    end
  end

  def age
    today = Date.today
    BuyerSellerData.user_info.each do |h|
      user_obj = User.make_object(h)
      birth_date = Date.parse user_obj.date_of_birth
      age_in_days = today - birth_date
      age_in_years = age_in_days/365.25
      puts "#{user_obj.first_name} age is #{age_in_years.to_i} years"
  end
  end

  def match_first_name
    BuyerSellerData.user_info.each do |h|
      first_name_arr = []
      user_obj = User.make_object(h)
      if user_obj.first_name == "alex"
        first_name_arr << user_obj
          puts "#{first_name_arr}"
          #puts "#{match_first_name.count}"
      end
    end
  end

 end
user = User.new
user.full_name
user.age
user.match_first_name

class Seller < User
  include BuyerSellerData
  def self.make_object(hash)
    info = self.new
    hash.each do |key, val|
      info.return_obj(key, val)
    end
    info
  end

  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end

  def seller_object
    BuyerSellerData.user_info.each do |h|
      buyer_arr = []
      user_obj = Seller.make_object(h)
      if user_obj.role == "seller"
        buyer_arr << user_obj
        puts "#{buyer_arr}"
        puts "\n"
      end
    end
  end
end
seller = Seller.new
seller.seller_object
class Product
  include ProductData
  def self.make_object(hash)
    info = self.new
    hash.each do |key, val|
      info.return_obj(key, val)
    end
    info
  end

  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end

  ProductData.product_info.each do |h|
    user_obj = User.make_object(h)
    # print "#{user_obj.name} "
    # print "#{user_obj.seller} "
    # print "#{user_obj.price} "
    # print "#{user_obj.category} "
    # puts "\n"
  end
end

class Buyer
  include BuyerSellerData
  def self.make_object(hash)
    info = self.new
    hash.each do |key, val|
      info.return_obj(key, val)
    end
    info
  end

  def return_obj(key, val)
    singleton_class.class_eval { attr_accessor "#{key.to_s}" }
    send("#{key.to_s}=", val)
  end


  def buyer_object
     BuyerSellerData.user_info.each do |h|
      buyer_arr = []
      user_obj = Buyer.make_object(h)
      if user_obj.role == "buyer"
        buyer_arr << user_obj
        puts "#{buyer_arr}"
        puts "\n"
      end
    end
  end

  def buy_toys
    ProductData.product_info.each do |h|
      toys = []
      user_obj = Buyer.make_object(h)
      if user_obj.category == "toys" && user_obj.price < 1000
        toys << user_obj
      end

      #puts "#{toys}"
    end
  end

  def buyer_full_name
    print "#{first_name} #{last_name}"
  end
end
h1 = {:first_name => 'Sundar ', :last_name => 'Pichai ',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
buyer = Buyer.new
buyer.buyer_object
buyer.buy_toys
