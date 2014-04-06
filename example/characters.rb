characters do

  create :narrator do
    name "Mighty Narrator"
    description "The master of the whole Horn engine!"
    
    talk :intro do
      normal """
        So, I am a character.
        We can use the characters command to create new characters anytime, and inside the block,
        we can use the create command. The argument for this command should be either a string
        or a symbol which will be used as an identification for the character in the Horn scripts.
      """
      pause
      normal """
        Inside the create command we can use the following verbs:
        - name, to give the character an name
        - description, which can be used in menus or otherwise to describe the character outside
        narrative
        - talk, which can be used to create a pre-prepared text for the character, using the same
        options and syntax as in the speak command.
      """
    end    
  end

end

characters 'heroes' do
  
  create :knight do
    name "Two-Shoes Good Knight"
    description "A generic prince in shining armor, blargh"

    talk :namespaces, """
      I'M A MIGHTY AND NOBLE KNIGHT oh fuck let's cut that crap out.
      You can define characters in 'namespaces', for instance, characters of different timelines
      or stories, and whatever else. The namespace can be defined by supplying the character command
      with a symbol or string.
      If you don't define a namespace when declaring a characters block, 
      the character will be avaiable in the 'global' namespace by default.
    """
  end

  create :sidekick do
    name "Somebody, I Think?"
    description "Who was this little guy again?"

    talk :multiple, """
      DO NOT MOCK ME, FOR I AM THE ULTIMATE DO-GOOD, THE ETERNAL SAVIOR, THE LAST RESORT OF HUMANITY,
      THE SIDEKICK!
      Also, you can define multiple characters in a 'characters' block, just saying.
    """
  end

end

sequence :chars, title: "Meeting the narrator" do

  speak """
    To make use of a character, we can the grab command to make them avaiable
    inside this sequence.
  """

  grab 'narrator'

  speak do
    normal """
      We can 'grab' someone either suplying the character identification chosen at his creation, 
      either as a string or as a symbol. Note that it doesn't matter how you defined the id, 
      if as a string or as a symbol - you can refer to id by both, interchangeably. 
      In other words, \"grab 'narrator'\" == \"grab :narrator\".
    """
    pause
    normal """
      In any case, this form of the grab command will attempt to load into this sequence 
      the corresponding character from the global namespace by default. If you want to load
      a character from another namespace, you can use the from option:
      \"grab 'knight' from: :heroes\"
      Note that the 'from' argument also accepts strings and symbols interchangeably.
    """
  end

  narrator.speak :intro
  narrator.speak """
    By the way, I spoke this rambling passing a symbol parameter representing the talk defined
    in the character creation. If you want to refer to the talk by a string, you need to use
    the 'use' option like this:
    \"narrator.speak use: 'intro'\"
  """

end

sequence :heroes, title: "Meeting the heroes", using: :heroes do

  grab [:knight, :sidekick]

  knight.speak :namespaces
  sidekick.speak :multiple

  speak """
    You can use the 'using' option in the sequence command to define a new
    default namespace from where 'grab' characters. This way, you don't need to use the
    'from' option when grabbing someone:
    \"grab :knight\"
    The global namespace remains avaiable, however, so this would be also valid:
    \"grab :narrator\"
  """

  speak """
    You can pass an array of namespaces for 'using' as well, and you can pass an array of characters
    to grab. Do note, however, that sometimes they may be name clashes, for instance, two different characters
    in the global and the heroes namespace, with the same identification. To specify the namespace, you need to use the
    'from' option explicitely - if you don't, nasal demons will spawn! (AKA the first match starting from the first 
    namespace declared in the 'using' option will be used, if no match, look in the global namespace, if no match,
    crahs and burn!)
    \"grab :double, from: :global\"
    To be able to grab two different chars with the same id, in the same sequence, use the 'as' option:
    \"grab :double, as: 'notdouble'\"
  """

end