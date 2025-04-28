-- roles: populate
INSERT INTO "public"."roles" ("role_name") VALUES 
    ('admin'), ('counsel_ca'), ('counsel_hs'), ('editor'), 
    ('onboarder'), ('parent'), ('student_hs'), ('student_ca');

-- radical_user: add admin users
INSERT INTO "public"."radical_user" ("email", "role", "created_at") VALUES ('geeta@radicalcollegestrategies.com', 'admin', '2025-04-28 19:15:41.803937+00'); 
INSERT INTO "public"."radical_user" ("email", "role", "created_at") VALUES ('veena@radicalcollegestrategies.com', 'admin', '2025-04-28 19:15:57.724081+00');
