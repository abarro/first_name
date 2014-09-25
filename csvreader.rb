from_file, to_file = ARGV

# start the csv lib from ruby standard lib 
require 'csv'

# read my csv file and store it into csv_data variable
csv_data = File.read(from_file)

# parse csv file according to blog post found on link bellow
my_csv = CSV.new(csv_data, :headers => true, :header_converters => :symbol, :converters => [:all])
# http://technicalpickles.com/posts/parsing-csv-with-ruby/
# convert each row into a hash
csv_hash = my_csv.to_a.map {|row| row.to_hash }

# open/create new file using the ARGV name
output = File.open(to_file, 'w')


all_names = csv_hash.map do |row|
	whole_name = row[:name]
	first_name = whole_name.to_s.split(" ")[0]

  if first_name != nil
  	first_name.capitalize!
  else
  	whole_name = "noname"
  end

	output.write("#{first_name}\n")
end