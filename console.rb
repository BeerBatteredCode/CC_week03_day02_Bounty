require_relative('models/bounty')

name1 = Bounty.new({'name' => 'Space Worm Jim', 'species' => 'Worm', 'bounty_value' => '1000', 'homeworld' => 'Worm Town' })
name2 = Bounty.new({'name' => 'Selma', 'species' => 'Louise', 'bounty_value' => '1000', 'homeworld' => 'Earth' })

name1.save()
name2.save()

name1.name = 'Space Worm Bob'
name1.update()

# all_space_hashes = Bounty.all()
# p all_space_hashes

id_find = Bounty.find_by_id(name2)
p id_find

names = Bounty.find_by_name(name1)
p names

# name2.delete()
