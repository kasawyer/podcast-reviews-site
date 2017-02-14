# Podcastaway

Podcastaway is a web application built on Rails that allows you to add, review, and vote on podcasts!

### Features

The following features exist within the application:

- The ability to add an item to be reviewed.
- The ability to rate (score on a scale) the item and to optionally comment on it (i.e. write a review).
- The ability to upvote or downvote a review. A user can only upvote or downvote once and can change their vote from up to down. This feature should utilize AJAX so that a complete page reload isn't necessary.
- A sign up and authentication system for your users (with devise).
- An ability to upload a profile photo (with CarrierWave).
- The ability to search for items.
- An admin role. Admins are able to delete reviews or items if they are deemed to be inappropriate.
- An email is sent to the owner of an item when a new review is posted about it.
- An index page for items that live-updates using React.js


## Deployment

This app can be viewed at https://wwww.podcastaway.herokuapp.com

## Built With

* [Rails](http://rubyonrails.org/) - the web application framework used
* [React.js](https://facebook.github.io/react/) - Used for building the user interface
* [Devise](https://rometools.github.io/rome/) - Used to for user authentication

## Authors

* **Marjie Lam** - (https://github.com/marjielam)
* **Katherine Sawyer** - (https://github.com/kasawyer)
* **Rahul Krishnan** - (https://github.com/Rahul-Krishnan)
* **Danny Gleason** - (https://github.com/dcgleason)

[ ![Codeship Status for kasawyer/podcast-reviews-site](https://app.codeship.com/projects/387d0b60-bf12-0134-451e-0ef15c5d34cb/status?branch=master)](https://app.codeship.com/projects/196496)
![Code Climate](https://codeclimate.com/github/kasawyer/podcast-reviews-site.png)
![Coverage Status](https://coveralls.io/repos/kasawyer/podcast-reviews-site/badge.png)
