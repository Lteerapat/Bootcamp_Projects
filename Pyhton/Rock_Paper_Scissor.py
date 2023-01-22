from random import sample #input random for computer hand

hand_list = ["scissor", "rock", "paper"] #list of computer hand
#start score
win = 0
loss = 0
tie = 0

while True:
    user_hand = input("Choose rock, paper, scissor or type quit to end the game: ") #user choose rock paper scissor or wanna quit
    user_hand = user_hand.lower() #change to lowercase string
    random_computer_hand = sample(hand_list, 1) #computer choose its hand
    computer_hand = (''.join(random_computer_hand)) #remove brackets and quotes
    if user_hand == "quit": #if user type quit then break out the loop
        print("You have ended the game, thank you for playing with me!")
        print("\nYour overall score: Win =", win, ",Loss =", loss, ",Tie =", tie)
        break
    if user_hand != "scissor" and user_hand != "rock" and  user_hand != "paper": #if user type incorrect keyword
        print("Wrong spelling, please try again.")
    elif user_hand == computer_hand:
        print("I chose",computer_hand,",Tie!")
        tie = tie + 1 #count tie game
    elif user_hand == "rock" and computer_hand == "scissor":
        print("I chose",computer_hand,",you win!")
        win = win + 1 #count win game
    elif user_hand == "paper" and computer_hand == "rock":
        print("I chose",computer_hand,",you win!")
        win = win + 1
    elif user_hand == "scissor" and computer_hand == "paper":
        print("I chose",computer_hand,",you win!")
        win = win + 1
    else:
        print("I chose",computer_hand,",you lose!") #else is losing game
        loss = loss + 1 #count loss game
