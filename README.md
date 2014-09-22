Description
=========
[![Code Climate](https://codeclimate.com/repos/541ae2ea695680750101377d/badges/59b3cb3bfa5b4fa6f5cb/gpa.svg)](https://codeclimate.com/repos/541ae2ea695680750101377d/feed)
---------
A cinema has a theatre of 100 rows, each with 50 seats. Customers request particular seats when making a booking.
Bookings are processed on a first-come, first-served basis. A booking  is accepted as long as it is for five or fewer seats, all seats are adjacent and on the same row, all requested seats are available, and accepting the booking would not leave a single-seat gap (since the cinema believes nobody would book such a seat, and so loses the cinema money).

Explanation
=========

The way I approached this problem was by starting with the smallest element of a cinema, the Seat. 

* The seat object knows which row and where in that row it is on, knows if it is booked or available. It also throws an error if the user tries to initialize it by giving a number that doesn't exist in the hall.

* The row object is initialized by having the 50 seat objects and its number.

* The cinema hall class contains 100 row objects(which inturn contain 50 seats). In this case since the cinema hall has information about all the seats(booked and available), I thought it would be appropriate to put the booking method here.

* The booking gets the input from the files provided and instantiate a booking request it also automatically assigns an Id number to each booking request.

* The check booking module is designed as a stand alone feature which accepts a booking request and the cinema hall. After taking these parameters it checks against all the rules and gives the booking method in the cinema hall true or false to accept or decline that booking respectively.

Technologies Used
=========

* Ruby
* Rspec for testing

How to use
=========
* git clone git@github.com:fitstek/cinema_booking.git
* cd cinema_booking
* irb
* require './app.rb'
* supply the file path to be processed when prompted