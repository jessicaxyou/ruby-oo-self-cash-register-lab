require 'pry'

class CashRegister
    # sets an instance variable @total on initialization to zero (FAILED - 1)
    # optionally takes an employee discount on initialization (FAILED - 2)
    attr_accessor :total, :discount, :price, :quantity, :title, :inventory, :last_transaction

    def initialize(discount=0) #note that value inside () should not have space
        @total = 0
        @discount = discount
        @inventory = []
        @item_names = []
    end
    # accepts a title and a price and increases the total (FAILED - 1)
    # also accepts an optional quantity (FAILED - 2)
    # doesn't forget about the previous total (FAILED - 3)
    def add_item(title, price, quantity=1) #quantity=1 sets optional quantity
        self.total += price * quantity
        #created @inventory empty array in intialize and needed to add title to array quantity number of times
        count = 0
        while count < quantity
            @inventory << title
            count += 1
        end
        #define last_transaction value
        @last_transaction = price * quantity
        # @item_names << title
        # @item_names = item_names.pop
    end
    
    def apply_discount
        # applies the discount to the total price (FAILED - 1)
        # returns success message with updated total (FAILED - 2)
        # reduces the total (FAILED - 3)
        if discount>0
            self.total = (total-(total*(discount.to_f/100))).round
            "After the discount, the total comes to $#{self.total}."
        else
             # returns a string error message that there is no discount to apply (FAILED - 1)
            "There is no discount to apply."
        end
    end

    def items
        #returns an array containing all items that have been added (FAILED - 1)
        #locate title from add_item method to pull into this section
        self.inventory
    end

    def void_last_transaction
        # subtracts the last item from the total (FAILED - 2)
        # returns the total to 0.0 if all items have been removed (FAILED - 3)
        @inventory.pop()
        @total -= @last_transaction
    end

end
