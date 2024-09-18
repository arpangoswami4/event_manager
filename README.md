This app uses ruby 3.0.0 and rails 7.0.2.4.
The whole application is built using rails even for the front end and for styling tailwind css is used and mysql is used as database.You can setup the database by addding username and password in enviroment variable by seeing env.template.
For making any a User as admin, we can do it from the rails console. For example if the user records is has 5 as id.

Then,
User.find(5).update_column(:role, 0)

Would make the user admin. As the enum is used for role and 0 denotes admin.