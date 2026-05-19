# Bảo mật - Mentor Financeiro

**Cập nhật lần cuối:** Ngày 19 tháng 5 năm 2026

Trang này giải thích các biện pháp bảo mật Mentor Financeiro bằng ngôn ngữ đơn giản. Nó bổ sung cho Chính sách quyền riêng tư và Điều khoản sử dụng.

## 1. Cam kết bảo mật

Mentor Financeiro được phát triển để hỗ trợ tổ chức tài chính mà không yêu cầu quyền truy cập trực tiếp vào tài khoản ngân hàng, không yêu cầu mật khẩu ngân hàng và không có chức năng như ngân hàng, nhà môi giới hoặc phương thức thanh toán.

Ứng dụng có thể lưu trữ dữ liệu tài chính do bạn nhập hoặc được xác định bằng các tính năng tùy chọn, đó là lý do tại sao chúng tôi coi bảo mật là phần trọng tâm của sản phẩm.

## 2. Ứng dụng không làm được gì

- Không yêu cầu mật khẩu ngân hàng, thẻ hoặc ví kỹ thuật số.
- Không truy cập được vào tài khoản ngân hàng của bạn.
- Không chuyển tiền.
- Không thực hiện thanh toán, Pix, chuyển khoản hoặc đầu tư dưới tên của bạn.
- Không yêu cầu mã bảo mật thẻ.
- Không yêu cầu mã ngân hàng OTP.
- Không bán dữ liệu cá nhân của bạn.

## 3. Biện pháp kỹ thuật được sử dụng

Tùy thuộc vào tài nguyên được sử dụng, ứng dụng có thể sử dụng:

- Đăng nhập bởi Firebase Authentication.
- Cloud Firestore với dữ liệu liên quan đến người dùng được xác thực.
- Quy tắc bảo mật để hạn chế quyền truy cập vào dữ liệu của chính người dùng.
- Thông tin liên lạc được mã hóa bởi SDK và dịch vụ được sử dụng.
- Firebase Crashlytics để xác định lỗi kỹ thuật và khắc phục sự cố.
- Android quyền chỉ được yêu cầu khi liên quan đến các tính năng của ứng dụng.
- Bộ nhớ cục bộ cho các tùy chọn, chủ đề, bộ nhớ đệm và dữ liệu thiết bị.

## 4. Giám sát thông báo

Giám sát thông báo là tùy chọn và yêu cầu kích hoạt thủ công trên Android.

Khi được bật, ứng dụng có thể đọc các thông báo được hỗ trợ để ghi nhận chi tiêu, mua hàng, thanh toán, đăng ký và chuyển khoản. Mục đích là giảm bớt công việc thủ công khi ghi chép chi phí.

Để giảm thiểu rủi ro:

- Ứng dụng sẽ thông báo cho bạn lý do cấp phép trước khi chuyển bạn đến phần cài đặt.
- Quyền truy cập có thể bị thu hồi bất cứ lúc nào trong cài đặt Android.
- Bộ lọc tìm kiếm các sự kiện tài chính tương thích, không phải các cuộc trò chuyện cá nhân.
- Ứng dụng cố gắng bỏ qua mã OTP, mật khẩu, mã bảo mật và thông báo xác thực.
- Ứng dụng không sử dụng tính năng này để truy cập ngân hàng, thẻ hoặc ví kỹ thuật số.

Mặc dù vậy, thông báo có thể chứa dữ liệu nhạy cảm. Chỉ sử dụng tính năng này nếu bạn đồng ý với kiểu xử lý này.

## 5. Quyền nhạy cảm

Ứng dụng có thể yêu cầu:

- **Internet:** kết nối với Firebase, Google Play, API và tài nguyên trực tuyến.
- **Thông báo:** gửi thông báo từ chính ứng dụng.
- **Vị trí:** điều chỉnh nội dung hoặc so sánh với quốc gia/khu vực khi được phép.
- **Truy cập vào thông báo Android:** nhận dạng tùy chọn chi phí từ các thông báo tương thích.
- **Mua hàng trong ứng dụng:** Premium đăng ký bởi Google Play.

Bạn kiểm soát các quyền này trong cài đặt Android.

## 6. Phần bảo mật của bạn

Để bảo vệ dữ liệu của bạn:

- Sử dụng khóa màn hình trên thiết bị.
- Không chia sẻ tài khoản của bạn.
- Luôn cập nhật ứng dụng và Android.
- Thu hồi quyền bạn không muốn sử dụng nữa.
- Kiểm tra các giao dịch được xác định tự động trước khi đưa ra quyết định.
- Không đăng ký những thông tin mà bạn không muốn lưu giữ trong ứng dụng.
- Hủy đăng ký trực tiếp tại Google Play khi bạn không muốn gia hạn.

## 7. Hạn chế

Không có ứng dụng, máy chủ, hệ điều hành hoặc dịch vụ đám mây nào được bảo mật 100%. Bất chấp các biện pháp đã được áp dụng, vẫn có thể xảy ra lỗi, không khả dụng, lỗi đồng bộ hóa, mất quyền truy cập, sự cố của bên thứ ba hoặc nỗ lực lạm dụng từ bên ngoài.

Mentor Financeiro tìm cách giảm thiểu rủi ro một cách hợp lý, nhưng bạn phải lưu giữ các bản sao hoặc quyền kiểm soát riêng đối với thông tin tài chính thiết yếu.

##8. Sự cố và liên hệ

Nếu bạn nhận thấy hành vi lạ, truy cập không đúng cách, dữ liệu không chính xác, nghi ngờ vi phạm bảo mật hoặc có vấn đề với các quyền nhạy cảm, vui lòng liên hệ:

**george.guimares@gmail.com**

Bao gồm, nếu có thể:

- Mẫu thiết bị.
- Phiên bản Android.
- Phiên bản ứng dụng.
- Mô tả vấn đề.
- Ảnh chụp màn hình mà không để lộ mật khẩu, mã hoặc dữ liệu quá mức.
