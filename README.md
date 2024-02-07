# An Employee Attendance App created with Flutter.

## Configuration
You will need to add your Supabase credentials in your `.env` file
SUPABASE_URL=
SUPABASE_KEY=

Add the `.env` file to pubspec.yml under assets
```
  assets:
    - .env
```

# Functionality
On first load, the login screen will display with an option to register. After registration, the user will be logged in and be redirected to the Check-in screen.

To Check-in, the user will slide the button. A checkmark icon will display for a few seconds and afterwards, the Check in time will display. The Same will happen for Check out.

if a user has already checked in and checked out for the day, and attempts to check in again, a message will display that the user has already checked in for the day.


