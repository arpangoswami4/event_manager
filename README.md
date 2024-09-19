A web application where users can create events as admins and search events, RSVP to them and add comments.

This app uses ruby 3.0.0 and rails 7.0.2.4.
The whole application is built using rails and mysql is used as database and for styling tailwind css is used.You can setup the database by addding username and password in enviroment variables by seeing env.template.

For making any a User as admin, we can do it from the rails console. For example if the user records is has 5 as id.

Then,
User.find(5).update(role: 0)

Would make the user admin. As the enum is used for role and 0 denotes admin.