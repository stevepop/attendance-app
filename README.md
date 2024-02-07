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


![login_screen](https://github.com/stevepop/attendance-app/assets/526063/46511084-b75c-4407-93e5-4d8bbeadf1d5)
![registration_screen](https://github.com/stevepop/attendance-app/assets/526063/aedb95a0-e501-420b-93d3-2c0438201594)
![ check_in_screen_1](https://github.com/stevepop/attendance-app/assets/526063/619c8a81-f0bb-497f-949d-832ca88b569b)
![checkin_location](https://github.com/stevepop/attendance-app/assets/526063/eb190ddb-d500-413e-8599-1f86c7aa636e)
![checkin_completed](https://github.com/stevepop/attendance-app/assets/526063/c8e88f34-b729-4fb9-8fcf-ad7cb7f61403)
