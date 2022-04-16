class Company < ActiveRecord::Base
  #macros
  has_many :freebies  #one to many, one company has many freebies
  has_many :devs, through: :freebies  #many to many
  
  #methods
  #1  Company#freebies
  # returns a collection of all the freebies for the Company
  # Because of the MACRO above, we have access to .freebies.  So to query the db we can write Company.first.freebies => and we return the various freebies that the company handed out.
# =================================================
  #2   Company#devs
  # returns a collection of all the devs who collected freebies from the Company.
  # Same thing as above, because of our MACRO that assigns relationships, Company has access to the .devs instance methods (through freebies JOIN table).  Company.first.devs returns the devs who collected freebies from that company; in this case Google because Google's company_id is attached to the first Freebie.
# =================================================
  #3  Company#give_freebie(dev, item_name, value)
  # takes a dev (an instance of the Dev class), an item_name (string), and a value as arguments, and creates a new Freebie instance associated with this company and the given dev.
  def give_freebie(dev, item_name, value)
    
    Freebie.create(item_name: item_name, value: value, dev: dev, company: self)
    # or this way
    # self.freebies.create(item_name: item_name, value: value, company: self)
  end

# =================================================
  #4 Company.oldest_company
  # returns the Company instance with the earliest founding year
  def self.oldest_company
    
    #in ruby we'd have to loop through the .all array
    #in SQL we use "order" by founding year, and we want the first entry
    self.order("founding_year").first
  end
  
end


# when debugging in pry, the .whatever needs to match the MACRO at the top