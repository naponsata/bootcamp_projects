bot <- c("Rock","Scissors","Paper")
count <- 0
win <- 0
loss <- 0
tie <- 0

print("Hello Welcome to Pao Ying Chub Game")
print("What's your name ?")
username <- readLines("stdin",n=1)
while (count < 9999){
print(paste("Are you ready",username,"!"))
print("Rock , Scissors , Paper")
user_ans <- as.character(readLines("stdin",n=1))
bot_ans <- sample(bot,1)
print("1")
print("2")
print("3")
print(paste("Your :",user_ans))
print(paste("Bot :",bot_ans))
if(user_ans == "Rock"|user_ans == "rock" & bot_ans == "Rock"){
      tie <- tie+1
      print("You Tie!")
}else if(user_ans == "Rock"|user_ans == "rock" & bot_ans == "Scissors"){
      win <- win+1
      print("You Win!")
}else if(user_ans == "Rock" | user_ans == "rock" & bot_ans == "Paper"){
      loss <- loss+1
      print("You Loss!")
}
if(user_ans == "Scissors"|user_ans == "scissors" & bot_ans == "Rock"){
  loss <- loss+1
  print("You Loss!")
}else if(user_ans == "Scissors"|user_ans == "scissors" & bot_ans == "Scissors"){
  tie <- tie+1
  print("You Tie!")
}else if(user_ans == "Scissors"|user_ans == "scissors" & bot_ans == "Paper"){
  win <- win+1
  print("You Win!")
}
if(user_ans == "Paper"|user_ans == "paper" & bot_ans == "Rock"){
  win <- win+1
  print("You Win!")
}else if(user_ans == "Paper"|user_ans == "paper" & bot_ans == "Scissors"){
  loss <- loss+1
  print("You Loss!")
}else if(user_ans == "Paper"|user_ans == "paper" & bot_ans == "Paper"){
  tie <- tie+1
  print("You Tie!")
}
count <- count+1
print("Do you want to play again?")
print("1.Yes! , 2.No")
again <- readLines("stdin",n=1)
if (again == 2|again == "No"|again == "no"){
  break}}
print("Result")
print(paste("Time :",count))
print(paste("Win  :",win))
print(paste("tie :",tie))
print(paste("Loss :",loss))

