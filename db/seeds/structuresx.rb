# Seeds for special structures

puts 'Adding special rune structures'

s = Structure.new(
    name: 'Unseal',
    description: %(Supposedly opens any door and deactivates any magical effect\(including rune magic\) attached to the door.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true
)
s.runes << Rune.where(house: "Power")
s.save!


puts "Special Rune Structures populated"
