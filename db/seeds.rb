#First thing to do when seeding is delete database
puts "Removing old data..."
Company.delete_all
Dev.delete_all
Freebie.delete_all

puts "Creating companies..."
c1 = Company.create(name: "Google", founding_year: 1998)
c2 = Company.create(name: "Facebook", founding_year: 2004)
c3 = Company.create(name: "Dunder Mifflin", founding_year: 2002)
c4 = Company.create(name: "Enron", founding_year: 1995)

puts "Creating devs..."
d1 = Dev.create(name: "Rick")
d2 = Dev.create(name: "Morty")
d3 = Dev.create(name: "Mr. Meseeks")
d4 = Dev.create(name: "Gazorpazop")

puts "Creating freebies..."
Freebie.create(item_name: "keychain", value: 3, company_id: c1.id, dev_id: d1.id)
Freebie.create(item_name: "Tshirt", value: 15, company_id: c2.id, dev_id: d2.id)
Freebie.create(item_name: "sticker", value: 1, company_id: c1.id, dev_id: d2.id)
Freebie.create(item_name: "pen", value: 2, company_id: c4.id, dev_id: d4.id)


# ***************************************************************
# * TODO: create freebies! Remember, a freebie belongs to a dev *
# * and a freebie belongs to a company.                         *
# ***************************************************************
# Create freebies Here

puts "Seeding done!"
