sequence :intro, title: "Introduction" do

  speak """
    This is a example game for Horn engine.
    It was created before the engine ever existed, because I wanted a target
    game done to test it. Also because dreaming is fun!
  """

  speak """
    The speak command should be used to output narrative text - i.e characters
    speaking, narrator mumblings, etc. It can also be used to output game warnings to
    the player, if needed.
  """

  grab 'narrator'

  narrator.speak """
    The speak command can be associated to nobody, or to a specific entity. In this example,
    we use the grab command to make the 'narrator' character entity avaiable in this sequence,
    and then we call the speak command on him.
  """

  speak do
    slow "Using a code block, we can adjust how the fast or how slow the text should be outputted... "
    slower "Like this..."
    slowest "Or this..."
    fastest "OR THIS HOLY SHIT STOP BEING SO SLOW DAMNIT"
    faster "***huffhuffhuff***"
    fast "...OK? OK."
    normal "So there is it."
  end

  speak do
    variable from: 1, to: 10, "We can also make the output speed variable for a given text."
    normal "We can also force a pause, asking for player input to continue."
    pause
    normal "See?"
  end

  speak scroll: :manual """
    Each speak command call implicitely pauses after all the text has been outputted, no matter
    which form was used. We can set the scroll option to manual so it will also pause whenever
    the text area get full and needs to, well, scroll. The option is set to auto by default.
  """

  speak """
    Finally, let's set some rules about the text strings:
          Whitespace at the start of a new line is ignored!
    The limit of characters for a single line is variable, and depends of the configured output.
    New lines in the speak command are new lines in the output.
    That's it, let's go to the characters command.
  """

  wait 0.5.seconds

  speak do
    normal "But just before that, let's talk about the wait command and the sequence command."
    pause
    normal "The wait command is, well, to wait a bit of time before going to the next message."
    pause
    normal """
      The sequence command creates a game sequence, where stuff happens. All the speak commands
      are avaiable inside the sequence block, along with some others. A sequence can be created and
      then later executed.
    """
  end

  speak "Now let's go to the characters command."

end