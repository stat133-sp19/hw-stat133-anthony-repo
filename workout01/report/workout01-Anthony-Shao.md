Workout01
================

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
shots_data <- read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)


two_pt <- arrange(
  summarise(
  group_by(shots_data, name),
  total = sum(shot_type == "2PT Field Goal"),
  made = sum(shot_type == "2PT Field Goal" & shot_made_flag == "shot_yes"),
  perc_made =  sum(shot_type == "2PT Field Goal" & shot_made_flag == "shot_yes") / sum(shot_type == "2PT Field Goal")), desc(perc_made)
)

three_pt <- arrange(
  summarise(
  group_by(shots_data, name),
  total = sum(shot_type == "3PT Field Goal"),
  made = sum(shot_type == "3PT Field Goal" & shot_made_flag == "shot_yes"),
  perc_made =  sum(shot_type == "3PT Field Goal" & shot_made_flag == "shot_yes") / sum(shot_type == "3PT Field Goal")), desc(perc_made)
)

overall <- arrange(
  summarise(
  group_by(shots_data, name),
  total = length(shot_type),
  made = sum(shot_made_flag == "shot_yes"),
  perc_made =  sum(shot_made_flag == "shot_yes") / length(shot_type)),
  desc(perc_made)
)
```

Why Are Golden State Warriors the Champions?
============================================

![Kevin Durant](https://media.wkyc.com/assets/WKYC/images/158e0ab0-ad17-4168-a60b-b4aef165ef0c/158e0ab0-ad17-4168-a60b-b4aef165ef0c_750x422.jpg)

In season 2016 – 2017, Golden State Warriors defeated Cleveland Cavaliers in the NBA Grand Final with a dominant lead of 4 – 1, proving themselves to be a superior team among others. Michael Jordan once said, “Defense wins championships.” While most of the players and coaches would agree with Jordan, the Warriors might just be an anomaly that have broken that maxim. It’s not that the Warriors have no or less emphasis on defense; in fact, the Warriors are one of the best defense teams in the league, it’s just that their offense is exceptional. Thus, this report is aiming to unravel the secrets of the Warriors’ success – highly effective offense. Mainly, five of the Warriors’ players will be analyzed, Stephen Curry, Andre Iguodala, Draymond Green, Kevin Durant, and Klay Thompson.

![Andre Iguodala](https://media.gq.com/photos/558286081177d66d68d51734/master/w_1600,c_limit/blogs-the-feed-andre-iguodala-635.jpg)

Below is a table consisting of numbers of the overall effective shooting for each player. Looking at these data, one can already sense the Warriors' capacity to score points. Kevin Durant and Andre Iguodala both have well above 50% of effective shots, whereas Thompson and Curry have more than 45%, but they have comparatively more shot opportunities than others which means they are able to score more points. Despite being a defense-oriented player, Green is also able to have 42.4% of effetive shots.

``` r
print(overall)
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

The 2-point effective shost might be even more scary and unbelievable for the Warriors. Again, Iguodala and Durant are topping the list with more than 60% of effective shots. This is indeed incredible compared to the league average. The rest of them all have around 50%, which is still remarkable.

``` r
print(two_pt)
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

![Draymond Green](https://chumley.barstoolsports.com/wp-content/uploads/2019/03/13/07e1a-15509331321360-800.jpg)

If someone can describe one thing about the Warriors, it would be their ability to make 3-pointers. The Warriors' 3-point shots have changed the NBA game: the way people play basketball and the way people watch basketball. Twenty years or even ten years ago, it would be unheard of if someone tells that a basketball game can be won by just making 3-point shots. Although it might be over exaggerated, the Warriors' have indeed done it. Looking at the data below, it's almost unimaginable that these players are on the same team. Klay and Curry both have above 40% effective 3-point shots, followed by Durant and Iguadala who are both well above 35%. Even Green, as a center player, can have 30% effective 3-point shot. This is the reason why the Warriors are often so far aheard at the end of the 3rd quarter. They are just so good at making 3-pointers.

``` r
print(three_pt)
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

![Klay Thompson](https://cdn.vox-cdn.com/thumbor/HJEw3Img4ro5dG4yjE1QSeL7IrI=/0x0:4514x3152/1200x800/filters:focal(1243x401:1965x1123)/cdn.vox-cdn.com/uploads/chorus_image/image/63218933/usa_today_12286608.0.jpg)

![Stephen Curry](https://i.kinja-img.com/gawker-media/image/upload/s--S8H4zPqx--/c_scale,f_auto,fl_progressive,q_80,w_800/wfjk2nrdqurtnow287kd.jpg)

Overall, the ability to score points won the championships for the Warriors. Especially, making 3-point or mid-range shots have increased the pace of the game. That is, there are more possesions than before. As a consequence, the number of total shots have increased, which is advantageous to the Warriors because they have such a high percentage of effective shots. Even if they lose some points due to bad defense, they are always able to catch up and take the lead by constantly making shots. This is why they are the champions.
