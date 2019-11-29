module Admin::IndexHelper
  def item_average_price
    @items = Item.all
    @total = 0
    @items.each do |item|
      @total += item.price
    end

    @verdict = @total/@items.size
    return @verdict.round(2)
  end

  def stock
    @items = Item.all
    @total = 0
    @items.each do |item|
      @total += item.price
    end
    return @total.round(2)
  end
end
