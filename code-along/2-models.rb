# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Company.destroy_all #delete all rows before running this code and adding rows. prevent duplicates 
# **************************

# - Insert, read, update, and delete rows in companies table
#   (i.e. full CRUD of company data).

# 1a. check out the schema file
# 1b. check out the model file
puts "There are #{Company.all.count} companies" #counts all lines in the company table 
# aka SELECT COUNT(*) from Company in SQL 


# 2. insert new rows in companies table
new_company=Company.new # .new creates a new row, insert into model 
#puts new_company.inspect
new_company["name"]="Apple"
new_company["city"]="Cupertino"
new_company["state"]="CA"
new_company["url"]="https://www.apple.com"
#puts new_company.inspect

new_company.save #save inserts these changes into the database. Converts from empty hash to an actual row 
#puts "There are #{Company.all.count} companies" #counts all lines in the company table 

new_company2=Company.new #don't have to do new variable, would overwrite, but cleaner to have a new variable when making the next row 
new_company2["name"]="Amazon"
new_company2["city"]="Seattle"
new_company2["state"]="WA"
#puts new_company.inspect

new_company2.save #save inserts these changes into the database. Converts from empty hash to an actual row 
#puts "There are #{Company.all.count} companies" #counts all lines in the company table 

new_company3=Company.new #don't have to do new variable, would overwrite, but cleaner to have a new variable when making the next row 
new_company3["name"]="Basecamp"
new_company3["city"]="Chicago"
new_company3["state"]="IL"
new_company3["url"]="https://www.basecamp.com"
#puts new_company.inspect

new_company4=Company.new # .new creates a new row, insert into model 
#puts new_company.inspect
new_company4["name"]="Meta"
new_company4["city"]="Menlo"
new_company4["state"]="CA"
new_company4["url"]="https://www.meta.com"
#puts new_company.inspect

new_company3.save #save inserts these changes into the database. Converts from empty hash to an actual row 

new_company4.save #save inserts these changes into the database. Converts from empty hash to an actual row 
puts "There are #{Company.all.count} companies" #counts all lines in the company table

# 3. query companies table to find all row with California company
puts "Cali Companies: #{Company.where({"state"=>"CA"}).count}"
cali_companies=Company.where({"state"=>"CA"})
puts cali_companies.inspect #active record relation, array 


# 4. query companies table to find single row for Apple
# apple=Company.where({"name"=>"Apple"})
# puts apple.inspect #prints out an array 

apple=Company.find_by({"name"=>"Apple"}) #find_by will only give you 1 result 
puts apple.inspect #prints out an array 

# 5. read a row's column value
apple_url=apple["url"] #only show the apple URL 
puts apple_url


# 6. update a row's column value
amazon=Company.find_by({"name"=>"Amazon"})
amazon["url"]="https://www.amazon.com"
amazon.save
puts amazon.inspect

# 7. delete a row
meta=Company.find_by({"name"=>"Meta"})
meta.destroy #deletes the row in the table 
puts "Cali Companies: #{Company.where({"state"=>"CA"}).count}"
