#Chatbot Homework
#Welcome
print("Welcome to eatData Pizza App")
print("May I ask your name please ?")
user_name <- readLines("stdin",n=1)
print(paste("Hi",user_name))
#Question1
print("What can I do for you today ?")
print("1.Order pizza, 2.Ask about promotion *Please answer with number")
action1 <- as.numeric(readLines("stdin",n=1))
if (action1==2){
  print("Sorry, today doesn't have a promotion.")
}else {
    print("Thankyou!")
  #Start order
    print("What would you like to order today?*Please answer with number")
    print("1.Hawaiian, 2.Seafood deluxe 3.Cheeze")
    order_menu <- as.numeric(readLines("stdin",n=1))
    if(order_menu == 1){
      order_sum <- as.numeric(200)
    }
    else if(order_menu == 2){
      order_sum <- as.numeric(250)
    }
    else if(order_menu == 3){
      order_sum <- as.numeric(150)
    }
    print("I got it!")
    print("What size do you need? ")
    print("1.Small, 2.Medium, 3.Large *Please answer with number")
    order_size <- as.numeric(readLines("stdin",n=1))
    if(order_size == 2){
      order_sum <- order_sum+50
    }else if(order_size == 3){
      order_sum <- order_sum+100}
    print("How many pizza do you want? *Please answer with number")
    order_qt <- as.numeric(readLines("stdin",n=1))
    order_sum <- order_sum*order_qt
    print("Would you like some drinks")
    print("1.Soft drink, 2.Beer, 3. water *Please answer with number")
    order_drink <- as.numeric(readLines("stdin",n=1))
    if(order_drink == 1){
      order_sum <- order_sum+20
    }else if(order_drink == 2){
      order_sum <- order_sum+90
    }
#Sum order
    print(paste("Thank you! your total order is" ,order_sum,"BAHT"))
    print("Thank you for your order. Please Enjoy!")
}
