# KỊCH BẢN DEMO BẢO VỆ ĐỒ ÁN QUẢN LÝ BÁN VÉ MÁY BAY

Tài liệu này cung cấp 2 kịch bản trình bày sản phẩm. Mỗi kịch bản đều bao gồm đầy đủ sự kết hợp hoàn hảo giữa 3 thành phần cốt lõi: **Function, Trigger và Procedure** nhằm phô diễn tối đa kỹ năng thiết kế Database trước hội đồng giám khảo.

---

## 🚀 KỊCH BẢN DEMO 1: "SỰ THÔNG MINH CỦA HỆ THỐNG" (PHƯƠNG ÁN CHÍNH)
*Mục tiêu của phần này là gây ấn tượng với hội đồng bằng cách cho thấy phần mềm không chỉ lưu trữ dữ liệu thụ động, mà có khả năng **tự động tính toán giá trị thương mại**, **bảo vệ dữ liệu vật lý** và **xử lý giao dịch phức tạp**.*

### 1. [Function] Tính giá vé động (FUNC_GET_DYNAMIC_PRICE)
* **Thuyết trình:** "Kính thưa thầy/cô, điểm khác biệt của hệ thống này là áp dụng Giá Vé Động (Dynamic Pricing) giống các hãng hàng không thực tế. Giá vé sẽ tự động tăng/giảm dựa vào độ khẩn cấp của thời gian bay mà không cần nhân viên phải cập nhật bằng tay."
* **Hành động Demo trên UI:**
  1. Mở màn hình **Khách hàng đặt vé**. Tìm một chuyến bay có lịch cất cánh còn rất xa (ví dụ: > 30 ngày). 
  2. Chỉ cho hội đồng xem: *"Do mua sớm, giá vé hạng Eco hiện tại đang là 900.000 VNĐ (giảm 10% so với gốc)"*.
  3. Mở một tab khác (Tab Admin), **sửa ngày cất cánh** của chuyến bay đó lùi về sát ngày hiện tại (cách hiện tại < 3 ngày).
  4. Quay lại tab Khách hàng, bấm **Tìm kiếm lại**. 
  5. Chỉ ra kết quả: *"Như thầy/cô thấy, giá vé Eco bây giờ đã tự động nhảy vọt lên 1.200.000 VNĐ (tăng 20%) nhờ Function tính toán lại hoàn toàn tự động."*

### 2. [Trigger] Ngăn chặn trùng lịch máy bay (TRG_CHECK_AIRCRAFT_OVERLAP)
* **Thuyết trình:** "Bên cạnh đó, Database được thiết kế các Trigger đóng vai trò như chốt chặn cuối cùng. Dù người dùng có cố tình hay vô tình thao tác sai trên giao diện, dữ liệu vẫn được đảm bảo tính toàn vẹn tuyệt đối."
* **Hành động Demo trên UI:**
  1. Mở màn hình **Quản lý Chuyến bay (Admin)**.
  2. Chỉ ra chuyến bay VN123 đang dùng máy bay `Boeing-787` bay từ **08:00 đến 10:00**.
  3. Bấm Thêm chuyến bay mới, nhập lịch bay là **09:00 đến 12:00** và cố tình chọn lại máy bay `Boeing-787`. Bấm Lưu.
  4. Hệ thống sẽ bật thông báo lỗi đỏ: *"Lỗi: Máy bay này đang kẹt chuyến bay khác trong khung giờ này!"*.
  5. Kết luận: *"Trigger `TRG_CHECK_AIRCRAFT_OVERLAP` đã phát hiện giao cắt thời gian và chặn đứng luồng dữ liệu này, ngăn ngừa thảm họa xếp lịch máy bay ngoài đời thực."*

### 3. [Procedure] Giao dịch đổi vé phức tạp (SP_CHANGE_FLIGHT_TICKET)
* **Thuyết trình:** "Cuối cùng, đổi vé là một nghiệp vụ cực kỳ rủi ro nếu xử lý trên code thông thường. Do đó em đóng gói nó thành một Transaction chuẩn ACID thông qua Procedure."
* **Hành động Demo trên UI:**
  1. Lấy một vé đang tồn tại (giá 1 triệu), chọn **Đổi vé/Chuyến bay**.
  2. Chọn một chuyến bay mới giá 3 triệu, bấm Xác nhận đổi.
  3. Giao diện báo thành công. Bạn giải thích: *"Trong 1 tíc tắc, Procedure `SP_CHANGE_FLIGHT_TICKET` đã gom 5 thao tác: kiểm tra ghế trống, nhả ghế cũ, khóa ghế mới, đổi trạng thái vé và ghi nhận khoản tiền chênh lệch cần đóng thêm 2 triệu. Nếu có bất kỳ lỗi gì ở giữa (vd: mất kết nối), Procedure sẽ tự động Rollback toàn bộ để khách không bị mất ghế cũ."*

---

## 🛡️ KỊCH BẢN DEMO 2: "SỰ CHẶT CHẼ TRONG GIAO DỊCH" (PHƯƠNG ÁN SƠ CUA)
*Mục tiêu của phần này là tập trung vào khả năng **xử lý đồng thời (concurrency)**, **tính toán hoàn tiền linh hoạt** và cơ chế **ngăn chặn bán lố** - những bài toán kinh điển của hệ thống bán vé.*

### 1. [Function] Hàm tính hoàn tiền theo thời gian (FUNC_CALCULATE_REFUND)
* **Thuyết trình:** "Để đảm bảo quyền lợi và quy định hủy vé chặt chẽ, hệ thống dùng Function để tự động định giá mức hoàn trả dựa vào khoảng cách đến giờ cất cánh."
* **Hành động Demo trên UI:**
  1. Vào lịch sử đặt vé, chọn **Hủy một vé** của chuyến bay sẽ cất cánh vào tuần sau (cách > 72 giờ). Hệ thống hiển thị popup: *"Bạn được hoàn 90% số tiền."*
  2. Đừng hủy vội, hãy vào Admin dời lịch bay của chuyến đó lên sát ngày hôm nay (cách < 24 giờ).
  3. Quay lại Khách hàng, bấm **Hủy vé** lần nữa. Lúc này hệ thống thông báo: *"Bạn sẽ không được hoàn tiền (0%) do hủy quá sát giờ bay."* (Ghi chú: Lời gọi này có thể lấy qua Procedure hủy vé nếu Function này đã được lồng ghép bên trong).

### 2. [Procedure] Luồng Giữ chỗ và Hủy dọn dẹp (SP_CLEANUP_AND_BOOK_TICKET)
* **Thuyết trình:** "Để giải quyết bài toán nhiều người cùng tranh mua một ghế và treo đơn hàng, hệ thống có Procedure chuyên biệt làm việc này."
* **Hành động Demo trên UI:**
  1. Đóng giả làm Khách hàng A: Chọn ghế `1A` và đi tới màn hình **Thanh toán**. 
  2. Giải thích với hội đồng: *"Khi em tới bước này, Procedure `SP_CLEANUP_AND_BOOK_TICKET` đã tạm khóa ghế 1A ở trạng thái PENDING. Nếu một Khách hàng B vào mua lúc này, ghế 1A sẽ bị khóa mờ. Đi kèm với nó là 1 đồng hồ đếm ngược 20 phút (gọi hàm FN_GET_REMAINING_PAYMENT_SEC). Hết giờ mà chưa thanh toán, hệ thống tự động nhả ghế."*

### 3. [Trigger] Ngăn chặn bán vé lố sức chứa (TRG_PREVENT_OVERBOOKING)
* **Thuyết trình:** "Cuối cùng, cam kết mạnh nhất của hệ thống là không bao giờ bán vé quá sức chứa thực tế của máy bay (Overbooking), em thiết lập 1 chốt chặn bằng Trigger."
* **Hành động Demo trên UI:**
  1. Vào màn hình đặt vé của một chuyến bay **chỉ còn đúng 1 ghế trống** (bạn có thể tạo máy bay cấu hình 1 ghế để dễ test).
  2. Mở thêm 1 màn hình ứng dụng thứ hai (Khách hàng B). Cùng lúc bấm thanh toán mua cái ghế trống cuối cùng đó trên cả 2 cửa sổ.
  3. Một màn hình sẽ báo đặt thành công, màn hình còn lại lập tức bị văng lỗi: *"Overbooking: Máy bay đã hết sức chứa!"*.
  4. Giải thích: *"Dù cho 2 yêu cầu lọt vào Database cùng 1 lúc, Trigger `TRG_PREVENT_OVERBOOKING` cũng sẽ chỉ duyệt cho 1 người, ngăn chặn lỗi bán lố cực kỳ nguy hiểm trong hàng không."*
