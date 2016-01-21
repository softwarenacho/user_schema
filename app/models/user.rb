class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 
  def name
    name = "#{first_name} #{last_name}"  
  end

  def age
    age = Date.today.year - birthday.year
    age -= 1 if Date.today < birthday + age.years
  end

  validates :age, :numericality => {:greater_than => 17}
  validates :email, :uniqueness => true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 

  #validates :phone, :format => {:with => /\A[0-9]{10}\z/}

  def before_validation_on_create
      self.phone = phone.gsub(/[^0-9]/, "")
   end

   validates_length_of :phone, :minimum => 10

end
