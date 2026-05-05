Skip to content
vanquang-sas
AgriSupplyChain
Repository navigation
Code
Issues
Pull requests
1
 (1)
Agents
Actions
Projects
Wiki
Security and quality
Insights
Settings
Important update
On April 24 we'll start using GitHub Copilot interaction data for AI model training unless you opt out. Review this update and manage your preferences in your GitHub account settings.
Files
Go to file
t
T
database
docs
changelog
img
DB_DOCUMENT.md
DB_INIT_INSTRUCTION.md
DEMO_WORKFLOW.md
GIT_COMMIT.md
GIT_GUIDELINE.md
NOTE_CHANGELOG.md
PROJECT_STRUCTURE.md
src
.gitignore
README.md
pom.xml
AgriSupplyChain/docs
/
GIT_COMMIT.md
in
dev

Edit

Preview
Indent mode

Spaces
Indent size

2
Line wrap mode

Soft wrap
Editing GIT_COMMIT.md file contents
  1
  2
  3
  4
  5
  6
  7
  8
  9
 10
 11
 12
 13
 14
 15
 16
 17
 18
 19
 20
 21
 22
 23
 24
 25
 26
 27
 28
 29
 30
 31
 32
 33
 34
 35
 36
 37
 38
 39
 40
 41
 42
 43
 44
 45
 46
 47
 48
 49
 50
# Quy tắc đặt tên Commit

Để quản lý lịch sử code hiệu quả, toàn bộ thành viên trong nhóm thống nhất áp dụng quy chuẩn **Conventional Commits** dưới đây.

## 1. Cấu trúc một dòng Commit
`<TYPE>: <Mô tả ngắn gọn bằng tiếng Việt>`

*Ví dụ:* `FEAT: Thêm chức năng thanh toán qua MOMO`

---

## 2. Các Loại Commit

Dưới đây là các từ khóa bắt buộc sử dụng ở đầu mỗi commit:

| Type      | Ý nghĩa       | Khi nào dùng? |
| :---      | :---          | :--- |
| **FEAT**  | Tính năng mới | Thêm một chức năng mới hoàn chỉnh. |
| **FIX**   | Sửa lỗi       | Sửa một lỗi logic, lỗi giao diện hoặc các lỗi khác. |
| **UI**    | Giao diện     | Thay đổi liên quan đến giao diện: màu sắc, font chữ, kích thước, icon, ảnh (không đổi logic chính). |
| **DOCS**  | Tài liệu      | Thay đổi file README, comment code, ghi chú hướng dẫn trong folder `docs` (không ảnh hưởng đến code). |
| **REFACTOR** | Tái cấu trúc | Thay đổi cấu trúc code hoặc cấu trúc các file (không đổi logic chính). |
| **DB**    | Database      | Thay đổi các script liên quan tới database trong `database`. |
| **PERF**  | Hiệu suất     | Tối ưu giúp ứng dụng chạy nhanh hơn hoặc tốn ít tài nguyên hơn. |
| **TEST**  | Kiểm thử      | Khi viết thêm hoặc chỉnh sửa các bộ Unit Test. |
| **CHORE** | Việc vặt      | Cập nhật file `pom.xml`, cài thư viện mới, cấu hình `.gitignore`. |
| **OTHER** | Việc khác     | **Tất cả những gì không thuộc các loại trên** |

---

## 3. Lưu ý
1. **Dấu cách:** Luôn có một dấu cách sau dấu hai chấm `:`.
   - Đúng: `FEAT: Thêm tính năng mới`
   - Sai: `FEAT:Thêm tính năng mới`
2. **Khi nào commit:** 
    - Hãy commit mỗi khi hoàn thành một đơn vị công việc nhỏ, tránh để code quá nhiều rồi mới commit một lần.
3. **Nếu có nhiều thay đổi trong một lần**: 
    - Giả sử có 2 thay đổi trong 1 lần commit `FEAT: Thêm bộ lọc mới` và `FIX: Sửa lỗi kết nối database`
    - **Cách 1**: Chia nhỏ commit
        - Bước 1: `git add` các file liên quan đến tính năng mới -> `git commit -m "FEAT: ..."`
        - Bước 2: `git add` các file liên quan đến sửa lỗi -> `git commit -m "FIX: ..."`
    - **Cách 2**: Gộp chung 1 commit
        - Bước 1: `git add` tất cả các file liên quan tới việc thay đổi
        - Bước 2: Gõ `git commit -m "FEAT: Thêm bộ lọc mới;` *(Không đóng ngoặc kép ở đây `"`)*
        - Bước 3: Nhấn Enter để xuống dòng
        - Bước 4: Gõ tiếp các thay đổi khác `FIX: Sửa lỗi kết nối database` *(Mỗi thay đổi 1 dòng)*
        - Bước 5: Đóng dấu ngoặc kép `"` và nhấn Enter lần nữa để hoàn tất

---

Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page.
No file chosen
Attach files by dragging & dropping, selecting or pasting them.
changelog content loaded