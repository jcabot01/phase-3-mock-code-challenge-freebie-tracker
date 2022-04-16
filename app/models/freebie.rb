class Freebie < ActiveRecord::Base
  #macros
  belongs_to :dev #one to many; we are given the .dev instance method
  belongs_to :company #one to many; we are given the .company instance method

  #methods
  #1  Company#freebies
  # returns a collection of all the freebies for the Company
  # f1 = Freebie.first  //set frist freebie to a variable
  # f1.dev   => #<Dev:0x0000558dad9764f0 id: 1, name: "Rick">
    # ==>this works because Freebie has access to :dev through the macro
    # Dev Load (0.3ms)  SELECT "devs".* FROM "devs" WHERE "devs"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
    # Additionally, look at the debug from the console.  f1.dev essentially searchs devs, and returns the dev that matches the foriegn key of f1
  # =========================================================================
  #2   Freebie#company
  # returns the Company instance for this Freebie
  # same thing, because of the macros relationship above, we have access to the .company instance method.  The query searches companies, where the company_id matches the f1 instance variable foreign_id.  Company_id = 1, foreign_key = 1 (for f1)
  #=====================================================================
  # 3  Aggregate and Association Methods
  # Freebie
  # Freebie#print_details
  # should return a string formatted as follows: {insert dev's name} owns a {insert freebie's item_name} from {insert company's name}
  def print_details 
    "#{self.dev.name} owns a #{self.item_name} from #{self.company.name}"
  end
  
end

# when debugging in pry, the .whatever needs to match the MACRO at the top