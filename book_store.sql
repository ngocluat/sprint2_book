-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sprint_2_book_store
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Watanabe Dzunichi'),(2,'Nguyễn Nhật Ánh'),(3,'Tô Hoài'),(4,'Xuân Diệu'),(5,'Nam Cao'),(6,'Nguyễn Minh Châu'),(7,'Tuệ Nghi'),(8,'Nguyễn Ngọc Thạch'),(9,'William Shakespeare'),(10,'Lev Tolstoy'),(11,'Victor Hugo'),(12,'Pushkin'),(13,'Vĩ Ngư'),(14,'Trường Lê'),(15,'Lê Thúy Hằng'),(16,'Choi Sang'),(17,'Imamura Natsuko'),(18,'Nhiều Tác Giả');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` longtext,
  `dimension` varchar(255) DEFAULT NULL,
  `image` longtext,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `total_page` int DEFAULT NULL,
  `translator` varchar(255) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKklnrv3weler2ftkweewlky958` (`author_id`),
  KEY `FKam9riv8y6rjwkua1gapdfew4j` (`category_id`),
  KEY `FKh602ahsjpusnkvli2askfuj3s` (`discount_id`),
  CONSTRAINT `FKam9riv8y6rjwkua1gapdfew4j` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKh602ahsjpusnkvli2askfuj3s` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `FKklnrv3weler2ftkweewlky958` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'12321','Đèn Không Hắt Bóng không đơn thuần kể về đời sống bệnh viện mà còn là câu chuyện tình yêu lạnh lùng, bí ẩn và đau đớn.\r\n\r\nMối quan hệ giữa Noriko và bác sĩ Naoe phải chăng là tình yêu một chiều? Đứng bên cạnh vị bác sĩ tài hoa, hình ảnh của Noriko khá lặng lẽ. Yêu Naoe, tự nguyện gắn bó với anh, cô vẫn phải chứng kiến hàng loạt mối quan hệ bất thường của Naoe với những phụ nữ khác, từ vợ và con gái của bác sĩ viện trưởng, cô gái quán bar, cho đến nàng ca sĩ ngôi sao…\r\n\r\nNhưng đau khổ hơn hết, cô nhận ra Naoe là một pháo đài riêng, không cho cô thâm nhập, ngay cả những giây phút gần gũi nhất cả về thân xác lẫn tình cảm. Chỉ đến khi Naoe mất đi, bức màn bí mật mới được vén lên. Giữa bao nhiêu phụ nữ vây quanh, Naoe chỉ yêu một mình Noriko. Cô chính là mảnh gương cuộc đời để anh soi vào, là chỗ bấu víu duy nhất trong những cơn đau đớn tuyệt vọng vì cái chết gần kề…\r\n\r\nNhưng vì kiêu hãnh và xót thương, anh không bao giờ phơi bày sự thật với cô. Tình yêu bền bỉ của Noriko đã được đền đáp, dù muộn màng…','13 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/900/900/detailed/232/den-khong-hat-bong-tb-2022.jpg','Đèn Không Hắt Bóng (Tái bản năm 2022)',220000,'NXB Hội Nhà Văn',200,'2022',_binary '',512,'Watanabe Dzunichi',1,2,2),(2,'11223','The God Game: A Novel\r\n\r\n\"Smart, propulsive and gripping, THE GOD GAME is an ambitious thriller and a terrifying examination of what could--and probably already is--happening in the world of artificial intelligence.\"―Harlan Coben, #1 New York Times bestselling author of Run Away\r\n\r\nA technological thriller with an all-too-believable premise, award-winning author Danny Tobey\'s The God Game follows five teenagers obsessed with an online video game that connects them to their worst impulses and most dangerous desires.\r\n\r\nThey call themselves the Vindicators. Targeted by bullies and pressured by parents, these geeks and gamers rule the computer lab at Turner High School. Wealthy bad boy Peter makes and breaks rules. Vanhi is a punk bassist at odds with her heritage. Kenny\'s creativity is stifled by a religious home life. Insecure and temperamental, Alex is an outcast among the outcasts. And Charlie, the leader they all depend on, is reeling from the death of his mother, consumed with reckless fury.','16.2 x 4.1 x 24.3 cm','https://nhasachphuongnam.com/images/thumbnails/2560/2560/detailed/231/8103tUuMVFL.jpg','The God Game: A Novel\r\n',400000,'St. Martin\'s Press',100,'2021',_binary '',464,'Phan An',9,2,4),(3,'23123','What Happened - Điều Gì Đã Diễn Ra\r\n\r\n\"Đây là những gì đã xảy ra.\r\n\r\nĐây là câu chuyện về những điều tôi đã chứng kiến, cảm thấy và suy tư trong suốt hai năm dữ dội nhất mà tôi từng trải qua.\r\n\r\nĐây là câu chuyện về hành trình đưa tôi đến ngã rẽ lịch sử này, về cách tôi tiếp tục bước đi sau một thất bại cay đắng, về cách tôi kết nối lại với những thứ quan trọng nhất trong cuộc đời và bắt đầu nhìn về phía trước với nhiều hy vọng thay vì dằn vặt quá khứ đầy tiếc nuối.\"','15.5 x 23.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/153/what-happened-dieu-gi-da-dien-ra.jpg','What Happened - Điều Gì Đã Diễn Ra',180000,'NXB Thế Giới',80,'2020',_binary '',568,'Nhóm P.Y.D.T',10,4,3),(4,'33321','Trường Học Hay Trường Đời\r\nTại sao nhiều bạn trẻ đọc sách về hướng nghiệp, việc làm, được các thầy cô ở trường tư vấn kỹ càng mà vẫn chọn sai ngành học, tốt nghiệp ra trường vẫn phải làm trái ngành nghề được đào tạo? Tại sao sinh viên ra trường thất nghiệp ngày càng đông, trong khi các doanh nghiệp ngày càng khó tuyển dụng được nhân sự như ý? Làm thế nào để biết mình đã chọn đúng nghề, chọn đúng sếp, chọn đúng công ty? Doanh nghiệp thực sự đang cần điều gì nhất ở người lao động? Nếu trượt đại học thì phải làm sao? Sinh viên có nên đi làm thêm không? Khi nào thì phụ huynh nên cho con em mình đi du học? Khi nào thì nên khởi sự kinh doanh? Thời cách mạng công nghiệp 4.0 thì nên chọn mô hình kinh doanh nào cho hiệu quả?...\r\n\r\nHàng loạt những câu hỏi sát sườn với người trẻ, từ hướng nghiệp đến việc làm, được nhà báo Nguyễn Tuấn Anh lý giải khoa học, dễ hiểu, gẫn gũi nhờ gần 20 năm làm việc với nhiều thế hệ sinh viên Việt Nam và các doanh nghiệp trong nước và quốc tế. Nhà báo Nguyễn Tuấn Anh cũng là người viết sách cho nhiều nhân vật nổi tiếng, trong đó có TS Lê Thẩm Dương (Trưởng khoa Tài chính – Trường Đại học Ngân hàng TP.HCM; diễn giả hàng đầu Việt Nam), TS Alok Bharadwaj (Nguyên Chủ tịch Hiệp hội Giám đốc Marketing châu Á, Phó Chủ tịch cao cấp phụ trách chiến lược của Canon châu Á)... Nhà báo Nguyễn Tuấn Anh hiện là Trưởng ban biên tập, Thư ký Toà soạn báo Sinh Viên Việt Nam.','13 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/141/truong-hoc-hay-truong-doi.jpg','Trường Học Hay Trường Đời',150000,'Báo Sinh Viên VN - Hoa Học Trò',150,'2020',_binary '',244,'',9,1,4),(5,'13221','Blame The Dead\r\n\r\nEd Ruggero\'s Blame the Dead is the thrilling start of an action-packed and timely World War II series by a former Army Officer for fans of compelling historical fiction.\r\n\r\nSet against the heroism and heartbreak of World War II, former Army officer Ed Ruggero brilliantly captures, with grace and authenticity, the evocative and timeless stories of ordinary people swept up in extraordinary times.\r\n\r\nSicily, 1943. Eddie Harkins, former Philadelphia beat cop turned Military Police lieutenant, reluctantly finds himself first at the scene of a murder at the US Army’s 11th Field Hospital. There the nurses contend with heat, dirt, short-handed staffs, the threat of German counterattack, an ever-present flood of horribly wounded GIs, and the threat of assault by one of their own―at least until someone shoots Dr. Myers Stephenson in the head.\r\n\r\nWith help from nurse Kathleen Donnelly, once a childhood friend and now perhaps something more, it soon becomes clear to Harkins that the unit is rotten to its core. As the battle lines push forward, Harkins is running out of time to find one killer before he can strike again.','16.3 x 2.9 x 24.3 cm','https://nhasachphuongnam.com/images/thumbnails/2560/2560/detailed/228/71z14WVfm1L.jpg','Blame The Dead',350000,'Forge Books',90,'2012',_binary '',336,'Phan An',12,2,2),(6,'51212','City Of Windows\r\n\r\n\"City of Windows is moving, breathtaking―a great entertainment.\" ―The Wall Street Journal\r\n\r\n“A tough, wise, knowing narrative voice, a great plot, a great setting, and even better characters ― I loved this.” ―Lee Child, New York Times bestselling author\r\n\r\nIn the tradition of Jeffery Deaver’s Lincoln Rhyme and David Baldacci’s Amos Decker, Robert Pobi\'s City of Windows introduces Lucas Page, a brilliant, reluctant investigator, matching wits with a skilled, invisible killer\r\n\r\nDuring the worst blizzard in memory, an FBI agent in a moving SUV in New York City is killed by a nearly impossible sniper shot. Unable to pinpoint where the shot came from, as the storm rapidly wipes out evidence, the agent-in-charge Brett Kehoe turns to the one man who might be able to help them―former FBI agent Lucas Page.\r\n\r\nPage, a university professor and bestselling author, left the FBI years ago after a tragic event robbed him of a leg, an arm, an eye, and the willingness to continue. But he has an amazing ability to read a crime scene, figure out angles and trajectories in his head, and he might be the only one to be able to find the sniper’s nest. With a new wife and family, Lucas Page has no interest in helping the FBI―except for the fact that the victim was his former partner.','16.3 x 3.2 x 24.2 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/231/91KlU7CFzpL.jpg','City Of Windows',420000,'Minotaur Books',150,'2018',_binary '',400,'Phan An',10,2,4),(7,'12356','Câu chuyện về một mùa hè ngọt ngào, những trò chơi nghịch ngợm và bâng khuâng tình cảm tuổi mới lớn. Chỉ vậy thôi nhưng chứng tỏ tác giả đúng là nhà kể chuyện hóm hỉnh, khiến đọc cuốn hút từ tựa đến trang cuối cùng, có lẽ chính vì giọng văn giản dị và trong trẻo của Nguyễn Nhật Ánh, và kết thúc thì có hậu đầy thuyết phục. Câu chuyện cho tuổi học trò, đọc xong là thấy ngập lên khao khát quay về một thời thơ bé, với tình thầy trò, bè bạn, tình xóm giềng, họ hàng, qua cách nhìn đời nhẹ nhõm, rộng lượng.\r\n\r\nCuốn sách này nhà văn đề tặng “Những năm tháng ấu thơ”, tặng các bạn thời nhỏ, cũng là tặng bạn đọc thân thiết của mình.','13 x 20 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/182/image_182390.jpg','Bảy Bước Tới Mùa Hè (Tái bản năm 2019)',115000,'NXB Trẻ',150,'2019',_binary '',288,NULL,2,3,2),(8,'45658','Một chiếc chuông gió chỉ rung lên khi có oán khí của người đã khuất chạm vào.\r\n\r\nMột cuộc hành trình phiêu bạt mãi mãi không nhìn thấy điểm cuối.\r\n\r\nKhách phượt bị mất tích, truyền thuyết về hẻm núi Ca Tát Ma cổ quái, đài thiên táng thần bí của người Tạng. Luồng oán khí đầu tiên chạm vào chiếc chuông ma quái, bí mật ẩn giấu trong đó rốt cuộc là gì…?\r\n\r\nCô gái thần bí cổ quái bước lên hành trình siêu độ vong linh. Chiếc chuông gió kỳ lạ vang lên, chạm tới sự điên cuồng, tội ác, sự tàn nhẫn, nỗi tuyệt vọng và cả tình yêu trong sâu thẳm nhân tính con người.\r\n\r\nCuộc gặp gỡ bất ngờ như được định mệnh sắp xếp của Quý Đường Đường và Nhạc Phong đã vén màn những bí ẩn chồng chất lên nhau, những vụ án trong án cũng dần dần sáng tỏ.','14.5 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/232/chuong-gio-tap-1.jpg','Chuông Gió - Tập 1',174000,'NXB Thanh Niên',300,'2021',_binary '',472,'Hàn Vũ Phi',13,6,2),(9,'89456','Bùa ngải - “con dao hai lưỡi” nếu được sử dụng với mục đích tốt sẽ trấn yểm và trừ tà nhưng nếu người sử dụng lợi dụng nó với mục đích xấu là làm hại người khác thì hậu quả thật khôn lường.\r\n\r\nQuỷ Ấn lấy bùa ngải làm trung tâm, xoay quanh thầy Lương - một người tự xưng là người chuyên bốc mộ nhưng có kiến thức về y thuật khiến người khác phải thán phục. Trên hành trình đi cởi bỏ nút thắt về quá khứ bí ẩn của mình, thầy Lương đã giúp đỡ những con người khốn khổ, bị trúng lời nguyền và ngải độc. Hữu duyên hay nghiệt duyên, những người mà thầy hết lòng giúp đỡ ấy lại có chung một nỗi sợ hãi và ánh mắt hận thù đối với người, hay nói cách khác là với một “con quỷ đội lốt người” đã cướp đi những người thân yêu nhất của họ một cách dã man và đau khổ nhất. Nơi “con quỷ” đó gây nỗi sợ hãi tột cùng đến người dân vô tội là Xím Bạc - một nơi được cho rằng chỉ có trong truyền thuyết, nơi mà những kẻ đã đặt chân đến đó không chết thì cũng trở nên điên loạn. Nơi khởi nguồn cho sự ham muốn của con người về thứ được gọi là vàng, nhưng cũng chính là nơi mở ra cánh cửa tử, chào đón những kẻ không vượt qua được sự cám dỗ.\r\n\r\nLiệu điều gì đang chờ đợi họ ở phía trước, nỗi sợ hãi, sự ám ảnh kinh hoàng hay thậm chí là cả cái chết rình rập? Dẫu biết vậy, nhưng họ vẫn hạ quyết tâm bước về phía trước. Và liệu cái giá nào mà “con quỷ” đó sẽ phải trả cho tội ác kéo dài chẳng thể đong đếm được của mình? Hãy đón đọc Quỷ Ấn - nơi thế giới tâm linh với những câu chuyện khó tin sẽ được khắc họa một cách chi tiết và rùng rợn nhất…','14.5 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/232/quy-an-bo-2-tap.jpg','Quỷ Ấn (Bộ 2 tập)',300000,'NXB Dân Trí',50,'2020',_binary '',728,NULL,14,1,2),(10,'21346','Tháng năm tuổi trẻ luôn qua đi vội vã, song lại là hành trình rực rỡ nhất mà mỗi chúng ta có được trong cuộc đời này. Thế nhưng, không phải ai khi còn trẻ, cũng sớm nhận ra điều đó để hết mình sống và rực rỡ như một mùa hạ.\r\n\r\nNhư câu chuyện của Hải - chàng sinh viên năm nhất trong SỐNG LẠI của tác giả Huy Hải là một ví dụ.\r\n\r\nMở đầu câu chuyện, bối cảnh như một bộ phim kinh dị. Hải tỉnh dậy trong một căn phòng lạ mà không phải ở nhà của mình. Phủ quanh cậu không chỉ có bóng tối với chút ánh sáng nhập nhoạng, yếu ớt hắt vào qua ô cửa, mà còn là bầu không khí đầy u ám và thiếu sức sống. Chưa kể ngay khi mở mắt tỉnh dậy, Hải còn gặp phải những con người mà cậu cho rằng là rất quái đản và chẳng khác gì những người trong trại thương điên. Họ nói, cậu đã chết. Hải dĩ nhiên không tin và nghĩ đó là trò đùa vô duyên nhất cậu từng gặp. Thế nhưng, có lên tiếng phủ định thế nào, những người ở quanh cậu vẫn không ngừng nói cậu đã chết. Điều đó khiến Hải phát điên, nên cậu quyết định rời khỏi căn phòng quái đản và đi tìm câu trả lời cho mình. Và chớ trêu thay, những gì cậu không tin lại là sự thật: Cậu đã chết. Chết khi còn quá trẻ. Chết trong hoàn cảnh cậu không ngờ tới được. Và điều đó khiến cậu không thể chấp nhận sự thật này, nên khao khát được… sống lại (dù trong thân xác một kẻ khác).','13 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/232/song-lai.jpg','Sống Lại',70000,'NXB Văn Học',100,'2022',_binary '',131,NULL,15,1,1),(11,'46521','Nếu đã bị mê hoặc bởi những tình huống dở khóc dở cười của cậu thiếu niên giỏi võ Kômang cùng những đồng đội, chắc chắn bạn sẽ không thể bỏ qua ấn phẩm này! Nhóm thầy trò Thủy Hỏa Thần lại một lần nữa tái xuất trong \"Hello Kômang\" - tác phẩm tiền truyện của \"Đội quân nhí nhố\", đảm bảo sẽ khiến bạn đọc phải cười \"bể bụng\" suốt 6 tập truyện!\r\n\r\nHi vọng rằng chúng ta sẽ có một mùa hè 2022 tràn đầy tiếng cười với HELLO KÔMANG!','11.3 x 17.6 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/232/hello-komang-tap-6.jpg','Hello Kômang - Tập 6',30000,'NXB Kim Đồng',199,'2022',_binary '',168,'Nhiều người dịch',16,6,1),(12,'45321','Trong mắt mọi người, “cô gái mặc váy tím” hết sức kỳ dị và không ai có thể tiếp cận. Nhưng với “tôi”, người con gái ấy lại có một sức cuốn hút vô cùng kỳ lạ. “Tôi” muốn kết bạn với “cô gái mặc váy tím” bằng mọi giá. Cuối cùng, “tôi” đã tìm cách để “cô gái mặc váy tím” tới làm cùng một chỗ với mình. Nhưng “tôi” là ai? Và mong ước thực sự của “tôi” là gì?\r\n\r\nMột sự ám ảnh mập mờ giữa điên rồ và lố bịch khiến Cô Gái Mặc Váy Tím trở nên khác biệt, đủ để kích thích trí tò mò và khơi gợi sự đồng cảm trong lòng độc giả.\r\n\r\n\"Khắc họa một người dẫn chuyện có phần ngờ nghệch và kỳ dị là một việc hết sức khó khăn nhưng nhờ sự diện hiện của “cô gái mặc váy tím” mà những điều lẩn khuất trong bóng tối về nhân vật “tôi” lại càng trở nên có chiều sâu. Khi đọc đến đoạn cuối, khi “tôi” đang định ăn bánh mì kem thì bị một đứa bé vỗ vào vai, nỗi buồn như muốn phát điên choán lấy lồng ngực tôi. Tác giả Imamura quả nhiên rất có tài năng trong việc khắc họa sống động những con người đi lệch quỹ đạo thông thường của con người.\" – Ogawa Yoko\r\n\r\nThông tin tác giả\r\n\r\nImamura Natsuko, một nữ nhà văn người Nhật Bản.\r\n\r\nImamura Natsuko ra mắt năm 2010 với tác phẩm Kochira Amiko (Amiko ở đây này – tạm dịch).\r\n\r\nCô gái mặc váy tím được xuất bản vào tháng 6 năm 2019 và đạt giải Akutagawa lần thứ 161 (năm 2019). Trước đó cô đã hai lần được đề cử cho giải thưởng này với hai tác phẩm, Ahiru (Con vịt – tạm dịch) và Hoshi no ko (Đứa con của những vì sao – tạm dịch). Ngoài ra Imamura Natsuko còn chấp bút nhiều tác phẩm và đạt vô số các giải thưởng khác.','14 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/232/co-gai-mac-vay-tim.jpg','Cô Gái Mặc Váy Tím (Giải thưởng Văn học Akutagawa 2019)',95000,'NXB Hà Nội',150,'2019',_binary '',158,'Vương Hải Yến',17,2,1),(13,'84654','Bạn đọc đang có trên tay một cuốn sách rất thú vị Người Thầy Của Tỉnh Thức & Thương Yêu.\r\n\r\nĐây là tập hợp một số bài báo trong hàng vạn bài viết về Thiền sư Thích Nhất Hạnh của các cây bút nổi tiếng trên thế giới. Có thể xem cuốn sách này như một tập chân dung về Thiền sư Thích Nhất Hạnh được \"ký họa\" ở nhiều góc độ khác nhau, dưới con mắt quan sát, qua \"cái thấy\" của người nước ngoài.\r\n\r\nMột điều thú vị là qua những bài viết ở đây, chúng ta phát hiện ra, người phương Tây tìm đến Thiền sư Thích Nhất Hạnh không chỉ để giãi bày, chuyển hóa những nỗi khổ niềm đau, tìm lại niềm vui sống giữa đời mà họ còn tìm cầu tuệ giác của ông trong việc làm thế nào để điều hành doanh nghiệp tốt hơn, giảm bớt stress, căng thẳng, phát huy nhiều hơn nữa sự sáng tạo, trên cơ sở đó để tăng lợi nhuận. Họ là những CEO của các tập đoàn kinh tế khổng lồ như Google, Yahoo, Ngân hàng Thế giới (World Bank). Họ còn là những thượng nghị sĩ Mỹ, những ngôi sao Hollywood nổi tiếng, những chính khách lừng danh... Qua những cuộc gặp gỡ, trao đổi ấy, Thiền sư Thích Nhất Hạnh đã chỉ bày cho họ hướng đi tâm linh trong đời sống, trong sự nghiệp cùng những phương pháp thực hành rất cụ thể. Tu tập theo ông, người ta sẽ thấy trí tuệ và lòng từ bi tăng trưởng, nhờ thế mà an lạc thân tâm.','14 x 20.5 cm','https://nhasachphuongnam.com/images/thumbnails/500/500/detailed/230/nguoi-thay-cua-tinh-thuc-va-thuong-yeu-tb-2022.jpg','Người Thầy Của Tỉnh Thức Và Thương Yêu (Tái bản năm 2022)',150000,'NXB Thế Giới',99,'2022',_binary '',284,NULL,18,4,1),(14,'24565','Không giống như những tác phẩm trước đây lấy bối cảnh vùng quê miền Trung đầy ắp những hoài niệm tuổi thơ dung dị, trong trẻo với các nhân vật ở độ tuổi dậy thì, trong quyển sách mới lần này nhà văn Nguyễn Nhật Ánh lấy bối cảnh chính là Sài Gòn – Thành phố Hồ Chí Minh nơi tác giả sinh sống (như là một sự đền đáp ân tình với mảnh đất miền Nam). Các nhân vật chính trong truyện cũng “lớn” hơn, với những câu chuyện mưu sinh lập nghiệp lắm gian nan thử thách của các sinh viên trẻ đầy hoài bão. Tất nhiên không thể thiếu những câu chuyện tình cảm động, kịch tính và bất ngờ khiến bạn đọc ngẩn ngơ, cười ra nước mắt. Và như trong mọi tác phẩm Nguyễn Nhật Ánh, sự tử tế và tinh thần hướng thượng vẫn là điểm nhấn quan trọng trong quyển sách mới này.\r\n\r\nNhư một cuốn phim “trinh thám tình yêu”, Con chim xanh biếc bay về dẫn bạn đi hết từ bất ngờ này đến tò mò suy đoán khác, để kết thúc bằng một nỗi hân hoan vô bờ sau bao phen hồi hộp nghi kỵ đến khó thở.\r\n\r\nBạn sẽ theo phe sinh viên-nhân viên với những câu thơ dịu dàng và đáo để, hay phe ông chủ với những kỹ năng kinh doanh khởi nghiệp? Và hãy đoán thử, điều gì khiến bạn có thể cảm động đến rưng rưng trong cuộc sống giữa Sài Gòn bộn bề?\r\n\r\nLâu lắm mới có hình ảnh thành phố rộn ràng trong tác phẩm của Nguyễn Nhật Ánh - điều hấp dẫn khác thường của Con chim xanh biếc bay về.\r\n\r\nChính vì thế mà cuốn sách chỉ có một cách đọc thôi: một mạch từ đầu đến cuối!\r\n\r\nĐặc biệt, kèm theo mỗi cuốn sách là 6 postcard với nhiều tranh vẽ của họa sĩ Đỗ Hoàng Tường.','13 x 20 cm','https://salt.tikicdn.com/cache/400x400/ts/product/da/6a/6c/dd77b39d450443cc6b5f714c8a3fcb4e.jpg.webp','Con Chim Xanh Biếc Bay Về',200000,'NXB Trẻ',100,'2020',_binary '',396,NULL,2,6,1),(15,'23442','Câu chuyện bắt đầu từ lá thư làm quen để trong học bàn của Thục, trong bộ ba Xuyến, Thục, Cúc Hương.\r\n\r\nLá thư chân tình đã thu hút sự tò mò của bộ ba, và họ bị cuốn hút vào trò chơi với người giấu mặt, dần hồi kéo theo Phán củi, anh chàng xấu xí vụng về của lớp làm quân sư và giúp xướng họa thơ. Cuộc truy tìm dẫn mọi người đến nhiều hiểu lầm tai hại và cả những bất ngờ thú vị. Và điều bất ngờ cuối cùng đã được phát hiện quá muộn. Vì sao? Xin để cho bạn đọc tự khám phá\r\n\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....','12 x 20 cm','https://salt.tikicdn.com/cache/400x400/media/catalog/product/b/o/bo-cau-khong-dua-thu.jpg.webp','Bồ Câu Không Đưa Thư (Truyện Dài)',60000,'NXB Trẻ',100,'2014',_binary '',176,NULL,2,1,1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_create` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdebwvad6pp1ekiqy5jtixqbaj` (`customer_id`),
  CONSTRAINT `FKdebwvad6pp1ekiqy5jtixqbaj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'2022-07-31',_binary '',5),(2,'2022-07-31',_binary '',5),(3,'2022-07-31',_binary '',5),(4,'2022-07-31',_binary '',5),(5,'2022-07-31',_binary '',5),(6,'2022-07-31',_binary '',5),(7,'2022-07-31',_binary '',5),(8,'2022-07-31',_binary '',5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKflpu1psdex9le27p7owju2piw` (`book_id`),
  KEY `FKrg4yopd2252nwj8bfcgq5f4jp` (`cart_id`),
  CONSTRAINT `FKflpu1psdex9le27p7owju2piw` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKrg4yopd2252nwj8bfcgq5f4jp` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
INSERT INTO `cart_detail` VALUES (1,1,11,8),(2,1,13,8);
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Văn Học Việt Nam'),(2,'Văn Học Nước Ngoài'),(3,'Thiếu nhi'),(4,'Thời sự - Chính trị'),(6,'Tiểu thuyết');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKixgo6lw7snw8ctly9at6t2g8` (`username`),
  CONSTRAINT `FKixgo6lw7snw8ctly9at6t2g8` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Đà Nẵng','2003-01-01','ngocluat@gmail.com',1,'Trần Ngọc Luật','0905111222',_binary '','ngocluat@gmail.com'),(2,'Tiên Sơn, Đà Nẵng','1998-01-01','phanan@gmail.com',1,'Phan An','0905467542',_binary '','phanan@gmail.com'),(3,'Hải Châu, Đà Nẵng','1994-01-01','quanghuu@gmail.com',1,'Nguyễn Quang Hữu','0904562354',_binary '','quanghuu@gmail.com'),(4,'Hoàng Diệu, Đà Nẵng','1997-01-01','thanhnghia@gmail.com',1,'Nguyễn Trần Thanh Nghĩa','0904562314',_binary '','thanhnghia@gmail.com'),(5,'Hòa Khánh, Đà Nẵng','1993-01-01','vietkhoa@gmail.com',1,'Phạm Việt Khoa','0905997021',_binary '','vietkhoa@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,'5'),(2,'10'),(3,'15'),(4,'20'),(5,'30'),(6,'50');
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_EMPLOYEE'),(3,'ROLE_MANAGER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfhq23r1o3cqe0n8jdi4vyv4s8` (`role`),
  KEY `FK2svos04wv92op6gs17m9omli1` (`username`),
  CONSTRAINT `FK2svos04wv92op6gs17m9omli1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `FKfhq23r1o3cqe0n8jdi4vyv4s8` FOREIGN KEY (`role`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1,'ngocluat@gmail.com'),(2,1,'phanan@gmail.com'),(3,1,'quanghuu@gmail.com'),(4,1,'thanhnghia@gmail.com'),(5,1,'vietkhoa@gmail.com');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `flag` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ngocluat@gmail.com',_binary '','$2a$10$X0e3BuF8.SHAS2xZUMEyaepdMW8pskhtkRtDDTFhS6xxTyvJZdvaW'),('phanan@gmail.com',_binary '','$2a$10$X0e3BuF8.SHAS2xZUMEyaepdMW8pskhtkRtDDTFhS6xxTyvJZdvaW'),('quanghuu@gmail.com',_binary '','$2a$10$X0e3BuF8.SHAS2xZUMEyaepdMW8pskhtkRtDDTFhS6xxTyvJZdvaW'),('thanhnghia@gmail.com',_binary '','$2a$10$X0e3BuF8.SHAS2xZUMEyaepdMW8pskhtkRtDDTFhS6xxTyvJZdvaW'),('vietkhoa@gmail.com',_binary '','$2a$10$X0e3BuF8.SHAS2xZUMEyaepdMW8pskhtkRtDDTFhS6xxTyvJZdvaW');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02  8:24:06
