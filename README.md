# Hockey Tracker App

[![forthebadge](http://forthebadge.com/images/badges/made-with-swift.svg)](http://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-coffee.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/uses-git.svg)](https://forthebadge.com)

# Quick Note

I've written several blog posts about this project, breaking down the code and my thought process around it. Check out my medium at [medium link](https://medium.com/@jackwaslen16)

<img src="https://github.com/jackwaslen/HockeyTracker/assets/78742473/d3852935-c243-49eb-9694-35d7ae241219" width=30% height=30%>
<img src="https://github.com/jackwaslen/HockeyTracker/assets/78742473/0b957efa-97ff-47c6-9d5c-d5db1408f3bc" width=30% height=30%>
<img src="https://github.com/jackwaslen/HockeyTracker/assets/78742473/7a489dbf-cb4c-4f88-b585-97518296c30b" width=30% height=30%>



# Description

Fed up with other Hockey Apps, I decided to build one myself. I wanted to it to be clean and simple, while also feeling like it fits in the broader Apple Eco-System. I was lucky enough to come across a free to use hockey database at [rapid-api](https://rapidapi.com/palsoft/api/hockey-live-sk-data/details), which contains accurate and update-to-date stats. Big thanks to Pavol Svanter for allowing me to us his data!

In the App, I have three main views:
  - Game View, where each individual game for a favourite team is displayed in a list. I also add images and dynamic messages to increase how interesting each object in the list is.
  - Statistics View, where stastitics for a favourite team is displayed and at a glance the user can see stat leaders on their team.
  - Standings View, where the standings of each division, or conference can be displayed. Note that in division view, I have different icons for divison leaders, playoffs teams via the top 3 in the division and wildcard teams. No icon = No playoffs. This way a user can see at a glance, who is in and who is out.

# Backend

In the app, I build an HTTP Manager. Which is explained in depth here: [HTTP Manager](https://medium.com/stackademic/heres-how-to-connect-to-restful-api-s-in-swift-http-manager-5f34b156ebc6). I use codable to easily transfer data between the api and my internal app.

I explain my thoughts regarding data flow in this app here: [MVVM](https://medium.com/@jackwaslen16/mvvm-architecture-in-a-production-level-ios-app-229b8b1c1cc8) but TLDR: ViewModel requests data -> HTTP Downloads Data -> Converts into Local Models via Codable -> ViewModel passes data into views. 
