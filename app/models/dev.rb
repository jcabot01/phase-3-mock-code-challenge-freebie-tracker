class Dev < ActiveRecord::Base
  #macros
  has_many :freebies
  has_many :companies, through: :freebies  #going through the freebies table to get the company info

  #methods
  #1  Dev#freebies
  # returns a collection of all the freebies that the Dev has collected
  # Same as the others, because of our MACROS, we have access to the .freebies instance method.  So Dev.first.freebies would return the 1st Dev instance, and it would then return the freebies that dev got, because the first dev id will match the dev_id found in the coresponding freebies tables.

  # =========================================================================

  #2  Dev#companies
  # returns a collection of all the companies that the Dev has collected freebies from
  # Same this as above, we call Dev.last => we get the last Dev instance.  We call Dev.last.companies  => we get the companies that that dev received freebies from.  The freebie table contains the that company_id, so we want to return the company whose company_id is found in the Freebie table

  # =========================================================================

  #3   Dev#received_one?(item_name)
  # accepts an item_name (string) and returns true if any of the freebies associated with the dev has that item_name, otherwise returns false
  #####We have to loop through the freebies, because there might be more than one.
  def received_one?(item_name) #if making a boolean method, we can use ? in method name.
    #long ruby-way to do it:
    # self.freebies.map do |freebie|
    #   if freebie.item_name == self.freebies
    #     return true
    #   end
    # end
    # return false
    #SQL/AR way of doing
    !!self.freebies.find_by(item_name: item_name)
    #find_by takes in 2 things; column name & value
    #also, !! is called "double-bang".  Since we have ? in the method name, the Ruby logic expects a boulean.  A way to make sure something returns to true is to negate it to  false !, then negate that to true !!, forcing whatever to follow to be considered true.
  end

  # =========================================================================

  #4   Dev#give_away(dev, freebie)
  # accepts a Dev instance and a Freebie instance, changes the freebie's dev to be the given dev; your code should only make the change if the freebie belongs to the dev who's giving it away
  def give_away(new_dev, freebie)
    binding.pry
    
    #update the dev to be the new_dev or we could do dev_id:
    #what if this freebie doesn't belong to this dev?
    #1st check if the freebie belongs to the current dev instance
    if freebie.dev_id == self.id
      freebie.update(dev: new_dev)
    else
      p "Freebie does not belong to current dev, can't give it away"
    end
  end
  
end

# when debugging in pry, the .whatever needs to match the MACRO at the top