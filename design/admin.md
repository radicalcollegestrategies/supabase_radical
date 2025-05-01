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
1. Delete user --> Moves to archive (TODO: Should this be onboarder?)

---

# Onboarding Screens
## OVERALL: TODO: NEED MORE CLARITY FOR THIS PAGE

## Screen: Student Add
- @@@TABLE: student(student_email, parent1_email, parent2_email)

## Screen: Student List + Edit
- List all students. Sort / filter by attributes
- Edit any details

## Screen: Expected Payments
- Read only: Date, Student, $$
    - Sort by date, search by student etc
- Button to send email reminder

## Record a Payment (same or diff screen than above)
- @@@TABLE: payments, payments_due
- Date, $$, Student
    - Should be able to check off an expected payment
    - Or split / edit if partial payment

## Screen: Student Onboarding
- @@@TABLE: subscription
- Assign student to course
- Generate PDF and send out docusign
- When complete
    - Counselor communication
    - Skool enroll
    - Automate skool acceptance

## Screen: Student Deboarding / Refund
- Some may auto-expire
- End all payments due
- Negative payment for refund issued
- Mark subscription as expired
- Skool remove
- Send email "this contract has ended"
- Check "deboarding protocol"