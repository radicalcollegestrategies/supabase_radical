# Architecture Design

Roles:
- Backend
   - [admin](admin.md) (includes bootstrapping)
   - [onboarder] (onboarder.md)

- Customer
   - student_hs
   - student_ca
   - parent

- Counselors
   - counsel_ca
   - counsel_hs
   - editor

## 

```mermaid
This is for fun now
```
## Tables
- Existing tables: [seed.sql](../supabase/seed.sql)
- Planned  tables: [tables.sql](tables.sql)

## Notes
- Authentication vs AuthoRization:
   - Authentication --> You are <name>
   - AuthoRization --> Role. What all are you authorized to do
- 