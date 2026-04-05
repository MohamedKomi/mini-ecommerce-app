# Mini E-Commerce App (Flutter)

A simple **Flutter e-commerce app** with:

- Authentication (Register & Login)
- Product listing with images
- Cart management
- Order submission
- Local storage for token
- Uses **Cubit state management** and **Dio** for API requests

---

## 🛠 Features

### Authentication
- Register & Login screens
- Token stored locally (SharedPreferences)

### Products
- Fetch products from API using Dio
- Show product image, name, price, and stock status
- Styled product cards with **GridView**

### Cart
- Add/Remove products
- Show total price
- Checkout button

### Orders
- Submit order with **address** & **phone**
- Confirmation message
- Cart cleared after submission

---

## 📂 Project Structure

ib/
├── features/
│ ├── auth/
│ │ ├── auth_cubit.dart
│ │ ├── auth_state.dart
│ │ ├── register_cubit.dart
│ │ ├── register_state.dart
│ │ ├── login_screen.dart
│ │ └── register_screen.dart
│ ├── products/
│ │ ├── product_cubit.dart
│ │ ├── product_state.dart
│ │ ├── product_model.dart
│ │ └── product_screen.dart
│ ├── cart/
│ │ ├── cart_cubit.dart
│ │ ├── cart_state.dart
│ │ └── cart_screen.dart
│ └── order/
│ └── order_screen.dart
└── main.dart
