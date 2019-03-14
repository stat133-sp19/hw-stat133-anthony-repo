# Make Shots Data

## Description: This script contains shot data of 5 NBA players.

## Inputs: The required inputs are the time in the game when shots are made, shot type, action type, and shot distance.

## Outputs: This file outpus a statistical summary of the player's shot data.

curry <- read.csv(file = "data/stephen-curry.csv", stringsAsFactors = FALSE, sep = ",")
iguodala <- read.csv(file = "data/andre-iguodala.csv", stringsAsFactors = FALSE, sep = ",")
green <- read.csv(file = "data/draymond-green.csv", stringsAsFactors = FALSE, sep = ",")
durant <- read.csv(file = "data/kevin-durant.csv", stringsAsFactors = FALSE, sep = ",")
thompson <- read.csv(file = "data/klay-thompson.csv", stringsAsFactors = FALSE, sep = ",")

curry$name <- "Stephen Curry"
iguodala$name <- "Andre Iguodala"
green$name <- "Draymond Green"
durant$name <- "Kevin Durant"
thompson$name <- "Klay Thompson"


curry$shot_made_flag[curry$shot_made_flag == 'y'] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == 'y'] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == 'n'] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- "shot_no"


curry$minute <- curry$period * 12 - curry$minutes_remaining
iguodala$minute <- iguodala$period * 12 - iguodala$minutes_remaining
green$minute <- green$period * 12 - green$minutes_remaining
durant$minute <- durant$period * 12 - durant$minutes_remaining
thompson$minute <- thompson$period * 12 - thompson$minutes_remaining


sink(file = 'output/stephen-curry-summary.txt')
summary(curry)
sink()

sink(file = 'output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = 'output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = 'output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = 'output/klay-thompson-summary.txt')
summary(thompson)
sink()

five_players <- rbind(curry, iguodala, green, durant, thompson)

write.csv(
  x = five_players,
  file = 'data/shots-data.csv'
)

sink(file = 'output/shots-data-summary.txt')
summary(five_players)
sink()

