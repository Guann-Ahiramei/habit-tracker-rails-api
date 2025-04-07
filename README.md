# Habit Tracker
Rails MVC project.
Habit tracker allows users to log in, add habits to specific categories, view a statistics dashboard, set email reminders, and check in/out of habits.
## Key Features

1. **Model Relationships**:
   - *One-to-One*: Implemented in the `Follow` model.
   - *One-to-Many*: Exists between `User` ↔ `Habit`, `Habit` ↔ `TimeBlock`, and `Habit` ↔ `Reminder`.
   - *Many-to-Many*: Used for `Habit` ↔ `Category`.
   - *Rich Associations* (One-to-Many/Many-to-Many with metadata): Applied to `User` ↔ `Follow` and `Habit` ↔ `Category` (via join tables).

2. **Tokens Management**:
   - User login state is controlled via Devise.

3. **Code Efficiency**:
   - Follows DRY principles with partials (e.g., reusable TimeBlocks form for habit logging).

4. **Styling Approach**:
   - Uses Tailwind CSS with stylesheet-based styling (avoids inline CSS).

5. **Test Credentials**:
   > **Username**: user2@example.com  
   > **Password**: password

6. **Test Data**:
   - Seed files generate mock data for testing.

---

## Application Flow

### 1. User Authentication
- Login/registration handled by `SessionsController`.
- Successful login redirects to the `DashboardController` homepage.

### 2. Habit Management
- Users create/view/edit/delete habits via `HabitsController`.
- Each habit can link to one or more categories (through `CategoriesHabit` model).

### 3. Category Management
- Users organize habits using `CategoriesController`.

### 4. Reminders
- Email reminders (via `RemindersController`) help track habit progress.

### 5. Time Blocking
- `TimeBlocksController` manages habit schedules (start/end times) and logs reasons for missed habits.

### 6. Social Features
- Users follow others (`FollowsController`) to view their habits/progress.

### 7. View Rendering
- Global methods/filters are provided by `ApplicationController`.
- Helper methods (in `helpers/`) simplify view logic.