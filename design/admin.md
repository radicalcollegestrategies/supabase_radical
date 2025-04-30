# Bootstrapping

1. Create table roles(role), populated with all roles
1. Create table radical_user(email PK, Fname, Lname, Ph#, List of roles), and enter all admins into it
    - TODO UPDATE ABOVE

# Authentication Screen
- "Signin with google": Google is the IDP / IDentity Provider 
- Authorization: 
    - If user is in "radical_user" table, then allow else not
    - A user sees a **picker** for each of their roles

# Admin Screens
## Screen: User Management
- Backend / Counselors, ie NOT students/parents
1. List all users and roles
1. Create a user: insert into radical_user
1. Edit any field
1. Add roles to user
1. Delete roles from users
1. Delete user --> Moves to archive

## Screen: Payments
- Different criteria, eg YTD, booked this yr, total booked etc