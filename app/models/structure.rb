class Structure < ApplicationRecord
    has_and_belongs_to_many :runes


    def composition
        list_of_runes = []
        list_of_runes += runes

        # recursion if a structure is made up of structures
        sub_structures.each do |structure_id|
            list_of_runes += Structure.find(structure_id).composition
        end

        list_of_runes
    end

    def dominant_house
        runes = self.composition
        # sort runes and find the dominant one
        houses = Hash.new(0)
        runes.map{|rune| houses[rune.house] += 1}
        most_common = houses.values.max
        dominant = houses.select{|k,v| v == most_common}.keys
        
        # Console output while testing to ensure correctness
        puts '############################################'
        puts "Runes in structure: #{houses}"
        puts "Dominant: #{dominant.count == 1 ? dominant[0] : 'None'}"
        puts '############################################'
        # return results
        dominant.count == 1 ? dominant[0] : 'None'

    end

end
