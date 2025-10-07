# Hướng Dẫn Virtual Environment (Môi Trường Riêng)

## 🎯 Tại Sao Cần Virtual Environment?

**Vấn đề:** Cài đặt trực tiếp vào Python global có thể gây:

- ❌ Xung đột thư viện giữa các project
- ❌ Khó quản lý dependencies
- ❌ Làm hỏng Python system
- ❌ Khó deploy và share project

**Giải pháp:** Virtual Environment tạo môi trường riêng biệt cho từng project.

## ✅ Đã Setup Xong!

Virtual environment đã được tạo và cài đặt dependencies:

```bash
# Virtual environment location
/Users/te-member/gt_self_learning/backend_chatbot/venv/

# Python trong venv
/Users/te-member/gt_self_learning/backend_chatbot/venv/bin/python

# Dependencies đã cài
fastapi, openai, google-generativeai, firebase-admin, matplotlib, sympy...
```

## 🚀 Cách Sử Dụng

### 1. Chạy Server (Tự động activate venv)

```bash
cd /Users/te-member/gt_self_learning/backend_chatbot
./run_local.sh
```

Script này sẽ:

- ✅ Tự động activate virtual environment
- ✅ Kiểm tra dependencies
- ✅ Start server với uvicorn

### 2. Manual Commands (Nếu cần)

```bash
# Activate virtual environment
source venv/bin/activate

# Kiểm tra Python path (phải là venv path)
which python
# Output: /Users/te-member/gt_self_learning/backend_chatbot/venv/bin/python

# Chạy server
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

# Deactivate khi xong
deactivate
```

### 3. Install Thêm Dependencies

```bash
# Activate venv trước
source venv/bin/activate

# Install package mới
pip install package-name

# Update requirements.txt
pip freeze > requirements.txt
```

## 📁 Cấu Trúc Virtual Environment

```
backend_chatbot/
├── venv/                    # Virtual environment
│   ├── bin/
│   │   ├── python          # Python executable
│   │   ├── pip             # Package manager
│   │   └── activate        # Activation script
│   ├── lib/
│   │   └── python3.9/
│   │       └── site-packages/  # Installed packages
│   └── pyvenv.cfg          # Venv config
├── app/                     # Your application code
├── requirements.txt         # Dependencies list
├── .env                     # Environment variables
└── run_local.sh            # Auto-run script
```

## 🔧 Troubleshooting

### Lỗi: "Command not found: uvicorn"

**Nguyên nhân:** Virtual environment chưa được activate

**Giải pháp:**

```bash
source venv/bin/activate
uvicorn app.main:app --reload
```

### Lỗi: "Module not found"

**Nguyên nhân:** Package chưa được cài trong venv

**Giải pháp:**

```bash
source venv/bin/activate
pip install -r requirements.txt
```

### Lỗi: "Permission denied"

**Nguyên nhân:** Script không có quyền execute

**Giải pháp:**

```bash
chmod +x run_local.sh
./run_local.sh
```

## 💡 Best Practices

### 1. Luôn Activate Venv Trước Khi Làm Việc

```bash
# Mỗi lần mở terminal mới
cd /Users/te-member/gt_self_learning/backend_chatbot
source venv/bin/activate
```

### 2. Kiểm Tra Python Path

```bash
# Phải trỏ đến venv
which python
# ✅ /Users/te-member/gt_self_learning/backend_chatbot/venv/bin/python

# ❌ KHÔNG được là:
# /usr/bin/python
# /usr/local/bin/python
```

### 3. Update Requirements.txt

```bash
# Khi install package mới
pip install new-package
pip freeze > requirements.txt
```

### 4. Deactivate Khi Xong

```bash
# Khi chuyển sang project khác
deactivate
```

## 🎯 Commands Summary

```bash
# Setup (chỉ cần chạy 1 lần)
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Daily usage
cd /Users/te-member/gt_self_learning/backend_chatbot
./run_local.sh                    # Auto activate + run server

# Manual usage
source venv/bin/activate          # Activate
uvicorn app.main:app --reload     # Run server
deactivate                        # Deactivate
```

## 📊 So Sánh

| Aspect           | Global Python | Virtual Environment |
| ---------------- | ------------- | ------------------- |
| **Isolation**    | ❌ Shared     | ✅ Isolated         |
| **Dependencies** | ❌ Mixed      | ✅ Project-specific |
| **Conflicts**    | ❌ High risk  | ✅ No conflicts     |
| **Deployment**   | ❌ Hard       | ✅ Easy             |
| **Management**   | ❌ Complex    | ✅ Simple           |

## 🎉 Kết Luận

Virtual environment đã được setup hoàn chỉnh! Bây giờ bạn có:

- ✅ **Môi trường riêng biệt** cho Math Chatbot project
- ✅ **Tất cả dependencies** đã được cài đặt
- ✅ **Script tự động** để chạy server
- ✅ **Không ảnh hưởng** đến Python global

**Chỉ cần chạy:**

```bash
./run_local.sh
```

Và server sẽ start với môi trường riêng! 🚀
