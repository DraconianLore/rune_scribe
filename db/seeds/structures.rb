# Seeds for base structures

# TEMPLATE:
# Structure.create(
#     name: '',
#     description: %(),
#     additional: %(),
#     trace: '',
#     draw: '',
#     target: '',
#     strained: false,
#     sub_structures: [],
#     discovered: false
# )

# Two Rune Structures
puts 'Adding two rune structures'
puts 'Mind...'
s = Structure.create(
    name: '',
    description: %(),
    additional: %(),
    trace: '',
    draw: '',
    target: '',
    strained: false,
    discovered: true
)
s.runes << Rune.find_by(name: '')
s.runes << Rune.find_by(name: '')
    
s = Structure.create(
    name: '',
    description: %(),
    additional: %(),
    trace: '',
    draw: '',
    target: '',
    strained: false,
    discovered: true
)
s.runes << Rune.find_by(name: '')
s.runes << Rune.find_by(name: '')
    
s = Structure.create(
    name: '',
    description: %(),
    additional: %(),
    trace: '',
    draw: '',
    target: '',
    strained: false,
    discovered: true
)
s.runes << Rune.find_by(name: '')
s.runes << Rune.find_by(name: '')

s = Structure.create(
    name: '',
    description: %(),
    additional: %(),
    trace: '',
    draw: '',
    target: '',
    strained: false
)
s.runes << Rune.find_by(name: '')
s.runes << Rune.find_by(name: '')
    
s = Structure.create(
    name: '',
    description: %(),
    additional: %(),
    trace: '',
    draw: '',
    target: '',
    strained: false
)
s.runes << Rune.find_by(name: '')
s.runes << Rune.find_by(name: '')
        
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'

puts "Two Rune Structures populated"

# Four Rune Structures
puts 'Adding four rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Four Rune Structures populated"

# Eight Rune Structures
puts 'Adding eight rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Eight Rune Structures populated"

# Sixteen Rune Structures
puts 'Adding sixteen rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Sixteen Rune Structures populated"

# Thirty Two Rune Structures
puts 'Adding thirty two rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Thirty Two Rune Structures populated"

# Sixty Four Rune Structures
puts 'Adding sixty four rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Sixty Four Rune Structures populated"

# Special Structures
puts 'Adding special rune structures'
puts 'Mind...'
puts 'Power...'
puts 'Death...'
puts 'Life...'
puts 'Neutral...'
puts "Special Rune Structures populated"
