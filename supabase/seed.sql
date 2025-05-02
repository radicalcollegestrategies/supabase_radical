-- radical_user: add admin users
INSERT INTO "public"."radical_user" 
       (email, roles, first_name, last_name, phone, email2)
VALUES (
    'geeta@radicalcollegestrategies.com',
    ARRAY['admin', 'counselor_hs']::roles_t[],
    'Geeta', 'Arora', 5103782464, 'geeta.aro@gmail.com'
    ); 

INSERT INTO "public"."radical_user" 
       (email, roles, first_name, last_name, phone, email2)
VALUES (
    'veena@radicalcollegestrategies.com',
    ARRAY['admin', 'counselor_ca']::roles_t[],
    'Veena', 'Mistry', 6502088836, 'veena_mistry2003@yahoo.com'
    );


