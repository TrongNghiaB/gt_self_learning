# Flutter Frontend Setup Guide

## 🚀 Flutter App đã được cập nhật để connect với Backend API!

### ✅ Những gì đã được thêm:

#### 1. **API Service** (`lib/core/network/api_service.dart`)

- HTTP client với Dio
- Firebase authentication integration
- Health check endpoint
- Math explanation endpoint

#### 2. **Data Models** (`lib/core/models/math_explanation.dart`)

- `ExplainRequest` - Request model
- `ExplainResponse` - Response model
- `Element` - All 11 element types
- Freezed + JSON serialization

#### 3. **Math Explanation Feature**

- **Page**: `lib/features/math_explanation/presentation/pages/math_explanation_page.dart`
- **Widget**: `lib/features/math_explanation/presentation/widgets/math_element_widget.dart`
- Search input với real-time API calls
- Beautiful UI cho tất cả element types

#### 4. **Authentication**

- **Page**: `lib/features/auth/presentation/pages/auth_page.dart`
- Google Sign-In integration
- Anonymous authentication
- Auto-navigation sau khi login

#### 5. **Routing**

- Updated `app_router.dart` với new routes
- Auto-generated route files
- Navigation flow: Auth → Math Explanation

## 🔧 Setup Instructions

### 1. **Configure Firebase**

Bạn cần cập nhật `lib/core/presentations/firebase_options.dart` với Firebase config thực tế:

```dart
// Thay thế các placeholder values:
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'your-actual-api-key',
  appId: 'your-actual-app-id',
  messagingSenderId: 'your-actual-sender-id',
  projectId: 'your-actual-project-id',
  authDomain: 'your-project-id.firebaseapp.com',
  storageBucket: 'your-project-id.appspot.com',
);
```

**Cách lấy Firebase config:**

1. Vào [Firebase Console](https://console.firebase.google.com)
2. Chọn project → Project Settings
3. Scroll xuống "Your apps" → Add app (Web/iOS/Android)
4. Copy config values

### 2. **Update API Base URL**

Trong `lib/core/network/api_service.dart`:

```dart
class ApiService {
  static const String baseUrl = 'http://localhost:8000'; // Backend URL
  // Hoặc production URL: 'https://your-backend-domain.com'
}
```

### 3. **Run the App**

```bash
cd /Users/te-member/gt_self_learning/frontend_chatbot

# Install dependencies
flutter packages get

# Generate code (nếu cần)
flutter packages pub run build_runner build

# Run app
flutter run
```

## 📱 App Flow

### 1. **Authentication Screen**

- Beautiful gradient background
- Google Sign-In button
- Anonymous login option
- Auto-navigation sau khi login

### 2. **Math Explanation Screen**

- Search input với suggestions
- Real-time API calls
- Loading states
- Error handling
- Beautiful element rendering

## 🎨 UI Features

### **Element Types Supported:**

1. **text_block** - Text với title/caption
2. **formula** - Mathematical formulas (LaTeX + text)
3. **example_steps** - Step-by-step solutions
4. **bar_chart** - Bar charts (base64 images)
5. **line_chart** - Line charts (base64 images)
6. **long_division** - Long division steps
7. **life_cycle** - Lifecycle diagrams
8. **node_graph** - Graph relationships
9. **hex_steps** - Hexagonal step layout
10. **horizontal_blocks** - Horizontal blocks
11. **pyramid** - Pyramid structures

### **UI Components:**

- Material Design 3
- Responsive layout
- Loading states
- Error handling
- Beautiful cards và containers
- Gradient backgrounds
- Custom icons

## 🔗 API Integration

### **Endpoints Used:**

- `GET /health` - Health check
- `POST /api/explain` - Math explanation (requires Firebase token)

### **Authentication Flow:**

1. User signs in với Firebase
2. App gets Firebase ID token
3. Token được gửi trong Authorization header
4. Backend verifies token
5. API response được render

## 🧪 Testing

### **Test API Connection:**

```bash
# 1. Start backend server
cd /Users/te-member/gt_self_learning/backend_chatbot
./run_local.sh

# 2. Start Flutter app
cd /Users/te-member/gt_self_learning/frontend_chatbot
flutter run

# 3. Test trong app:
# - Sign in với Google hoặc Anonymous
# - Ask: "Explain quadratic equations"
# - Xem response với elements
```

### **Debug Tips:**

- Check console logs cho API calls
- Verify Firebase authentication
- Check network connectivity
- Validate API responses

## 📋 Next Steps

1. **Configure Firebase** với real project
2. **Test authentication** flow
3. **Test API calls** với backend
4. **Customize UI** theo brand
5. **Add more features** (history, favorites, etc.)

## 🎯 Features Ready

✅ **Authentication** - Google + Anonymous  
✅ **API Integration** - Full backend communication  
✅ **Math Explanation** - All 11 element types  
✅ **Beautiful UI** - Material Design 3  
✅ **Error Handling** - User-friendly messages  
✅ **Loading States** - Smooth UX

**App đã sẵn sàng để test!** 🚀
