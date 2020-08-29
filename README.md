# README

This is an image repository built in Ruby on Rails for Shopify's Backend Developer Intern Challenge Question.

The job app is https://www.shopify.com/careers/developer-internships-data-science-internships-winter-2021-826aeb

The challenge info is: https://docs.google.com/document/d/1ZKRywXQLZWOqVOHC4JkF3LqdpO3Llpfk_CkZPR8bjak/edit

Please hire me.

Notes for myself that I will delete later:

User: Devise generated for log in, log out
  - has many: images

Photo:
  - belongs to user
  - has many images attached
  - boolean for public/private
  - description
  - array of tags/key words for searching similar images
  - CUD can only be accessed by the user who the photo belongs to
  - R can be accessed by the user it belongs to, and other users if bool public == true

Image:
  - active storage item
  - just kind of attached to Photo
  - connect to Cloudinary in the future so I don't have to store this on my local machine because that's dumb for prod

For bulk upload:
  - Ruby on Rails is not really good at this
  - Try something like a queue? https://github.com/resque/resque
  - Have separate controller functions for single and multiple image uploads and just kind of do a images.each do Photo.create(image: image)
  - Since photos and images are 1 to 1, can't really do a thing where you attach multiple images to one photo object, since they will have to be able to be deleted separately

Bulk Delete:
  - Destroy all function
  - Have a 'Delete?' boolean for photo
  - When destroy all is called, go through each photo that belongs to current_user and delete if delete == true

Search:
  - by text: find images by description
  - by characteristics: I am not smart enough to do image recognition so its gonna be the tags
  - search for similar images: how??? maybe just use https://github.com/asmuth/recommendify whichs gets visitor similarity

Buy/Sell:
  - User has money numerical value attached
  - Photo has price value
  - Click buy: current_user.money = current_user.money - photo.price
  - Photo has discount value
  - If discount: current_user.money = current_user.money - (photo.price - (photo.price * discount))
  - Inventory management???? How does this work in real life? Will have to research this a bit more