-- Tables not yet defined
-----------------------------------------------------
-- Admin

-- Archive --> Past users moved to this one
-- create table radical_user_archive --> Same schema as radical_user.
-- MAYBE have a student_archive instead of radical_user_archive ???

-- Courses: MS, DEM, XF, CA, essay_edit
-- create table courses(course_name, description, notes)

-- create table assign_counselor(student_email, counselor_email, role (can be HS counselor, CA counselor, editor))

-- create table subscription(student_email, course_name, cost, start_date, expiration_date, quit_date, notes (catchall))

-- Payments
-- create table payments(student_email, date_paid, amt_paid, method, collected_by, notes (catchall))
-- create table payments_due(student_email, due_date, amt_due, action_after_paid)
-----------------------------------------------------
-- MAYBE NOT
-- Employees / Contractors: email, PDF of contract, text (terms of contract)

-----------------------------------------------------
-- CA
-- create table ca_subscription(student_email, e2e_apps, e2e_used, overview_apps, overview_used, purchased_e2e_apps)
-- ?? purchased_e2e_apps --> Keep or just increase the # of e2e_apps ??

