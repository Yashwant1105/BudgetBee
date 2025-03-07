# **BudgetBee - Expense Management App**

BudgetBee is an **enhanced and upgraded version of expense tracker** that helps users manage their daily expenses efficiently. It features **user authentication, expense categorization, and spending analytics**, providing users with insights into their financial habits.

---

## **✨ Features**

- **User Authentication:** Secure login and sign-up using Supabase authentication.
- **Expense Management:** Add, edit, and delete expenses categorized under different spending areas.
- **Spending Insights:** View expenses in a **chart-based** breakdown.
- **Undo Expense Deletion:** Recover recently deleted expenses via a snackbar action.

---

## **📁 File Structure**

The project is organized as follows:

- **[main.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/main.dart)** - Initializes the app and sets up Supabase authentication.
- **[auth_service.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/auth/auth_service.dart)** - Handles user authentication using Supabase.
- **[user_login.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/auth/user_login.dart)** - Implements the user login screen with credential validation.
- **[user_signup.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/auth/user_signup.dart)** - Provides the user registration screen with email confirmation.
- **[chart.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/widgets/chart.dart)** - Generates graphical insights for expenses.
- **[chart_bar.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/widgets/chart_bar.dart)** - Defines the individual bars in the expense chart.
- **[expense.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/models/expense.dart)** - Defines the data model for expenses.
- **[expenses_list.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/widgets/expenses_list.dart)** - Displays a categorized list of expenses.
- **[expense_item.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/widgets/expense_item.dart)** - Represents an individual expense item.
- **[new_expenses.dart](https://github.com/Yashwant1105/BudgetBee/blob/main/lib/widgets/new_expenses.dart)** - Provides the UI for adding new expenses.

---

## **🔹 Flutter Concepts Used**

- **State Management:** Uses `StatefulWidget` with `setState`.
- **Navigation & Routing:** Implements screen navigation using `Navigator.pushReplacement`.
- **Authentication:** Uses **Supabase** for login and sign-up.
- **UI Components:** Includes **custom widgets** for expense items and visual components.
- **Snackbar Actions:** Allows undoing deleted expenses via `SnackBarAction`.

---

## **🚀 Setup and Installation**

### **Prerequisites**

Ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)

### **Steps to Run**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Yashwant1105/BudgetBee.git
   cd BudgetBee
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

---

## **📖 Usage Guide**

1. Open the app and **log in or sign up**.
2. Add expenses by selecting a **category, amount, and description**.
3. View your expenses in a detailed **list or chart format**.
4. Swipe left on an expense to delete it (with an option to undo).

---



