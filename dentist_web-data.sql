 use GraduationThesis ;

INSERT INTO role (description,is_deleted,role_name) VALUES
          ('Quản lý',0,'QUAN_LY'),
          ('NV HÀNH CHÍNH',0,'HANH_CHINH'),
          ('Bác sĩ',0,'BAC_SI'),
          ('Bệnh nhân',0,'BENH_NHAN'),
          ('Kỹ thuật viên hình ảnh',0,'KY_THUAT');


INSERT INTO medicine_category (description, name,is_deleted) VALUES
('giảm đau và chống viêm', 'Giảm đau và chống viêm',false),
('gây tê', 'Gây tê',false),
('kháng sinh', 'Kháng sinh',false),
('chống nấm', 'Chống nấm',false),
('chống virus', 'Chống virus',false),
('chống loét miệng', 'Chống loét miệng',false),
('khô miệng', 'Khô miệng',false),
('bệnh nha chu', 'Bệnh nha chu',false),
('chống dị ứng', 'Chống dị ứng',false),
('chống lo âu và an thần', 'Chống lo âu và an thần',false),
('chống viêm', 'Chống viêm',false),
('khử trùng', 'Khử trùng',false),
('hỗ trợ tiêu hóa', 'Hỗ trợ tiêu hóa',false);

INSERT into medicines_dosage_amount(amount,is_deleted) VALUES (1,false),(2,false),(3,false),(4,false),(5,false);

INSERT INTO distribution_medicines (address,contact_person,distribution_name,email,is_deleted,name,note,tax_code) VALUES
	 ('Số 160, phố Tôn Đức Thắng, Phường Hàng Bột, Quận Đống đa, Hà Nội','Tô Thành Hưng','CÔNG TY CỔ PHẦN DƯỢC PHẨM TRUNG ƯƠNG I - PHARBACO','pharbaco@pharbaco.com.vn',0,'PHARBACO .,JSC','	0100109032 - 25/07/2007','0100109032'),
	 ('Số 4, Đường 30/4, Phường 1, TP Cao Lãnh, Đồng Tháp','Trần Thị Đào','Công ty TNHH Dược phẩm Imexpharm','tuyendung@imexpharm.com',0,'IMEXPHARM','1400384433 - 01/08/2001','1400384433'),
	 ('	36 Đường số 17B, Khu phố 3, Phường Bình Trị Đông B, Quận Bình Tân, TP Hồ Chí Minh','Đinh Văn Huân','CÔNG TY TNHH THƯƠNG MẠI DƯỢC PHẨM DUY ANH','info@gmail.com',0,'	DUY ANH PHAR CO., LTD','0303418205 - 06/07/2004','0303418205'),
	 ('246 Cống Quỳnh, Phường Phạm Ngũ Lão, Quận 1, TP Hồ Chí Minh','Nguyễn Ngọc Dung','CÔNG TY TNHH DƯỢC PHẨM VIMEDIMEX','vimehanoi@vimedimex.vn',0,'CôNG TY TNHH DượC PHẩM VIMEDIMEX','0306406857 - 17/11/2008','	0306406857'),
	 ('	288 Bis, Nguyễn Văn Cừ, Phường An Hòa, Quận Ninh Kiều, Cần Thơ','Toshiyuki Ishii','CÔNG TY CỔ PHẦN DƯỢC HẬU GIANG','dhgpharma@dhgpharma.com.vn',0,'DHG PHARMA','1800156801 - 15/09/2004','1800156801');


insert into medicines_dosage_unit (unit,is_deleted) VALUES ('Viên',false),('Gói',false),('mg',false),('ml',false);

INSERT into frequency (times_of_day,is_deleted) VALUES ('Sáng',false),('Chiều',false),('Tối',false);

DELIMITER //

DROP PROCEDURE IF EXISTS InsertTreatmentDuration//

CREATE PROCEDURE InsertTreatmentDuration()
BEGIN
    DECLARE counter INT DEFAULT 1;
    WHILE counter <= 180 DO
        INSERT INTO treatment_duration (Quantity,is_deleted) VALUES (counter,false);
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

CALL InsertTreatmentDuration();

INSERT INTO medicines (before_eating, medicine_name, distribution_medicines_id, medicine_category_id, medicines_dosage_amount_id, medicines_dosage_unit_id,is_deleted) VALUES
(True, 'Ibuprofen', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 1, 1,false),
(True, 'Acetaminophen (Paracetamol)', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 2, 1,false),
(True, 'Aspirin', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 3, 1,false),
(True, 'Naproxen', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 4, 1,false),
(True, 'Ketorolac', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 5, 1,false),
(True, 'Lidocaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 1, 2,false),
(True, 'Articaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 2, 2,false),
(True, 'Mepivacaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 3, 2,false),
(True, 'Bupivacaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 4, 2,false),
(True, 'Prilocaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 5, 2,false),
(True, 'Amoxicillin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 1, 3,false),
(True, 'Clindamycin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 2, 3,false),
(True, 'Metronidazole', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 3, 3,false),
(True, 'Azithromycin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 4, 3,false),
(True, 'Doxycycline', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 3,false),
(True, 'Nystatin', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 1, 4,false),
(True, 'Clotrimazole', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 2, 4,false),
(True, 'Fluconazole', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 3, 4,false),
(True, 'Acyclovir', 5, (SELECT medicine_category_id FROM medicine_category WHERE name='chống virus'), 1, 1,false),
(True, 'Valacyclovir', 5, (SELECT medicine_category_id FROM medicine_category WHERE name='chống virus'), 2, 1,false),
(True, 'Triamcinolone Acetonide', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống loét miệng'), 1, 1,false),
(True, 'Orabase', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='chống loét miệng'), 2, 1,false),
(True, 'Pilocarpine', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='khô miệng'), 1, 1,false),
(True, 'Cevimeline', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='khô miệng'), 2, 1,false),
(True, 'Chlorhexidine Gluconate', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='bệnh nha chu'), 1, 1,false),
(True, 'Doxycycline Gel', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='bệnh nha chu'), 2, 1,false),
(True, 'Diphenhydramine', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống dị ứng'), 1, 1,false),
(True, 'Diazepam', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống lo âu và an thần'), 1, 1,false),
(True, 'Midazolam', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống lo âu và an thần'), 2, 1,false),
(True, 'Nitrous Oxide', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống lo âu và an thần'), 3, 1,false),
(True, 'Ropivacaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 5, 1,false),
(True, 'Epinephrine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 5, 1,false),
(True, 'Tetracaine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 5, 1,false),
(True, 'Oxycodone', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 5, 1,false),
(True, 'Hydrocodone', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 1, 1,false),
(True, 'Codeine', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 1, 1,false),
(True, 'Morphine', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='giảm đau và chống viêm'), 2, 1,false),
(True, 'Prednisone', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống viêm'), 1, 1,false),
(True, 'Methylprednisolone', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống viêm'), 2, 1,false),
(True, 'Dexamethasone', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống viêm'), 3, 1,false),
(True, 'Amoxicillin/Clavulanic Acid', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 4, 1,false),
(True, 'Ciprofloxacin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 1,false),
(True, 'Levofloxacin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 1,false),
(True, 'Ceftriaxone', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 1,false),
(True, 'Cephalexin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 1,false),
(True, 'Metronidazole Gel', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 5, 1,false),
(True, 'Doxycycline Capsule', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 1, 1,false),
(True, 'Clindamycin Gel', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 1, 1,false),
(True, 'Mupirocin', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 2, 1,false),
(True, 'Chlorhexidine Varnish', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='bệnh nha chu'), 3, 1,false),
(True, 'Minocycline', 3, (SELECT medicine_category_id FROM medicine_category WHERE name='kháng sinh'), 4, 1,false),
(True, 'Clotrimazole Troche', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 2, 1,false),
(True, 'Nystatin Oral Suspension', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 3, 1,false),
(True, 'Fluconazole Tablet', 4, (SELECT medicine_category_id FROM medicine_category WHERE name='chống nấm'), 4, 1,false),
(True, 'Povidone-Iodine', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='khử trùng'), 1, 1,false),
(True, 'Hydrogen Peroxide Mouthwash', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='khử trùng'), 2, 1,false),
(True, 'Dexamethasone Mouthwash', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống viêm'), 4, 1,false),
(True, 'Triamcinolone Oral Paste', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='chống viêm'), 5, 1,false),
(True, 'Benzocaine Topical', 2, (SELECT medicine_category_id FROM medicine_category WHERE name='gây tê'), 5, 1,false),
(True, 'Probiotics', 1, (SELECT medicine_category_id FROM medicine_category WHERE name='hỗ trợ tiêu hóa'), 1, 1,false);


INSERT INTO dental_issues (name,is_deleted) VALUES
('Đau răng',false),
('Viêm nướu',false),
('Chảy máu nướu',false),
('Sưng nướu',false),
('Hơi thở có mùi',false),
('Răng nhạy cảm',false),
('Răng bị sứt mẻ',false),
('Răng bị mòn',false),
('Răng lung lay',false),
('Nhiễm trùng răng',false),
('Áp xe răng',false),
('Mòn men răng',false),
('Răng mọc lệch',false),
('Răng khôn mọc lệch',false),
('Sâu răng',false),
('Loét miệng',false),
('Khô miệng',false),
('Viêm tủy răng',false),
('Răng ngả màu',false),
('Nhiệt miệng',false),
('Viêm quanh răng',false),
('Răng ê buốt',false),
('Lở loét nướu',false),
('Nướu thâm đen',false),
('Răng thưa',false),
('Răng lệch lạc',false),
('Răng cửa bị hư hại',false),
('Mất răng',false),
('Răng mọc thêm',false),
('Đau quai hàm',false),
('Nướu co rút',false),
('Răng hô',false),
('Răng móm',false),
('Hàm không cân xứng',false),
('Răng chèn ép',false),
('Sâu ngầm',false),
('Vôi răng',false),
('Viêm lợi do mảng bám',false),
('Mọc mụn nhọt trong miệng',false),
('Vết cắt trong miệng',false),
('Nhiễm trùng nướu',false),
('Lệch đường giữa',false),
('Đau răng khi cắn',false),
('Răng không đều màu',false),
('Sứt mẻ răng cửa',false),
('Hàm răng không khớp',false),
('Thẩm mỹ',false),
('Mất răng hàng loạt',false),
('Viêm lợi do thuốc',false),
('Nhiễm trùng chân răng',false),
('Răng mọc quá nhiều',false),
('Mất răng cửa',false),
('Thay đổi màu nướu',false),
('Tiêu xương hàm',false),
('Răng bị đen',false),
('Sưng nướu quanh răng khôn',false),
('Nướu bị lở loét',false),
('Vết thương trong miệng do dụng cụ chỉnh nha',false),
('Nứt nẻ môi do thời tiết',false),
('Nhiễm trùng chân răng sau phẫu thuật',false);

INSERT INTO treatment (treatment_name,is_deleted) VALUES
('Điều trị tủy',false),
('Trám răng',false),
('Nhổ răng',false),
('Súc miệng bằng nước muối',false),
('Vệ sinh răng miệng',false),
('Sử dụng thuốc kháng sinh',false),
('Đánh răng nhẹ nhàng',false),
('Dùng chỉ nha khoa đúng cách',false),
('Súc miệng bằng dung dịch kháng khuẩn',false),
('Sử dụng thuốc kháng viêm',false),
('Điều trị nha chu',false),
('Vệ sinh răng miệng kỹ lưỡng',false),
('Uống nhiều nước',false),
('Sử dụng nước súc miệng kháng khuẩn',false),
('Dùng kem đánh răng cho răng nhạy cảm',false),
('Tránh thực phẩm quá nóng hoặc lạnh',false),
('Bọc răng sứ',false),
('Sử dụng bảo vệ răng khi nghiến răng',false),
('Điều chỉnh chế độ ăn uống',false),
('Nẹp răng',false),
('Dẫn lưu mủ',false),
('Dùng kem đánh răng chứa fluoride',false),
('Niềng răng',false),
('Chỉnh nha',false),
('Nhổ răng khôn',false),
('Sử dụng thuốc bôi loét miệng',false),
('Sử dụng thuốc kích thích tiết nước bọt',false),
('Sử dụng thuốc giảm đau và kháng viêm',false),
('Tẩy trắng răng',false),
('Sử dụng miếng dán tẩy trắng răng',false),
('Sử dụng thuốc bôi giảm đau',false),
('Khám nha sĩ để xác định nguyên nhân và điều trị phù hợp',false),
('Làm cầu răng',false),
('Nhổ răng mọc thêm',false),
('Điều trị nha khoa phù hợp',false),
('Ghép nướu',false),
('Phẫu thuật chỉnh hình',false),
('Phẫu thuật chỉnh hình hàm',false),
('Lấy cao răng',false),
('Vệ sinh răng miệng định kỳ',false),
('Sử dụng chỉ nha khoa',false),
('Vệ sinh vùng miệng sạch sẽ',false),
('Rửa vết thương bằng nước muối',false),
('Vệ sinh răng miệng tốt',false),
('Sử dụng veneer',false),
('Tư vấn và điều trị thẩm mỹ nha khoa',false),
('Sử dụng răng giả',false),
('Cấy ghép răng',false),
('Thay đổi thuốc hoặc điều chỉnh liều lượng dưới sự giám sát của bác sĩ',false),
('Ghép xương',false),
('Sử dụng sáp bảo vệ',false),
('Sử dụng son dưỡng môi',false),
('Giữ ẩm cho môi',false);


INSERT INTO service_type (type_name,is_deleted) VALUES
('Tổng quát',false),
('Chụp phim',false),
('Phòng ngừa',false),
('Chữa tủy',false),
('trám răng',false),
('Nhổ răng',false),
('Tẩy trắng răng',false),
('Chốt, cùi giả',false),
('Phục hồi tháo lắp',false),
('Răng sứ',false),
('Implant',false),
('chỉnh nha',false),
('Thẩm mỹ',false),
('Tiểu phẫu',false),
('Phục hồi cố định',false),
('Chữa trị bệnh lý miệng',false);

INSERT INTO service (service_name, price, time_estimate, service_type_id, is_deleted, description, imageurl) VALUES
     ('Khám tổng quát', 0, 25, 1, false, 'Khám tổng quát giúp kiểm tra tình trạng sức khỏe tổng thể và phát hiện sớm các vấn đề.', 'https://www.vinmec.com/static/uploads/small_20210327_095104_900316_chup_xquang_rang_max_1800x1800_jpg_d64ce1176d.jpg'),
     ('X quang kỹ thuật số (1 phim)', 20000, 15, 2, false, 'Chụp X quang kỹ thuật số để kiểm tra các vấn đề bên trong cơ thể.', 'https://medlatec.vn/media/2403/content/20230222_kham-tong-quat-bao-nhieu-tien-1.jpg'),
     ('X quang toàn cảnh', 100000, 15, 2, false, 'Chụp X quang toàn cảnh để kiểm tra toàn bộ vùng hàm mặt.', 'https://lh5.googleusercontent.com/proxy/zr1zSdk8jWsDrkFXxt4z8Oz3jgGOgF2EpquOvu9VjDgrtmntWFvZdS0qtj2N-S0iB8xmEVfOICjs3cRMuMJjrI-DuXsFpS4fWk1gZjuex2miEHtAUtGy4EE'),
     ('X quang sọ nghiêng', 100000, 15, 2, false, 'Chụp X quang sọ nghiêng để kiểm tra cấu trúc sọ từ góc nghiêng.', 'https://nhakhoasmileone.vn/uploaded/2022/1-chup-xquang-truoc-khi-nieng-rang%20(2).png'),
     ('X quang sọ thẳng', 100000, 15, 2, false, 'Chụp X quang sọ thẳng để kiểm tra cấu trúc sọ từ góc thẳng.', 'https://login.medlatec.vn//ImagePath/images/20200319/20200319_chup-x-quang-rang-khon-01.jpg'),
     ('X quang CT răng hàm mặt - 2 hàm', 600000, 15, 2, false, 'Chụp CT để kiểm tra chi tiết các răng và cấu trúc hàm mặt.', 'https://login.medlatec.vn//ImagePath/images/20200323/20200323_chup-ct-rang-01.jpg'),
     ('X quang CT răng hàm mặt - 1 hàm', 500000, 15, 2, false, 'Chụp CT để kiểm tra chi tiết một hàm răng và cấu trúc hàm mặt.', 'https://ptddatviet.vn/Content/Fileuploads/images/chup-phim-hien-dai-cone-beam-ct%20-2.jpg'),
     ('Cạo vôi răng', 250000, 20, 3, false, 'Cạo vôi răng giúp loại bỏ mảng bám và vôi răng.', 'https://cdn.diemnhangroup.com/nhakhoashark.vn/2022/11/Cao-voi-rang-1.jpg'),
     ('Trám bít hố rãnh', 200000, 20, 3, false, 'Trám bít hố rãnh giúp bảo vệ răng khỏi sâu và tổn thương.', 'https://cdn.diemnhangroup.com/nhakhoashark.vn/2023/11/Tram-bit-ho-ranh-2.jpg'),
     ('Trám răng bằng Composite', 150000, 35, 4, false, 'Trám răng bằng vật liệu Composite để phục hồi chức năng răng.', 'https://nhakhoamientay.com/wp-content/uploads/2021/04/tram-rang-composite-la-gi.jpg'),
     ('Trám răng thẩm mỹ bằng Composite', 400000, 35, 4, false, 'Trám răng thẩm mỹ bằng Composite giúp cải thiện vẻ ngoài của răng.', 'https://nhakhoakim.com/wp-content/uploads/2018/08/Tram-rang-composite.jpg'),
     ('Chữa tủy', 800000, 35, 4, false, 'Điều trị tủy răng để giải quyết các vấn đề liên quan đến tủy.', 'https://soradental.com/wp-content/uploads/2020/05/top-6-nha-khoa-chua-tuy-rang-gioi-nhat-tai-tphcm.jpg'),
     ('Nạo túi nha chu', 200000, 35, 4, false, 'Nạo túi nha chu giúp loại bỏ vi khuẩn và mảng bám trong nướu.', 'https://nhakhoaantamsaigon.vn/thumbs/600x423x2/upload/news/phau-thuat-nao-tui-loi-1-1-600x423-2473.jpg'),
     ('Nhổ răng sữa trẻ em', 50000, 15, 5, false, 'Nhổ răng sữa cho trẻ em khi răng đã rụng hoặc cần loại bỏ.', 'https://nhakhoakim.com/wp-content/uploads/2018/08/nha-khoa-tre-em-o-tpchm-1.jpg'),
     ('Nhổ răng vĩnh viễn mọc thẳng', 400000, 20, 5, false, 'Nhổ răng vĩnh viễn mọc thẳng để giải quyết các vấn đề răng miệng.', 'https://nhakhoanhantam.com/stmresource/files/nho-rang/rang-nho-roi-co-moc-lai-khong-cach-phuc-hoi-rang.jpg'),
     ('Nhổ răng khôn hàm dưới', 1500000, 45, 5, false, 'Nhổ răng khôn hàm dưới khi cần thiết để giảm đau và ngăn ngừa các vấn đề.', 'https://nhakhoanhantam.com/stmresource/files/nho-rang/nhung-luu-y-khi-nho-rang-khon-ham-duoi.jpg'),
     ('Nhổ răng khôn hàm trên', 800000, 45, 5, false, 'Nhổ răng khôn hàm trên khi cần thiết để giảm đau và ngăn ngừa các vấn đề.', 'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2024/1/6/nho-rang1-170451102817991690027.jpg'),
     ('Tẩy trắng răng tại phòng khám', 1500000, 40, 6, false, 'Dịch vụ tẩy trắng răng tại phòng khám để làm sáng màu răng.', 'https://kandental.com/wp-content/uploads/2018/04/TAY-TRANG-BANG-DEN.jpg'),
     ('Tẩy trắng răng tại nhà', 1000000, 40, 6, false, 'Tẩy trắng răng tại nhà với các sản phẩm chuyên dụng.', 'https://nhakhoalinhxuan.com/wp-content/uploads/2018/12/mang-tay-trang-rang-tai-nha.jpg'),
     ('Tẩy trắng răng kết hợp', 2200000, 40, 6, false, 'Kết hợp tẩy trắng răng tại phòng khám và tại nhà để đạt hiệu quả tối ưu.', 'https://nhakhoacheese.vn/wp-content/uploads/2022/08/tay-trang-rang_taimuihongsg.jpeg'),
     ('Tẩy trắng nội nha', 500000, 40, 6, false, 'Tẩy trắng răng nội nha để làm sáng màu răng từ bên trong.', 'https://nhakhoaaquacare.com/wp-content/uploads/2016/05/tay-trang-rang-2.jpg'),
     ('Chốt, cùi giả', 1000000, 40, 7, false, 'Chốt và cùi giả để thay thế răng bị hư hỏng.', 'https://cdn.nhathuoclongchau.com.vn/unsafe/https://cms-prod.s3-sgn09.fptcloud.com/tong_quan_ve_tai_tao_cui_rang_va_cac_diem_can_luu_y_1_Cropped_19005ae560.jpg'),
     ('Răng sứ tháo lắp', 800000, 30, 8, false, 'Răng sứ tháo lắp giúp thay thế các răng bị mất hoặc bị hư hỏng.', 'https://nhakhoadaiviet.vn/wp-content/uploads/2015/12/rang-su-thao-l%C4%83p.png');

INSERT INTO distribution_supplies (address,contact_person,distribution,email,is_deleted,name,note,tax_code) VALUES
	 ('Số 237 phố Phú Viên, Phường Bồ Đề, Quận Long Biên, Hà Nội','Phạm Hải Yến','CÔNG TY TNHH THƯƠNG MẠI VÀ DƯỢC PHẨM HÀ NỘI','hanoipharma@gmail.com',0,'HANOI PHARMACEUTICAL AND TRADING CO ., LTD','0106451147 - 24/01/2014','	0106451147'),
	 ('195 Lê Cao Lãng, Phường Phú Thạnh, Quận Tân Phú, Thành Phố Hồ Chí Minh, Việt Nam.','Nguyễn Thục Đăng Quyên','CÔNG TY TNHH THIẾT BỊ Y TẾ GDENT','info@gdent.vn',0,'GDENT CO., LTD','0315403683 - 23/11/2018','0315403683'),
	 ('37 Bàu Cát 3, Phường 14, Quận Tân Bình, TP Hồ Chí Minh','Huỳnh Thanh Đạm','CÔNG TY TNHH THIẾT BỊ Y TẾ MEDENT','info@medent.vn',0,'	MEDENT CO.,LTD','0312439106 - 29/08/2013','0312439106'),
	 ('Số 1, ngõ 135 phố Núi Trúc, Phường Kim Mã, Quận Ba Đình, Hà Nội','	Hoàng Minh Dũng','TỔNG CÔNG TY THIẾT BỊ Y TẾ VIỆT NAM - CTCP',' info@vinamed.com.vn',0,'	VINAMED','0100124376 - 19/10/1996','0100124376'),
	 ('17 Sông Thương, Phường 2, Quận Tân Bình, TP Hồ Chí Minh','Phạm Văn Hùng','CÔNG TY CỔ PHẦN TRANG THIẾT BỊ Y NHA KHOA VIỆT ĐĂNG','info@vietdangdental.com',0,'VIET DANG MDE JSC','0312024302 - 25/10/2012','0312024302');

INSERT INTO dental_supplies (supplies_name,  distribution_id,is_deleted)
VALUES
('Khâu',  1,false),
('Mắc cài',  1,false),
('Dây cung', 1,false),
('Chỉ nha khoa',  1,false),
('Gương nha khoa',  1,false),
('Kềm nhổ răng',  1,false),
('Bàn chải nha khoa',  1,false),
('Cạo vôi răng',  1,false),
('Cần chỉnh nha',  1,false),
('Đèn chiếu quang',  1,false),
('Máy xquang nha khoa',  1,false),
('Khí cụ mở miệng',  1,false),
('Dao phẫu thuật',  1,false),
('Dụng cụ nạo túi nha chu',  1,false),
('Bơm tiêm nha khoa',  1,false),
('Găng tay y tế',  1,false),
('Máy siêu âm',  1,false),
('Dụng cụ thử tủy',  1,false),
('Máy trám răng',  1,false),
('Đũa hút nước bọt',  1,false),
('Dụng cụ nén bông',  1,false),
('Mỏ neo răng',  1,false),
('Dụng cụ đo chĐiều sâu túi nha chu',  1,false),
('Chất hàn răng',  1,false),
('Máy mài răng',  1,false),
('Khay lấy dấu răng',  1,false),
('Chất lấy dấu răng',  1,false),
('Máy chiếu phim X-quang',  1,false),
('Nút nha khoa',  1,false),
('Kềm cắt dây',  1,false),
('Kềm kẹp máu',  1,false),
('Dụng cụ định hình tủy răng',  1,false),
('Găng tay cao su',  1,false),
('Kính bảo hộ',  1,false),
('Nha cụ phân tách',  1,false),
('Kềm kẹp gắp dụng cụ',  1,false),
('Khay dụng cụ',  1,false),
('Chất làm tê tại chỗ',  1,false),
('Đầu đèn LED',  1,false),
('Máy hút dịch nha khoa',  1,false),
('Dụng cụ đo lường răng',  1,false),
('Dụng cụ lấy tủy răng',  1,false),
('Chất làm đầy răng tạm thời',  1,false),
('Máy đo độ nhạy cảm răng', 1,false),
('Dụng cụ nạo sâu răng',  1,false),
('Dụng cụ kiểm tra khớp cắn',  1,false),
('Dụng cụ nén amalgam',  1,false),
('Kẹp nha khoa',  1,false),
('Mũi khoan nha khoa',  1,false),
('Băng vệ sinh miệng',  1,false),
('Máy đo độ pH miệng',  1,false),
('Kéo nha khoa',  1,false),
('Dụng cụ lấy cao răng siêu âm',  1,false),
('Dụng cụ lấy cao răng thủ công',  1,false),
('Chất bảo vệ men răng',  1,false),
('Đèn trám răng',  1,false),
('Dụng cụ chỉnh hình miệng',  1,false),
('Kẹp dây cung',  1,false),
('Bộ dụng cụ chỉnh hình',  1,false),
('Chất làm sạch ống tủy',  1,false);


INSERT INTO abnormality (name, is_deleted)
VALUES
('Viêm nướu', false),
('Viêm túi nha chu', false),
('Mất răng', false),
('Áp xe răng', false),
('Viêm tủy răng', false),
('Sứt mẻ', false),
('Gãy răng', false),
('Trám răng hỏng', false),
('Mất xương', false),
('Tiêu xương', false),
('Mòn men răng', false),
('Răng mọc lệch', false),
('Núm phụ', false),
('Răng nằm ngược', false),
('Cột đen trên răng', false),
('Tủy răng bị chết', false),
('Răng lõm hoặc lồi', false),
('Nang chân răng', false),
('Răng bị thâm đen', false),
('Vùng xâm nhập của mảng bám', false);

INSERT INTO imaging_planes (name, is_deleted)
VALUES
('Hướng', false),
('Trước', false),
('Sau', false),
('Trên', false),
('Dưới', false),
('Bên trái', false),
('Bên phải', false);

INSERT INTO medical_history (name,is_deleted) VALUES
('Cảm lạnh',false),
('Đau đầu',false),
('Tiểu đường',false),
('Huyết áp cao',false),
('Đau dạ dày',false),
('Trào ngược dạ dày',false),
('Viêm phế quản',false),
('Viêm họng',false),
('Viêm amidan',false),
('Viêm phổi',false),
('Viêm gan',false),
('Viêm mật',false),
('Viêm thận',false),
('Viêm bàng quang',false),
('Viêm ruột thừa',false),
('Viêm ruột kết',false),
('Viêm ruột già',false),
('Viêm nhiễm đường tiểu',false),
('Viêm nhiễm đường ruột',false),
('Tiêu chảy',false),
('Táo bón',false),
('Chứng suyễn',false),
('Hen suyễn',false),
('Viêm khớp',false),
('Đau xương khớp',false),
('Viêm xương',false),
('Cứng cổ',false),
('Đau vai gáy',false),
('Đau lưng',false),
('Đau dây thần kinh tọa',false),
('Đau đốt sống',false),
('Cột sống trụy',false),
('Cao huyết áp',false),
('Thấp huyết áp',false),
('Thiếu máu não',false),
('Đau tim',false),
('Mất trí nhớ',false),
('Trầm cảm',false),
('Lo âu',false),
('Suy giảm trí tuệ',false),
('Mất ngủ',false),
('Rối loạn tiền đình',false),
('Đau mắt',false),
('Viêm mắt',false),
('Viêm tai giữa',false),
('Viêm tai ngoài',false),
('Đau răng',false),
('Viêm nướu',false),
('Viêm amidan',false),
('Viêm tai giữa',false),
('Viêm xoang',false),
('Viêm tinh hoàn',false),
('Viêm tuyến tiền liệt',false),
('Viêm tuyến vú',false),
('U xơ tử cung',false),
('U nang buồng trứng',false),
('U xơ vú',false),
('U gan',false),
('U gan ác tính',false),
('U dạ dày',false),
('U ruột',false),
('U thận',false),
('U tiền liệt tuyến',false),
('U não',false),
('U phổi',false),
('U vú',false),
('U hậu môn',false),
('U tiểu đường',false),
('U gan cấp tính',false),
('U phế quản',false),
('U tuyến nước bọt',false),
('U tiền liệt',false),
('U da',false),
('U mạch máu não',false),
('U trung liên',false),
('U thanh quản',false),
('U gan tái phát',false),
('U da non',false),
('U tiền liệt ác tính',false),
('U tuyến nước bọt ác tính',false),
('U đường tiêu hóa',false),
('U tuyến nước bọt cấp tính',false),
('U tụy',false),
('U dạ dày cấp tính',false),
('U hậu môn ác tính',false),
('U tuyến nước bọt cấp tính',false),
('U tử cung',false),
('U thần kinh ngoại biên',false),
('U da ác tính',false),
('U bàng quang',false),
('U phổi ác tính',false);

INSERT INTO department (department_name,description,is_deleted) VALUES
	 ('Phòng Nha Khoa Tổng Quát','Thực hiện các dịch vụ nha khoa tổng quát, bao gồm khám và điều trị cơ bản.',0),
	 ('Phòng Nha Khoa Cấy Ghép','Thực hiện các quy trình cấy ghép răng.',0),
	 ('Phòng Nha Khoa Chỉnh Hình','Chuyên về chỉnh hình răng và hàm (niềng răng).',0),
	 ('Phòng Khám Răng-Hàm-Mặt','Đánh giá và điều trị các vấn đề về răng miệng, hàm và mặt.',0),
	 ('Phòng Kỹ Thuật','Thực hiện các xét nghiệm hình ảnh như X-ray, CT scan, và MRI để hỗ trợ chẩn đoán.',0),
	 ('Phòng Quản Lý','Điều hành và quản lý các hoạt động của phòng khám hoặc bệnh viện nha khoa.',0),
	 ('Phòng Hành Chính','Xử lý các công việc liên quan đến quản lý hồ sơ bệnh nhân, bảo hiểm và các tài liệu hành chính khác.',0),
	 ('Phòng Kế Toán','Quản lý các vấn đề tài chính, thanh toán và hóa đơn.',0),
	 ('Phòng Dịch Vụ Khách Hàng','Quản lý việc đặt lịch hẹn và đăng ký bệnh nhân.',0),
	 ('Phòng Chẩn Đoán Hình Ảnh','Sử dụng công nghệ hình ảnh để chẩn đoán các vấn đề về răng và hàm.',0)

INSERT INTO specialty (specialty_name,is_deleted) VALUES
('Nha khoa tổng quát',false),
('Chỉnh nha',false),
('Chữa trị viêm nướu',false),
('Chăm sóc răng miệng trẻ em',false),
('Phục hình răng sứ',false),
('Thẩm mỹ nha khoa',false),
('Nha khoa phòng ngừa',false),
('Chỉnh nha trẻ em',false),
('Chữa trị nhiễm trùng răng miệng',false),
('Phục hình nha khoa',false);

INSERT INTO appointment_type (description,is_deleted,type_name) VALUES
	 ('Tái khám',0,'Tái khám'),
	 ('Đăng ký mới',0,'Đăng ký mới');


INSERT INTO issues_treatment_automation (dental_issues_id, treatment_id) VALUES
-- Đau răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),

-- Viêm nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),

-- Chảy máu nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Chảy máu nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Đánh răng nhẹ nhàng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Chảy máu nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng chỉ nha khoa đúng cách')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Chảy máu nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng dung dịch kháng khuẩn')),

-- Sưng nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sưng nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sưng nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sưng nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha chu')),

-- Hơi thở có mùi
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hơi thở có mùi'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng kỹ lưỡng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hơi thở có mùi'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Uống nhiều nước')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hơi thở có mùi'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng nước súc miệng kháng khuẩn')),

-- Răng nhạy cảm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng nhạy cảm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng kem đánh răng cho răng nhạy cảm')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng nhạy cảm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tránh thực phẩm quá nóng hoặc lạnh')),

-- Răng bị sứt mẻ
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị sứt mẻ'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị sứt mẻ'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),

-- Răng bị mòn
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị mòn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng bảo vệ răng khi nghiến răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị mòn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều chỉnh chế độ ăn uống')),

-- Răng lung lay
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng lung lay'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha chu')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng lung lay'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nẹp răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng lung lay'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),

-- Nhiễm trùng răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),

-- Áp xe răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Áp xe răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Áp xe răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dẫn lưu mủ')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Áp xe răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Áp xe răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'nhổ răng')),
-- Mòn men răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mòn men răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng kem đánh răng chứa fluoride')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mòn men răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều chỉnh chế độ ăn uống')),

-- Răng mọc lệch
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng mọc lệch'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng mọc lệch'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),

-- Răng khôn mọc lệch
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng khôn mọc lệch'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng khôn')),

-- Sâu răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sâu răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sâu răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),

-- Loét miệng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Loét miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Loét miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc bôi loét miệng')),

-- Khô miệng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Khô miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Uống nhiều nước')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Khô miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kích thích tiết nước bọt')),

-- Viêm tủy răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm tủy răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm tủy răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc giảm đau và kháng viêm')),

-- Răng ngả màu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng ngả màu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tẩy trắng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng ngả màu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng miếng dán tẩy trắng răng')),

-- Nhiệt miệng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiệt miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiệt miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc bôi giảm đau')),

-- Viêm quanh răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm quanh răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng dung dịch kháng khuẩn')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm quanh răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha chu')),

-- Răng ê buốt
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng ê buốt'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng kem đánh răng cho răng nhạy cảm')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng ê buốt'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tránh thực phẩm quá nóng hoặc lạnh')),

-- Lở loét nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Lở loét nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Lở loét nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),

-- Nướu thâm đen
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nướu thâm đen'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Khám nha sĩ để xác định nguyên nhân và điều trị phù hợp')),

-- Răng thưa
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng thưa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng thưa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),

-- Răng lệch lạc
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng lệch lạc'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng lệch lạc'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),

-- Răng cửa bị hư hại
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng cửa bị hư hại'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng cửa bị hư hại'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),

-- Mất răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Cấy ghép răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Làm cầu răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng răng giả')),

-- Răng mọc thêm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng mọc thêm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng mọc thêm')),

-- Đau quai hàm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau quai hàm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng bảo vệ răng khi nghiến răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau quai hàm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha khoa phù hợp')),

-- Nướu co rút
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nướu co rút'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Ghép nướu')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nướu co rút'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng tốt')),

-- Răng hô
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng hô'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng hô'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Phẫu thuật chỉnh hình')),

-- Răng móm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng móm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng móm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Phẫu thuật chỉnh hình')),

-- Hàm không cân xứng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hàm không cân xứng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Phẫu thuật chỉnh hình hàm')),

-- Răng chèn ép
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng chèn ép'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng chèn ép'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),

-- Sâu ngầm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sâu ngầm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sâu ngầm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),

-- Vôi răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Lấy cao răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng định kỳ')),

-- Viêm lợi do mảng bám
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm lợi do mảng bám'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng chỉ nha khoa')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm lợi do mảng bám'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng kỹ lưỡng')),

-- Mọc mụn nhọt trong miệng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mọc mụn nhọt trong miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mọc mụn nhọt trong miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh vùng miệng sạch sẽ')),

-- Vết cắt trong miệng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vết cắt trong miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Rửa vết thương bằng nước muối')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vết cắt trong miệng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),

-- Nhiễm trùng nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng kỹ lưỡng')),

-- Lệch đường giữa
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Lệch đường giữa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Lệch đường giữa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),

-- Đau răng khi cắn
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau răng khi cắn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng bảo vệ răng khi nghiến răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Đau răng khi cắn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),

-- Răng không đều màu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng không đều màu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tẩy trắng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng không đều màu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng veneer')),

-- Sứt mẻ răng cửa
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sứt mẻ răng cửa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sứt mẻ răng cửa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),

-- Hàm răng không khớp
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hàm răng không khớp'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Hàm răng không khớp'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),

-- Thẩm mỹ
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Thẩm mỹ'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tư vấn và điều trị thẩm mỹ nha khoa')),

-- Mất răng hàng loạt
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng hàng loạt'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng răng giả')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng hàng loạt'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Cấy ghép răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng hàng loạt'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Làm cầu răng')),

-- Viêm lợi do thuốc
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Viêm lợi do thuốc'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Thay đổi thuốc hoặc điều chỉnh liều lượng dưới sự giám sát của bác sĩ')),

-- Nhiễm trùng chân răng
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng chân răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng chân răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),

-- Răng mọc quá nhiều
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng mọc quá nhiều'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng mọc quá nhiều'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),

-- Mất răng cửa
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng cửa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng cửa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Mất răng cửa'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Cấy ghép răng')),

-- Thay đổi màu nướu
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Thay đổi màu nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Khám nha sĩ để xác định nguyên nhân và điều trị phù hợp')),

-- Tiêu xương hàm
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Tiêu xương hàm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Ghép xương')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Tiêu xương hàm'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Cấy ghép răng')),

-- Răng bị đen
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị đen'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tẩy trắng răng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Răng bị đen'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy răng')),

-- Sưng nướu quanh răng khôn
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sưng nướu quanh răng khôn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Sưng nướu quanh răng khôn'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),

-- Nướu bị lở loét
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nướu bị lở loét'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nướu bị lở loét'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc bôi giảm đau')),

-- Vết thương trong miệng do dụng cụ chỉnh nha
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vết thương trong miệng do dụng cụ chỉnh nha'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng kỹ lưỡng')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vết thương trong miệng do dụng cụ chỉnh nha'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng sáp bảo vệ')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Vết thương trong miệng do dụng cụ chỉnh nha'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Khám nha sĩ để xác định nguyên nhân và điều trị phù hợp')),

-- Nứt nẻ môi do thời tiết
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nứt nẻ môi do thời tiết'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng son dưỡng môi')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nứt nẻ môi do thời tiết'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Giữ ẩm cho môi')),

-- Nhiễm trùng chân răng sau phẫu thuật
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng chân răng sau phẫu thuật'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
((SELECT dental_issues_id FROM dental_issues WHERE name = 'Nhiễm trùng chân răng sau phẫu thuật'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng'))
;

INSERT INTO service_treatment (is_deleted, service_id, treatment_id)
VALUES
-- Điều trị tủy, trám răng: Chữa tủy, Trám răng bằng Composite
(false, (SELECT service_id FROM service WHERE service_name = 'Chữa tủy'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),

-- Súc miệng bằng nước muối, vệ sinh răng miệng, sử dụng thuốc kháng sinh: Cạo vôi răng, Nạo túi nha chu, Điều trị viêm lợi do thuốc
(false, (SELECT service_id FROM service WHERE service_name = 'Cạo vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nạo túi nha chu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị viêm lợi do thuốc'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),

-- Đánh răng nhẹ nhàng, dùng chỉ nha khoa đúng cách, súc miệng bằng dung dịch kháng khuẩn: Nạo túi nha chu, Điều trị bệnh lý nướu
(false, (SELECT service_id FROM service WHERE service_name = 'Nạo túi nha chu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Đánh răng nhẹ nhàng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng chỉ nha khoa đúng cách')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng dung dịch kháng khuẩn')),

-- Sử dụng thuốc kháng viêm, vệ sinh răng miệng, điều trị nha chu: Nạo túi nha chu, Điều trị bệnh lý nướu
(false, (SELECT service_id FROM service WHERE service_name = 'Nạo túi nha chu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng viêm')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha chu')),

-- Vệ sinh răng miệng kỹ lưỡng, uống nhiều nước, sử dụng nước súc miệng kháng khuẩn: Cạo vôi răng, Điều trị răng nhiễm màu kháng sinh
(false, (SELECT service_id FROM service WHERE service_name = 'Cạo vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng kỹ lưỡng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị răng nhiễm màu kháng sinh'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Uống nhiều nước')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị răng nhiễm màu kháng sinh'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng nước súc miệng kháng khuẩn')),

-- Dùng kem đánh răng cho răng nhạy cảm, tránh thực phẩm quá nóng hoặc lạnh: Trám răng bằng Composite, Trám răng thẩm mỹ bằng Composite
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng kem đánh răng cho răng nhạy cảm')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng thẩm mỹ bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Tránh thực phẩm quá nóng hoặc lạnh')),

-- Trám răng hoặc bọc răng: Trám bít hố rãnh, Trám răng bằng Composite
(false, (SELECT service_id FROM service WHERE service_name = 'Trám bít hố rãnh'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),

-- Sử dụng bảo vệ răng khi nghiến răng, điều chỉnh chế độ ăn uống: Sứ Zirconia, Trám răng bằng Composite
(false, (SELECT service_id FROM service WHERE service_name = 'Sứ Zirconia'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng bảo vệ răng khi nghiến răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều chỉnh chế độ ăn uống')),

-- Điều trị nha chu, nẹp răng, nhổ răng nếu cần: Nhổ răng sữa trẻ em, Nhổ răng vĩnh viễn mọc thẳng, Nhổ răng khôn hàm dưới
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng sữa trẻ em'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị nha chu')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng vĩnh viễn mọc thẳng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nẹp răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng khôn hàm dưới'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),

-- Sử dụng thuốc kháng sinh, điều trị tủy răng: Chữa tủy, Trám răng bằng Composite, Trám răng thẩm mỹ bằng Composite
(false, (SELECT service_id FROM service WHERE service_name = 'Chữa tủy'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng thẩm mỹ bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),

-- Sử dụng thuốc kháng sinh, dẫn lưu mủ, điều trị tủy hoặc nhổ răng: Chữa tủy, Nạo túi nha chu, Nhổ răng khôn
(false, (SELECT service_id FROM service WHERE service_name = 'Chữa tủy'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Sử dụng thuốc kháng sinh')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nạo túi nha chu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dẫn lưu mủ')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng khôn hàm dưới'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều trị tủy')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng khôn hàm dưới'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng')),

-- Sử dụng kem đánh răng chứa fluoride, điều chỉnh chế độ ăn uống: Cạo vôi răng, Điều trị bệnh lý nướu
(false, (SELECT service_id FROM service WHERE service_name = 'Cạo vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Dùng kem đánh răng chứa fluoride')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Điều chỉnh chế độ ăn uống')),

-- Niềng răng, chỉnh nha: Niềng răng, Chỉnh nha
(false, (SELECT service_id FROM service WHERE service_name = 'Niềng răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Niềng răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Chỉnh nha'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Chỉnh nha')),

-- Nhổ răng khôn: Nhổ răng khôn hàm dưới, Nhổ răng khôn hàm trên
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng khôn hàm dưới'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng khôn')),
(false, (SELECT service_id FROM service WHERE service_name = 'Nhổ răng khôn hàm trên'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Nhổ răng khôn')),

-- Trám răng, bọc răng: Trám răng bằng Composite, Trám răng thẩm mỹ bằng Composite, Bọc răng sứ
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Trám răng thẩm mỹ bằng Composite'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Trám răng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Bọc răng sứ'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Bọc răng sứ')),

-- Vệ sinh răng miệng, súc miệng bằng nước muối: Cạo vôi răng, Điều trị bệnh lý nướu
(false, (SELECT service_id FROM service WHERE service_name = 'Cạo vôi răng'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Vệ sinh răng miệng')),
(false, (SELECT service_id FROM service WHERE service_name = 'Điều trị bệnh lý nướu'), (SELECT treatment_id FROM treatment WHERE treatment_name = 'Súc miệng bằng nước muối'));

INSERT INTO appointment_status (description,is_deleted,status) VALUES
	 ('Cuộc hẹn đã được đặt thành công và đang chờ đến ngày giờ thực hiện.',0,'Đã Đặt'),
	 ('Cuộc hẹn đã được xác nhận bởi nhân viên phòng khám.',0,'Đã Xác Nhận'),
	 ('Cuộc hẹn đang được thực hiện',0,'Đang Diễn Ra'),
	 ('Cuộc hẹn đã được hoàn thành',0,'Hoàn Thành'),
	 ('Cuộc hẹn đã bị hủy bởi khách hàng hoặc phòng khám.',0,'Đã Hủy');

INSERT INTO shift (begin_time,description,end_time,is_deleted,name) VALUES
	 ('07:30:00','Thời gian làm việc từ 7g30 đến 11g 30','11:30:00',0,'Sáng'),
	 ('12:30:00','Thời gian làm việc từ 12g30 đến 16g 30','16:30:00',0,'Chiều'),
	 ('17:30:00','Thời gian làm việc từ 17g30 đến 21g 30','21:30:00',0,'Tối');
INSERT INTO time_of_shift (begin_time,end_time,is_deleted,shift_id) VALUES
	 ('07:30:00','08:00:00',0,1),
	 ('08:00:00','08:30:00',0,1),
	 ('08:30:00','09:00:00',0,1),
	 ('09:00:00','09:30:00',0,1),
	 ('09:30:00','10:00:00',0,1),
	 ('10:00:00','10:30:00',0,1),
	 ('10:30:00','11:00:00',0,1),
	 ('11:00:00','11:30:00',0,1),
	 ('12:30:00','13:00:00',0,2),
	 ('13:00:00','13:30:00',0,2),
	 ('13:30:00','14:00:00',0,2),
	 ('14:00:00','14:30:00',0,2),
	 ('14:30:00','15:00:00',0,2),
	 ('15:00:00','15:30:00',0,2),
	 ('15:30:00','16:00:00',0,2),
	 ('16:00:00','16:30:00',0,2),
	 ('17:30:00','18:00:00',0,3),
	 ('18:00:00','18:30:00',0,3),
	 ('18:30:00','19:00:00',0,3),
	 ('19:00:00','19:30:00',0,3),
	 ('19:30:00','20:00:00',0,3),
	 ('20:00:00','20:30:00',0,3),
	('20:30:00','21:00:00',0,3);

INSERT INTO dental_staff (address,birthday,fullname,gender,imageurl,is_deleted,phone_number,department_id) VALUES
	 ('Bình Minh, Vĩnh Long','1999-08-01T00:00:00.000Z','Nguyễn Thành Trung','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649401/agyvcegqkphlgo1wewqw.jpg',0,'0969 281 254',6),
	 ('Ngã Bảy, Hậu Giang','2000-05-17T00:00:00.000Z','Đặng Hoàng Tuấn','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649418/ssgdza3blqoc7sadlu9x.jpg',0,'0932 756 321',7),
	 ('Thoại Sơn, An Giang','2004-09-24T00:00:00.000Z','Bùi Nhật Đức Anh','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649435/f0hi7pvf3z2trsbff4hd.jpg',0,'0988 654 178',1),
	 ('Vĩnh Thuận, Kiên Giang','2001-05-14T00:00:00.000Z','Đinh Lê Hoàn','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649483/ktcj45jw63drocc8sobw.jpg',0,'0973 737 606',3),
	 ('Vĩnh Thuận, Kiên Giang','2002-09-18T00:00:00.000Z','Đặng Vỹ Khang','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649515/olwzp6ung2humyjtigho.jpg',0,'0909 123 765',8),
	 ('Ninh Kiều, Cần Thơ','1999-12-01T17:00:00.000Z','Nguyễn Thị Nguyệt','FEMALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724649176/ang9p8bf1em87mjrvwu5.jpg',0,'033 714 3598',7);

	
	INSERT INTO doctor (address,birthday,degrees,full_name,gender,image,is_deleted,phone_number,signature,specialty_id) VALUES
	 ('Vĩnh Thuận, Kiên Giang','1990-09-19T00:00:00+07:00','3','Nguyễn Hữu Nam','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724647943/nvxh9fw7gfve3kd1xbtf.jpg',0,'0909 999 999','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724647956/ajr7e28zug7xz2yc3nwk.png',1),
	 ('Long Hòa, Phú Tân, An Giang','1992-01-22T00:00:00+07:00','3','Huỳnh Thúy Hằng','FEMALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648076/qxw4vzxwtsz7el81vqoo.jpg',0,'0912 345 678','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648086/aspn9jqvxntuhvq3gyqy.png',2),
	 ('Ninh Kiều, Cần Thơ','1993-05-12T00:00:00+07:00','3','Lâm Vĩnh Phúc','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648178/zfzc4p1fejsdnjjxgx97.jpg',0,'0868 888 888','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648186/yqrsqjgwhul2oylwhjos.png',3),
	 ('Phú Tân, An Giang','1996-03-27T00:00:00+07:00','3','Nguyễn Minh Thư','FEMALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648266/wodt1tmaaybzkn9uzhbv.jpg',0,'0987 654 321','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648278/fytboghng1uibixoxzvv.png',4),
	 ('Bình Minh, Vĩnh Long','1994-06-16T00:00:00+07:00','3','Nguyễn Thị Huệ','FEMALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648340/fxp7wsdlwtvsnca94czd.jpg',0,'0977 777 777','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648351/sfm5bwz21ukg8ox6ohas.png',5),
	 ('Cái Răng, Cần Thơ','1997-09-19T00:00:00+07:00','3','Bùi Vĩnh Lộc','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648430/iyxqkcyuazphcpkque7e.jpg',0,'0910 199 099','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724648442/v1s4ri7m2hqqfhre9vj5.png',6),
	 ('Thoại Sơn, An Giang','1999-01-01T00:00:00+07:00','3','Bùi Nhật Đức Anh','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724653403/ofbj6ayzzcrxdb85lhto.jpg',0,'0932 737 202','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724653411/aspjvect3dy9yjjv5st2.png',6),
	 ('Vĩnh Thuận, Kiên Giang','1997-07-17T00:00:00+07:00','3','Đinh Lê Hoàn','MALE','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724653463/hyrqjao2iqpdyyqiif2g.jpg',0,'0909 765 431','http://res.cloudinary.com/ddpmzwtbs/image/upload/v1724653472/a3zb8klabcspxzhi6fov.png',2);

	
	INSERT INTO patient (address,birthday,citizen_identification_number,full_name,gender,imageurl,is_deleted,phone_number,`type`) VALUES
	 (NULL,'1999-12-08 00:00:00','089099156457','Trịnh Văn Bền','MALE','',0,'0909 281 254',0),
	 (NULL,'1992-12-04 00:00:00','089092789678','Nguyễn Thị Hồng','FEMALE','',0,'0969 281 254',0),
	 (NULL,'1997-12-09 00:00:00','089097109546','Nguyễn Thị Trâm','FEMALE','',0,'0932 756 412',0),
	 (NULL,'1990-12-03 00:00:00','089090278337','Hồ Tuấn Tú','MALE','',0,'0934 567 888',0),
	 (NULL,'1993-12-08 00:00:00','089093789543','Nguyễn Hoài Bảo','MALE','',0,'0978 765 282',0);

	
	INSERT INTO account (email,is_deleted,password,status,dental_staff_id,doctor_id,patient_id,role_id) VALUES
	 ('trung2894@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,1,NULL,NULL,1),
	 ('hoangtuan97531@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,2,NULL,NULL,2),
	 ('dkhang709@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,5,NULL,NULL,2),
	 ('ducanhnhatbui@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,NULL,7,NULL,3),
	 ('hoanledinhlv100@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,NULL,8,NULL,3),
	 ('trung12894@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,NULL,NULL,1,4),
	 ('kczilk@gmail.com',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,NULL,NULL,2,4),
	 ('khangdvpc05402@fpt.edu.vn',0,'$2a$10$QwUeGvKTnS6rkc8tOAH8ZeaZR0e9M9i810PBl4k9jyPgMfAZCtKKS',0,6,NULL,NULL,5);

	
INSERT INTO doctor_schedule (create_at,`date`,is_available,is_deleted,update_at,doctor_id,shift_id) VALUES
	 ('2024-08-26 12:37:04.920000','2024-08-29 00:00:00',0,0,'2024-08-26 12:37:04.920000',5,3),
	 ('2024-08-26 12:37:04.920000','2024-08-29 00:00:00',0,0,'2024-08-26 12:37:04.920000',5,2),
	 ('2024-08-26 12:37:04.920000','2024-08-29 00:00:00',0,0,'2024-08-26 12:37:04.920000',5,1),
	 ('2024-08-26 12:37:04.921000','2024-08-28 00:00:00',0,0,'2024-08-26 12:37:04.921000',4,1),
	 ('2024-08-26 12:37:04.921000','2024-08-28 00:00:00',0,0,'2024-08-26 12:37:04.921000',4,3),
	 ('2024-08-26 12:37:04.921000','2024-08-28 00:00:00',0,0,'2024-08-26 12:37:04.921000',4,2),
	 ('2024-08-26 12:40:54.761000','2024-08-31 00:00:00',0,0,'2024-08-26 12:40:54.761000',4,2),
	 ('2024-08-26 12:40:54.762000','2024-08-31 00:00:00',0,0,'2024-08-26 12:40:54.762000',4,3),
	 ('2024-08-26 12:40:54.761000','2024-08-31 00:00:00',0,0,'2024-08-26 12:40:54.761000',4,1),
	 ('2024-08-26 13:11:34.246000','2024-08-30 00:00:00',0,0,'2024-08-26 13:11:34.246000',4,1);
INSERT INTO doctor_schedule (create_at,`date`,is_available,is_deleted,update_at,doctor_id,shift_id) VALUES
	 ('2024-08-26 13:11:34.246000','2024-08-30 00:00:00',0,0,'2024-08-26 13:11:34.246000',4,2),
	 ('2024-08-26 12:53:08.542000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,3),
	 ('2024-08-26 12:53:08.542000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,3),
	 ('2024-08-26 12:53:08.541000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,3),
	 ('2024-08-26 12:53:08.542000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,2),
	 ('2024-08-26 12:53:08.541000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,2),
	 ('2024-08-26 12:53:08.542000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,2),
	 ('2024-08-26 12:53:08.541000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,2),
	 ('2024-08-26 12:53:08.541000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,3),
	 ('2024-08-26 12:53:08.541000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,2),
	 ('2024-08-26 12:53:08.541000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.541000',3,3),
	 ('2024-08-26 12:53:08.541000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.541000',2,2),
	 ('2024-08-26 12:53:08.541000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.541000',2,3),
	 ('2024-08-26 12:53:08.542000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.542000',2,3),
	 ('2024-08-26 12:53:08.542000','2024-08-02 00:00:00',0,0,'2024-08-26 12:53:08.542000',2,2),
	 ('2024-08-26 12:53:08.542000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.542000',2,3),
	 ('2024-08-26 12:53:08.542000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,2),
	 ('2024-08-26 12:53:08.542000','2024-08-03 00:00:00',0,0,'2024-08-26 12:53:08.542000',2,2),
	 ('2024-08-26 12:53:08.542000','2024-08-01 00:00:00',0,0,'2024-08-26 12:53:08.542000',1,3),
	 ('2024-08-26 13:03:43.916000','2024-08-01 00:00:00',0,0,'2024-08-26 13:03:43.916000',6,1);
INSERT INTO doctor_schedule (create_at,`date`,is_available,is_deleted,update_at,doctor_id,shift_id) VALUES
	 ('2024-08-26 13:03:43.916000','2024-08-01 00:00:00',0,0,'2024-08-26 13:03:43.916000',5,1),
	 ('2024-08-26 13:03:53.979000','2024-08-02 00:00:00',0,0,'2024-08-26 13:03:53.979000',4,1),
	 ('2024-08-26 13:03:53.979000','2024-08-02 00:00:00',0,0,'2024-08-26 13:03:53.979000',5,1),
	 ('2024-08-26 13:04:01.796000','2024-08-03 00:00:00',0,0,'2024-08-26 13:04:01.796000',6,1),
	 ('2024-08-26 13:04:01.796000','2024-08-03 00:00:00',0,0,'2024-08-26 13:04:01.796000',4,1),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,3),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,2),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,3),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,2),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,2),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',6,3),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,2),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,3),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,2),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,3),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,2),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',2,3),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,2),
	 ('2024-08-26 13:04:42.875000','2024-08-04 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,3),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,2),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,2),
	 ('2024-08-26 13:04:42.875000','2024-08-05 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,3),
	 ('2024-08-26 13:04:42.875000','2024-08-06 00:00:00',0,0,'2024-08-26 13:04:42.875000',4,3),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,2),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,3),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,1),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,3),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,1),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,1),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,2),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,3),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,1),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,2),
	 ('2024-08-26 13:04:51.476000','2024-08-07 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,3),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',3,2),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,3),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,1),
	 ('2024-08-26 13:04:51.476000','2024-08-08 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,2),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,1),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,3),
	 ('2024-08-26 13:04:51.476000','2024-08-09 00:00:00',0,0,'2024-08-26 13:04:51.476000',2,2),
	 ('2024-08-26 13:05:01.803000','2024-08-04 00:00:00',0,0,'2024-08-26 13:05:01.803000',3,1),
	 ('2024-08-26 13:05:01.803000','2024-08-06 00:00:00',0,0,'2024-08-26 13:05:01.803000',3,1),
	 ('2024-08-26 13:05:01.803000','2024-08-05 00:00:00',0,0,'2024-08-26 13:05:01.803000',5,1),
	 ('2024-08-26 13:05:01.803000','2024-08-05 00:00:00',0,0,'2024-08-26 13:05:01.803000',3,1),
	 ('2024-08-26 13:05:01.803000','2024-08-04 00:00:00',0,0,'2024-08-26 13:05:01.803000',5,1),
	 ('2024-08-26 13:05:01.803000','2024-08-06 00:00:00',0,0,'2024-08-26 13:05:01.803000',5,1),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,3),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,1),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,3),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,3),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,1),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,2),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,2),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,1),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,2),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,1),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,1),
	 ('2024-08-26 13:05:11.565000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,3),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',3,2),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,2),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,3),
	 ('2024-08-26 13:05:11.565000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,1),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,2),
	 ('2024-08-26 13:05:11.565000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.565000',2,3),
	 ('2024-08-26 13:05:11.566000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,1),
	 ('2024-08-26 13:05:11.566000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,3),
	 ('2024-08-26 13:05:11.566000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,3),
	 ('2024-08-26 13:05:11.566000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,2),
	 ('2024-08-26 13:05:11.566000','2024-08-10 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,2),
	 ('2024-08-26 13:05:11.566000','2024-08-11 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,1),
	 ('2024-08-26 13:05:11.566000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,1),
	 ('2024-08-26 13:05:11.566000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,3),
	 ('2024-08-26 13:05:11.566000','2024-08-12 00:00:00',0,0,'2024-08-26 13:05:11.566000',5,2),
	 ('2024-08-26 13:05:21.755000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.755000',6,1),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',6,3),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',6,1),
	 ('2024-08-26 13:05:21.755000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.755000',6,2),
	 ('2024-08-26 13:05:21.755000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.755000',6,3),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',6,2),
	 ('2024-08-26 13:05:21.755000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.755000',6,2),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',6,3),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,1),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,2),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,3),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,2),
	 ('2024-08-26 13:05:21.755000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.755000',6,1),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,1),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,1),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,3),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,3),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',2,2),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,2),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,1),
	 ('2024-08-26 13:05:21.756000','2024-08-13 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,3),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,3),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,1),
	 ('2024-08-26 13:05:21.756000','2024-08-14 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,2),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,2),
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,1);
INSERT INTO doctor_schedule (create_at,`date`,is_available,is_deleted,update_at,doctor_id,shift_id) VALUES
	 ('2024-08-26 13:05:21.756000','2024-08-15 00:00:00',0,0,'2024-08-26 13:05:21.756000',4,3),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,1),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,3),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,2),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,2),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,1),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,1),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,2),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,3),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,1),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,3),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,3),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,2),
	 ('2024-08-26 13:05:32.243000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,1),
	 ('2024-08-26 13:05:32.243000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,2),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,2),
	 ('2024-08-26 13:05:32.243000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.243000',3,3),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,1),
	 ('2024-08-26 13:05:32.243000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,3),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,1),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,2),
	 ('2024-08-26 13:05:32.243000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,3),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,2),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,1),
	 ('2024-08-26 13:05:32.243000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,3),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,1),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,2),
	 ('2024-08-26 13:05:32.244000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.244000',5,3),
	 ('2024-08-26 13:05:32.243000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,2),
	 ('2024-08-26 13:05:32.243000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,3),
	 ('2024-08-26 13:05:32.243000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.243000',5,1),
	 ('2024-08-26 13:05:32.244000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,1),
	 ('2024-08-26 13:05:32.244000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,2),
	 ('2024-08-26 13:05:32.244000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,2),
	 ('2024-08-26 13:05:32.244000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,1),
	 ('2024-08-26 13:05:32.244000','2024-08-16 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,3),
	 ('2024-08-26 13:05:32.244000','2024-08-17 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,3),
	 ('2024-08-26 13:05:32.244000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,1),
	 ('2024-08-26 13:05:32.244000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,2),
	 ('2024-08-26 13:05:32.244000','2024-08-18 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,3),
	 ('2024-08-26 13:05:32.244000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,1),
	 ('2024-08-26 13:05:32.244000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,2),
	 ('2024-08-26 13:05:32.244000','2024-08-19 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,3),
	 ('2024-08-26 13:05:32.244000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,1),
	 ('2024-08-26 13:05:32.244000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,2),
	 ('2024-08-26 13:05:32.244000','2024-08-20 00:00:00',0,0,'2024-08-26 13:05:32.244000',1,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,1),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,2),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,3),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,1),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,1),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,2),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,2),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,2),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,1),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,1),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,2),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,3),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,3),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,1),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,2),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,1),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,1),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,2),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,1),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,2),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,3),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,3),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',3,2),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,2),
	 ('2024-08-26 13:05:44.756000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,3),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,1),
	 ('2024-08-26 13:05:44.756000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.756000',5,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,3),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,1),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,2),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,1),
	 ('2024-08-26 13:05:44.756000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,2),
	 ('2024-08-26 13:05:44.756000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,3),
	 ('2024-08-26 13:05:44.756000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.756000',4,1),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,3),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,1),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,2),
	 ('2024-08-26 13:05:44.757000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,2),
	 ('2024-08-26 13:05:44.757000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,3),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,1),
	 ('2024-08-26 13:05:44.757000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,1),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,3),
	 ('2024-08-26 13:05:44.757000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,3),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',4,2),
	 ('2024-08-26 13:05:44.757000','2024-08-21 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,2),
	 ('2024-08-26 13:05:44.757000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,1),
	 ('2024-08-26 13:05:44.757000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,2),
	 ('2024-08-26 13:05:44.757000','2024-08-22 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,3),
	 ('2024-08-26 13:05:44.757000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,1),
	 ('2024-08-26 13:05:44.757000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,2),
	 ('2024-08-26 13:05:44.757000','2024-08-23 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,3),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,1),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,2),
	 ('2024-08-26 13:05:44.757000','2024-08-24 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,3),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,3),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,2),
	 ('2024-08-26 13:05:44.757000','2024-08-25 00:00:00',0,0,'2024-08-26 13:05:44.757000',1,1),
	 ('2024-08-26 13:05:56.868000','2024-09-03 00:00:00',0,0,'2024-08-26 13:05:56.868000',6,2),
	 ('2024-08-26 13:05:56.868000','2024-09-02 00:00:00',0,0,'2024-08-26 13:05:56.868000',6,3),
	 ('2024-08-26 13:05:56.868000','2024-09-02 00:00:00',0,0,'2024-08-26 13:05:56.868000',6,2),
	 ('2024-08-26 13:05:56.868000','2024-09-03 00:00:00',0,0,'2024-08-26 13:05:56.868000',6,3),
	 ('2024-08-26 13:06:13.115000','2024-09-05 00:00:00',0,0,'2024-08-26 13:06:13.115000',2,1),
	 ('2024-08-26 13:06:13.115000','2024-09-06 00:00:00',0,0,'2024-08-26 13:06:13.115000',2,1),
	 ('2024-08-26 13:12:00.831000','2024-08-27 00:00:00',0,0,'2024-08-26 13:12:00.831000',4,1),
	 ('2024-08-26 13:06:13.115000','2024-09-01 00:00:00',0,0,'2024-08-26 13:06:13.115000',2,1),
	 ('2024-08-26 13:06:13.115000','2024-09-07 00:00:00',0,0,'2024-08-26 13:06:13.115000',4,1),
	 ('2024-08-26 13:06:13.115000','2024-09-04 00:00:00',0,0,'2024-08-26 13:06:13.115000',4,1),
	 ('2024-08-26 13:12:00.831000','2024-08-27 00:00:00',0,0,'2024-08-26 13:12:00.831000',4,2),
	 ('2024-08-26 13:12:00.831000','2024-08-27 00:00:00',0,0,'2024-08-26 13:12:00.831000',4,3),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,2),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,1),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,3),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,3),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,1),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,2),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,1),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,2),
	 ('2024-08-26 13:31:08.216000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,2),
	 ('2024-08-26 13:31:08.216000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,1),
	 ('2024-08-26 13:31:08.216000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,3),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,3),
	 ('2024-08-26 13:31:08.216000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,1),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,2),
	 ('2024-08-26 13:31:08.216000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,2),
	 ('2024-08-26 13:31:08.216000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.216000',8,3),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,1),
	 ('2024-08-26 13:31:08.216000','2024-08-27 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,3),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,2),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,2),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,3),
	 ('2024-08-26 13:31:08.216000','2024-08-28 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,1),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,1),
	 ('2024-08-26 13:31:08.216000','2024-08-29 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,3),
	 ('2024-08-26 13:31:08.216000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,1),
	 ('2024-08-26 13:31:08.217000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.217000',7,1),
	 ('2024-08-26 13:31:08.216000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.216000',7,2),
	 ('2024-08-26 13:31:08.217000','2024-08-30 00:00:00',0,0,'2024-08-26 13:31:08.217000',7,3),
	 ('2024-08-26 13:31:08.217000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.217000',7,2),
	 ('2024-08-26 13:31:08.217000','2024-08-31 00:00:00',0,0,'2024-08-26 13:31:08.217000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-01 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-02 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,1),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,3),
	 ('2024-08-26 13:34:47.864000','2024-09-03 00:00:00',0,0,'2024-08-26 13:34:47.864000',8,2),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-04 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-05 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-06 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,1),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,2),
	 ('2024-08-26 13:34:47.864000','2024-09-07 00:00:00',0,0,'2024-08-26 13:34:47.864000',7,3),
	 ('2024-08-26 14:02:47.939000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.939000',7,2),
	 ('2024-08-26 14:02:47.940000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.940000',8,2),
	 ('2024-08-26 14:02:47.940000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.940000',8,1),
	 ('2024-08-26 14:02:47.940000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.940000',8,3),
	 ('2024-08-26 14:02:47.939000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.939000',7,3),
	 ('2024-08-26 14:02:47.939000','2024-08-26 00:00:00',0,0,'2024-08-26 14:02:47.939000',7,1);

	
	
	INSERT INTO treatment_duration (description,is_deleted,quantity) VALUES
	 (NULL,0,1),
	 (NULL,0,2),
	 (NULL,0,3),
	 (NULL,0,4),
	 (NULL,0,5),
	 (NULL,0,6),
	 (NULL,0,7),
	 (NULL,0,8),
	 (NULL,0,9),
	 (NULL,0,10),
	 (NULL,0,11),
	 (NULL,0,12),
	 (NULL,0,13),
	 (NULL,0,14),
	 (NULL,0,15),
	 (NULL,0,16),
	 (NULL,0,17),
	 (NULL,0,18),
	 (NULL,0,19),
	 (NULL,0,20),
	 (NULL,0,21),
	 (NULL,0,22),
	 (NULL,0,23),
	 (NULL,0,24),
	 (NULL,0,25),
	 (NULL,0,27),
	 (NULL,0,28),
	 (NULL,0,29),
	 (NULL,0,39),
	 (NULL,0,31),
	 (NULL,0,32),
	 (NULL,0,33),
	 (NULL,0,34),
	 (NULL,0,35),
	 (NULL,0,36),
	 (NULL,0,37),
	 (NULL,0,38),
	 (NULL,0,39),
	 (NULL,0,40),
	 (NULL,0,41),
	 (NULL,0,42),
	 (NULL,0,43),
	 (NULL,0,44),
	 (NULL,0,45),
	 (NULL,0,46),
	 (NULL,0,47),
	 (NULL,0,48),
	 (NULL,0,49),
	 (NULL,0,50),
	 (NULL,0,51),
	 (NULL,0,52),
	 (NULL,0,53),
	 (NULL,0,54),
	 (NULL,0,55),
	 (NULL,0,56),
	 (NULL,0,57),
	 (NULL,0,58),
	 (NULL,0,59),
	 (NULL,0,60);


     