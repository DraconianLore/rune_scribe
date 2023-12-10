class Structure < ApplicationRecord
    has_and_belongs_to_many :runes
    has_one :level
    before_create :calculate_details
    has_and_belongs_to_many :tags

    attribute :is_locked, :boolean
    
    scope :unlocked, -> { where(discovered: true) }
    scope :locked, -> { where(discovered: false) }


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
        
        # Verbose console output
        puts '############################################'
        puts "Structure: #{self.name}"
        puts "Runes in structure: #{houses}"
        puts "Dominant: #{dominant.count == 1 ? dominant[0] : 'None'}"
        puts '############################################'
        # return results
        dominant.count == 1 ? dominant[0] : 'None'

    end


    # private

    def calculate_details
        self.dominant = self.dominant_house
        self.number_of_runes = self.composition.count
        runes = self.composition
        house_level = {1 => 1, 2 => 1, 3 => 2, 4 => 3, 5 => 4, 7 => 5, 10 => 7}
        self.level = Level.create(
            all: runes.sort_by{|rune| rune.level}.last.level,
            mind: house_level[runes.select{|rune| rune.house == "Mind"}.sort_by{|rune| rune.level}.last&.level] || 0,
            power: house_level[runes.select{|rune| rune.house == "Power"}.sort_by{|rune| rune.level}.last&.level] || 0,
            death: house_level[runes.select{|rune| rune.house == "Death"}.sort_by{|rune| rune.level}.last&.level] || 0,
            life: house_level[runes.select{|rune| rune.house == "Life"}.sort_by{|rune| rune.level}.last&.level] || 0
            )
        
    end
    

end
