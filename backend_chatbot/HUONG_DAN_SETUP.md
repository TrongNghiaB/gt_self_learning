# Hướng Dẫn Cài Đặt Đầy Đủ (Tiếng Việt)

## 📋 Tổng Quan

Backend này sử dụng **Multi-Model AI System** kết hợp:

- **OpenAI GPT-4** - Model chính cho reasoning và math explanations
- **Google Gemini Pro** - Model phụ hoặc backup
- **Firebase Auth** - Xác thực người dùng

Bạn cần cấu hình cả 3 services để hệ thống hoạt động.

## 🔑 Các API Keys Cần Thiết

1. **Firebase** - Miễn phí (cho auth)
2. **OpenAI** - Trả phí (cần thẻ tín dụng)
3. **Gemini** - Miễn phí hoặc trả phí

---

## 📋 Các Bước Cấu Hình

### Bước 1: Cấu Hình Firebase

#### 1.1. Lấy Firebase Project ID

1. Truy cập [Firebase Console](https://console.firebase.google.com)
2. Chọn project của bạn (hoặc tạo project mới)
3. Click vào biểu tượng ⚙️ (Settings) → **Project Settings**
4. Copy **Project ID** (ví dụ: `my-math-app-12345`)

#### 1.2. Tải Service Account Key

1. Vẫn trong **Project Settings**
2. Chọn tab **Service Accounts**
3. Click nút **Generate New Private Key**
4. Click **Generate Key** để tải file JSON
5. Đổi tên file thành `serviceAccountKey.json`
6. Di chuyển file vào thư mục `backend_chatbot/`

```bash
# Ví dụ:
mv ~/Downloads/my-project-firebase-adminsdk-xxxxx.json /Users/te-member/gt_self_learning/backend_chatbot/serviceAccountKey.json
```

---

### Bước 2: Lấy OpenAI API Key

1. Truy cập [OpenAI Platform](https://platform.openai.com/api-keys)
2. Đăng nhập hoặc tạo tài khoản mới
3. Click **"Create new secret key"**
4. Đặt tên cho key (ví dụ: "Math Chatbot")
5. Copy API key (bắt đầu bằng `sk-...`)

**⚠️ Lưu ý:**

- Bạn cần nạp tiền vào tài khoản OpenAI (tối thiểu $5)
- GPT-4 tốn khoảng $0.01-0.03 mỗi request
- Giữ key này bí mật!

---

### Bước 3: Lấy Google Gemini API Key

1. Truy cập [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Đăng nhập bằng Google account
3. Click **"Create API Key"**
4. Chọn Google Cloud project (hoặc tạo mới)
5. Copy API key

**💡 Lưu ý:**

- Gemini có free tier (60 requests/phút)
- Không cần thẻ tín dụng cho free tier
- Nếu dùng free tier, set `PRIMARY_MODEL=gemini` trong `.env`

---

### Bước 4: Chỉnh Sửa File .env

Mở file `.env` trong thư mục `backend_chatbot/` và cập nhật:

```bash
# Firebase
FIREBASE_PROJECT_ID=my-math-app-12345
GOOGLE_APPLICATION_CREDENTIALS=/Users/te-member/gt_self_learning/backend_chatbot/serviceAccountKey.json

# OpenAI (bắt buộc nếu dùng OpenAI)
OPENAI_API_KEY=sk-proj-abc123xyz...

# Gemini (bắt buộc nếu dùng Gemini)
GEMINI_API_KEY=AIzaSyB...

# Model Selection
# - openai: Chỉ dùng OpenAI (tốn phí nhưng chất lượng cao)
# - gemini: Chỉ dùng Gemini (miễn phí nhưng giới hạn rate)
# - both: Dùng cả hai (OpenAI ưu tiên, Gemini backup)
PRIMARY_MODEL=openai
```

**💡 Gợi ý cấu hình:**

- **Có budget**: `PRIMARY_MODEL=openai` + fill cả 2 API keys
- **Miễn phí**: `PRIMARY_MODEL=gemini` + chỉ cần Gemini key
- **An toàn nhất**: `PRIMARY_MODEL=both` + có cả 2 keys (failover)

### Bước 5: Kiểm Tra Cấu Hình

```bash
# 1. Kiểm tra file .env
cat .env

# 2. Kiểm tra file serviceAccountKey.json có tồn tại không
ls -la serviceAccountKey.json

# 3. Nếu file tồn tại, bạn sẽ thấy kết quả như:
# -rw-r--r--  1 te-member  staff  2345 Oct  7 10:30 serviceAccountKey.json
```

## 🚀 Chạy Server

Sau khi cấu hình xong:

```bash
# 1. Chạy setup (nếu chưa chạy)
./setup.sh

# 2. Chạy server
./run.sh
```

Server sẽ khởi động tại: `http://localhost:8000`

## 🧪 Test Thử

### 1. Test Health Endpoint (Không cần auth)

```bash
curl http://localhost:8000/health
```

Kết quả mong đợi:

```json
{ "status": "healthy" }
```

### 2. Test API với Firebase Token

Bạn cần lấy Firebase ID Token từ frontend:

```javascript
import { getAuth } from "firebase/auth";

const auth = getAuth();
const user = auth.currentUser;
const idToken = await user.getIdToken();

console.log("Token:", idToken);
// Copy token này để test
```

Sau đó test API:

```bash
# Thay YOUR_TOKEN bằng token thực tế
curl -X POST http://localhost:8000/api/explain \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "query": "Giải thích phương trình bậc hai",
    "locale": "vi"
  }'
```

## ❌ Xử Lý Lỗi Thường Gặp

### Lỗi: "Missing authentication token"

**Nguyên nhân:** Không gửi token hoặc token sai format

**Giải pháp:**

- Đảm bảo header có: `Authorization: Bearer <token>`
- Token phải lấy từ Firebase Auth (frontend)

### Lỗi: "Invalid authentication token"

**Nguyên nhân:** Token không hợp lệ hoặc đã hết hạn

**Giải pháp:**

- Lấy token mới từ frontend
- Token có thời hạn 1 giờ, cần refresh định kỳ

### Lỗi: "Firebase app initialization failed"

**Nguyên nhân:**

- `FIREBASE_PROJECT_ID` sai
- Đường dẫn `GOOGLE_APPLICATION_CREDENTIALS` sai
- File `serviceAccountKey.json` không tồn tại

**Giải pháp:**

1. Kiểm tra lại Project ID
2. Kiểm tra đường dẫn file JSON (phải là đường dẫn tuyệt đối)
3. Kiểm tra file JSON có tồn tại: `ls -la serviceAccountKey.json`

### Server không khởi động

```bash
# 1. Kiểm tra virtual environment
source venv/bin/activate

# 2. Cài lại dependencies
pip install -r requirements.txt

# 3. Kiểm tra Python version (cần 3.11+)
python --version
```

## 📝 Ví Dụ File .env Hoàn Chỉnh

### Cấu hình với OpenAI (có trả phí):

```bash
# Firebase
FIREBASE_PROJECT_ID=math-explainer-app-2024
GOOGLE_APPLICATION_CREDENTIALS=/Users/te-member/gt_self_learning/backend_chatbot/serviceAccountKey.json

# OpenAI
OPENAI_API_KEY=sk-proj-abc123xyz456def789...
GEMINI_API_KEY=AIzaSyB-xyz123...

# Model: OpenAI ưu tiên
PRIMARY_MODEL=openai

# LOG_LEVEL=INFO
```

### Cấu hình miễn phí với Gemini:

```bash
# Firebase
FIREBASE_PROJECT_ID=math-explainer-app-2024
GOOGLE_APPLICATION_CREDENTIALS=/Users/te-member/gt_self_learning/backend_chatbot/serviceAccountKey.json

# Chỉ cần Gemini key
OPENAI_API_KEY=
GEMINI_API_KEY=AIzaSyB-xyz123...

# Model: Chỉ dùng Gemini
PRIMARY_MODEL=gemini

# LOG_LEVEL=INFO
```

## 📞 Cần Thêm Trợ Giúp?

Xem thêm tài liệu:

- `README.md` - Tài liệu chính (tiếng Anh)
- `QUICKSTART.md` - Hướng dẫn nhanh
- `API_USAGE.md` - Cách sử dụng API
- `TESTING.md` - Hướng dẫn test

## ✅ Checklist Trước Khi Chạy

- [ ] Đã tạo Firebase project
- [ ] Đã tải file `serviceAccountKey.json`
- [ ] File `serviceAccountKey.json` nằm trong thư mục `backend_chatbot/`
- [ ] Đã cập nhật `FIREBASE_PROJECT_ID` trong `.env`
- [ ] Đã cập nhật `GOOGLE_APPLICATION_CREDENTIALS` trong `.env` (đường dẫn tuyệt đối)
- [ ] Đã chạy `./setup.sh`
- [ ] Test health endpoint thành công

Nếu tất cả đều ✅ thì bạn đã sẵn sàng! 🚀
