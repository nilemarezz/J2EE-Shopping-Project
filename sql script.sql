/*Table structure for table productline */

create table ACCOUNT
(
	USERNAME VARCHAR(30) not null primary key,
	PASSWORD VARCHAR(40) not null,
	NAME VARCHAR(30),
	EMAIL VARCHAR(50),
	ACTIVATEKEY VARCHAR(40),
	REGDATE TIMESTAMP,
	ACTIVATEDATE TIMESTAMP,
	ADDRESS VARCHAR(150),
	PROVICE VARCHAR(30)
);


DROP TABLE productline;

CREATE TABLE productline (
  productLine varchar(50) NOT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription clob,
  image blob,
  PRIMARY KEY (productLine)
) ;

/*Data for the table productlines */

insert  into productline(productLine,textDescription,htmlDescription,image) values 
('Food and Health','Food and Health books write about all foods in each places and how to take care bodies in good health.',NULL,NULL),
('Entertainment and Travel','Entertainment and Travel books write about a trip to travel in the world and all of kind with entertainment to people.',NULL,NULL),
('Science and Technology','Science and Technology books write about knowledge of technology and science.',NULL,NULL),
('Children and Toddler','Children and Toddler is a book for child 1-6 years old and can not read any difficult vocabulary in books.',NULL,NULL),
('Literature','Literature is about a story who make from imagination of someone or story that make from true experience of someone or true situation in the past.',NULL,NULL),
('Education','Education books make to a person who want to learn more in some knowledge with that person do not know about it.',NULL,NULL);

/*Table structure for table product */

DROP TABLE  product;

CREATE TABLE product (
  productCode varchar(15) NOT NULL,
  productName varchar(80) NOT NULL,
  productLine varchar(50) NOT NULL,
  productDescription clob NOT NULL,
  productAuthor varchar(120) NOT NULL,
  productPublisher varchar(70) NOT NULL,
  quantityInStock smallint NOT NULL,
  productPrice decimal(10,2) NOT NULL,
  PRIMARY KEY (productCode),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES productline (productLine)
) ;

insert  into product(productCode,productName,productLine,productDescription,productAuthor,productPublisher,quantityInStock,productPrice) values 
('S01-1','Statistics for Engineers and Scientists','Science and Technology','The idea for this book grew out of discussions between the statistic faculty and the engineering faculty at the Colorado School of Mines regarding our introductory statistics course for engineers.','William Navidi','William Navidi',20,1054.50),
('S01-2','Modern Many-Particle Physics : Atomic Gases, Nanostructures and Quantum Liquids','Science and Technology','This book is devoted to the description of Bosonic and Fermionic systems : metallic clusters; quantum dots, wires...','Enrico Lipparini','World Scientific Publishing Co. Pte. Ltd.',20,2512.75),
('S01-3','Guide to Managerial Communication : Effective Business Writing and Speaking','Science and Technology','The editorial team at Pearson has worked closely with educators around the globe to inform students of the ever-changing world in a broad variety of disciplines.','Mary Munter','Prentice Hall',20,883.50),
('S01-4','Concepts of Programming Languages','Science and Technology','oncepts of Programming Languages introduces students to the main constructs of contemporary programming languages and provides the tools needed to critically evaluate existing and future programming languages.','Robert W. Sebesta','Pearson Education Limited',20,1035.50),
('S01-5','Wikipatterns','Science and Technology','A practical guide to improving productivity and collaboration in your organization','Stewart Mader','Wiley Publishing, Inc.',20,1026.00),
('S01-6','Panoramic Photography: From Composition and Exposure to Final Exhibition','Science and Technology','Suitable for panoramic photographers, this work features diagrams to explain the technical details involved in various shots.','Arnaud Frich','Focal Press',20,1282.50),
('S01-7','Filmmakers and Financing : Business Plans for Independents','Science and Technology','An excellent, insightful guide to attracting financing for indie films.','Louise Levison','Focal Press',20,1282.50),
('S01-8','How Cool Stuff Works','Science and Technology','You use all kinds of incredible technology every day. But how does it really work?','Chris Woodford, Luke Collins,Clint Witchalls,Ben Morgan,James Flint','Dorling Kindersley Limited',20,997.50),
('S01-9','Digital Media Tools','Science and Technology','International Student Edition','Nigel Chapman, Jenny Chapman','John Wiley and Sons (Asia) Pte Ltd',20,2137.50),
('S01-10','Bounce, Tumble, and Splash!: Simulating the Physical World with Blender 3D','Science and Technology','Defy the Rules of 3D and Get Physical with Blender','Tony Mullen','Sybex',20,1710.00),
('S01-11','Engineering Mechanics : Dynamics, Computational Edition','Science and Technology','Focusing on the conceptual understanding of mechanics, this exciting new text addresses developments in the methods of analyzing mechanics problems.','Daniel J. Inman, Daniel S. Balint, Robert W. Soutas-Little','Thomson Learning',20,950.00),
('S01-12','Photos That Inspire Photo Workshop','Science and Technology','This is a different kind of book. Packed inside are more than 200 magnificent photos','Lynne Eodice','John Wiley and Sons (Asia) Pte Ltd',20,1282.50),
('S01-13','Oxford English for Electrical and Mechanical Engineering','Science and Technology','This course is intended for students of Electrical Engineering and Mechanical Engineering in universities, colleges, and technical schools, and for technicians and engineers.','Eric H. Glendinning, Norman Glendinning','Oxford University Press',20,322.05),
('S01-14','Workshop : IT','Science and Technology','The Workshop series gives lower-intermediate students a practical foundation for the English they need in the real world.','Dinos Demetriades','Oxford University Press',20,270.75),
('S01-15','A First Look at Communication Theory','Science and Technology','This program ensures that students have a solid foundation with which to begin understanding the relationships between theories.','Em Griffin, Andrew Ledbetter, Glenn Sparks','McGraw-Hill Education',20,921.50),
('S01-16','Mechanics of Materials, Eighth Edition,SI','Science and Technology','The Eighth Edition of MECHANICS OF MATERIALS continues its tradition as one of the leading texts on the market. With its hallmark clarity and accuracy','James M. Gere, Barry J. Goodno','Cengage Learning',20,2455.75),
('S01-17','Electric Machines: Principles, Applications, and Control Schematics','Science and Technology','Electric Machines: Principles, Applications, and Control Schematics','Dino Zorbas','Cengage Learning',20,859.75),
('S01-18','Fluid Mechanics : Fundamentals and Applications','Science and Technology','The overall content and order of presentation has not changed significantly except for the following : the visual impact of all figures and photographs has been enhanced by a full color treatment.','Yunus A. Cengel, John M. Cimbala','McGraw-Hill',20,1021.25),
('L02-1','Horridly Ever After','Literature','Seventeen short stories by a contemporary Thai writer These seemingly simple tales will challenge you to reflect on diverse matters ranging from individual conflicts to social issues Darkly amusing','Aditya Khamvongsa','ArtyHOUSE',20,317.30),
('L02-2','The Interspecies Trilogy: The Mermaid Apprentices','Literature','Two teenagers... A world of mythological beings... And a whirlwind of adventure.','Pieretta Dawn','Asia Books Co.,Ltd.',20,366.70),
('L02-3','The Boy Who Was Haunted by a Ghost other Scary Stories','Literature','Aditya Khamvongsa work takes the readers on a walk through an unearthly passage with surreal atmosphere, filled with childhood impressions, mysterious satires, and bizarre symbolism.','Aditya Khamvongsa','ArtyHOUSE',20,221.35),
('L02-4','A Scattered World','Literature','A novel of magical realism and verbal magic set on the fault line of Islam and Buddhism in Southern Thailand.','Siriworn Kaewkan','Pajonphai Publishing',20,185.25),
('L02-5','Halo: Ghosts of Onyx','Literature','The Spartan-II program has gone public. Tales of super-soldiers fending off thousands of Covenant attacks have become the stuff of legend.','Eric Nylund','Tor Books',20,256.50),
('L02-6','Chasing Harry Winston','Literature','A trio of best friends in Manhattan agree to change their lives in the most personal and dramatic way possible -- and within one calendar year.','Lauren Weisberger','Simon & Schuster',20,304.00),
('L02-7','Harry Potter and the Deathly Hallows','Literature','In this dramatic conclusion to the harry Potter series, Harry must leave his most loyal friends behind, and in a final perilous journey find the strength and the will to face his terrifying destiny.','J.K. Rowling','Bloomsbury',20,1187.50),
('L02-8','Toward the Light','Literature','The Story of the Struggles for Liberty and Rights that Made the Modern West...','A.C.Grayling','Bloomsbury',20,399.00),
('L02-9','The Indian Clerk','Literature','The Indian Clerk is an utterly compelling story about our need to find order in the world.','David Leavitt','Bloomsbury',20,361.00),
('L02-10','Hell and Earth : A Novel of the Promethean Age','Literature','Queen Mab rules an enchanted land, but her life is bound to the world of iron...','Elizabeth Bear','Roc Book',20,484.50),
('L02-11','Ink and Steel : A Novel of the Promethean Age','Literature','Queen Elizabeth rules by wit and by will. But magic keeps her on the throne...','Elizabeth Bear','Roc Book',20,484.50),
('L02-12','The Devil of Nanking','Literature','A harrowing thriller that plumbs the secret connections between the Tokyo underworld and a grisly atrocity in wartime China','Mo Hayder','Penguin Books, Ltd.',20,275.50),
('L02-13','Suffer the Little Children','Literature','A Commissario Guido Brunetti Mystery by the International Bestselling Author of Fatal Remedies and The Girl of His Dreams','Donna Leon','Penguin Books, Ltd.',20,275.50),
('L02-14','Violet in Private','Literature','A story for any girl who ever wondered what it would be like to have her wildest dream come true.','Melissa Walker','Berkley Jam',20,342.00),
('L02-15','The Sky So Near','Literature','A historical romance saga set in Siam and Malaya during colonial times.','Pensri Kiengsiri','Woman publisher',20,560.50),
('L02-16','The Art of Keeping Secrets','Literature','Storytelling is a gift, and Patti has the gif','Patti Callahan Henry','NAL ACCENT',20,484.50),
('L02-17','The Dark Ones','Literature','They roam the night waiting to strike...','Anthony Izzo','Pinnacle Books',20,266.00),
('L02-18','Crescent Moon','Literature','when the moon changes its shape, temptation and terror become one...','Lori Handeland','Pan Macmillan',20,361.00),
('E03-1','Industrial Robotics and Mechatronics Applications','Education','This book is an attempt to provide a basic background to industrial robotics and mechatronics applications and provide links through to more specialized skills.','Dechrit Maneetham, Dr.','Se-education,Ltd.',20,357.00),
('E03-2','Complete TOEIC - Listening','Education','Listening provides test-takers with essential skills, knowledge and trips to achieve the highest possible score on the listening components of the TOEIC test Test components covered include','Sayamol Panseeta','Interact Images Co. Ltd.',20,274.55),
('E03-3','Essential Grammar for TOEIC, IELTS and TOEFL','Education','Essential Grammar for TOEIC, IELTS and TOEFL is an English grammar instructional book with comprehensive coverage of all core English grammar topics','Sayamon Panseeta','Interact Images Co. Ltd.',20,236.55),
('E03-4','Essential Vocabulary for TOEIC, IELTS and TOEFL','Education','Essential Vocabulary for TOEIC, IELTS and TOEFL is an English vocabulary exercise book covering 600 commonly-encountered words in the TOEIC, IELTS and TOEFL tests','Sayamol Panseeta','Interact Images Co. Ltd.',20,236.55),
('E03-5','Essential IELTS in 30 Days','Education','Essential IELTS in 30 Days provides test-takers with essential skills, knowledge and tips to achieve the highest possible score on the Ielts test.','Daniel Cole','Interact Images Co. Ltd.',20,284.05),
('E03-6','English Reading and Writing Integration : A Thinking Skill Approach','Education','This textbook focuses on the integration of reading and writing skills useful for graduate students and other people.','Asst.Prof.Dr. Kasma Suwanarak','National Institute of Development Administration Press',20,399.50),
('E03-7','Diagnostic Maths Topical Tests P1','Education','Diagnostic Topical Tests is a series of structured assessment tools. Specially written in accordance with the later MOE Syllabus, this series assists in systematic evaluation of pupils learning.','Li Fanglan','Fan-Math Education',20,285.00),
('E03-8','Learning English Kindergarten 1','Education','Build vocabulary through pictures and sentences. Encourage observations through reading and writing activities. Boost writing skills through sentence formation exercises.','S. James','Singapore Asian Publishers Pte Ltd.',20,204.25),
('E03-9','Learning English Nursery','Education','Learn to recognize, read and write the letters of the alphabet. Recongnize words through pictures. Understand self and others through themes.','S. James','Singapore Asian Publishers Pte Ltd.',20,204.25),
('E03-10','How to Improve Your Mathematics Primary 3','Education','How to Improve Your Mathematics is a series of books specially compiled for primary pupils according to the latest Primary Mathematics syllabus issued by the Ministry of Education.','Andrew Er','Educational Publishing House Pte Ltd',20,209.00),
('E03-11','Step-by-Step Maths Primary 3','Education','This series equips pupils with skills to perform academically and to meet the life challenges that lay ahead of them.','Simon Eio','Educational Publishing House Pte Ltd',20,199.50),
('E03-12','Discovering Additional Mathematics : Workbook','Education','Mathematics textbook for secondary school students. It is designed to give students more practice in applying the concepts learnt.','Chow Wai Keung','Star Publishing',20,418.00),
('E03-13','Discovering Additional Mathematics A : Textbook','Education','Textbook in the discovering Mathematics series written for students in secondary schools. This textbook prepares students for the Singapore-Cambridge GCE O-Level Examinations in Additional Mathematics','Chow Wai Keung','Star Publishing',20,612.75),
('E03-14','Discovering Additional Mathematics B : Textbook','Education','Mathematics textbook for secondary school students. It is designed to give students more practice in applying the concepts learnt.','Chow Wai Keung','Star Publishing',20,375.25),
('E03-15','Information and Communication Technology Primary 4','Education','This Series Helps Students to Explore the World of Computers Through its : Step-by-Step Instructions, Clear and Concise Text, Exciting Hands-on Activities.','Ping Rajan','Pelangi Publishing (Thailand) Co., Ltd.',20,76.50),
('E03-16','Earth System Science Student Book Grade 7-9','Education','Earth System Science Textbook promotes the learning about the environment in a scientific manner. Within the framework of the GLOBE Project, this course has been developed by scientists','The Institute the Promotion of Teaching Science and Technology(IPST)','Aksorn Smart Co., Ltd.',20,465.50),
('E03-17','Scholastic Study Smart Reading Skills Builder : Level K1','Education','This book introduces, teaches and reinforces common phonics sound patterns, word families and sight words through the use of poems.','Kama Einhorn,Rozanne Lanczak Williams','Scholastic Singapore',20,142.50),
('E03-18','Scholastic Study Smart K2 : Reading Skills Builder','Education','Develops reading fluency using phonics, word families and sight words.','Kama Einhorn,Rozanne Lanczak Williams','Scholastic Singapore',20,142.50),
('E03-19','Handbook of Research Methodology in International Business','Education','This book can serve two main purpose. For teaching, this book is recommended for an advanced research course as a reference rather than a main text book.','Amonrat Thoumrungroje','Triple Education Co., Ltd.',20,285.00),
('C04-1','Amazing Dolphins','Children and Toddler','Children Should be Able to Memorize 26 English Letters in Order to Understand how to Pronounce and Spell the Words in Fun Phonics Reading.','Apinya Sangsanont','Inter Kids',20,85.50),
('C04-2','Alice in Wonder Sea','Children and Toddler','A magical fairy tale for children of all ages. Reading it will show you the value of learning how to think "outside the box!"','S.REE FREEWALL and 3 Ds','Seree Pakarnseree',20,407.55),
('C04-3','Legend of the Buddha','Children and Toddler','The Stories of Buddha, Chief Disciples and Other Notable Figures of Buddhism.','Ohm Rachavate','Amarincomics',20,327.720),
('C04-4','I Can Trick a Tiger','Children and Toddler','I Can Trick a Tiger is Level 2b for children starting to read - those children who can recognize a few words by sight, can use pictures to help read simple sentences, and know some letter sounds.','Alex Brychta, Cynthia Rider','Oxford University Press',20,142.50),
('C04-5','Poor Old Rabbit','Children and Toddler','The story has a high degree of patterning and vocabulary repetition with one to two sentences per page. Level 2 corresponds roughly to ORT stage 2-3.','Alex Brychta, Cynthia Rider','Oxford University Press',20,142.50),
('C04-6','Floppy and the Bone','Children and Toddler','It retells the fable The Dog and the Bone as an everyday story, so there are opportunities for children to compare the two stories. Level 2 corresponds roughly to ORT stage 2-3.','Alex Brychta, Cynthia Rider','Oxford University Press',20,142.50),
('C04-7','Pairs : Twins and Other Twosomes','Children and Toddler','Pairs are all around us and we usually assume they are two identical things.','Evan Welty','Ammonite Flims Publishing',20,460.75),
('C04-8','Milva and the Magic Voice','Children and Toddler','In a short epilogue, the "Magic Voice" summarizes the morale of the story in grown up words for older children, parents, teachers.','Karin-Regina Florey','PAKVAN PUBLISHING',20,185.25),
('C04-9','Storybook Collection','Children and Toddler','Dive into Adventure, Disney Pixar Style','Disney Press','Disney Press',20,565.25),
('C04-10','Jack and the Beanstalk','Children and Toddler','Thes are the original Ladybird retellings, with beautiful new pictures of the kind children like best full of richness and detail.','B.Com M.A., M.A. Vera Southgate','Ladybirds Books',20,95.00),
('C04-11','Tale Time : Sleeping Beauty','Children and Toddler','Wonderful Collection of evergreen childrenâ?s classic tales. The outstanding illustrations make very book an interesting and excellent read.','June Chiang','Penerbitan Pelangi Sdn. Bhd.',20,72.20),
('C04-12','Favourite Tales : The Lion and the Hare','Children and Toddler','Ladybird Favourite Tales are the timeless, treasured stories that generations of children have grown up with and loved. These easy-to-read retellings, enhanced by exciting, richly colourful illustrations, faithfully capture all the magic of the magic of the original stories.','Sampurna Chatterjee','Ladybirds Books',20,80.75),
('C04-13','Little Foam Friends Duck','Children and Toddler','Ladybug presents a day in the life of a little ladybug. / Duck introduces a little duck at play in the pond.','PlayBac','PlayBac Publishing',20,61.75),
('C04-14','Little Foam Friends Ladybug','Children and Toddler',' Ladybug presents a day in the life of a little ladybug. / Duck introduces a little duck at play in the pond.','PlayBac','PlayBac Publishing',20,61.75),
('C04-15','Amazing Life Cycles: Reptiles and Amphibians','Children and Toddler','Explore the lives and life cycles of some amazing wild animals...','Brian Williams','Tick Tock',20,275.50),
('C04-16','How to Draw: Magical Creatures and Mythical Beasts','Children and Toddler','Learn how to draw a variety of planes, from easy aviation to supersonic flying machines.','Mark Bergin','Book House',20,166.25),
('C04-17','How to Draw: Mecha Robots and Battle Fantasy Figures','Children and Toddler','Learn how to draw a variety of futuristic robots and machines, and combine them to make your own sci-fi and fantasy scenes.','Mark Bergin','Book House',20,166.25),
('C04-18','The Science Library: Animal Life','Children and Toddler','Where do marsupials LIVE? How do rhinoceroses COMMUNICATE? Discover the answers to these questions and many more...','Steve Parker','Miles Kelly Publishing Ltd.',20,266.00),
('ET05-1','Lonely Planet : Thailand','Entertainment and Travel','Bangkok pull-out map top sights in full detail Islands planner','Mark Beales, Tim Bewer, Joe Bindloss, Austin Bush, David Eimer, Bruce Evans, Damian Harper','Lonely Planet Publications',20,945.25),
('ET05-2','Thailand Small Hotels : Bangkok 2','Entertainment and Travel','The eleventh in the series of the successful Thailand Small Hotels and the second of Thailand Small Hotels BANGKOK','Li-Zenn Publishing Limited','Li-Zenn Publishing Limited',20,845.50),
('ET05-3','Exploring Bangkok','Entertainment and Travel','Exploring Bangkok An Architectural and Historical Guidebook','Robin Ward','Li-Zenn Publishing Limited',20,760.00),
('ET05-4','Lonely Planet : Vietnam','Entertainment and Travel','Ho Chi Minh City & Hanoi pull-out map. Bonut Coverage of Angkor Wat.','Iain Stewart, Brett Atkinson, Damian Harper, Nick Ray','Lonely Planet Publications',20,878.75),
('ET05-5','How to Improve At : Basketball','Entertainment and Travel','These guides show you step by step how to get on top of every aspect of your game.','Jim Drewett','Ticktock Media Ltd.',20,332.50),
('ET05-6','IN SEARCH OF TIGER','Entertainment and Travel','A Journey Through Golf with Tiger Woods','Tom Callahan','Crown Publishers',20,736.25),
('ET05-7','The Kingdom of Siam : The Art of Central Thailand 1350-1800','Entertainment and Travel','The artistic accomplishments of Ayuutthaya are unfortunately not well know outside Thailand. I am pleased that an exhibition of many wonderful...','M.L.Pattaratorn Chirapravati,Forrest McGill','Tuttle Publishing',20,935.75),
('ET05-8','Jazz Chant Fairy Tales','Entertainment and Travel','Jazz Chants Fairy Tales is a collection of eight best-loved fairy tales designed to teach conversational American English...','Carolyn Graham','Oxford University Press',20,522.50),
('ET05-9','Jazz Chants for Children','Entertainment and Travel','This delightful, beautifully illustrated book, designed especially for children, uses chants, songs, and poems...','Carolyn Graham','Oxford University Press',20,522.50),
('ET05-10','Lonely Planet : Bhutan','Entertainment and Travel','Expert recommendations, Best planning advice, Off-the-beaten-track essentials.','Lindsay Brown, Bradley Mayhew','Lonely Planet Publications',20,945.25),
('ET05-11','Lonely Planet : Laos','Entertainment and Travel','100% researched & updated, Best planning advice, Expert recommendations.','Nick Ray, Greg Bloom, Richard Waters','Lonely Planet Publications',20,850.25),
('ET05-12','Lonely Planet Discover : Japan','Entertainment and Travel','Experience the Best of Japan','Wendy Yanagihara,Benedict Walker,Kate Morgan,Rebecca Milner,Craig McLachlan,Trent Holden,Laura Crawford,Chris Rowthorn','Lonely Planet Publications',20,902.50),
('ET05-13','The Rough Guide to Laos','Entertainment and Travel','Laos offers a glimpse of a forgotten Asia - pristine jungles, people renowned for their friendliness and possibly the most relaxed capital city on earth...','Jeff Cranmer, Steven Martin','Rough Guides',20,617.50),
('ET05-14','Lonely Planet : A Year of Adventures','Entertainment and Travel','A Guide To The World Most Exciting Experiences','ED. Trent Holden, ED. Alison Ridgway, ED. Dianne Schallmeiner','Lonely Planet Publications',20,660.25),
('ET05-15','Exciting Thailand Volume 1: Mysterious Bangkok','Entertainment and Travel','Mysterious Bangkok is a lovingly-written cultural and historical city guide which portrays the citizens of Bangkok with heartfelt sensitivity...','Dr. Robert Frei','Asia Books Co.,Ltd.',20,755.25),
('ET05-16','Lonely Planet Pocket : Bangkok 4','Entertainment and Travel','Top Sights - Local Life - Made Easy','Austin Bush','Lonely Planet Publications',20,451.25),
('ET05-17','Lonely Planet Pocket : Phuket','Entertainment and Travel','Top Experiences - Local Life - Made Easy','Trent Holden, Kate Morgan','Lonely Planet Publications',20,451.25),
('ET05-18','Exciting Thailand : A Visual Journey','Entertainment and Travel','By any standards Thailand is a unique and special place.','Andrew Forbes','Periplus',20,660.25),
('FH06-1','Thai Cakes and Desserts','Food and Health','Featuring over 30 made-easy recipes, this cookbook is an ideal guide for making authentic Thai cakes and desserts accessible to every home.','Chat Mingkwan','Periplus',20,114.00),
('FH06-2','The Asian Barbecue Book','Food and Health','This book on Asian barbecue will give enthusiastic grillers the inspiration and practical guidance to create countless delicious Asian-inspired meals','Alex Skaria','Tuttle Publishing',20,935.75),
('FH06-3','Periplus Mini Cookbooks : Homestyle Chinese Cooking','Food and Health','A Selection of delicious Chinese dishes that are easy to prepare at home, and light and healthy too!','Daniel Reid','Periplus',20,114.00),
('FH06-4','Indonesian Cakes and Desserts','Food and Health','A delicious selection of over 30 tropical cakes and dessert from around the Indonesian archipelago from Fried Bananas with Coconut...','William Wongso, Hayatinufus A. L. Tobing','Periplus',20,114.00),
('FH06-5','The Asian Kitchen','Food and Health','Savor the authentic flavors of dishes from all parts of Asia from the spicy satays of Indonesia to the fragrant spring rolls of Saigon.','Kong Foong Ling','Periplus',20,836.00),
('FH06-6','Energy Boost','Food and Health','Energy-giving food solutions to keep you fully charged throughout the day','Beverly le Blanc','Love Food',20,189.05),
('FH06-7','Healthy Meals for Babies and Toddlers','Food and Health','Delicious and nutritious recipes for your children, from weaning to starting their school years.','Valerie Barrett','Love Food',20,246.05),
('FH06-8','6 Minute Morning Workout','Food and Health','Stretchig, toning and shaping your body','Faye Rowe, Sara Rose','Parragon Publishing',20,246.05),
('FH06-9','Pilates Perfect: The Complete Guide to Pilates Exercise at Home','Food and Health','Get in the best shape of your life with Pilates Perfect.','Dianne Daniels','Healthy Living Books',20,579.50),
('FH06-10','Combat Fat: The Complete Plan for Permanent Weight Loss','Food and Health','Based on the official surgeon general and cdc guidelines','Rosemarie Alfieri, Stew Smith, James Villepigue, M. Laurel Cutlip, Andrew Flach','Hatherleigh Press',20,551.00),
('FH06-11','Classic One Pot Cooking','Food and Health','Over 300 Delicious Recipes from Around the World','Hajra Makda','Apple Press',20,921.50),
('FH06-12','Low-fat no-fat Thai','Food and Health','Over 190 delicious and authentic recipes from Thailand, Burma, Indonesia, Malaysia and the Philippines','Jane Bamforth','Lorenz Books',20,850.25),
('FH06-13','Thai Cooking','Food and Health','How to prepare and cook 75 delicious and authentic Thai dishes step-by-step, with over 450 photographs and easy-to-follow expert advice on special ing','Judy Bastyra','Southwater Publishing',20,712.50),
('FH06-14','Smoothies and Juices','Food and Health','Whatever the time of day, or whatever the occasion, this book will ensure you have the perfect drink every time','Christine Ambridge','Parragon Publishing',20,712.50),
('FH06-15','Betty Crocker Small Bites','Food and Health','100 Recipes for the Way You Really Cook','Betty Crocker','Wiley Publishing, Inc.',20,641.25),
('FH06-16','Thai Curry','Food and Health','Thailand a tropical country blessed with natural food resources, so choices for curry ingredients are hugely broad, resulting in a variety of curry dishes and recipes with regional differences.','Thawithong Hongwiwat, Yada Sringernyuang','Seangdad Publishing',20,142.50),
('FH06-17','Thai Fusion Cuisine','Food and Health','80 Thai recipes that combine and mix use of the internationak and local ingredients perfectly well.','Nareerat Srisawat','Amarin Cuisine',20,375.25),
('FH06-18','Everyday Thai','Food and Health','Simple and Delicious Recipes for Thai Cooking at Home','Ph.D. Thavithong Hongwiwat','Seangdad Publishing',20,755.25),
('FH06-19','No-Bake Desserts','Food and Health','Delicious Homemade Treats Made Easy, Fast and Over-free','Pantira Rattanadilok Na Phuket','Seangdad Publishing',20,332.50);


CREATE TABLE HISTORYORDER(
OrderID INT NOT NULL PRIMARY KEY,
USERNAME VARCHAR(30) NOT NULL,
TIMEDATE DATE NOT NULL,
METHOD VARCHAR(20) NOT NULL,
AMOUNT INT NOT NULL,
PRICE DECIMAL NOT NULL,
CONSTRAINT FK_accountUSERNAME_historyOrder FOREIGN KEY (USERNAME) REFERENCES account (USERNAME) ON DELETE NO ACTION ON UPDATE NO ACTION);

--6.) Create table HISTORYORDERDETAIL

CREATE TABLE HISTORYORDERDetail (
OrderDetailId int not null primary key,
OrderID INT NOT NULL ,
productCode VARCHAR(10) NOT NULL,
productQuantity int not null,
productPrice decimal not null,
CONSTRAINT FK_productCode_historyOrderDetail FOREIGN KEY (productCode) REFERENCES Product (ProductCode) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT FK_orderId_historyOrderDetail FOREIGN KEY (orderId) REFERENCES historyOrder (orderId) ON DELETE NO ACTION ON UPDATE NO ACTION);
