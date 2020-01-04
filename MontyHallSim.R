#Monte Carlo simulation of stick strategy
B <- 10000
stick <- replicate(B, {
  doors <- as.character(1:3)
  prize <- sample(c("car", "goat", "goat"))
  prize_door <- doors[prize == "car"]
  my_pick <- sample(doors, 1) #choose a door
  show <- sample(doors[!doors %in% c(my_pick, prize_door)], 1) #open unchosen door without prize
  stick <- my_pick #stay with original choice
  stick == prize_door
})

mean(stick)

#Monte Carlo simulation of change strategy
switch <- replicate(B, {
  doors <- as.character(1:3)
  prize <- sample(c("car", "goat", "goat"))
  prize_door <- doors[prize == "car"]
  my_pick <- sample(doors, 1) #choose a door
  show <- sample(doors[!doors %in% c(my_pick, prize_door)], 1) #open unchosen door without prize
  switch <- doors[!doors %in% c(my_pick, show)] #switch doors
  switch == prize_door
})

mean(switch)