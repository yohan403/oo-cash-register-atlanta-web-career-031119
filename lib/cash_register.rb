class CashRegister
  attr_reader :discount
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @items_price = []
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def add_item(title,price,quantity=1)
    @title = title
    @price = price
    @total += price * quantity
    quantity.times do
      @items << title
      @items_price << price * quantity
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total * (1-@discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @items_price.last
  end
end
