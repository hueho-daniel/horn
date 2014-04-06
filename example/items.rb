items 'weird' do

  create :thingamajik do
    name 'Dongle'
    type 'Others'
    description {
      short: "Something weird I found."
      long: """
        Items are fairly easy to create. Like characters, they accept namespaces, they have
        themselves names for use in the game narrative, and identifications for use in Horn scripts.
        The main difference is that they have two descriptions: one short and one long, for use
        in different situations. You can also use a type verb, for defining a short, descriptive type
        name, and a multiple verb, which when used makes the item stackable in the inventory.
      """
    }
    multiple max: 2
  end

  create :ball do
    name 'Ball'
    type 'Liars'
    description {
      short: "Actually a cube."
      long: """
        Egads! I have been fooled! This is no ball!
      """
    }
  end

end

sequence :items, title: "Your stuff" do

  speak """
    You can access the current game inventory by using, well, the inventory verb.
    This is not actually a command, rather, is a persistent object which you can access
    in sequences, accepting various subcommands.
  """

  inventory.clear!

  speak """
    Some things you can do with the inventory:
    - put a new item, using a similar syntax to the grab command:
    \"inventory.put :ball, from: 'weird'\"
    - check if there is a item in the inventory - returns true or false:
    \"inventory.has? :thingamajik, from 'weird'\a
    - get all the itens in the inventory - returns an map with ids as keys and itens as values:
    \"inventory.get\"
  """

  inventory.put :ball, from: :weird, message: "Someone put a ball in my belongings!"
  inventory.put :thingamajik, from: 'weird', quiet: true

  speak """
    inventory.put accept two extra arguments compared to 'grab': 'message' defines a custom message
    to be outputted when the item is added to the inventory - you can define a default message to show
    up so you don't have to always fill this option. 'quiet' disables the message, and just adds the 
    item without fanfare.
  """

  speak """
    To check the attributes of a item, you can just grab it, like you do with characters:
    \"grab :ball, from 'weird'\"
    \"speak ball.description.long\"
    If you don't want to pollute the sequence namespace, you can use the following syntax, which
    makes the item only avaiable in the supplied block (note that this work with characters as well)
    \"grab :ball, from 'weird' do |ball| speak ball.description.short end \"
  """

  speak inventory.get[:thingamajik].description.long

end