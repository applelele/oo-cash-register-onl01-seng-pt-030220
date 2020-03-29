class CashRegister
  attr_accessor :total, :employee_discount, :title

  def initialize(employee_discount = nil)
    @total = 0.00
    @employee_discount = employee_discount
    @title = []
    # @@cart << self
  end

  def discount
    self.employee_discount
  end

  def add_item(title, price, quantity = 1)
    # item_info = {}
    # item_info[:name] = title
    # item_info[:price] = price
    # item_info[:quantity] = quantity
    # cart << item_info
    @price = price
    @quantity = quantity

    @total += @price * @quantity

    if quantity > 1
        quantity.times do
            @title << title
        end
    else
        @title << title
    end
  end

  def apply_discount
    if @employee_discount
      @total = @total * (1 - (@employee_discount.to_f / 100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @title
  end

  def void_last_transaction
    @total - (@price * @quantity)
  end

end
