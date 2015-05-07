
module Maze

def self.prompt
  print "> "
  return gets.chomp.downcase
end

#Player begins game. Initial prompt is taken from "Ruby Wizardry"
def self.start
  puts
  puts <<-MESSAGE
  Holy giraffes! You fell into a maze! 
  Through the thick fog you can just barely see that there are two paths on either side of you. 
  MESSAGE
  puts
  puts <<-MESSAGE
  Which direction do you choose? 
  (right, left, or forward) *full answers throughout the game, please*
  MESSAGE
  
  next_move = prompt

  #There are three options. You can go right or left or forward.
  if next_move.include? "right"
   right
  elsif next_move.include? "left"
    left
  elsif next_move.include? "forward" 
   forward  
  else
    puts "You should have made a proper decision. If you don't die from thirst, you'll probably get eaten."
    try_again
  end     
end

#Allows the user to restart or exit
def self.try_again
  puts "Do you want to try again?"
  next_move = prompt
  if next_move.include? "n"
    exit
  elsif next_move.include? "y"
    start
  else
    puts "I guess that's a no."
    exit
  end
end

#When user selects an option that allows them to continue forward
def self.successful
  sleep 1 
  puts "Good job!"
  try_again
end

#Lets the user know they suck. 
def self.failure
  sleep 1
  puts "Well, that was a bad decision."
  try_again
end

def self.mistake
  puts "Ummmm, no. Let's try this again."
  sleep 1
end

#When the user selects "right"
def self.right
  puts
  puts <<-MESSAGES
  You slowly move forward, stumbling periodically over the gnarled roots poking through the ground. 
  You approach an intersection and poke your head around to see what is on the right. 
  You see a dwarf grumbling to himself as he paces back and forth, battle axe in hand. 
  MESSAGES
  
  sleep 1 
  puts
  puts <<-MESSAGES
  Do you want to approach the cranky dwarf? Or turn around?
  (approach or turn)
  MESSAGES
  next_move = prompt

  if next_move == "turn" 
    right_three
  elsif  next_move == "approach"
  puts <<-MESSAGES
  You approach the dwarf slowly. 
  He looks up and glares at you. 
  You ask him for assistance, but he tells you he is busy and you must pay for his help. 
  And pay well at that. 
  MESSAGES
    right_two
  else
    mistake
    right
  end 
end

#Follow up to approaching the dwarf
def self.right_two
  puts
  puts <<-MESSAGES
  You look down and pat your pockets. 
  Apparently the only thing that got transported into the maze with you of any value is your overpriced watch. 
  MESSAGES

  sleep 1
  puts 
  puts <<-MESSAGES
  Do you stay and hand it over? Or leave and try and find your own way? 
  (stay or leave)
  MESSAGES

  next_move = prompt

  if next_move == "stay"
    puts
    puts <<-MESSAGES
  You sigh and hand over your watch. 
  The dwarf begrudgingly accepts it and leads you through a series of twists and turns through the maze. 
  He dumps you off at the exit and grumbles at you as you dash out of the maze.
  MESSAGES
    puts
    successful
  elsif next_move == "leave"
    right_three
  else
    mistake
    right_two
  end
end

#Follow up to turn around and leave cranky dwarf alone
def self.right_three
  puts
  puts <<-MESSAGES
  You turn around and find a massive spider creeping up behind you.
  The spider hesitates, and it appears almost as startled as you.  
  MESSAGES

  sleep 1
  puts 
  puts <<-MESSAGES
  Do you grab a nearby rock and try and put up a fight? 
  Or do you reconsider dealing with the cranky dwarf?
  (rock or dwarf)
  MESSAGES

  next_move = prompt

  if next_move == "rock"
  puts
  puts <<-MESSAGES
  You pick up the closest rock and nail the spider right in the eye. 
  He turns around and scuttles away. 
  Well you're kind of pissed off, so you go and chase him and continue tossing rocks at him. 
  You find a particulrly good rock to toss when you look up and realize the spider has led you to the exit.
  MESSAGES
  puts
    successful
  elsif next_move == "dwarf"
  puts
  puts <<-MESSAGES
  You spin around to run away and quickly realize that eight legs can move a heck of a lot faster than two. 
  Before you know it, you're all wrapped up in a web, and no one is around to hear your muffled screams as you become a spider snack.
  MESSAGES
  puts
    failure
  else
    mistake
    right_three
  end
end


#When the user selects "left"
def self.left
  puts
  puts <<-MESSAGES
  You slowly move forward, stumbling periodically over the gnarled roots poking through the ground.
  You trip and fall. 
  As you push yourself up, you feel a warm breeze run across your face. 
  You slowly look up and see a sleepy dragon in front of you. 
  You freeze as he gazes at you with his slitted eyes. 
  MESSAGES

  sleep 1
  puts
  puts <<-MESSAGES
  Do you run? Or do you stay?
  run or stay
  MESSAGES
  next_move = prompt

  if next_move == "run"
    left_two
  elsif next_move == "stay"
    left_three
  else
    mistake
    left
  end
end

#User decides to run way from dragons
def self.left_two
  puts
  puts <<-MESSAGES
  Your only options are to turn around or to try and sprint around him. He is pretty big...
  MESSAGES

  sleep 1
  puts 
  puts <<-MESSAGES
  (turn or sprint)
  MESSAGES

  next_move = prompt

  if next_move == "turn"
    puts
    puts <<-MESSAGES
    Obviously you can't outrun a dragon, so you spin on your heel and dash towards the nearest bend. 
    The dragon lazily swipes at you with his tail and pins you to the ground. 
    The last thing you see is his enormous jaw opening wide to swallow you whole. 
    MESSAGES
    puts
    failure
  elsif next_move == "sprint"
    puts
    puts <<-MESSAGES
    You were a track star in high school, so you're pretty confident you can do this. 
    You take off in a burst of speed. 
    The dragon snorts in amusement and accidentally burns you to a crisp. 
    MESSAGES
    puts
    failure
  else
    mistake
    left_two
  end
end

#User decides to stay
def self.left_three
  puts
  puts <<-MESSAGES
  Though you're trembling, you opt to stay. 
  I mean, how could you outrun a dragon? 
  That's just silly. 
  But then you hear the dragon's belly rumble and reconsider. Do you stay put or give in to the urge to flee? 
  MESSAGES

  sleep 1
  puts 
  puts <<-MESSAGES
  (stay or flee)
  MESSAGES

  next_move = prompt

  if next_move == "stay"
    puts
  puts <<-MESSAGES
  The dragon slowly lowers his head to the ground and his eyes gradually drift shut. 
  After waiting a few minutes, you begin creeping towards where you think the exit might be. 
  At long last you arrive at the exit and you weep tears of joy as you collapse outside the maze.   
  MESSAGES
  puts
    successful
  elsif next_move == "flee"
    puts
  puts <<-MESSAGES
  You just got toasted by a hangry dragon. 
  What were you thinking?  
  MESSAGES
  puts
    failure
  else
    mistake
    left_three
  end
end



#When the user selects forward
def self.forward
  puts
  puts <<-MESSAGES
  You slowly move forward, stumbling periodically over the gnarled roots poking through the ground.
  As you continue along the twists and turns, the path gradually narrows and you struggle to pull yourself through the prickly branches. 
  Through the leaves you spot a clearing up ahead. 
  You continue forward, but your foot catches on a branch and you stumble, falling to your knees. 

  You rise up, and freeze. 
  In front of you is a wizened old woman, stirring a foul green goop in a large cauldron. 
  "You're lost," she says in a crackly voice. "Drink this potion, and it will transport you to the outside of the maze."
  You gulp as you watch what her scoop the thick goo into a cup and hold it out do you. 
  MESSAGES

  sleep 1
  puts
  puts <<-MESSAGES
  Do you want to accept a drink from what appears to be a witch?
  (yes or no)
  MESSAGES

  next_move = prompt

  if next_move == "yes"
  puts
  puts <<-MESSAGES
  You force yourself to drink down the bitter liquid. 
  The old woman gives you a strange smile, and you catch a glint of anticipation in her eyes before you are suddenly whisked away. 
  You find yourself bathed in the warmth of the sun and realize you are on the other side of the massive hedges. 
  You sigh in relief, but then your stomach lets out a curious grumble. 
  You begin screaming as your stomach begins to burn.  
  MESSAGES
    forward_two
  elsif next_move == "no"
    puts
  puts <<-MESSAGES
  You sprint away, not even noticing the scratches of the brambles as you force your way through the narrow hedges. 
  You run until your legs give out and you fall to your knees. 
  You look up, gasping for breath, and see two exits up ahead. 
  MESSAGES
    forward_three
  else
    mistake
    forward
  end  
end

#Result of accepting the drink
def self.forward_two
  puts <<-MESSAGES
  The witch suddenly appears before you and offers to save you in exchange for your soul. 
  MESSAGES

  sleep 1
  puts
  puts <<-MESSAGES
  Are you desperate enough to agree? Or will you accept your fate and die in agony?
  (accept or die)
  MESSAGES

  next_move = prompt

  if next_move == "accept"
    puts
  puts <<-MESSAGES
  The pain immediately disappears, but you find yourself surrounded by tall blades of grass. 
  You look up and see that the maze hedges appear even more enormous than they did before. 
  Panicked, you look down to see your body covered in bumpy, leathery skin and realize you've been turned into a toad. 
  The witch cackles as she bends down to scoop you up before she heads back into the maze.
  MESSAGES
    puts
    failure
  elsif next_move == "die"
  puts
  puts <<-MESSAGES
  The last thing you hear before collapsing in a heap on the ground is the old woman's cackle.
  MESSAGES
    failure
  else
    mistake
    forward_two
  end
end

#Option following user saying "no" to potion
def self.forward_three
  puts
  puts <<-MESSAGES
  Still shaky from your run in with the old woman, you pause to consider whether or not it's a trap. 
  Do you go to the closest door and get the hell out of here? 
  Or do you force yourself to go to the door a little bit further away? 
  MESSAGES

  sleep 1
  puts 
  puts <<-MESSAGES
  (closest or furthest)
  MESSAGES

  next_move = prompt

  if next_move == "closest"
    puts
  puts <<-MESSAGES
  You grasp the knob and turn it. 
  When you see the bright blue sky you let out a huge sigh of relief and step through. 
  The door slams behind you and you collapse on the grass in relief. 
  MESSAGES
    puts
    successful
  elsif next_move == "furthest"
    puts
  puts <<-MESSAGES
  You grasp the knob and turn it. 
  When you see the bright blue sky you let out a huge sigh of relief and step through. 
  You hurry through only to find yourself back in the maze. 
  The foul stench hits you, and you realize you're back where you started. 
  You sink to your knees as the old witch approaches you with a toothless grin. 
  Your world fades to black. 
  Because that's what you get for being suspicious. 
  MESSAGES
    puts
    failure
  else
    mistake
    forward_three
  end
end


start


end




