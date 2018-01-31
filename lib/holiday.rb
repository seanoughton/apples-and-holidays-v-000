require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash.each do |key_01,value_01|
    if key_01 == :summer
      value_01.each do |key_02, value_02|
        return value_02[1]
      end
    end
  end

end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |key_01,value_01|
    if key_01 == :winter
      value_01.each do |key_02, value_02|
        #puts key_02
        value_02 << supply
      end
    end
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |key_01,value_01|
    if key_01 == :spring
      value_01.each do |key_02, value_02|
        #puts key_02
        value_02 << supply
      end
    end
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |key_01,value_01|
      if key_01 == season   #iterates through the hash to find the specified season
      #adds a new holiday to that season
      #add a new key value pair to that hash
      #hash["new_key"] = "New Value"
        value_01[holiday_name] = supply_array
      end
    end
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  return_array = []
  holiday_hash.each do |key_01,value_01|
    if key_01 == :winter
      value_01.each do |key_02, value_02|
        return_array << value_02
      end
    end
  end
  return_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |key_01,value_01|
    puts "#{key_01.capitalize}:" #season
    value_01.each do |key_02, value_02|
      holiday = "#{key_02}".gsub(/_/," ")#take out underscores
      holiday = holiday.split.collect do|x| #capitalize all words
        x.capitalize
      end
      puts "  #{holiday.join(' ')}: #{value_02.join(", ")}".gsub(/_/," ")
      #puts "  #{holiday.split.collect(&:capitalize).join(' ')}: #{value_02.join(", ")}".gsub(/_/," ")
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_array=[]
  holiday_hash.each do |key_01,value_01|
    value_01.each do |key_02, value_02|
      #puts key_02 #holiday names
      value_02.each do |value_03|
        if value_03 == "BBQ"
          return_array << key_02
        end
      end
    end
  end
  return_array

end
