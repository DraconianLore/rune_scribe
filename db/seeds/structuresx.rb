# Seeds for special structures

puts 'Adding special rune structures'

s = Structure.new(
    name: 'Unseal',
    description: %(Supposedly opens any door and deactivates any magical effect\(including rune magic\) attached to the door.),
    target: ['Surface'],
    trace: 'Instant',
    draw: 'Instant',
    strained: false,
    discovered: true,
    tldr: "Open magic doors"
)
s.runes << Rune.where(house: "Power")
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Exterminator',
    description: %(Keeps rodents from coming within 10ft.),
    target: ['Surface', 'Object'],
    trace: '1 Day',
    draw: '1 Year',
    strained: false,
    discovered: true,
    tldr: "Rodent Be Gone"
)
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Fear')
s.runes << Rune.find_by(name: 'Rune of Death')
s.tags << Tag.find_by(name: 'Utility')
s.save!

s = Structure.new(
    name: 'Mimic',
    description: %(Two identical Objects marked with this structure move simultaniously.\nStructures must have line of sight to each other.),
    target: ['Object'],
    trace: '1 Day',
    draw: '1 Year',
    strained: false,
    discovered: true,
    tldr: "Move 2 items at once"
)
s.runes << Rune.find_by(name: 'Rune of Air')
s.runes << Rune.find_by(name: 'Rune of Fury')
s.runes << Rune.find_by(name: 'Rune of Sight')
s.tags << Tag.find_by(name: 'Utility')
s.save!


s = Structure.new(
    name: 'Preservation',
    description: %(Keeps food and water fresh.),
    target: ['Object'],
    trace: '1 Day',
    draw: '1 Year',
    strained: false,
    discovered: true,
    tldr: "Keep food/water fresh"
)
s.runes << Rune.find_by(name: 'Rune of Frost')
s.runes << Rune.find_by(name: 'Rune of Life')
s.runes << Rune.find_by(name: 'Rune of Light')
s.tags << Tag.find_by(name: 'Utility')
s.save!

puts "Special Rune Structures populated"
