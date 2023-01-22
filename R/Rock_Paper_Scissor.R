#create vector for computer hand
list_computer_hand <- c("rock","paper","scissor")
#create number of win lose and tie
win <- 0
lose <- 0
tie <- 0 
while (TRUE) {
    cat("\nChoose rock, paper, scissor or type quit to end the game: ")
    user_hand <- tolower(readLines("stdin", n=1))
    #random rock paper or scissor
    computer_hand <- sample(list_computer_hand, 1)
    #if user type quit then break out the loop
    if (user_hand == "quit") {
      cat("You have ended the game, thank you for playing with me!")
      cat("\nYour overall score: Win =", win, ",Loss =", lose, ",Tie =", tie)
      break
    }
    if (user_hand != "scissor" & user_hand != "rock" & user_hand != "paper") {
      cat("Wrong spelling, please try again.") #if user type incorrect keyword
    } else if (user_hand == computer_hand) {
      cat("I chose,",computer_hand,"Tie!")
      tie <- tie + 1 #count tie game
    } else if (user_hand == "rock" & computer_hand == "scissor") {
      cat("I chose,",computer_hand,"you win!")
      win <- win + 1 #count win game
    } else if (user_hand == "paper" & computer_hand == "rock") {
      cat("I chose,",computer_hand,"you win!")
      win <- win + 1
    } else if (user_hand == "scissor" & computer_hand == "paper") {
      cat("I chose,",computer_hand,"you win!")
      win <- win + 1
    } else {
      cat("I chose,",computer_hand,"you lose!") #else is losing game
      lose <- lose + 1 #count loss game
    }
}
























