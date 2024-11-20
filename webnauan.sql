-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2024 lúc 12:26 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webnauan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cacbuocnau`
--

CREATE TABLE `cacbuocnau` (
  `MaBuoc` int(11) NOT NULL,
  `MaCongThuc` int(11) NOT NULL,
  `BuocThucHien` int(11) DEFAULT NULL,
  `HuongDan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cacbuocnau`
--

INSERT INTO `cacbuocnau` (`MaBuoc`, `MaCongThuc`, `BuocThucHien`, `HuongDan`) VALUES
(7, 2, 1, 'Nghêu mua về bạn ngâm tầm 2-3 tiếng cho nghêu nhả bớt cát ra nếu không khi ăn sẽ mất ngon. Bạn có thể cắt thêm vào nước ngâm nghêu 2-3 trái ớt nhé.'),
(8, 2, 2, 'Thơm cắt miếng xéo vừa ăn. Sả cắt xéo, mỏng 3 cây, 2 cây sả còn lại đập dập sau đó cắt khúc 3-4cm. Lá chanh cắt sợi nhỏ. Ớt cắt khoanh tròn, cắt khúc ra. Tỏi bằm nhuyễn.'),
(9, 2, 3, 'Cho 2 muỗng canh dầu ăn vào nồi, cho tỏi vào phi thơm, khi tỏi thơm rồi cho xả cắt khoanh tròn vào, xào tiếp đến khi nghe mùi sả thơm thì cho thơm vào, xào 10s thì cho đường vào, xào tiếp 3p thì cho 0.5 lít nước vào nấu sôi.'),
(10, 2, 4, 'Sau khi nước sôi rồi bạn cho tiếp vào nồi sa tế, hạt nêm, muối, bột ngọt, ớt, tương ớt, nước mắm sau đó quấy đều cho gia vị được hòa quyện cũng như tan vào nhau. Nước me bạn cho nước vào quấy tan rồi cho nước cốt me vào nồi nhé, tùy vào khẩu vị của bạn. Cuối cùng cho sả đập dập, lá chanh, ớt vào quấy đều.'),
(11, 2, 5, 'Cuối cùng là bạn cho nghêu vào nấu chín, nấu đến khi nghêu mở miệng là nghêu chín rồi. Dọn ra ăn nóng bao ngon. Chúc mọi người sẽ thành công với món ăn này.'),
(12, 3, 1, 'Bí ngòi, cà rốt, bắp cải, ớt chuông rửa sạch, thái sợi. Hẹ, và ngò rí rửa sạch, băm nhỏ. Bạc hà rửa sạch. (Nếu không có thì bạn dùng húng lũi để thay thế). Chanh vắt lấy nước cốt, bỏ hạt nếu có, trộn với tất cả nguyên liệu trong Phần sốt trộn.'),
(13, 3, 2, 'Cho 1/2 nước sốt trong tô sốt trộn với bí ngòi, cà rốt, ớt chuông, bắp cải, ngò rí, hẹ. Sau đó bạn nhúng bánh tráng với nước, tiến hành cuốn gỏi. Xếp lớp bánh tráng ở dưới, lớp gỏi ở trên rồi cuốn chắc tay. Bạn nhớ cho bạc hà vào nữa nhé.'),
(14, 3, 3, 'Gỏi cuốn xong sẽ được thành phẩm thế này. Bạn cho 1/2 lượng sốt còn lại vào 1 cái dĩa, trình bày với đậu phộng rang cho xinh. Khi ăn, chấm gỏi cuốn với phần sốt me đậu phộng ấy sẽ thú vị lắm đấy.'),
(15, 4, 1, 'Với phần măng ngâm, các bạn mua về, xả nhiều lần với nước, sau đó đem luộc măng với 1 ít muối trong 10 phút (1 dạng chần măng cho chín), sau đó đem đi rửa sạch lại thêm 2 lần nước nữa, rồi vắt ráo nước.'),
(16, 4, 2, 'Phần tôm và phần thịt luộc với 1 ít muối để đậm đà. Có thể luộc chung với nhau nếu các bạn muốn tiết kiệm thời gian. Sau đó, tôm lột sạch vỏ, lấy chỉ lưng, chừa đuôi, thịt thì cắt thành những lát nhỏ vừa ăn, mình chuộng kiểu cắt thanh dài và thành khối vuông để trông đẹp mắt hơn.'),
(17, 4, 3, 'Cắt nhỏ húng lũi, rau răm theo kiểu thái rối, phần hành lá cắt khúc (có thể bỏ qua nếu các bạn không chịu được mùi hành sống) để chuẩn bị cho phần trộn gỏi. Phần nước mắm trộn gỏi mình làm theo công thức 2:2 - tức là khuấy tan 2 muỗng canh nước mắm với 2 muỗng canh đường đến khi tan, sau đó cho thêm tỏi, ớt băm vào là hoàn thành rồi.'),
(18, 4, 4, 'Rưới nước mắm, rắc các loại rau đã chuẩn bị ở trên vào trộn đều cùng với 1 muỗng canh nước cốt chanh là đã có món gỏi măng trộn vừa lạ vừa quen rồi.'),
(19, 4, 5, 'Sự kết hợp hơi cũ từ tôm, thịt với sự kết hợp mới từ măng ngâm đã tạo nên 1 món gỏi măng trộn tôm thịt vô cùng lạ miệng và hấp dẫn. Nhớ ăn kèm cùng bánh phồng nha. Thanh, ngọt, tươi...là những cung bậc cảm xúc khi bạn thưởng thức món này đó. Làm ngay thôi!'),
(20, 5, 1, 'Đầu tiên, cho 50ml nước cốt cam, 20ml nước cốt chanh, 1 muỗng cà phê đường nâu, 5gr vỏ chanh, 5gr vỏ cam, 1 muỗng cà phê vani vào nồi, bắc lên bếp, khuấy đều khoảng 1 phút.'),
(21, 5, 2, 'Thơm, dâu tây, kiwi rửa sạch, cắt hạt lựu.'),
(22, 5, 3, 'Chuối bóc vỏ, cắt khoanh tròn khoảng 1cm. Cam bóc vỏ, tách lấy múi còn nho rửa sạch, để nguyên trái.'),
(23, 5, 4, 'Cho tất cả trái cây ra tô, rưới đều hỗn hợp nước cốt cam vào, trộn đều. Trang trí thêm lá bạc hà nếu thích và thưởng thức ngay nhé!'),
(24, 6, 1, 'Củ kiệu cắt rửa sạch. Ngâm qua nước muối ít nhất 10 giờ hay qua đêm. Vớt ra xả với nước. Phơi nắng cho ráo (trong khoảng 2 giờ).'),
(25, 6, 2, 'Chanh dây nạo lấy phần ruột, lược qua rây lấy nước cốt. Hòa tan nước cốt chanh dây với đường và ½ thìa cà phê muối. Đun chanh dây trên lửa nhỏ cho tan hết đường. Không đun lửa lớn sẽ làm mất màu và vitamin. Bắc xuống và lược lại một lần nữa rồi để nguội.'),
(26, 6, 3, 'Sắp củ kiệu vào hũ thuỷ tinh. Đổ sốt chanh dây vào 1/2 phần củ kiệu. Ngày hôm sau phần nước chanh dây sẽ tan đầy hũ.'),
(27, 6, 4, 'Món củ kiệu sẽ ngâm chanh dây sẽ được dùng được sau 2-3 ngày ngâm. Mỗi ngày bạn nhớ lắc nhẹ cho nước chanh dây thấm đều củ kiệu. Củ kiệu là món ăn kèm nhưng lại là \"linh hồn\" của mâm cỗ ngày Tết. Thông thường củ kiệu ngâm với giấm sẽ có vị chua hắc nhưng với cách dùng chanh dây này bạn sẽ cảm nhận vị ngọt và chua thanh nhẹ, giúp kích thích vị giác đồng thời hỗ trợ tiêu hóa. Mùa Tết năm nay đừng ngần ngại thử món củ kiệu ngâm chanh dây cho gia đình và người thân thưởng thức nhé.'),
(28, 7, 1, 'Trước tiên, bạn rửa sạch trứng rồi thả vào chảo sâu lòng và đổ nước ngập xâm xấp. Luộc trứng ở lửa vừa. Sau đó, khi trứng chín thì mình đập giập vỏ như hình, lưu ý không đập quá nát.'),
(29, 7, 2, 'Chuẩn bị gừng, ớt, vỏ quế, hoa hồi, hạt tiêu và hành lá đã buộc gọn trong 1 nồi sạch. Chế nước vào nồi và nêm thêm nước tương, đường, bột ngũ vị hương. Tiếp theo, nêm muối cho vừa ăn và đậy nắp đun sôi trong 10 phút. Sau đó, thả trà túi lọc và trứng vào. Lúc này, bạn có thể nêm nếm thêm 1 lần nữa cho nước dùng vừa miệng.'),
(30, 7, 3, 'Đun to lửa cho tới khi nước sôi thì vặn nhỏ bếp và đun liu riu cho trứng ngấm gia vị. Tiếp đó, ta thả thêm hai lát chanh vào, tiếp tục đun nhỏ lửa. Sau 40 phút thì tắt bếp, song vẫn ngâm trứng trong nước dùng thêm khoảng 2 - 3 tiếng nữa rồi mới vớt ra thưởng thức.'),
(31, 7, 4, 'Lòng trắng trứng được nhuộm vân màu không những trông rất đẹp mắt mà còn có độ dai, giòn hơn món trứng luộc bình thường. Cắn thử một miếng ta sẽ bắt gặp phần lòng đỏ bùi ngậy, thoảng hương trà thảo mộc thật dễ chịu.'),
(32, 8, 1, 'Tỏi đem bóc vỏ và băm nhỏ. Ngò rí rửa sạch cắt nhỏ.'),
(33, 8, 2, 'Cho 50g bơ lạt vào tô sau đó thêm tỏi băm, ngò rí cắt nhỏ, thyme, muối và tiêu trộn đều hỗn hợp.'),
(34, 8, 3, 'Bật lò nướng trước 15 phút để lò ổn định nhiệt độ. Cắt bánh mì baguette thành khúc ngắn rồi cắt làm đôi, phết hỗn hợp bơ tỏi vừa trộn lên trên.'),
(35, 8, 4, 'Xếp bánh mì vào khay, rắc 1 ít phô mai parmesan rồi đem đi nướng 15 phút ở 160 độ C là hoàn thành bánh mì bơ tỏi.'),
(36, 8, 5, 'Bánh mì bơ tỏi ra lò có màu nâu giòn lớp bơ tỏi óng ánh cùng phô mai thơm phức phía trên. Cắt lát ra và cùng thưởng thức bánh mì giòn tan thơm mùi của thyme và ngò rí kết hợp với tỏi cùng vị béo ngậy của bơ và phô mai, thật tuyệt vời. Đây là món ăn vặt tuyệt vời cho những ngày rảnh rỗi tại nhà. Bạn có thể dùng kem xúc xích, thịt nguội cùng với tương cà hoặc tương ớt cho buổi sáng, để giải ngấy bạn có thể dùng kèm các món salad cho buổi tối. Bánh mì bơ tỏi và mayonnaise cũng là lựa chọn hoàn hảo.'),
(37, 9, 1, 'Hoa atiso đỏ mua về rửa thật sạch khoảng 10 nước hết cát còn dính lại bên trong cánh hoa. Rửa nhẹ tay tránh làm dập nát cánh hoa.'),
(38, 9, 2, 'Dùng dao tách riêng phần cánh hoa và nhụy. Rửa lại cánh hoa, nhụy khoảng 5 nước nữa. Để nửa ngày cho thật khô nước.'),
(39, 9, 3, 'Cho cánh hoa vào hộp, cứ một lớp hoa một lớp đường, lần lượt cho đến khi hết hoa. Đậy kín ngâm đường 4 ngày cho tan hết.'),
(40, 9, 4, 'Gắp riêng phần cánh hoa ra chảo, sên trên lửa nhỏ cho đến khi cánh hoa hơi héo lại là được. Phần nước còn lại nấu sôi, để nguội làm siro. Bảo quản tủ lạnh dùng dần.'),
(41, 9, 5, 'Khi ăn có thể lấy một ít mứt, siro atiso kết hợp với sữa chua làm sinh tố rất ngon.'),
(42, 10, 1, 'Trộn đều bột gạo, bột năng, men nở, 1 muỗng canh đường. Để hỗn hợp này lên men ở nhiệt độ 35 - 40 độ C trong vòng 1 tiếng rưỡi.'),
(43, 10, 2, 'Thắng đường thốt nốt với 1 muỗng canh nước. Lưu ý khi thắng không đảo lên mà chỉ lắc chảo/nồi.'),
(44, 10, 3, 'Khi đường đã chuyển màu nâu đậm, tắt bếp rồi rót nước cốt dừa vào, trộn đều.'),
(45, 10, 4, 'Khi bột đã ủ xong đợt 1 thì dùng phới trộn đều cho xẹp bớt bọt khí rồi rưới hỗn hợp đường vừa thắng vào trộn đều rồi ủ lần 2 trong vòng 1 tiếng.'),
(46, 10, 5, 'Bột ủ xong trộn đều cho bọt khí phân bố đều trong hỗn hợp bột.'),
(47, 10, 6, 'Chuẩn bị nồi hấp nước đã sôi. Rót bột vào đầy khuôn đã phết dầu rồi cho vào nồi hấp trong 10 phút.'),
(48, 10, 7, 'Khi bánh đã chín thì lấy ra cho bánh nguội hẳn mới bóc bánh để bánh không bị vỡ.'),
(49, 11, 1, 'Nấu nước sốt cay gồm 30ml nước tương, 50ml nước lọc, 40gr đường, 30gr tương cà, 30gr tương ớt, 50gr tương ớt Hàn Quốc, 5gr ớt bột Hàn Quốc, 5gr tỏi băm vào rồi khuấy đều cho sốt hoà quyện.'),
(50, 11, 2, 'Tiếp theo cho 200gr tôm đã bóc vỏ vào chảo, trở đều cho tôm thấm sốt. Rim thêm 5 phút cho tôm chín thì tắt bếp.'),
(51, 11, 3, 'Trên một chiếc chảo khác cho vào 2 muỗng canh dầu ăn, làm nóng dầu rồi cho 20gr hành tây cắt hạt lựu, 10gr tỏi thái lát, 10gr ớt đỏ cắt nhỏ vào phi cho dậy mùi. Khi hành tây chuyển trong bạn cho 400gr cơm nguội'),
(52, 21, 1, 'Đặt chảo lên bếp, cho dầu ăn vào đun nóng. Sau đó, cho hành tím và tỏi băm vào phi thơm.'),
(53, 21, 2, 'Cho thịt ba chỉ vào chảo, xào cho đến khi thịt săn lại và ra mỡ.'),
(54, 21, 3, 'Tiếp theo, thêm tôm khô vào chảo, đảo đều cùng với thịt ba chỉ.'),
(55, 21, 4, 'Cho nước mắm và đường vào, đảo đều cho gia vị thấm vào thịt và tôm.'),
(56, 21, 5, 'Rim tôm và thịt trên lửa nhỏ khoảng 10-15 phút, cho đến khi nước mắm cạn và tôm thịt có màu vàng đẹp.'),
(57, 21, 6, 'Rắc tiêu và hành lá lên trên, trộn đều rồi tắt bếp.'),
(58, 12, 1, 'Gan gà rửa sạch, cố gắng bỏ phần mỡ dính xung quanh rồi thái miếng nhỏ. Đổ sữa tươi ngập gan rồi ngâm khoảng 10-15 phút. Hành tím và tỏi bóc vỏ, băm nhỏ.'),
(59, 12, 2, 'Đun nóng cho tan chảy bơ, cho hành tím và tỏi băm vào xào thơm. Cho gan và tiêu hạt vào (nếu dùng tiêu xay thì chỉ cần cho 1/3 vào lúc này cho thơm), đảo đều tay để gan chín. Lần lượt cho muối, xạ hương đảo đều tiếp. Trước khi tắt bếp rồi bắc qua 1 bên thì rắc tiêu xay vào, đảo đều rồi để khoảng 10 phút cho nguội bớt.'),
(60, 12, 3, 'Cho vừa đủ phần gan vừa xào vào và máy xau thực phẩm, ấn nút và xay tới độ nhuyễn mình muốn.'),
(61, 12, 4, 'Đổ hỗn hợp gan xay vào hộp rồi bỏ vào ngăn mát tủ lạnh khoảng 3-4 tiếng. Nếu làm pate gan vào buổi tối thì sáng hôm sau ngủ dậy là có thể phết ăn cùng bánh mì được rồi.'),
(62, 15, 1, 'Đun chảy 10gr bơ lạt trên lửa vừa, cho vào đó 10gr bột mì, dùng phới khuấy đều để bột hòa quyện vào với bơ khoảng 1-2 phút cho bột chín, thành hỗn hợp sền sệt. Từ từ cho 200ml sữa tươi vào chảo, quấy cho hòa quyện, nấu thêm 1 phút hoặc đến khi dùng tay kéo 1 đường trên dụng cụ mà thấy vệt kéo rõ ràng thì cho phô mai parmesan vào khuấy tan. Thêm một chút tiêu nữa nhé.'),
(63, 15, 2, 'Phết 1 lớp mỏng mù tạt Dijon (hoặc mù tạt vàng) lên 1 mặt bánh, để thêm 1 lát phô mai mềm tùy thích (mình dùng phô mai Cheddar). Gấp thịt nguội làm 4 sau đó xếp lên trên miếng bánh mì đã có mù tạt và phô mai. Lại thêm 1 lớp phô mai lên trên cùng và ghép thành 1 cặp sandwich với 1 lát bánh mì nguyên.'),
(64, 15, 3, 'Cho 5gr bơ nhạt vào chảo, đun chảy rồi đặt 1 cặp sandwich vào chảo, đun lửa nhỏ 2-3 phút cho bánh mì giòn, rám nâu đẹp. Dùng sạn nhấc sandwich lên, thêm bơ vào chảo, đun chảy và áp chảo mặt còn lại. Sau khi cả 2 mặt bánh đều có màu vàng đẹp thì lấy ra đặt lên mâm nướng hoặc rack rưới sốt phô mai đã chuẩn bị lên trên mặt bánh. Đưa vào lò nướng 200 độ (chế độ lửa trên) khoảng 5-10 phút hoặc đến khi sốt phô mai trên mặt sôi và rám vàng. Các bạn nhớ canh, thay đổi vị trí bánh trong lò để lớp bề mặt được rám vàng đều nhé. Sau đó lấy bánh ra ngoài. rắc thêm ít ngò cắt nhỏ là hoàn thành rồi.'),
(65, 15, 4, 'Bánh nên được ăn ngay sau khi nướng thì lớp phô mai vẫn còn tan chảy, bánh mì còn giòn và thơm mùi bơ và phô mai. Cắn miếng đầu tiên bạn sẽ cảm nhận được độ giòn của bánh mì, béo béo thơm thơm của 2 loại phô mai, thịt nguội hơi dai dai và mằn mặn sẽ giúp điều vị phô mai. Kết cấu của bánh vừa dai, vừa giòn, vừa mềm sẽ không làm bạn cảm thấy chán và ngán.'),
(66, 15, 5, 'Đây là món ăn nhẹ đặc trưng ở các quán cafe hoặc quán bar tại nước Pháp xinh đẹp. Croque Monsieur có nghĩa là Quý ông giòn rụm, mô tả đúng chất giòn của chiếc bánh. Ngoài ra còn một phiên bản Croque Madamme - Quý cô giòn rụm thì cách thức cũng y chang nhau có điều \"Quý cô\" được ưu ái đội thêm 1 \"chiếc mũ rộng vành\" là một quả trứng opla xinh xắn.'),
(67, 16, 1, 'Ngâm miến gạo với nước lạnh khoảng 20-30 phút cho đến khi mềm, vớt ráo. Đun sôi khoảng 1 muỗng canh dầu trong chảo cho trứng vào tráng mỏng rồi lấy ra khỏi chảo. Để nguội bớt thì cắt nhỏ. Đun thêm 1 muỗng canh dầu ăn, cho tôm vào đảo săn rồi trút ra đĩa.'),
(68, 16, 2, 'Cà rốt, hành tím, hành lá, giá đỗ làm sạch. Cà rốt thái sợi. Hành lá thái khúc. Hành tím băm nhỏ. Dùng lại chảo, thêm hành tím, cà rốt vào đảo đều cho mềm. Sau đó cho tôm, trứng chiên lúc nãy. Thêm miến, giá, hành lá vào trộn đều tay, dùng đồ gắp làm tơi miến để miến không bị dính vào nhau.'),
(69, 16, 3, 'Nước sốt: Cho 1 muỗng canh nước tương, 1/2 muỗng cà phê đường, 1 muỗng cà phê dầu mè vào chén khuấy đều, cho chén nước sốt vào chảo, đảo đều, làm tơi miến ra, nêm nếm vừa ăn. Tắt bếp, cho muối và hạt tiêu vào chảo và trộn đều.'),
(70, 16, 4, 'Miến xào Singapore hay còn gọi là Mei Fun có màu sắc rất bắt mắt, miến dai giòn, phần thịt tôm săn chắc và ngọt. Đây sẽ là món ăn đầy dinh dưỡng cho cả nhà đổi bữa vào dịp cuối tuần đấy.'),
(71, 18, 1, 'Thịt bò mua về rửa sạch, để ráo sau đó cắt miếng vừa ăn. Tiếp đến cho tất cả các nguyên liệu phần ướp thịt gồm 2 củ tỏi, 3 muỗng canh gừng băm, 5 muỗng canh nước mắm, 2 muỗng canh bột gia vị bò kho, 1,5 muỗng cà phê đường nâu vào ướp cùng trong vòng 30 phút.'),
(72, 18, 2, 'Bắc chảo lên bếp cùng 3 muỗng canh dầu ăn, khi dầu nóng đều thì cho sả, tỏi băm nhuyễn vào phi thơm. Sau đó bạn cho hành tây thái lát mỏng vào đảo đều cho đến khi hơi mềm.'),
(73, 18, 3, 'Lúc này, cho bò vào nấu cùng và thêm sốt cà chua, nấu trong vòng 5 phút thì thêm nước, nước dừa, hoa hồi, tiêu, ớt bột vào đun cho đến khi sôi thì hạ lửa hỏ đun trong vòng 1 giờ đồng hồ.'),
(74, 18, 4, 'Thêm cà rốt cắt miếng, muối, nước tương và sa tế, nấu thêm 40 phút nữa là được. Khi ăn, trụng sợi hủ tiếu qua nước sôi để giữ nóng sau đó cho ra tô cùng với hỗn hợp bò kho, dùng kèm rau thơm và chanh tươi. Bò kho từ lâu đã là món ăn truyền thống của Việt Nam được nhà nhà, người người ưa thích! Chuẩn bị một nồi bò kho ngon đúng điệu cho cả nhà cùng thưởng thức vào bữa sáng hẳn là điều mà bà nội trợ nào cũng muốn làm. Với công thức này, bạn sẽ có được một tô hủ tiếu bò kho chuẩn ngon, hấp dẫn hệt như ngoài hàng, còn chờ gì mà không xắn tay vào bếp làm ngay món ăn hấp dẫn này?'),
(75, 19, 1, 'Sơ chế các loại rau củ: Cà rốt, bí ngòi cắt sợi dài. Nấm linh chi nâu rửa sạch, cắt bỏ gốc, vắt ráo nước. Đậu hũ cắt khối vuông và chiên giòn. Tiếp đến là chế biến món ăn: Phi thơm hành tím và tỏi băm, cho các nguyên liệu vào xào sơ trong 5 phút để chín sơ.'),
(76, 19, 2, 'Nêm hỗn hợp với nước tương, đường (có thể bỏ qua) và một chút nước lọc (để phần rau củ không bị cháy). Mì tàu hũ mua về không cần sơ chế gì cả, chỉ cần chắt ráo nước và bỏ vào chảo trộn đều lên thêm 7-10 phút nữa cho thấm gia vị. Nêm nếm lại cho vừa ăn và thưởng thức thôi.'),
(77, 19, 3, 'Cho thêm đậu hủ chiên giòn lên mặt là xong rồi. Đây cũng là một món nên dùng thử cho những ai đã quá ngán với món chay quen thuộc. Nếu nấu chay các bạn chỉ cần thay hành tím và tỏi bằng hành boa rô nhé. Mì đậu hũ rất thơm khi kết hợp cùng các loại rau củ sẽ vô cùng thanh mát, bổ dưỡng. Đừng tưởng ăn chay là đạm bạt, không đa dạng nha. Thử ngay thôi!'),
(78, 22, 1, 'Nấu nước sốt cay gồm 30ml nước tương, 50ml nước lọc, 40gr đường, 30gr tương cà, 30gr tương ớt, 50gr tương ớt Hàn Quốc, 5gr ớt bột Hàn Quốc, 5gr tỏi băm vào rồi khuấy đều cho sốt hoà quyện.'),
(79, 22, 2, 'Tiếp theo cho 200gr tôm đã bóc vỏ vào chảo, trở đều cho tôm thấm sốt. Rim thêm 5 phút cho tôm chín thì tắt bếp.'),
(80, 22, 3, 'Trên một chiếc chảo khác cho vào 2 muỗng canh dầu ăn, làm nóng dầu rồi cho 20gr hành tây cắt hạt lựu, 10gr tỏi thái lát, 10gr ớt đỏ cắt nhỏ vào phi cho dậy mùi. Khi hành tây chuyển trong bạn cho 400gr cơm nguội, 50gr kim chi cắt nhỏ và 20gr hành lá vào chảo. Rang đều cơm và các nguyên liệu trong chảo cho nóng lên và tơi ra.'),
(81, 22, 4, 'Khi cơm đã tơi đều chúng ta dồn cơm về chính giữa, chừa một khoảng trống bên ngoài chảo. Đánh tan đều 2 quả trứng gà, đổ vào khoảng trống đã chừa xung quanh cơm. Gắp tôm đã rim lên trên cơm và thưởng thức thôi.'),
(82, 22, 5, 'Vậy là chỉ với vài bước đơn giản là bạn đã có được một món cơm chiên lạ miệng và cực kì hấp dẫn rồi'),
(83, 13, 1, 'Làm sạch gà, chặt miếng vừa ăn, ướp gà với 1/2 muỗng canh củ hành tỏi băm nhỏ, vài lát nghệ tươi, 1 muỗng canh hạt nêm, 1 muỗng canh nước mắm, 1/2 muỗng cà phê bột ngọt. Rửa sạch tôm ướp với ít củ hành tỏi băm nhỏ, 1/2 muỗng canh hạt nêm, ít bột ngọt. Ướp thịt gà và tôm khoảng 20\"'),
(84, 13, 2, 'Rửa sạch tất cả rau với nước muối pha loãng để ráo nước. Luộc chín trứng cút lột vỏ'),
(85, 13, 3, 'Cho ít dầu vào nồi phi thơm ít củ hành tỏi băm nhỏ, xào tôm chín cho ra tô để qua một bên.'),
(86, 13, 4, 'Dùng lại nồi phi thơm thêm ít củ hành tỏi băm nhỏ để xào thịt gà,nêm thêm 1 muỗng cà phê màu đều và 1/3 muỗng cà phê bột nghệ vào. Thịt gà săn, cho nước vào sâm sấp mặt thịt. Tuỳ theo độ dai của thịt gà, có thể cho trứng cút vào luôn (để trứng cút thấm nước dùng mới ngon). Nước dùng sôi vài lượt,gà vừa đủ độ mềm, cho tôm vào. Nêm nếm lại vừa khẩu vị'),
(87, 13, 5, 'Nấu nước trụng sơ mì quảng cho ra tô, để tôm thịt trứng lên trên và chan nước dùng vào sâm sấp mặt bánh, thêm hành lá, đậu phộng rang. Ăn kèm với rau, bánh đa nè. Ngon hơn nếu ai ăn được ớt xiêm xanh,cay...thơm ngất ngây luôn...Xin mời'),
(88, 20, 1, 'Cho trứng vịt vào nồi luộc chín trong khoảng 15-20 phút rồi bóc bỏ vỏ.'),
(89, 20, 2, 'Thịt rửa sạch, cắt miếng to cỡ 3 ngón tay gộp lại. Hành tím bóc vỏ, cắt múi cau. Tỏi bóc vỏ, cắt nhỏ.'),
(90, 20, 3, 'Ướp thịt kho tàu với hành tím, tỏi, 5 muỗng canh nước mắm, 1 muỗng canh đường, 1.5 muỗng cà phê muối, 1 muỗng cà phê bột ngọt và 1 muỗng cà phê tiêu trong khoảng 20-30 phút.'),
(91, 20, 4, 'Đun nóng 3 muỗng canh dầu ăn trong nồi lớn rồi hạ nhỏ lửa, cho thịt đã ướp vào, nhanh tay đảo đều khoảng 5-10 phút.'),
(92, 20, 5, 'Khi thấy thịt săn lại thì cho nước 1 trái dừa vào, đậy nắp đun lửa to. Khi nước sôi thì thêm 1 muỗng canh nước màu vào trộn đều. Đậy nắp, đun sôi với lửa lớn khoảng 15-20 phút. Thi thoảng hớt bỏ bọt trắng để nồi thịt kho tàu ngày tết được đẹp mắt nhé.'),
(93, 20, 6, 'Khi nước trong nồi vơi đi thì cho trứng vịt vào, thêm 1 lít nước lọc đun sôi với lửa lớn trong khoảng 20-30 phút.'),
(94, 20, 7, 'Cách nấu thịt kho tàu ngon: Khi nước trong nồi cạn 1 nửa thì hạn nhỏ lửa, đun liu riu đến khi nước sệt và còn lại ít là được.'),
(95, 20, 8, 'Bày trí ra tô và thường thức với cơm. Món thịt kho tàu ngày tết truyền thống đã sẵn sàng rồi đây! Ăn cùng với bánh mì hay cơm đều ngon lành, có thêm đĩa dưa giá nữa thì quá tuyệt vời luôn. Có cách nấu thịt kho tàu ngon lành này, Tết các bạn tự tay làm một nồi cho cả nhà nhé.'),
(96, 23, 1, 'Để làm tôm rim tỏi trước tiên cần làm sạch tôm tươi, cắt bỏ râu, đuôi tôm. Sau đó, ướp tôm tươi với 10gr bột nêm, 25gr đường trắng, 1/2 muỗng cà phê bột ngọt, 1/2 muỗng cà phê muối khoảng 15 phút cho ngấm gia vị.'),
(97, 23, 2, 'Bóc vỏ và băm nhỏ tỏi. Rửa sạch ớt, cắt nhỏ rồi cho cả 2 vào chén.'),
(98, 23, 3, 'Cách làm tôm rim tỏi: Phi thơm tỏi, ớt với 15ml dầu ăn trong chảo. Cho tôm tươi vào, đảo đều 1 phút. Cho tiếp 25ml nước mắm vào, rim nhỏ lửa khoảng 15 phút cho thịt tôm rim ngấm đều gia vị. Tắt bếp, đảo đều.\r\n\r\n'),
(99, 23, 4, 'Cho tôm rim tỏi ra dĩa, ăn cùng cơm trắng rất tuyệt vời. Với cách làm tôm rim tỏi đơn giản sẽ có được thịt tôm rim mềm, ngấm vị mặn mặn, cay nhẹ, rất lôi cuốn. Đặc biệt, với món tôm rim tỏi này rất thích hợp cho những bữa cơm ngày mưa, giúp cả nhà ăn ngon miệng và ăn nhiều cơm hơn nhé.'),
(100, 24, 1, 'Tôm tươi mua về lột bỏ đầu, vỏ và chỉ lưng. Dùng dao cắt dọc sống lưng để khi nấu lên tôm cong lại nhìn đẹp mắt hơn. Đem rửa sạch, thấm khô rồi ướp với 1/3 quả trứng gà đánh tan, 1 muỗng canh bột năng rồi trộn đều.'),
(101, 24, 2, 'Bắc chảo dầu nóng, cho tôm vào chiên giòn rồi vớt ra, cho vào dĩa có lót giấy thấm dầu.'),
(102, 24, 3, 'Ớt chuông xanh đỏ, hành tây và thơm cắt miếng vừa ăn. Nấu nồi nước sôi, cho các loại rau củ vào trụng sơ rồi vớt ra cho vào tô nước đá lạnh, mục đích để giữ được màu sắc đẹp hơn khi xào.'),
(103, 24, 4, 'Hành lá cắt lấy phần đầu hành, cho vào phi thơm với 1 muỗng canh dầu ăn. Cho thêm các loại rau củ, nước cốt me, đường, hạt nêm rồi xào lên cho rau củ thấm gia vị. Thêm vào 1 muỗng canh bột năng pha loãng để tạo độ sánh cho nước xào. Đổ thêm tôm vào trộn đều là hoàn tất món tôm xào rau củ chua ngọt ngon lành rồi.'),
(104, 24, 5, 'Món tôm xào chua ngọt với các loại rau củ không chỉ tạo nên màu sắc bắt mắt, mùi vị lại còn rất hấp dẫn đưa cơm. Nếu còn loay hoay chưa biết nấu gì với những con tôm tươi ngon nhà bạn thì đây chính là một gợi ý tuyệt vời nhé! Tôm xào chua ngọt dùng với cơm nóng trong những bữa trưa hè nóng bức thì còn gì ngon hơn nữa nào!'),
(105, 26, 1, 'Sơ chế gà ác với gừng băm và 50ml rượu trắng, thoa đều gừng và rượu khắp mình gà để khử mùi sau đó đem rửa sạch lại với nước lạnh.'),
(106, 26, 2, 'Bắc nồi lên bếp, cho gà ác vào nồi. Lần lượt cho các nguyên liệu thuốc bắc là xuyên khung, đỗ trọng, thục địa, hoài sơn, táo đỏ, đương quy, đẳng sâm, nhãn nhục và kỷ tử, mỗi loại 15gr vào nồi. Cho vào 700ml nước dừa tươi vào nồi, bật lửa lớn, nấu đến khi sôi.'),
(107, 26, 3, 'Khi nồi hầm sôi, cho vào 20ml rượu trắng, nêm gia vị với 1 muỗng cà phê muối, 1 muỗng canh hạt nêm và 2 muỗng canh đường. Đậy nắp, hầm lửa nhỏ trong 30 phút đến khi gà chín mềm.'),
(108, 26, 4, 'Gà ác tiềm thuốc bắc chín để trong thố và dùng nóng, phần thuốc bắc bên trong có những loại hơi khó ăn nhưng nếu ăn được thì sẽ rất tốt cho cơ thể đấy. Khi ăn bạn có thể chấm thịt gà với muối tiêu vắt thêm tắc. Món gà tiềm thuốc bắc ăn rất ấm bụng, dùng vào những ngày mưa lành lạnh sẽ rất phù hợp. Với hướng dẫn chi tiết từ Cooky, hy vọng các bạn có thể tự nấu tại nhà món gà ác tiềm thuốc bắc thơm ngon bổ dưỡng cho cả gia đình!'),
(109, 27, 1, 'Thịt gà ta mua về rửa sạch, chặt thành miếng vừa ăn. Ướp gà với 10gr hành tím băm, 10gr tỏi băm, 2 muỗng canh nước tương và 1 lòng đỏ trứng gà trong 15 phút cho thấm gia vị.'),
(110, 27, 2, 'Bắc chảo dầu lên bếp, cho sả và lá chanh cắt sợi vào chiên vàng. Để sả và lá chanh được giòn khi chiên, bạn nhớ phơi khô hoặc thấm khô sả và lá chanh trước khi chiên.'),
(111, 27, 3, 'Thịt gà sau khi ướp áo qua lớp bột bắp để khi chiên được giòn hơn. Vẫn chảo dầu đã chiên sả và lá chanh, cho gà vào chiên đến khi vàng đều 2 mặt thì tắt bếp, vớt gà ra giấy thấm dầu để ráo.'),
(112, 27, 4, 'Bắc chảo lên bếp, cho vào chảo 2 muỗng canh gạo, rang 5 phút trên lửa nhỏ đến khi gạo hơi xém vàng thì cho vào 1 muỗng canh hạt đậu xanh cà vỏ. Rang gạo cùng đậu khoảng 3 phút cho dậy mùi thơm. Kế đến cho vào 1 muỗng canh muối hột và 1/2 muỗng canh tiêu hột, rang thêm 3 phút nữa thì tắt bếp, đem xay nhuyễn hỗn hợp trên.'),
(113, 27, 5, 'Cho gà vào chảo, rưới muối đã xay nhuyễn áo đều lên gà. Đảo đều trên lửa nhỏ khoảng 3 phút thì tắt bếp.'),
(114, 27, 6, 'Bày sả chiên lên đĩa, xếp gà đã rang muối lên trên, rải thêm lá chanh và ớt để thêm phần bắt mắt. Hương vị thơm lừng, giòn giòn lạ miệng của thịt gà và hỗn hợp muối rang độc đáo đã tạo nên món gà rang muối thơm ngon khó cưỡng, ăn một lần là nhớ mãi. Đã có công thức rồi, bạn còn chờ gì nữa mà không vào bếp ngay để trổ tài nấu nướng của mình nào!'),
(115, 14, 1, 'Cách làm trứng ngâm:1/ Đổ nước vào nồi, nấu sôi sau đó cho 1 chút giấm và muối (cho giấm và muối để lỡ trứng có nứt thì lòng trắng vẫn nguyên vẹn) vào nước luộc rồi nhẹ nhàng thả trứng vào nồi luộc trong khoảng 5 - 5.30 phút (mẹo, khi luộc được 2p, vớt từng trứng lên dùng muỗng gõ nhẹ vào đầu to của quả trứng cho hơi rạn vỏ rồi thả nhẹ vào luộc tiếp, bảo đảm khi bóc vỏ, 10 quả đẹp đủ 10)2/ Trứng luộc xong ngay lập tức ngâm vào nước đá để hạ nhiệt để không làm trứng tiếp tục chín. Sau khi trứng nguội thì lấy ra bóc. Chú ý bóc nhẹ và cẩn thận vì trứng lòng đào rất mềm và dễ vỡ.3/ Cho tất cả nguyên liệu ngâm trứng vào nồi đun sôi để nguội. Lọc lấy nước ngâm trứng vào thố.4/ Cho trứng vào hộp hỗn hợp nước ngâm cùng hành lá, mè rang và ớt. Để trứng qua đêm là ngon nhất hoặc sau 2h là đã có thể dùng được. Bảo quản trứng trong ngăn mát tủ lạnh được 7 ngày và nhớ là trứng luôn ngập nước ngâm.'),
(116, 14, 2, 'Cách làm nước dùng mì:1/ Rửa sơ Konbu, sau đó cho Konbu vào nồi cùng 3.5L nước lọc. Đun sôi và hạ nhỏ lửa đun Konbu 15 phút, tiếp đến cho cá cơm khô hoặc cá bào vào nấu thêm 20 phút nữa để lấy chất ngọt từ cá và tảo bẹ. Lọc lấy nước dùng qua rây.2/ Đun sôi lại nước dùng vừa lọc, nêm vào Mirin, Hon dashi và muối. Tắt lửa. Ta đã có nước dùng mì, đừng lo nước dùng nhạt vị, vì sau đó chúng ta sẽ chan thêm nước hầm thịt vào tô mì thành phẩm.'),
(117, 14, 3, 'Cách hầm thịt :1/ Thịt heo rửa sạch, cuộn tròn thịt, lấy dây cột chặt.2/ Hành boa rô cắt khúc ngắn, tỏi, gừng cắt lát mỏng, cà rốt cắt khối to, hành tây cắt múi cau to3/ Cho vào nồi: nước dùng + Ryorishu + Mirin + nước tương + đường + cà rốt + hành tây + boa rô + tỏi + gừng nấu sôi tắt lửa . Ta có hỗn hợp nước hầm.4/ Bắt chảo dầu chiên vàng 2 mặt tảng thịt ( cuộn thịt)5/ Cho thịt đã chiên vào nồi nước kho chuẩn bị sẵn, khi hỗn hợp nước kho sôi bùng thì bớt lửa nhỏ, hầm riu riu đến khi thịt mềm, thỉnh thoảng trở đều cuộn thịt (lưu ý nước hầm cạn thì phải châm thêm cho ngập thịt). Nếu bạn hầm bằng nồi áp suất thì 3 lửa là thịt mềm ngon thấm vị, hoàn tất.'),
(118, 14, 4, '\r\nThưởng thức : Đun sôi nước cho mì Udon hoặc mì Ramen vào chần sơ, chủ yếu cho mì rời ra vì mì tươi đã chín sẵn rồi. Cho mì vào tô, xếp thịt và cắt đôi trứng bằng chỉ hoặc để nguyên trứng, chan 1/3 nước hầm thịt và 2/3 nước dùng vào, rắc hành lá cắt nhỏ thêm ít bột ớt 7 vị. Thưởng thức nóng !!👉 Thịt heo hầm kiểu này nếu nhiều thì cất tủ mát, cắt lát thịt heo hầm cho ra dĩa ăn với cơm trắng như món mặn kèm dưa leo, cà chua hoặc cuốn rau sống rất ngon'),
(119, 17, 1, 'Nấm kim châm cắt bỏ phần đuôi rửa sạch để ráo.Thịt xông khói cắt miếng vuông nhỏ. Kim chi vắt khô nước để riêng, rồi thái thành miếng nhỏ. Đánh tơi cơm nguội để tránh bị vón cục khi rang.'),
(120, 17, 2, 'Tỏi bóc vỏ sau đó băm nhỏ. Dầu nóng cho tỏi vào phi và chiên phần thịt xông khói trên lửa trung bình. Tiếp tục cho kim chi vào đảo sơ sau đó cho nấm kim châm vào tiếp tục đảo nhanh.'),
(121, 17, 3, 'Cho cơm vào. Rưới phần nước sốt kim chi đều lên cơm và nhanh tay đảo để cơm và kim chi, thịt xông khói trộn lẫn với nhau Các bạn đảo đến khi hạt cơm săn lại trong vòng 3-4 phút.'),
(122, 17, 4, 'Các bạn tắt bếp, cho dầu mè, mè rang, hành lá băm vào trộn đều rồi nêm nếm lại cho vừa ăn. Cho cơm ra đĩa, gắp trứng chiên rải lên mặt nữa là hoàn thành rồi.'),
(123, 21, 1, 'Đặt chảo lên bếp, cho dầu ăn vào đun nóng. Sau đó, cho hành tím và tỏi băm vào phi thơm.'),
(301, 66, 2, 'Chuẩn bị sô cô la. Dùng dao sắc (dao có răng cưa sẽ hiệu quả hơn trong việc này) để cắt thanh sô cô la thành những miếng nhỏ. Cắt càng nhỏ thì sô cô la sẽ tan chảy càng nhanh. Công thức cơ bản cần khoảng 50g sô cô la cho một cốc sữa khoảng 230ml. Bạn có thể gia giảm nguyên liệu tùy theo độ béo mong muốn. Thêm sô cô la hay giảm sữa là tùy bạn để tạo ra ly sô cô la sữa đúng theo sở thích. Tuy nhiên, việc cắt nhỏ sô cô la cũng không thật sự cần thiết. Vì miếng nhỏ có thể tan trong sữa. Bạn có thể dùng thìa để khuấy hoặc một dụng cụ đặc biệt thường được dùng ở Mexico là cây khuấy bằng gỗ với những vòng tròn.'),
(302, 66, 3, 'Đun chảy sô cô la. Đặt nồi nhỏ lên bếp ở chế độ lửa vừa nhỏ, đun chảy sô cô la với 250ml sữa, khuấy liên tục đến khi sô cô la tan chảy hoàn toàn. Phải luôn chú ý khi đun vì sữa và sô cô la rất dễ cháy. Một cách khác để thay thế cho phương pháp đun trực tiếp là đun cách thủy. Đổ một ít nước vào nồi nhỏ, đun với lửa lớn và đặt một bát kim loại lớn hơn trên miệng nồi. Cho sô cô la vào bát và khuấy đến khi tan chảy hết. Thêm kem vào sô cô la với tỉ lệ 1:1 và khuấy đều để làm sốt ganache. Sốt ganache sẽ được thêm vào cốc sữa của bạn khi hoàn tất. Thêm hương vị vào sốt ganache khi bạn khuấy kem. Dùng phương pháp đun cách thủy sẽ ngăn được việc làm cháy sô cô la, nhưng hãy cẩn thận vì bát sẽ rất nóng khi đun!'),
(303, 66, 4, 'Thêm hương vị. Bạn có thể thêm muối, rượu, gia vị và các hương vị khác tại thời điểm này. Để hương vị thêm đậm đà, bạn cần phải thêm chúng vào sữa sớm hơn. Tuy nhiên, nếu bạn muốn sữa có vị thanh, nhẹ nhàng thì khoan hãy thêm hương vị vào lúc này.'),
(304, 66, 5, 'Giảm xuống lửa vừa. Thêm phần sữa còn lại vào và khuấy liên tục. Nếu bạn thấy có lợn cợn nổi lên, đừng lo, đó là mẩu sô cô la chưa tan chảy hết và sẽ biến mất khi sữa được đun nóng hơn. Thỉnh thoảng, bạn cần phải khuấy mạnh để sô cô la tan chảy hoàn toàn. Nếu hỗn hợp sữa quá nóng hoặc bạn cảm thấy có thể sẽ bị cháy, hãy lấy nồi ra khỏi bếp và tiếp tục khuấy để nhiệt độ giảm dần. Khi hỗn hợp nguội thì lại cho nồi lên bếp. Đừng đun sôi hỗn hợp!'),
(305, 66, 6, 'Rót sữa vào tách nhỏ hoặc cốc lớn để thưởng thức. Trang trí thêm nếu bạn muốn, chẳng hạn như thêm lá bạc hà, ống quế hoặc kem sữa tươi để cốc sữa thơm ngon hơn! Bạn cũng có thể thêm hương vị cho cốc sữa với một ít whiskey, rum, brandy hoặc schnapps bạc hà.'),
(306, 67, 1, 'Đong nửa lon gạo bỏ vào nồi rang đến vàng đều thì tắt bếp.'),
(307, 67, 2, 'Trong lúc rang gạo thì bắc sẵn 1 nồi 2 lít nước.'),
(308, 67, 3, 'Nước sôi, bỏ gạo và yến mạch vào (Do yến mạch mình dùng là loại mix ăn liền nên mình không cần rang trước. Bạn nào dùng yến mạch tươi thì nên rang rồi mới bỏ vào nhé).'),
(309, 67, 4, 'Tắt bếp, đậy nắp vung. Ngâm trong 20 phút.'),
(310, 67, 5, 'Thêm 250ml sữa tươi vào nồi. Nêm thêm sữa đặc nếu muốn uống ngọt. Đun hỗn hợp trong 15 phút nữa.'),
(314, 1, 1, 'Xà lách lặt lấy từng lá lớn không cắt nhỏ'),
(315, 1, 2, 'rửa sạch và để ráo (Ngâm nước muối khoảng 15 phút trước khi rửa cho đảm bảo sạch). Đậu que tước gân hai đầu và hai bên lưng. Cà rốt thái thành sợi vừa dài không quá nhỏ. Dưa leo cũng cắt thành những que dài.'),
(316, 1, 3, 'Thịt gà rửa sạch để ráo và cắt thành khúc dài. Sau đó ướp với tiêu'),
(318, 1, 5, 'xì dầu và hành tỏi băm. Trộn đều và ướp trong vòng 15 phút cho thịt thấm và mềm.'),
(319, 1, 6, 'Bắc nồi nước lên bếp'),
(320, 1, 7, 'khi nước bắt đầu sôi lăn tăn thì cho 1/2 muỗng cà phê muối vào khoáy đều'),
(321, 1, 8, 'tiếp theo cho cà rốt và đậu que vào luộc vừa chín. Không nên luộc chín quá vì như vậy sẽ làm rau bị mềm'),
(322, 1, 9, 'không còn giòn và ngọt nữa. Vớt ra và để ráo nước.'),
(323, 1, 10, 'Bắc chảo nhỏ lên bếp'),
(324, 1, 11, 'cho vào một xíu dầu và xào phần thịt gà cho chín'),
(325, 1, 12, 'để lửa nhỏ cho thịt gà chín đều và thấm đều gia vị. Có thể thay xào bằng việc áp chảo nhưng phải để nguyên miếng gà áp chảo nhé.'),
(326, 1, 13, 'Khi tất cả nguyên liệu đã sẵn sàng thì bắt đầu cuốn. Trải miếng rong biển ra'),
(327, 1, 14, 'mặt trơn để ở ngoài và mặt nhám ở phía bên trong. Xếp lần lượt xà lách'),
(331, 1, 18, 'thịt gà và thêm một ít sốt Mayonnaise cho đậm vị (nếu bạn nào thích ăn béo). Lúc cuốn nhớ vừa cuốn vừa ép xuống cho cuốn chặt và đẹp như vậy khi cắt ra mới không bị đổ nhân.'),
(332, 1, 19, 'Cắt cuốn ra và thưởng thức'),
(333, 1, 20, 'có thể chấm cùng tương ớt và sốt Mayonnaise sẽ rất ngon và béo. Còn không có thể không cần nước sốt vì trong thịt gà đã có gia vị ướp rất vừa miệng rồi nhé.'),
(390, 33, 1, 'trụng mì\r'),
(391, 33, 2, 'Luộc rau\r'),
(392, 33, 3, 'Chế biến nước chấm'),
(393, 34, 1, 'a\r'),
(394, 34, 2, 'b\r'),
(395, 34, 3, 'c');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congthuc`
--

CREATE TABLE `congthuc` (
  `MaCongThuc` int(11) NOT NULL,
  `TenCongThuc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MoTa` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ThoiGianChuanBi` int(11) DEFAULT NULL,
  `TongThoiGianNau` int(11) DEFAULT NULL,
  `PhucVu` int(11) DEFAULT NULL,
  `MaLoaiMonAn` int(11) DEFAULT NULL,
  `TacGia` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AnhChiTiet` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `congthuc`
--

INSERT INTO `congthuc` (`MaCongThuc`, `TenCongThuc`, `MoTa`, `ThoiGianChuanBi`, `TongThoiGianNau`, `PhucVu`, `MaLoaiMonAn`, `TacGia`, `AnhChiTiet`) VALUES
(1, 'Rong Biển Cuộn Rau Củ ', 'Rong biển là món ăn không còn xa lạ và được chế biến với nhiều nguyên liệu khác nhau, và món ăn này chủ yếu được cuộn cơm để làm món ăn no trong những buổi picnic gia đình. Tuy nhiên, sự biến tấu nhẹ nhàng dành cho những bạn không thích ăn cơm, hoặc các bạn ăn Eat Clean thì món này chắc chắn là sự lựa chọn hoàn hảo. Nguyên liệu rất tươi ngon lại chế biến rất đơn giản chắc chắn sẽ là công thức mới hay ho cho các nàng muốn có một hình thể đẹp.', 8, 20, 1, 1, 'Phương Oanh', 'khaivichitiet1.jpg'),
(2, 'Nghêu Hấp Thái', 'Món nghêu hấp thái với những con nghêu ngọt béo hòa quyện cùng vị chua, cay đặc trưng của món thái cùng mùi thơm của xả, lá chanh thật không thể cưỡng lại. Hãy cùng hằng vào bếp để làm nhé.', 15, 20, 1, 1, 'Mỹ Chi', 'khaivichitiet2.jpg'),
(4, 'Gỏi Măng Trộn Tôm Thịt', 'Gỏi Măng Trộn Tôm Thịt là một món gỏi ngon, lạ miệng. Người miền Trung rất thích ăn măng và nhà mình cũng vậy. Măng ngâm này ngoài xào, nấu canh thì làm gỏi ăn chống ngán cũng là món ngon khó lòng bỏ qua. Món này mình kết hợp với tôm thịt để dễ ăn nhất. Nếu đang cần một món cho thực đơn khai vị thì lưu lại luôn nha', 10, 20, 1, 1, 'Phương Linh', 'khaivichitiet4.jpg'),
(5, 'Salad Trái Cây Trộn Chua Ngọt', 'Trái cây vẫn luôn là trợ thủ đắc lực giúp bạn giảm cân hoặc làm đẹp. Tô trái cây trộn mát lạnh, hương vị của các loại trái cây hòa quyện tạo nên hương vị rất ngon. Rất đơn giản và dễ làm nhé!', 10, 20, 4, 4, 'Mạnh Tuấn', 'khaivichitiet5.jpg'),
(6, 'Củ Kiệu Ngâm Chanh Dây', 'Củ kiệu là món ăn kèm nhưng lại là \"linh hồn\" của mâm cỗ ngày Tết. Thông thường củ kiệu ngâm với giấm sẽ có vị chua hắc nhưng với cách dùng chanh dây này bạn sẽ cảm nhận vị ngọt và chua thanh nhẹ, giúp kích thích vị giác đồng thời hỗ trợ tiêu hóa. Mùa Tết năm nay đừng ngần ngại thử món củ kiệu ngâm chanh dây cho gia đình và người thân thưởng thức nhé.', 15, 20, 1, 1, 'Minh Tú', 'khaivichitiet6.jpg'),
(7, 'Trứng Trà Trung Hoa', 'Ở Trung Quốc, người ta dùng trứng ngâm trà như một món ăn nhẹ, đôi khi họ cũng dùng với cơm hoặc cháo. Trứng ngâm trà được bán tại các quầy hàng rong hoặc các cửa hàng lớn. Họ ăn quanh năm, nhưng nhiều nhất là những ngày Tết Nguyên đán bởi họ coi đây là một món ăn mang lại sự thịnh vượng, may mắn.', 10, 30, 5, 5, 'Trung Kiên', 'khaivichitiet7.jpg'),
(8, 'Bánh Mì Bơ Tỏi', 'Bánh mì bơ tỏi có xuất xứ từ nước Pháp và dùng để ăn vặt, ăn xế, ăn sáng,... lúc nào cũng hoàn hảo. Món bánh này vừa thơm ngon lại vô cùng đơn giản', 15, 20, 1, 1, 'Nhữ Bình', 'khaivichitiet8.jpg'),
(9, 'Mứt Hoa Atiso Đỏ', 'Hoa atiso đỏ hay còn gọi là hồng hoa có tác dụng giải độc, mát gan, chứa nhiều vitamin. Đặc biệt món mứt atiso ăn ngọt giòn chua thanh rất hấp dẫn.', 10, 25, 4, 4, 'Kim Oanh', 'khaivichitiet9.jpg'),
(10, 'Bánh Bò Hấp Thốt Nốt', 'Bánh bò hấp thốt nốt thơm ngào ngạt mùi cốt đừa với thốt nốt, lại mềm xốp, ai ăn cũng sẽ thích mê. Các bạn xem clip để biết cách làm chi tiết nhé', 10, 20, 4, 4, 'Phương Anh', 'khaivichitiet10.jpg'),
(12, 'Pate Gan Gà Béo', 'Pate gan gà béo cách làm đơn giản. Pate mịn béo, thơm ngon. Có thể dùng phết lên bánh mì nướng ăn ngay hoặc phết vào trong lòng ở bánh mì, dồi thêm nhân bánh ưa thích vào là được.', 10, 20, 2, 2, 'Ngọc Lê', 'ansangchitiet2.jpg'),
(13, 'Mì Quảng Tôm Thịt Trứng', 'Mì quảng là một trong những món ăn đặc trưng của người Quảng Nam-Đà Nẵng. Lần đầu tiên được ăn mì quảng rất ngon cách đây đã lâu, nên cũng không còn nhớ là ở đâu? Và đôi lần vào vài tiệm mì quảng khác nhau để tìm lại hương vị mình đã từng ăn, nhưng vẫn không đúng khẩu vị... *Tìm hiểu qua nhiều cách nấu, rất đơn giản dễ làm. Biến tấu nguyên liệu, đậm đà hương vị theo khẩu vị nhà mình. Thế là có món mì quảng tại gia cho cả nhà cùng thưởng thức.', 15, 20, 3, 3, 'Kim Oanh', 'ansangchitiet3.jpg'),
(14, 'Mì Udon Thịt Heo Hầm Và Trứng', 'Nếu bạn nào đã thưởng thức qua mì Ramen Nhật Bản sẽ nhận ra tô mì Nhật thường dùng kèm trứng lòng đào ngâm. Ăn vào sẽ cảm nhận vị mặn ngọt thơm của gia vị Nhật ngấm vào trứng từ của Mirin và Sake cùng hành boa rô, gừng, tỏi... Team thích ăn trứng và chuộng mì Nhật đều sẽ thấy ngon lành, hấp dẫn nè', 5, 20, 5, 5, 'Akira', 'ansangchitiet4.jpg'),
(15, 'Sandwich Thịt Nguội Và Phô Mai Nướng Giòn', 'Một món sandwich kẹp thịt và phô mai, trắng và mềm cực kỳ nhàm chán sẽ được biến tấu khi phần bánh được áp chảo giòn rụm. Không những thơm lừng mùi bơ mà còn có thêm 1 lớp sốt phô mai được nướng rám vàng xinh xắn.', 10, 20, 2, 2, 'Mỹ Linh', 'ansangchitiet5.jpg'),
(16, 'Miến xào Singapore', 'Cuối tuần đổi món với miến xào Singapore vừa ngon vừa dễ làm nhé! Làm mới món miến dân dã, quen thuộc với cách làm miến xào Singapore, chắc hẳn sẽ mang đến bạn những trải nghiệm ẩm thực bất ngờ. Món miến xào kiểu Singapore này có màu sắc rất bắt mắt, lại thêm nhiều rau ăn vừa giòn vừa ngọt. Cách làm miến cũng đơn giản mà lại dinh dưỡng. Thích hợp cho cả nhà đổi bữa vào dịp cuối tuần đấy!', 15, 20, 2, 2, 'Trúc Oanh', 'ansangchitiet6.jpg'),
(17, 'Cơm Chiên Kimchi Hàn Quốc', 'Cơm chiên Kimchi - Nghe tên thì các bạn cũng đã biết món ăn này bắt nguồn từ đâu rồi đúng không? Với màu sắc bắt mắt, nổi bật, hương vị thơm ngon đặc trưng, món cơm chiên này dần được người Việt chúng ta yêu thích. Nào cùng tham khảo công thức sau để có một món cơm chuẩn vị nhé!', 10, 25, 5, 5, 'Baek Jong Won', 'ansangchitiet7.jpg'),
(18, 'Hủ Tiếu Bò Kho', 'Bò kho từ lâu đã là món ăn truyền thống của Việt Nam được nhà nhà, người người ưa thích! Chuẩn bị một nồi bò kho ngon đúng điệu cho cả nhà cùng thưởng thức vào bữa sáng hẳn là điều mà bà nội trợ nào cũng muốn làm. Với công thức này, bạn sẽ có được một tô hủ tiếu bò kho chuẩn ngon, hấp dẫn hệt như ngoài hàng, còn chờ gì mà không xắn tay vào bếp làm ngay món ăn hấp dẫn này?', 10, 15, 2, 2, 'Ngọc Lê', 'ansangchitiet8.jpg'),
(19, 'Mì Tàu Hũ Xào Rau Củ', 'Dạo này phong trào Eat clean nở rộ lên như diều gặp gió, mình thì chỉ sử dụng thực đơn này cho những ngày ngán dầu mỡ, và những ngày mình mệt mỏi chán ăn. Được hôm vào siêu thị thì thấy loại mì sợi được làm từ đậu hũ này nên mua và làm luôn món này. Rau củ, đậu hũ, mì đậu hũ, đơn giản là xào với nước tương thôi nhưng lại ngon khỏi bàn luôn.', 15, 20, 2, 2, 'Thanh Chi', 'ansangchitiet9.jpg'),
(20, 'Thịt Kho Tàu Đón Tết', 'Thịt kho tàu là món ăn không thể thiếu trong bữa ăn ngày Tết của người Việt. Miếng thịt béo ngậy, mềm thơm tan từ từ trong miệng, trứng vịt bùi bùi, ăn với cơm nóng thì không còn gì bằng. Cách nấu thịt kho tàu ngon không hề khó một chút nào, chỉ cần vài bước là bạn có nồi thịt kho tàu ngon đúng vị rồi đấy!', 15, 30, 3, 3, 'Trúc Oanh', 'monchinhchitiet1.jpg'),
(21, 'Ba Chỉ Rim Tôm Khô', 'Thịt ba chỉ rim tôm khô là món ngon từ thịt ba chỉ và tôm khô, đặc trưng hương vị của món Việt. Tôm khô rang thịt với vị béo ngậy của thịt ba chỉ kết hợp với vị ngọt thơm của tôm khô tạo nên món ăn hấp dẫn khó cưỡng. Cách chế biến tôm khô trong thịt kho tôm khô này, sẽ làm nổi bật hương vị món ăn, không hề tanh đâu, bắt tay làm ngay nhé!', 20, 40, 1, 1, 'Nguyễn An', 'monchinhchitiet2.jpg'),
(22, 'Cơm Chiên Tôm Cay', 'Vào những ngày quá chán với những món ăn thường ngày, hãy thử chiêu đãi bản thân món Cơm chiên tôm cay cực kì bắt mắt và hấp dẫn mà Cooky giới thiệu dưới đây. Cách làm chỉ với vài bước đơn giản, nguyên liệu thường là những thứ có sẵn trong tủ lạnh thôi mà thành phẩm mang lại không chê vào đâu được.', 20, 25, 2, 2, 'Văn Bình', 'monchinhchitiet3.jpg'),
(23, 'Tôm Rim Tỏi', 'Tôm Rim Tỏi là món rim bắt cơm, giúp đổi vị và chống ngán cho bữa ăn của gia đình. Cách làm tôm rim kết hợp vị tỏi thơm lừng cùng tôm tươi ngọt thịt, thấm đều gia vị cay mặn, đậm đà. Nếu chưa biết làm tôm rim sao cho ngon thì Cooky sẽ mách bạn cách làm tôm rim ngon, đơn giản cho ngày bận rộn, đảm bảo thu hút cả nhà, giúp bữa cơm thêm ngon miệng.', 25, 30, 3, 3, 'Phương Oanh', 'monchinhchitiet4.jpg'),
(24, 'Tôm Xào Rau Củ Chua Ngọt', 'Món tôm xào rau củ chua ngọt với các loại rau củ không chỉ tạo nên màu sắc bắt mắt, mùi vị lại còn rất hấp dẫn đưa cơm. Nếu còn loay hoay chưa biết nấu gì với những con tôm tươi ngon nhà bạn thì đây chính là một gợi ý tuyệt vời nhé!', 30, 60, 3, 3, 'Diệu Chi', 'monchinhchitiet5.jpg'),
(26, 'Gà Ác Tiềm Thuốc Bắc', 'Gà Ác Tiềm Thuốc Bắc là một món ngon từ gà được nhiều người biết đến với công dụng bồi bổ cho sức khỏe. Ngoài ra, gà ác có tính bình, vị ngọt giúp giải toả độc tố trong cơ thể, cho giấc ngủ ngon hơn, món gà ác tiềm thuốc bắc cho bà bầu cực kì tốt. Hãy cùng Cooky khám phá cách nấu gà ác tiềm thuốc bắc cho bà bầu ngon, đơn giản ngay tại nhà nhé!', 15, 40, 3, 3, 'Kim Chi', 'monchinhchitiet7.jpg'),
(27, 'Gà Rang Muối Xả', 'Cùng vào bếp và thực hiện món gà rang muối sả thơm lừng, gọi là muối nhưng hỗn hợp này được làm từ gạo tẻ, đậu xanh và muối biển, được rang chín rồi xay thành hỗn hợp bột mịn, sau đó xóc đều với gà để tạo nên vị thơm bùi, mằn mặn rất hấp dẫn. Món ăn có lớp vỏ giòn tan, thơm bùi, thịt gà bên trong chín mềm, đậm đà, thích hợp cho bữa ăn hằng ngày và cả các dịp lễ, Tết, tiệc tùng bởi hương vị thơm ngon cùng hình thức bắt mắt. Gà rang muối tưởng chừng cầu kỳ, phức tạp nhưng bạn hoàn toàn có thể vào bếp', 18, 45, 3, 3, 'Phương Lan', 'monchinhchitiet8.jpg'),
(33, 'Mì xào', 'Thơm ngon', 15, 25, 2, 1, 'nhật', 'ansang9.jpg'),
(34, 'trái cây', 'Thanh mát', 9, -1, 12, 4, 'nhật', 'Background.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `congthuc_nguyenlieu`
--

CREATE TABLE `congthuc_nguyenlieu` (
  `ID_CongThuc_NguyenLieu` int(11) NOT NULL,
  `MaCongThuc` int(11) NOT NULL,
  `MaNguyenLieu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `congthuc_nguyenlieu`
--

INSERT INTO `congthuc_nguyenlieu` (`ID_CongThuc_NguyenLieu`, `MaCongThuc`, `MaNguyenLieu`) VALUES
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 9),
(19, 2, 18),
(20, 2, 19),
(21, 2, 20),
(22, 2, 8),
(23, 2, 6),
(24, 2, 21),
(25, 2, 22),
(26, 2, 23),
(27, 2, 24),
(28, 2, 62),
(29, 3, 25),
(30, 3, 26),
(31, 3, 27),
(32, 3, 28),
(33, 3, 29),
(34, 3, 30),
(35, 3, 31),
(36, 3, 32),
(37, 3, 33),
(38, 3, 2),
(39, 3, 90),
(40, 3, 7),
(41, 4, 34),
(42, 4, 35),
(43, 4, 36),
(44, 4, 37),
(45, 4, 38),
(46, 4, 39),
(47, 4, 22),
(48, 4, 19),
(49, 4, 9),
(50, 4, 16),
(51, 5, 40),
(52, 5, 41),
(53, 5, 42),
(54, 5, 43),
(55, 5, 44),
(56, 5, 14),
(57, 5, 19),
(58, 6, 46),
(59, 6, 141),
(60, 6, 19),
(61, 6, 6),
(62, 7, 47),
(63, 7, 48),
(64, 7, 49),
(65, 7, 50),
(66, 7, 51),
(67, 7, 19),
(68, 7, 6),
(69, 7, 7),
(70, 7, 16),
(71, 7, 33),
(72, 7, 39),
(73, 7, 38),
(74, 8, 52),
(75, 8, 53),
(76, 8, 54),
(77, 8, 55),
(78, 8, 9),
(79, 8, 132),
(80, 8, 6),
(81, 8, 50),
(82, 9, 56),
(83, 9, 19),
(84, 10, 57),
(85, 10, 58),
(86, 10, 59),
(87, 10, 60),
(88, 10, 19),
(89, 10, 6),
(90, 11, 61),
(91, 11, 62),
(92, 11, 63),
(93, 11, 64),
(94, 11, 65),
(95, 11, 35),
(96, 11, 7),
(97, 11, 19),
(98, 11, 9),
(99, 11, 38),
(100, 11, 47),
(101, 12, 66),
(102, 12, 67),
(103, 12, 53),
(104, 12, 10),
(105, 12, 9),
(106, 12, 6),
(107, 12, 50),
(108, 12, 55),
(109, 13, 68),
(110, 13, 69),
(111, 13, 1),
(112, 13, 35),
(113, 13, 22),
(114, 13, 8),
(115, 13, 20),
(116, 14, 47),
(117, 14, 70),
(118, 14, 71),
(119, 14, 23),
(120, 14, 19),
(121, 14, 33),
(122, 14, 64),
(123, 14, 36),
(124, 14, 9),
(125, 15, 72),
(126, 15, 73),
(127, 15, 74),
(128, 15, 75),
(129, 15, 36),
(130, 15, 53),
(131, 15, 67),
(132, 16, 76),
(133, 16, 77),
(134, 16, 78),
(135, 16, 35),
(136, 16, 63),
(137, 16, 47),
(138, 16, 7),
(139, 16, 6),
(140, 16, 19),
(141, 16, 38),
(142, 16, 49),
(143, 17, 79),
(144, 17, 80),
(145, 17, 65),
(146, 17, 61),
(147, 17, 9),
(148, 17, 63),
(149, 17, 47),
(150, 17, 38),
(151, 18, 81),
(152, 18, 82),
(153, 18, 83),
(154, 18, 9),
(155, 18, 33),
(156, 18, 33),
(157, 19, 84),
(158, 19, 2),
(159, 19, 25),
(160, 19, 63),
(161, 19, 10),
(162, 19, 7),
(163, 19, 19),
(164, 19, 23),
(165, 20, 36),
(166, 20, 9),
(167, 20, 10),
(168, 20, 22),
(169, 20, 6),
(170, 20, 19),
(171, 20, 20),
(172, 20, 47),
(173, 21, 36),
(174, 21, 88),
(175, 21, 22),
(176, 21, 8),
(177, 21, 19),
(178, 21, 63),
(179, 21, 9),
(180, 21, 10),
(181, 22, 61),
(182, 22, 35),
(183, 22, 7),
(184, 22, 62),
(185, 22, 16),
(186, 22, 9),
(187, 22, 63),
(201, 23, 19),
(202, 23, 20),
(203, 23, 6),
(204, 23, 9),
(205, 23, 63),
(206, 23, 22),
(207, 23, 16),
(208, 24, 35),
(209, 24, 14),
(210, 24, 89),
(211, 24, 38),
(212, 24, 64),
(213, 24, 47),
(214, 24, 8),
(215, 24, 63),
(216, 24, 90),
(217, 25, 91),
(218, 25, 60),
(219, 25, 19),
(220, 25, 22),
(221, 25, 9),
(222, 25, 50),
(223, 26, 92),
(224, 26, 93),
(225, 26, 94),
(226, 26, 95),
(227, 26, 96),
(228, 26, 97),
(229, 26, 98),
(230, 26, 99),
(231, 26, 100),
(232, 26, 60),
(233, 26, 19),
(234, 26, 33),
(235, 26, 6),
(236, 27, 1),
(237, 27, 101),
(238, 27, 102),
(239, 27, 7),
(240, 27, 9),
(241, 27, 6),
(242, 27, 50),
(339, 39, 81),
(340, 39, 128),
(341, 39, 129),
(342, 39, 63),
(343, 39, 6),
(344, 39, 19),
(345, 39, 9),
(346, 39, 89),
(347, 39, 122),
(348, 40, 130),
(349, 40, 131),
(350, 40, 132),
(351, 40, 133),
(352, 40, 8),
(353, 40, 22),
(354, 40, 63),
(355, 40, 29),
(356, 41, 134),
(357, 41, 11),
(358, 41, 62),
(359, 41, 132),
(360, 41, 6),
(361, 42, 67),
(362, 42, 135),
(363, 42, 136),
(364, 42, 137),
(365, 42, 138),
(366, 42, 139),
(367, 42, 19),
(368, 43, 140),
(369, 43, 141),
(370, 43, 142),
(371, 43, 19),
(372, 43, 67),
(373, 44, 143),
(374, 44, 144),
(375, 44, 23),
(376, 44, 67),
(377, 44, 19),
(378, 44, 63),
(379, 44, 47),
(380, 45, 145),
(381, 45, 146),
(382, 45, 147),
(383, 45, 67),
(384, 45, 19),
(385, 45, 41),
(386, 45, 53),
(387, 46, 57),
(388, 46, 58),
(389, 46, 59),
(390, 46, 60),
(391, 46, 19),
(392, 46, 6),
(393, 47, 19),
(394, 47, 148),
(395, 47, 23),
(396, 47, 143),
(397, 47, 73),
(398, 48, 19),
(399, 48, 143),
(400, 48, 149),
(401, 48, 150),
(402, 48, 23),
(403, 48, 60),
(404, 49, 19),
(405, 49, 143),
(406, 49, 151),
(407, 49, 60),
(408, 50, 143),
(409, 50, 152),
(410, 50, 67),
(411, 51, 143),
(412, 51, 147),
(413, 51, 23),
(414, 51, 19),
(415, 51, 67),
(416, 52, 19),
(417, 52, 143),
(418, 52, 153),
(419, 52, 154),
(420, 52, 23),
(421, 53, 23),
(422, 53, 19),
(423, 53, 60),
(424, 53, 143),
(425, 53, 140),
(426, 54, 19),
(427, 54, 23),
(428, 54, 60),
(429, 54, 145),
(430, 54, 143),
(431, 55, 60),
(432, 55, 146),
(433, 55, 143),
(434, 55, 19),
(435, 55, 23),
(436, 56, 138),
(437, 56, 48),
(438, 56, 19),
(439, 56, 23),
(440, 56, 28),
(441, 57, 41),
(442, 57, 155),
(443, 57, 14),
(444, 57, 48),
(445, 57, 39),
(446, 57, 129),
(447, 58, 19),
(448, 58, 23),
(449, 58, 60),
(450, 58, 145),
(451, 58, 143),
(452, 59, 48),
(453, 59, 156),
(454, 60, 48),
(455, 60, 158),
(456, 60, 67),
(457, 60, 19),
(458, 60, 23),
(459, 61, 157),
(460, 61, 158),
(461, 61, 67),
(462, 61, 19),
(463, 61, 23),
(464, 62, 67),
(465, 62, 19),
(466, 62, 148),
(467, 62, 156),
(468, 63, 159),
(469, 63, 145),
(470, 63, 146),
(471, 64, 160),
(472, 64, 156),
(473, 64, 129),
(474, 64, 39),
(475, 65, 48),
(476, 65, 39),
(477, 65, 19),
(478, 65, 23),
(479, 65, 162),
(480, 66, 163),
(481, 66, 164),
(482, 66, 67),
(483, 67, 165),
(484, 67, 102),
(485, 67, 67),
(486, 67, 23),
(492, 1, 1),
(493, 1, 2),
(494, 1, 3),
(495, 1, 4),
(496, 1, 5),
(497, 1, 6),
(498, 1, 7),
(499, 1, 8),
(500, 1, 9),
(501, 1, 10),
(502, 1, 11),
(503, 1, 12),
(504, 1, 13),
(568, 33, 2),
(569, 33, 4),
(570, 33, 7),
(571, 33, 84),
(572, 34, 123);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'dddddd', 'sada@gmail.com', 'dddddddddddddddddddddddddđ', '2024-11-05 06:43:21'),
(2, 'trrrrrrrrrrrrr', 'rtttttttttttt@gmail.com', 'rtttttttttttttttttttttttt', '2024-11-05 06:44:12'),
(3, 'rrrrrrrrrrrrrr', 'sada@gmail.com', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr', '2024-11-05 06:44:41'),
(4, 'êrer', 'sada@gmail.com', 'SSSSSSSSSSSSSSSSAFFFFFFFFFFFFF', '2024-11-05 06:48:21'),
(5, 'êrer', 'sada@gmail.com', 'SSSSSSSSSSSSSSSSAFFFFFFFFFFFFF', '2024-11-05 06:49:11'),
(6, 'êrer', 'sada@gmail.com', 'SSSSSSSSSSSSSSSSAFFFFFFFFFFFFF', '2024-11-05 06:49:15'),
(7, 'êrer', 'sada@gmail.com', 'SSSSSSSSSSSSSSSSAFFFFFFFFFFFFF', '2024-11-05 06:50:45'),
(8, 'êrer', 'sada@gmail.com', 'SSSSSSSSSSSSSSSSAFFFFFFFFFFFFF', '2024-11-05 06:50:51'),
(9, 'dddddd', 'sada@gmail.com', 'FDDDDDDDDDDDDDĐ', '2024-11-05 06:51:14'),
(10, 'dddddd', 'sada@gmail.com', 'FDDDDDDDDDDDDDĐ', '2024-11-05 06:51:52'),
(11, 'aa', 'aaaa@gmail.com', '111111111111`11111111111111', '2024-11-12 15:39:40'),
(12, 'Nhật', 'nhat@gmail.com', 'ahjhjhjhjhj', '2024-11-17 01:20:28'),
(13, 'a', 'a@gmail.com', 'Trang web rất hay và hữu ích', '2024-11-17 10:59:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaimonan`
--

CREATE TABLE `loaimonan` (
  `MaLoaiMonAn` int(11) NOT NULL,
  `TenLoaiMonAn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mota` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loaimonan`
--

INSERT INTO `loaimonan` (`MaLoaiMonAn`, `TenLoaiMonAn`, `Mota`) VALUES
(1, 'Khai Vị', NULL),
(2, 'Đồ ăn sáng', NULL),
(3, 'Món chính', NULL),
(4, 'Tráng Miệng', NULL),
(5, 'Món ăn nước ngoài\r\n', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loainguyenlieu`
--

CREATE TABLE `loainguyenlieu` (
  `MaLoaiNguyenLieu` int(11) NOT NULL,
  `TenLoai` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MoTa` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `loainguyenlieu`
--

INSERT INTO `loainguyenlieu` (`MaLoaiNguyenLieu`, `TenLoai`, `MoTa`) VALUES
(1, 'Rau Củ', ''),
(2, 'Thịt', NULL),
(3, 'Hải Sản', NULL),
(4, 'Trái Cây', NULL),
(5, 'Đồ khô Và Gia Vị', 'Bao gồm các đồ khô như mì ống, bột mì, bột ngọt...'),
(6, 'Đồ Uống', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguyenlieu`
--

CREATE TABLE `nguyenlieu` (
  `MaNguyenLieu` int(11) NOT NULL,
  `MaLoaiNguyenLieu` int(11) NOT NULL,
  `TenNguyenLieu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SoLuong` float DEFAULT NULL,
  `DonVi` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguyenlieu`
--

INSERT INTO `nguyenlieu` (`MaNguyenLieu`, `MaLoaiNguyenLieu`, `TenNguyenLieu`, `SoLuong`, `DonVi`) VALUES
(1, 2, 'Ức Gà', 300, 'Gr'),
(2, 1, 'Cà Rốt', 1.5, 'Củ'),
(3, 1, 'Đậu que', 100, 'Gr'),
(4, 1, 'Xà lách', 2, 'Cây'),
(5, 1, 'Phổ Tai', 2, 'Lá'),
(6, 5, 'Muối', 0.5, 'Muỗng cà phê'),
(7, 5, 'Nước Tương', 1, 'Muỗng cà phê'),
(8, 5, 'Hạt Nêm', 1, 'Muỗng cà phê'),
(9, 1, 'Tỏi', 1, 'Củ'),
(10, 1, 'Hành Tím', 1, 'Củ'),
(11, 5, 'Sốt Mayonnaise', 1, 'Muỗng cà phê'),
(12, 1, 'Dưa leo', 1, 'Trái'),
(13, 1, 'Rong Biển', 8, 'Miếng'),
(14, 4, 'Dứa', 1, 'Trái'),
(15, 1, 'Sả', 5, 'Cây'),
(16, 1, 'Ớt', 4, 'Trái'),
(17, 1, 'Chanh', 20, 'Lá'),
(18, 1, 'Me', 1, 'Vắt'),
(19, 5, 'Đường', 2, 'Muỗng cà phê'),
(20, 5, 'Bột Ngọt', 0.5, 'Muỗng cà phê'),
(21, 5, 'Sa Tế', 1, 'Muỗng cà phê'),
(22, 5, 'Nước Mắm', 1, 'Muỗng cà phê'),
(23, 6, 'Nước', 0.5, 'Lít'),
(24, 3, 'Nghêu', 1, 'Kg'),
(25, 1, 'Bí Ngòi', 1, 'Trái'),
(26, 1, 'Bắp Cải', 0.5, 'Bắp'),
(27, 1, 'Hẹ', 6, 'Cây'),
(28, 1, 'Bạc Hà', 6, 'Lá'),
(29, 5, 'Bánh Tráng', 6, 'Miếng'),
(30, 1, 'Đậu Phộng', 0.5, 'Chén'),
(31, 5, 'Nước Sốt Mè Rang', 2, 'Muỗng canh'),
(32, 5, 'Siro Đường', 1, 'Muỗng cà phê'),
(33, 1, 'Gừng', 1, 'Củ'),
(34, 1, 'Măng Tươi', 500, 'Gr'),
(35, 3, 'Tôm Tươi', 300, 'Gr'),
(36, 2, 'Thịt Heo', 400, 'Gr'),
(37, 1, 'Rau Răm', 5, 'Gr'),
(38, 1, 'Hành Lá', 20, 'Gr'),
(39, 1, 'Chanh', 1, 'Quả'),
(40, 5, 'Vani', 1, 'Muỗng cà phê'),
(41, 4, 'Dâu Tây', 5, 'Trái'),
(42, 4, 'Kiwi', 2, 'Trái'),
(43, 4, 'Chuối', 2, 'Trái'),
(44, 4, 'Cam', 2, 'Trái'),
(45, 4, 'Nho', 2, 'Trái'),
(46, 1, 'Củ Kiệu', 500, 'Gr'),
(47, 2, 'Trứng Gà', 3, 'Quả'),
(48, 2, 'Trà Túi Lọc', 2, 'Gói'),
(49, 5, 'Bột Ngũ Vị Hương', 15, 'Gr'),
(50, 5, 'Hạt Tiêu', 7.5, 'Gr'),
(51, 1, 'Quế', 3, 'Lát'),
(52, 5, 'Bánh Mì', 1, 'Ổ'),
(53, 5, 'Bơ', 50, 'Gr'),
(54, 5, 'Bột Phô Mai', 100, 'Gr'),
(55, 1, 'Cỏ Xạ Hương', 10, 'Gr'),
(56, 1, 'Bông Atiso', 2, 'Kg'),
(57, 5, 'Bột Gạo', 140, 'Gr'),
(58, 5, 'Bột Năng', 15, 'Gr'),
(59, 5, 'Men Nở', 5, 'Gr'),
(60, 6, 'Nước Cốt Dừa', 200, 'Gr'),
(61, 5, 'Cơm', 400, 'Gr'),
(62, 5, 'Tương Ớt', 50, 'Gr'),
(63, 5, 'Dầu Ăn', 2, 'Muỗng Canh'),
(64, 1, 'Hành Tây', 20, 'Gr'),
(65, 1, 'KimChi', 50, 'Gr'),
(66, 1, 'Gan Gà', 300, 'Gr'),
(67, 6, 'Sữa Tươi Không Đường', 200, 'ml'),
(68, 5, 'Bánh Đa', 2, 'Cái'),
(69, 5, 'Bột Nghệ', 0.5, 'Muỗng cà phê'),
(70, 5, 'Xì Dầu', 150, 'ml'),
(71, 1, 'Rượu Sake', 100, 'ml'),
(72, 5, 'Bánh Mì Sandwich', 4, 'Lát'),
(73, 5, 'Phô Mai', 4, 'Lát'),
(74, 5, 'Mù tạt', 5, 'Gr'),
(75, 5, 'Bột Mì', 10, 'Gr'),
(76, 5, 'Miến', 100, 'Gr'),
(77, 1, 'Giá Đỗ', 20, 'Gr'),
(78, 5, 'Dầu mè', 1, 'Muỗng cà phê'),
(79, 2, 'Thịt Xông Khói', 150, 'Gr'),
(80, 1, 'Nấm Kim', 200, 'Gr'),
(81, 2, 'Thịt bò', 1, 'Kg'),
(82, 1, 'Cà Chua', 1.5, 'Quả'),
(83, 5, 'Hủ Tiếu', 500, 'Gr'),
(84, 5, 'Mì', 400, 'Gr'),
(85, 1, 'Nấm Bào Ngư', 100, 'Gr'),
(86, 2, 'Đậu Hũ Chiên', 1, 'Miếng'),
(87, 5, 'Nước Sốt Mè Rang', 1, 'Muỗng Canh'),
(88, 5, 'Dầu Hào', 1, 'Muỗng Canh'),
(89, 1, 'Ớt Chuông', 60, 'Gr'),
(90, 6, 'Nước Cốt Me', 100, 'Chén'),
(91, 3, 'Tép Đất', 300, 'Gr'),
(92, 2, 'Gà Ác', 1, 'Con'),
(93, 1, 'Rễ ngò', 20, 'Gr'),
(94, 1, 'Củ Cải Trắng', 100, 'Gr'),
(95, 5, 'Mì Udon', 400, 'Gr'),
(96, 1, 'Cải Thảo', 150, 'Gr'),
(97, 1, 'Rau Cải Cúc', 150, 'Gr'),
(98, 3, 'Cá Cơm Khô', 30, 'Gr'),
(99, 1, 'Tảo bẹ', 5, 'Gr'),
(100, 2, 'Bắp Bò', 400, 'Gr'),
(101, 1, 'Cải Bẹ Xanh', 200, 'Gr'),
(102, 1, 'Rau Má', 200, 'Gr'),
(103, 3, 'Cá Hồi', 300, 'Gr'),
(104, 6, 'Nước Cốt Cam', 0.5, 'Chén'),
(105, 5, 'Dầu Olive', 2, 'Muỗng Canh'),
(106, 5, 'Bột Bắp', 1, 'Muỗng canh'),
(107, 1, 'Nấm Hương', 5, 'Cái'),
(108, 2, 'Đậu Hũ Non', 400, 'Gr'),
(109, 1, 'Nấm Đông Cô', 5, 'Cái'),
(110, 3, 'Tôm Càng Xanh', 0.5, 'Kg'),
(111, 1, 'Đậu Bắp', 200, 'Gr'),
(112, 1, 'Khoai Tây', 2, 'Củ'),
(113, 6, 'Mật Ong', 1, 'Muỗng Canh'),
(114, 1, 'Bắp Nếp', 2, 'Trái'),
(115, 1, 'Nấm Mèo', 40, 'Gr'),
(116, 1, 'Ngò Rí', 4, 'Nhánh'),
(117, 1, 'Tàu Hũ Ky', 200, 'Gr'),
(118, 1, 'Cà Tím', 1, 'Trái'),
(119, 6, 'Kem Whipping', 250, 'ml'),
(120, 5, 'Bột gelatine', 16, 'Gr'),
(121, 5, 'Bột trà xanh', 3, 'Gr'),
(122, 4, 'Vải', 1, 'Kg'),
(123, 1, 'Hạnh Nhân', 50, 'Gr'),
(124, 4, 'Cùi Dừa', 800, 'Gr'),
(125, 4, 'Chanh dây', 2, 'Trái'),
(126, 5, 'Bột cà phê', 15, 'Gr'),
(127, 5, 'Bột Rau Câu', 40, 'Gr'),
(128, 5, 'Bột Bánh Bông Lan', 200, 'Gr'),
(129, 4, 'Xoài Chín', 400, 'Gr'),
(130, 6, 'Sữa chua', 300, 'Gr'),
(131, 5, 'Bánh Oreo', 80, 'Gr'),
(132, 6, 'Cà Phê Hòa Tan', 3, 'Gói'),
(133, 1, 'Hoa Đậu Biếc', 3, 'Muỗng Canh'),
(134, 4, 'Dừa Nạo', 100, 'Gr'),
(135, 5, 'Bột quế', 2, 'Muỗng cà phê'),
(136, 5, 'Bột Milo', 100, 'Gr'),
(137, 5, 'Bột Matcha', 2, 'Muỗng Cà Phê'),
(138, 4, 'Táo', 1, 'Quả'),
(139, 6, 'Nước Nóng', 250, 'ml'),
(140, 6, 'Trà Ô Long Tứ Quý', 100, 'Gr'),
(141, 5, 'Trân Châu Đài Loan', 200, 'Gr');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TenDangNhap` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MatKhau` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`TenDangNhap`, `MatKhau`) VALUES
('ad', '$2y$10$Us7A6qbR..TT2KKVkwLvR..SMFSFqGP3JU9juJGP9hHZJQvt2dwHS'),
('user', '$2y$10$llS9xrCGiKkHaQa2WszELutfrW5t.ZKx38WwEzexHsJeIn8soxo0u'),
('user2', '$2y$10$zjkuqYzL/IW2DHAbpRL//OVzbBsTaR8Y44cMY1.IapeI18eyjG04C');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoanadmin`
--

CREATE TABLE `taikhoanadmin` (
  `TenDangNhap` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoanadmin`
--

INSERT INTO `taikhoanadmin` (`TenDangNhap`, `MatKhau`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cacbuocnau`
--
ALTER TABLE `cacbuocnau`
  ADD PRIMARY KEY (`MaBuoc`);

--
-- Chỉ mục cho bảng `congthuc`
--
ALTER TABLE `congthuc`
  ADD PRIMARY KEY (`MaCongThuc`);

--
-- Chỉ mục cho bảng `congthuc_nguyenlieu`
--
ALTER TABLE `congthuc_nguyenlieu`
  ADD PRIMARY KEY (`ID_CongThuc_NguyenLieu`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loaimonan`
--
ALTER TABLE `loaimonan`
  ADD PRIMARY KEY (`MaLoaiMonAn`);

--
-- Chỉ mục cho bảng `loainguyenlieu`
--
ALTER TABLE `loainguyenlieu`
  ADD PRIMARY KEY (`MaLoaiNguyenLieu`);

--
-- Chỉ mục cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  ADD PRIMARY KEY (`MaNguyenLieu`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TenDangNhap`),
  ADD UNIQUE KEY `TenDangNhap` (`TenDangNhap`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cacbuocnau`
--
ALTER TABLE `cacbuocnau`
  MODIFY `MaBuoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT cho bảng `congthuc`
--
ALTER TABLE `congthuc`
  MODIFY `MaCongThuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `congthuc_nguyenlieu`
--
ALTER TABLE `congthuc_nguyenlieu`
  MODIFY `ID_CongThuc_NguyenLieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `loaimonan`
--
ALTER TABLE `loaimonan`
  MODIFY `MaLoaiMonAn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loainguyenlieu`
--
ALTER TABLE `loainguyenlieu`
  MODIFY `MaLoaiNguyenLieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  MODIFY `MaNguyenLieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
