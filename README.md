# Koinz

#  Tips

- In the Networking layer i have used "Moya" wich conains unit tests for APIs.

- For reacting programming i have used 'Rxsift' and 'Rxcocoa'.

- For data persistence i have used Core data.

- For design arch i have used MVVM.

-  To load the images asyncrounasly i have used 'Kingfisher'.

- I have used 'Cocoapods' as my dependency manager.

- i did't see any attached ad photos in the task so i get a photo URL from the internet and used it.

# APP Structure

## Parants
- (AppDelegate-SceneDelegate)

## Services
- Contain the APIs file to set up the connections request, and network manager file to set up the network data center
- Contain Persistence Handler.

## Models
- Contain all the model's files to decode the json responses.

## Features
- the all App's features i will descripe them in the 'Description' section.

## Resources
- Contain info.plist, assets and the Lunchpad

## Application Core
- Contain all the helper classes i used in the project.


# Description


## Photos

- I have used the first userId to call the 'users' API and get the photos for this user using the API and present the results in table view.
- I have used 'Rxswift' and 'Rxcocoa' to bind the photos data source to view controller from view model.
- I have added an Ad screen every 5 cells.
- I have used PhotoCellViewModel to create the image url.

## Image Preview

- I have implemented the 'Zoom' feature using scroll view and adding min and max zoom scale to the scrollView.
