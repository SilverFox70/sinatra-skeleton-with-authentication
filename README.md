# User Registration and Authentication

## Summary
This is my version of a sinatra skeleton with user authentication and registration.  It only has the most bare bones functionality right now, but is adaptable and extensible for various projects.

## TO DO list:

### Add routing and handlers to bring users to their unique profile page

### Add options to allow users to edit their profile, which at this point would consist of updating their email address or password

### Add dual authentication check in user.rb file to verify both email and correct password

### Add admin special authentication and logic

### Add admin only pages for viewing and managing user accounts

### Style the basic forms more consistently for rapid use in building apps

### Implement partials where possible (such as with displaying error messages)

### Change the routing when a user successfully logs in or provide a partial to let the user know that authentication succeeded.



[sessions]: http://www.sinatrarb.com/faq.html#sessions
[HTTP cookies]: http://en.wikipedia.org/wiki/HTTP_cookie
[using sessions]: http://www.sinatrarb.com/intro#Using%20Sessions
[before filter]: http://www.sinatrarb.com/intro#Filters
