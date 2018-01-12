namespace :bags do   
 desc "1000 Bag Numbers are getting created using this task"
 task :import => [:environment] do 
    1000.times do  
      rand_number = rand(100000000) 
      bag = Bag.new(number: "BAG#{rand_number}")
      bag.save(validate: false)
    end
  end
end

puts "sucess"
