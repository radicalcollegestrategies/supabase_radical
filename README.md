# supabase_radical

This project is designed to manage user profiles in a Supabase application. It includes SQL commands to create a `radical_users` table, set up Row Level Security (RLS), and define a trigger for handling new users in the Supabase Auth system.

## Project Structure

```
supabase_radical
├── test
│   └── create.sql        # SQL commands for creating tables and triggers
├── .gitignore             # Specifies files to ignore in Git
├── .env.example           # Template for environment variables
└── README.md              # Project documentation
```

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/supabase_radical.git
   cd supabase_radical
   ```

2. **Install Dependencies**
   Ensure you have the necessary dependencies installed for your environment.

3. **Configure Environment Variables**
   Copy the `.env.example` file to `.env` and fill in the required values.

4. **Run SQL Commands**
   Execute the SQL commands in `test/create.sql` to set up the database schema.

## Usage

- The `radical_users` table is used to store user profiles.
- Row Level Security (RLS) is enabled to ensure that users can only access their own data.
- A trigger is set up to automatically create a profile entry when a new user signs up via Supabase Auth.

## Contributing

Feel free to submit issues or pull requests for improvements or bug fixes.

## License

This project is licensed under the MIT License.