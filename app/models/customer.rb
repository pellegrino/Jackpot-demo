class Customer < ActiveRecord::Base
  attr_writer :credit_card
  before_create :create_customer_at_jackpot 

  def create_customer_at_jackpot
    # Creates this customer at jackpot
    @jackpot_customer = Jackpot::Customer.create(email: self.email, 
                                                 subscription_id: self.jackpot_subscription_id)

    self.jackpot_customer_id = @jackpot_customer.id 

    if @jackpot_customer
      @jackpot_customer.update_credit_card(Jackpot::Card.new(@credit_card))
    end 
  end 

  def pay_jackpot_subscription
    jackpot_instance.pay_subscription unless jackpot_instance.nil?
  end 

  private
  def jackpot_instance
    Jackpot::Customer.find self.jackpot_customer_id
  end 
end
