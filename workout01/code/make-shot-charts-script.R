# Shot Charts

## Description: This file uses gsw-shots-data.csv to produce charts.

## Inputs: The required inputs are the positions, in terms of coordinates, of where players' have made shots.

## Outputs: This script produces a chart containing positions of where the players' have made shots.

library(jpeg)
library(grid)
library(ggplot2)
court_file <- "images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

shots_data <-  read.csv(file = "data/shots-data.csv", stringsAsFactors = FALSE, sep = ",")


curry_shot_chart <- ggplot(data = shots_data[shots_data$name == "Stephen Curry",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()

iguodala_shot_chart <- ggplot(data = shots_data[shots_data$name == "Andre Iguodala",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()

green_shot_chart <- ggplot(data = shots_data[shots_data$name == "Draymond Green",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()

durant_shot_chart <- ggplot(data = shots_data[shots_data$name == "Kevin Durant",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant  (2016 season)') + 
  theme_minimal()

klay_shot_chart <- ggplot(data = shots_data[shots_data$name == "Klay Thompson",]) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()

pdf(file = "images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

pdf(file = "images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = "images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf(file = "images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = "images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
klay_shot_chart
dev.off

shots_chart <- ggplot(shots_data) +
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Chart: GSW (2016 season)') + 
  facet_wrap(~ name) +
  theme_minimal()
  
pdf(file = "images/gsw-shots-charts.pdf", width = 8, height = 7)
shots_chart
dev.off()

png(file = "images/gsw-shots-charts.png", width = 8, height = 7, units = 'in', res = 300)
shots_chart
dev.off()
