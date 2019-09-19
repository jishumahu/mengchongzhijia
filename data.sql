-- 数据库名称pet — —宠物
SET NAMES UTF8;
DROP DATABASE IF EXISTS pet;
CREATE DATABASE pet CHARSET=UTF8;
USE pet;
-- 创建表格
-- 1、轮播图
CREATE TABLE pet_banner(
    bid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),  #标题文字
    pic VARCHAR(256),
    aid VARCHAR(32)
);
INSERT INTO pet_banner VALUES
(null,'全国包邮，送货上门','img/carousel/1.jpg',0),
(null,'全国包邮，送货上门','img/carousel/2.jpg',1),
(null,'全国包邮，送货上门','img/carousel/3.jpg',2),
(null,'全国包邮，送货上门','img/carousel/4.jpg',3),
(null,'全国包邮，送货上门','img/carousel/5.jpg',4);
-- 2、首页可认领萌宠  
CREATE TABLE pet_cutepet(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(256),
    details VARCHAR(64), #宠物详情
    cname VARCHAR(32),  #宠物名称
    price DECIMAL(10,2),
    fid INT              #宠物种类编号
);
INSERT INTO pet_cutepet VALUES
(null,'img/fppet/bosi.jpg','波斯猫','persian','6568','0'),
(null,'img/fppet/buou.jpg','布偶猫','ragdoll','18888','1'),
(null,'img/fppet/wumao.jpg','加拿大无毛猫','Canadian Hairless','15654','2'),
(null,'img/fppet/meiduan.jpg','美国短毛猫','American Shorthai','3258','3'),
(null,'img/fppet/nwsl.jpg','挪威森林猫','Norwegian Forest Cat','2589','4'),
(null,'img/fppet/xianluo.jpg','暹罗猫','xianluo','3689','5'),
(null,'img/fppet/yingduan.jpg','英国短毛猫','English Shorthai','3123','6'),
(null,'img/fppet/aiji.jpg','埃及猫','Egyptian cat','2323','8'),
(null,'img/fppet/lihua.jpg','狸花猫','Beaver cat','5648','9'),
(null,'img/fppet/mengmai.jpg','孟买猫','Bombay cat)','4682','10');

-- 3、首页宠物用品
CREATE TABLE pet_supply(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(256),
    sname VARCHAR(32),      #商品名称
    details VARCHAR(64),    #商品详情
    price DECIMAL(10,2),
    pid INT                 #商品编号
);
INSERT INTO pet_supply VALUES
(null,'img/fppetjoy/1.jpg','猫罐头','babypet 白肉猫罐头主食罐100g*6增肥营养幼猫零食金枪鱼肉汤湿粮','50.00',1),
(null,'img/fppetjoy/2.jpg','成猫粮','雪山室内成猫粮6磅折耳英短加菲猫天然猫粮田园去毛球全猫粮2.7kg','66.00',2),
(null,'img/fppetjoy/3.jpg','猫砂','宠匠水蜜桃豆腐猫砂除臭无尘环保特价包邮抗菌成幼猫通用猫砂6L','99.00',3),
(null,'img/fppetjoy/4.jpg','猫砂盆','MEET全自动猫砂盆厕所清洁器电动全封闭智能猫咪铲屎机去臭猫沙盆','66.00',4),
(null,'img/fppetjoy/5.jpg','猫罐头湿粮','腐败猫-PurePaws飘仕白肉去毛球配方猫罐头湿粮拼箱组合 80g*6罐','88.00',5),
(null,'img/fppetjoy/6.jpg','猫沙盆','猫砂盆防外溅全半封闭特大号猫厕所猫屎盆拉屎猫沙盆猫咪全套用品','56.00',6),
(null,'img/fppetjoy/7.jpg','猫咪玩具球','抖音同款猫咪玩具球led闪光球激光逗猫球自嗨猫玩具发光自动变向','70.00',7),
(null,'img/fppetjoy/8.png','除臭猫沙','格琳斯膨润土猫砂柠檬味无尘香砂结团猫砂5L抗菌除臭猫沙养猫常备','80.00',8),
(null,'img/fppetjoy/9.jpg','网红猫玩具','网红猫玩具打地鼠机箱猫抓板人宠互动益智玩具自嗨逗猫棒猫咪用品','90.00',9),
(null,'img/fppetjoy/10.jpg','磨牙新品啃咬抱枕','Meowcard 大鸡腿子猫薄荷猫卡逗猫网红玩具磨牙新品啃咬抱枕爆款','100.00',10);
-- 宠物家族
CREATE TABLE pet_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(32)
);
INSERT INTO pet_family VALUES
(0,'波斯猫'),
(null,'布偶猫'),
(null,'加拿大无毛猫'),
(null,'美国短毛猫'),
(null,'挪威森林猫'),
(null,'暹（xiān）罗猫'),
(null,'英国短毛猫'),
(null,'苏格兰折耳猫'),
(null,'孟买猫'),
(null,'加菲猫'),
(null,'孟加拉豹猫');
-- 宠物用品类别
CREATE TABLE pet_sup_family(
    sfid  INT PRIMARY KEY AUTO_INCREMENT,
    sfname VARCHAR(32) 
);
INSERT INTO pet_sup_family VALUES
(0,'猫罐头'),
(null,'猫粮'),
(null,'猫砂'),
(null,'猫砂盆'),
(null,'猫玩具');
--宠物列表bcsfa 
CREATE TABLE pet_animal(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,      #宠物品种家族编号
    title VARCHAR(128), #主标题
    subtitle VARCHAR(128),  #副标题
    price DECIMAL(10,2),#价格
    aname VARCHAR(32),#宠物名称
    age INT,    #宠物年龄
    details VARCHAR(256),#宠物详情
    oldmaster VARCHAR(32),#宠物原主
    says VARCHAR(256),#原主人寄语
    saletime BIGINT,#寄售时间
    is_onsale BOOLEAN,#是否可以免费认领
    lg VARCHAR(128),#大图
    md VARCHAR(128),#中图
    sm VARCHAR(128)#小图
);
INSERT INTO pet_animal VALUES
(null,1,'家养纯种布偶','布偶猫活体幼猫宠物猫 家养纯种布偶猫海豹蓝双重点色 满背满耳',5000,'小猫','50天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','王先生','眼泪不是答案，拼搏才是选择。只有回不了的过去，没有到不了的明天。','2019-05-25',0,'img/products/lg/8.png','img/products/md/8.png','img/products/sm/8.png'),
(null,8,'小黑豹幼猫','深圳可上门 孟买猫纯种活体小黑豹幼猫黑猫招财僻邪猫cfa血统认证',3000,'小布','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','谷先生','一个人失败的最大原因，就是对于自己的能力永远不敢充分信任，甚至认为自己必将失败。','2019-08-23',1,'img/products/lg/9.jpg','img/products/md/9.jpg','img/products/sm/9.jpg'),
(null,9,'加菲猫纯种','出售纯种加菲加菲猫宠物猫加菲猫幼崽宠物猫加菲猫纯种猫咪活幼体',1666,'小汪','25天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','汪先生','不要质疑你的付出，这些都会一种累积一种沉淀，它们会默默铺路，只为让你成为更优秀的人。','2019-07-15',0,'img/products/lg/10.jpg','img/products/md/10.jpg','img/products/sm/10.jpg'),
(null,1,'仙女猫布偶','杭州猫舍出售布偶猫活体幼猫海双布偶猫蓝双仙女猫布偶宠物猫猫咪',8888,'小瑞','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','陈先生','所有的不甘，都是因为还心存梦想，在你放弃之前，好好拼一把，只怕心老，不怕路长。','2019-04-15',1,'img/products/lg/13.jpg','img/products/md/13.jpg','img/products/sm/13.jpg'),
(null,6,'蓝猫英短','猫咪活物布偶幼崽宠物猫活体渐层猫猫咪活幼体蓝猫幼猫英国短毛猫',6666,'小谷','60天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','任小姐','不管前方的路有多苦，只要走的方向正确，不管多么崎岖不平，都比站在原地更接近幸福。','2019-03-12',0,'img/products/lg/14.jpg','img/products/md/14.jpg','img/products/sm/14.jpg'),
(null,3,'标斑美短','美国短毛猫标斑美短虎斑加白起司猫母猫妹妹活体宠物猫家养幼猫',2300,'小梦','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','吴小姐','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态。——叔本华','2019-04-12',0,'img/products/lg/1.jpg','img/products/md/1.jpg','img/products/sm/1.jpg'),
(null,6,'蓝猫幼崽','蓝猫幼崽纯种蓝白猫活体猫宠物猫折耳猫英短猫美短猫布偶猫渐层猫',5000,'小阳','40天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','魏先生','心态决定看世界的眼光，行动决定生存的状态。要想活出尊严，展现不凡，只有改变观念，敢于和命运抗争！','2019-05-01',0,'img/products/lg/2.jpg','img/products/md/2.jpg','img/products/sm/2.jpg'),
(null,1,'仙女猫小浣熊','布偶猫幼猫活体幼猫纯种蓝眼睛宠物猫幼崽布偶猫仙女猫 小浣熊',7000,'小陈','35天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','马先生','与其在风雨中逃避，不如在雷电中舞蹈，即便淋得透湿，也是领略生命的快意。','2019-08-25',1,'img/products/lg/3.jpg','img/products/md/3.jpg','img/products/sm/3.jpg'),
(null,2,'斯芬克斯无毛猫','无毛猫活体斯芬克斯无毛猫幼猫加拿大无毛猫白皮蓝眼精灵耳无毛猫',4000,'小浩','25天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','陈小姐','每个成功者，都要穿越不为人知的黑暗。强者不是没眼泪，只是能含着眼泪向前跑。','2019-08-10',0,'img/products/lg/4.jpg','img/products/md/4.jpg','img/products/sm/4.jpg'),
(null,1,'海双布偶猫','布偶猫幼猫纯种布偶猫幼崽海双布偶猫赛级仙女猫咪活幼体猫咪活物',6000,'佳佳','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','许先生','如果你想要什么，那就勇敢地去追求，不要管别人是怎么想的，因为这就是实现梦想的方式——行动。','2019-05-15',1,'img/products/lg/5.jpg','img/products/md/5.jpg','img/products/sm/5.jpg'),
(null,5,'纯种海豹重点暹罗猫','纯种海豹重点暹罗猫幼猫活体宠物猫咪先罗猫蓝眼泰国猫短毛猫挖煤',5555,'豆包','35天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','严小姐','人生没有对错，只有选择后的坚持，不后悔，走下去，就是对的。走着走着，花就开了。','2019-08-21',0,'img/products/lg/6.jpg','img/products/md/6.jpg','img/products/sm/6.jpg'),
(null,10,'纯种金豹幼猫','孟加拉豹猫活体纯种金豹幼猫雪豹亚豹宠物猫幼崽巨型空心大玫瑰纹',7500,'菜包','40天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','刘小姐','生活中其实没有绝境，绝境在于你自己的心没有打开。','2019-05-23',0,'img/products/lg/7.jpg','img/products/md/7.jpg','img/products/sm/7.jpg'),
(null,7,'蓝白活体猫咪','蓝白活体猫咪折耳加菲猫英短布偶渐层蓝猫金吉拉暹罗宠物猫咪橘猫',2000,'肉包','50天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','李先生','盛年不重来，一日难再晨，及时当勉励，岁月不待人','2019-06-23',1,'img/products/lg/11.jpg','img/products/md/11.jpg','img/products/sm/11.jpg'),
(null,6,'英短蓝猫幼猫','英短蓝猫幼猫活体纯种蓝白猫英短银渐层加菲猫美短猫家养猫咪活物',9999,'土豆包','28天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','王小姐','自觉心是进步之母，自贱心是堕落之源，故自觉心不可无，自贱心不可有。——邹韬奋','2019-02-12',0,'img/products/lg/12.jpg','img/products/md/12.jpg','img/products/sm/12.jpg'),
(null,1,'仙女蓝眼猫','北京猫舍海双布偶猫幼猫宠物仙女蓝眼猫曼基康矮脚猫布偶活体幼猫',5000,'酸菜包','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','杨任杰','每个成功者，都要穿越不为人知的黑暗。强者不是没眼泪，只是能含着眼泪向前跑。','2019-08-15',0,'img/products/lg/15.jpg','img/products/md/15.jpg','img/products/sm/15.jpg');
--宠物商品列表 bcsfap
CREATE TABLE pet_products(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    sf_id INT,  #商品家族编号
    title VARCHAR(128),#主标题
    subtitle VARCHAR(128),#副标题
    price DECIMAL(10,2),
    details VARCHAR(256),#详情
    lg VARCHAR(128),#大图
    md VARCHAR(128),#中图
    sm VARCHAR(128),#小图
    nums INT,#库存数量
    is_onsale BOOLEAN #是否促销
);
-- 0 猫罐头 1 猫粮 2 猫砂 3 猫砂盆 4猫玩具
INSERT INTO pet_products VALUES
(null,0,'白肉猫罐头','babypet 白肉猫罐头主食罐100g*6增肥营养幼猫零食金枪鱼肉汤湿粮','12.9','xxx','img/products/lg/gt/2.jpg','img/products/md/gt/2.jpg','img/products/sm/gt/2.jpg',520,0),
(null,1,'雪山室内成猫粮','雪山室内成猫粮6磅折耳英短加菲猫天然猫粮田园去毛球全猫粮2.7kg','34.9','xxx','img/products/lg/ml/10.jpg','img/products/md/ml/10.jpg','img/products/sm/ml/10.jpg',520,1),
(null,2,'水蜜桃豆腐猫砂','宠匠水蜜桃豆腐猫砂除臭无尘环保特价包邮抗菌成幼猫通用猫砂6L','56.9','xxx','img/products/lg/ms/9.jpg','img/products/md/ms/9.jpg','img/products/sm/ms/9.jpg',520,0),
(null,3,'MEET全自动猫砂盆','MEET全自动猫砂盆厕所清洁器电动全封闭智能猫咪铲屎机去臭猫沙盆','78.9','xxx','img/products/lg/msp/10.jpg','img/products/md/msp/10.jpg','img/products/sm/msp/10.jpg',520,0),
(null,0,'去毛球配方猫罐头湿粮','腐败猫-PurePaws飘仕白肉去毛球配方猫罐头湿粮拼箱组合 80g*6罐','91.9','xxx','img/products/lg/gt/9.jpg','img/products/md/gt/9.jpg','img/products/sm/gt/9.jpg',520,1),
(null,3,'防外溅全半封闭猫沙盆','猫砂盆防外溅全半封闭特大号猫厕所猫屎盆拉屎猫沙盆猫咪全套用品','23.9','xxx','img/products/lg/msp/9.jpg','img/products/md/msp/9.jpg','img/products/sm/msp/9.jpg',520,1),
(null,4,'猫咪玩具球','抖音同款猫咪玩具球led闪光球激光逗猫球自嗨猫玩具发光自动变向','45.9','xxx','img/products/lg/mwj/2.jpg','img/products/md/mwj/2.jpg','img/products/sm/mwj/2.jpg',520,0),
(null,2,'除臭猫沙','格琳斯膨润土猫砂柠檬味无尘香砂结团猫砂5L抗菌除臭猫沙养猫常备','67.9','xxx','img/products/lg/ms/10.jpg','img/products/md/ms/10.jpg','img/products/sm/ms/10.jpg',520,0),
(null,4,'网红猫玩具','网红猫玩具打地鼠机箱猫抓板人宠互动益智玩具自嗨逗猫棒猫咪用品','89.9','xxx','img/products/lg/mwj/8.jpg','img/products/md/mwj/8.jpg','img/products/sm/mwj/8.jpg',520,1),
(null,4,'磨牙新品啃咬抱枕','Meowcard 大鸡腿子猫薄荷猫卡逗猫网红玩具磨牙新品啃咬抱枕爆款','12.9','xxx','img/products/lg/mwj/10.jpg','img/products/md/mwj/10.jpg','img/products/sm/mwj/10.jpg',520,0),
(null,0,'麦富迪猫咪主食罐','泰国进口猫罐头麦富迪猫咪主食罐170g12幼猫零食营养增肥湿粮整箱','34.9','xxx','img/products/lg/gt/1.jpg','img/products/md/gt/1.jpg','img/products/sm/gt/1.jpg',520,0),
(null,0,'营养增肥幼猫主食猫罐头','猫罐头包邮170g*12罐 营养增肥幼猫主食罐猫咪湿粮猫零食特价秒杀','56.9','xxx','img/products/lg/gt/3.jpg','img/products/md/gt/3.jpg','img/products/sm/gt/3.jpg',520,0),
(null,0,'鸡肉鲜肉猫罐头','猫罐头鸡肉鲜肉幼猫成猫湿粮宠物零食猫170g工厂直销鲜肉包定制','75.9','xxx','img/products/lg/gt/4.jpg','img/products/md/gt/4.jpg','img/products/sm/gt/4.jpg',520,0),
(null,0,'泰国原装进口麦富迪猫罐头','泰国原装进口麦富迪猫罐头成幼猫零食湿粮 特价秒杀 整箱12罐包邮','56.9','xxx','img/products/lg/gt/5.jpg','img/products/md/gt/5.jpg','img/products/sm/gt/5.jpg',520,0),
(null,0,'尾巴生活85度猫罐头','尾巴生活85度猫罐头 鲜肉浓汤慢炖 金枪鱼猫罐头零食猫湿粮85g','52.9','xxx','img/products/lg/gt/6.jpg','img/products/md/gt/6.jpg','img/products/sm/gt/6.jpg',520,0),
(null,0,'喵达泰国进口猫罐头','喵达泰国进口猫罐头主食罐幼猫汤罐白肉营养湿粮猫咪增肥发腮80g','55.9','xxx','img/products/lg/gt/7.jpg','img/products/md/gt/7.jpg','img/products/sm/gt/7.jpg',520,0),
(null,0,'进口渔极无谷物猫罐头','.包邮日本AkikA泰国进口渔极无谷物猫罐AY系列海鲜鱼猫罐头80g*6罐','55.9','xxx','img/products/lg/gt/8.jpg','img/products/md/gt/8.jpg','img/products/sm/gt/8.jpg',520,0),
(null,0,'九尾猫串串猫罐头','喵九仙 九尾猫串串狗猫零食猫条猫咪湿粮流质猫零食猫罐头妙鲜5包','66.9','xxx','img/products/lg/gt/10.jpg','img/products/md/gt/10.jpg','img/products/sm/gt/10.jpg',520,0),
(null,1,'好主人猫粮','【10万好评】好主人猫粮成猫专用增肥发腮英短蓝猫10成年2.5kg5斤收藏加购优先发货 不吃免邮包退!','99.9','xxx','img/products/lg/ml/1.jpg','img/products/md/ml/1.jpg','img/products/sm/ml/1.jpg',520,1),
(null,1,'小鱼干双拼粮','猫粮小鱼干双拼粮10斤成猫幼猫成年猫粮英短蓝猫咪主粮5kg通用型','50.9','xxx','img/products/lg/ml/2.jpg','img/products/md/ml/2.jpg','img/products/sm/ml/2.jpg',520,1),
(null,1,'雷米高澳丽得猫粮','雷米高澳丽得海洋鱼味成猫幼猫粮10kg英短蓝猫增肥发腮包邮20斤装10kg一袋装 非独立小包装','99.9','xxx','img/products/lg/ml/3.jpg','img/products/md/ml/3.jpg','img/products/sm/ml/3.jpg',520,1),
(null,1,'海尔仕猫粮','海尔仕猫粮10kg增肥发腮流浪猫蓝猫英短猫粮成猫幼猫通用型20斤不吃包退（不包运费） 2个月以上成幼猫通用','99.9','xxx','img/products/lg/ml/4.jpg','img/products/md/ml/4.jpg','img/products/sm/ml/4.jpg',520,1),
(null,1,'田诺营养猫粮','田诺营养猫粮三文鱼肉味10kg成猫幼猫粮猫主粮20斤海洋鱼味通用型','60.9','xxx','img/products/lg/ml/5.jpg','img/products/md/ml/5.jpg','img/products/sm/ml/5.jpg',520,1),
(null,1,'贝乐芙幼猫粮','贝乐芙幼猫粮鸡肉鳕鱼发育宝肉粒猫粮美毛天然英短猫粮主粮1.5kg','70.9','xxx','img/products/lg/ml/6.jpg','img/products/md/ml/6.jpg','img/products/sm/ml/6.jpg',520,1),
(null,1,'千色喵自制天然猫粮','千色喵自制天然猫粮成猫猫粮老年猫粮鸡肉味猫咪主粮500g1斤包邮','80.9','xxx','img/products/lg/ml/7.jpg','img/products/md/ml/7.jpg','img/products/sm/ml/7.jpg',520,1),
(null,1,'简简单单冻干猫粮','简简单单冻干猫粮全期猫粮小猫猫粮成猫猫粮10KG幼猫猫粮1.3KG','90.9','xxx','img/products/lg/ml/8.jpg','img/products/md/ml/8.jpg','img/products/sm/ml/8.jpg',520,1),
(null,1,'伊萨猫粮','伊萨猫粮10kg 幼猫成猫英短加菲波斯猫折耳猫三文鱼天然猫粮20斤','91.9','xxx','img/products/lg/ml/9.jpg','img/products/md/ml/9.jpg','img/products/sm/ml/9.jpg',520,1),
(null,2,'膨润土结团猫砂','猫砂10公斤膨润土结团猫砂除臭猫沙低尘20斤10kg多省包邮猫咪用品','110.9','xxx','img/products/lg/ms/1.jpg','img/products/md/ms/1.jpg','img/products/sm/ms/1.jpg',520,0),
(null,2,'膨润土结团去味猫砂','猫砂包邮10公斤膨润土猫沙去味20斤10kg幼猫无尘除臭结团猫咪用品','120.9','xxx','img/products/lg/ms/2.jpg','img/products/md/ms/2.jpg','img/products/sm/ms/2.jpg',520,0),
(null,2,'猫特勒豆腐猫砂','猫特勒豆腐猫砂原味绿茶水蜜桃味猫砂除臭无尘结团6L满10公斤包邮','130.9','xxx','img/products/lg/ms/3.jpg','img/products/md/ms/3.jpg','img/products/sm/ms/3.jpg',520,0),
(null,2,'无尘绿茶原味猫砂','安心【除臭豆腐猫砂】无尘绿茶原味猫沙满10公斤20公斤袋/9.9包邮','140.9','xxx','img/products/lg/ms/4.jpg','img/products/md/ms/4.jpg','img/products/sm/ms/4.jpg',520,0),
(null,2,'除臭结团吸水低尘猫砂','猫砂包邮10公斤膨润土除臭结团吸水低尘猫咪用品原味猫沙10kg20斤','150.9','xxx','img/products/lg/ms/5.jpg','img/products/md/ms/5.jpg','img/products/sm/ms/5.jpg',520,0),
(null,2,'波奇怡亲猫砂','波奇怡亲猫砂豆腐猫砂除臭结团吸附猫沙6L结团25省包邮猫咪用品','160.9','xxx','img/products/lg/ms/6.jpg','img/products/md/ms/6.jpg','img/products/sm/ms/6.jpg',520,0),
(null,2,'活性碳原生豆腐猫砂','喜宠屋 活性碳原生豆腐猫砂 高效除臭无尘猫沙豆腐砂包邮6L/袋','170.9','xxx','img/products/lg/ms/7.jpg','img/products/md/ms/7.jpg','img/products/sm/ms/7.jpg',520,0),
(null,2,'植物破碎宠物猫砂','猫砂6L5斤豆腐猫砂植物破碎宠物用猫砂卫生防臭杀菌无尘包邮免费','180.9','xxx','img/products/lg/ms/8.jpg','img/products/md/ms/8.jpg','img/products/sm/ms/8.jpg',520,0),
(null,3,'防外溅全半封闭式大号猫砂盆','猫砂盆防外溅全半封闭式大号猫厕所猫沙盆猫屎盆小号猫咪用品除臭超大空间 很防外溅 买1发3 不怕对比','99.9','xxx','img/products/lg/msp/1.jpg','img/products/md/msp/1.jpg','img/products/sm/msp/1.jpg',520,0),
(null,3,'全自动猫砂盆','全自动猫砂盆智能铲屎机猫咪电动清理器用品便盆猫沙盆猫蛋猫厕所','190.9','xxx','img/products/lg/msp/2.jpg','img/products/md/msp/2.jpg','img/products/sm/msp/2.jpg',520,0),
(null,3,'全半封闭式猫砂盆','全半封闭式猫砂盆大号小号猫咪厕所除臭防外溅猫沙猫屎盆猫咪用品','200.9','xxx','img/products/lg/msp/3.jpg','img/products/md/msp/3.jpg','img/products/sm/msp/3.jpg',520,0),
(null,3,'顶入式猫砂盆','顶入式猫砂盆全封闭式afp除臭超特大号猫咪用品防臭防外溅猫厕所','210.9','xxx','img/products/lg/msp/4.jpg','img/products/md/msp/4.jpg','img/products/sm/msp/4.jpg',520,0),
(null,3,'猫砂盆全套用品','猫砂盆防外溅全半封闭特大号猫厕所猫屎盆拉屎猫沙盆猫咪全套用品','220.9','xxx','img/products/lg/msp/5.jpg','img/products/md/msp/5.jpg','img/products/sm/msp/5.jpg',520,0),
(null,3,'全封闭式除臭猫砂盆','猫砂盆全封闭式除臭猫盆猫咪用品拉屎防外溅防臭大号猫厕所猫屎盆','230.9','xxx','img/products/lg/msp/6.jpg','img/products/md/msp/6.jpg','img/products/sm/msp/6.jpg',520,0),
(null,3,'顶入式全封闭式猫砂盆','顶入式猫砂盆全封闭式除臭猫屎盆超特大号猫沙盆防臭防外溅猫厕所','240.9','xxx','img/products/lg/msp/7.jpg','img/products/md/msp/7.jpg','img/products/sm/msp/7.jpg',520,0),
(null,3,'日本IRIS猫砂盆','日本IRIS爱丽思爱丽丝全封闭式猫砂盆肥猫厕所猫沙盆WNT510包邮','250.9','xxx','img/products/lg/msp/8.jpg','img/products/md/msp/8.jpg','img/products/sm/msp/8.jpg',520,0),
(null,4,'抓板玩具剑麻猫爬架','抓板玩具剑麻猫爬架瓦楞纸窝猫咪用品耐磨磨爪器逗猫蹭痒猫抓柱','260.9','xxx','img/products/lg/mwj/1.jpg','img/products/md/mwj/1.jpg','img/products/sm/mwj/1.jpg',520,0),
(null,4,'猫墙角蹭毛器','猫墙角蹭毛器猫咪挠痒痒玩具蹭痒器按摩刷宠物用品猫用蹭脸猫抓板','270.9','xxx','img/products/lg/mwj/3.jpg','img/products/md/mwj/3.jpg','img/products/sm/mwj/3.jpg',520,0),
(null,4,'猫薄荷鱼','猫玩具鱼猫薄荷鱼3d猫玩具逗猫棒猫猫磨牙小猫抱枕宠物仿真猫咪玩','280.9','xxx','img/products/lg/mwj/4.jpg','img/products/md/mwj/4.jpg','img/products/sm/mwj/4.jpg',520,0),
(null,4,'宠物不倒翁','宠物不倒翁猫玩具球耐咬','99.9','xxx','img/products/lg/mwj/5.jpg','img/products/md/mwj/5.jpg','img/products/sm/mwj/5.jpg',520,0),
(null,4,'猫抓板','猫咪玩耍玩具瓦楞纸带球猫抓板猫磨爪器猫咪用品逗猫转盘球猫娱乐','290.9','xxx','img/products/lg/mwj/6.jpg','img/products/md/mwj/6.jpg','img/products/sm/mwj/6.jpg',520,0),
(null,4,'猫玩具小老鼠','猫玩具小老鼠逗猫益智解压玩具成幼猫纯色短毛绒响珠玩具猫咪用品','300.9','xxx','img/products/lg/mwj/7.jpg','img/products/md/mwj/7.jpg','img/products/sm/mwj/7.jpg',520,0),
(null,4,'自嗨逗猫棒','.猫玩具自嗨逗猫棒 包邮小羽毛猫铃铛耐啃咬仙女幼猫神器猫咪用品','310.9','xxx','img/products/lg/mwj/9.jpg','img/products/md/mwj/9.jpg','img/products/sm/mwj/9.jpg',520,0);
-- 用户信息
CREATE TABLE pet_master(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(20),
    gender TINYINT  #性别 1——男 0——女
);
INSERT INTO pet_master VALUES
(null,'xbh',md5('123456'),'254125@126.com','18254789658',1);

--购物车
CREATE TABLE pet_pro_carts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,        #商品编号
    price DECIMAL(10,2),
    pname VARCHAR(32),      #详情列表中的title
    details VARCHAR(128),          #详情列表中的subtitle
    pic VARCHAR(64),
    count SMALLINT,         #商品数量
    uid TINYINT             #用户编号 
);
-- --宠物知识普及
-- CREATE TABLE pet_msg(
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     fid INT,                 #家族编号
--     fname VARCHAR(32),          #品种名称
--     subtitle VARCHAR(1024),         # 简介
--     details VARCHAR(1024),      #宠物详情
--     msg VARCHAR(1024)           #饲养需知
-- )
-- INSERT INTO pet_msg VALUES
-- (null,1,'波斯猫','波斯猫（Persian cat）是以阿富汗的土种长毛猫和土耳其的安哥拉长毛猫为基础，在英国经过100多年的选种繁殖，于1860年诞生的一个品种。波斯猫是最常见的长毛猫，波斯猫有一张讨人喜爱的面庞，长而华丽的背毛，优雅的举止，故有“猫中王子”、“王妃”之称，是世界上爱猫者最喜欢的纯种猫之一，占有极其重要的地位。','整体形态长毛，圆胖型。中型到大型都有。骨骼粗壮，肌肉发达。四肢短而直，脚掌大呈短圆形。尾巴短与身材对称，毛膨松而长，非常高贵有气派。头大而圆，额、鼻、颚都是平平的。鼻子很短，鼻梁宽。眼睛又大又圆，表情丰富。耳小，尖端呈圆形，两耳分隔得很开。全身满是像丝一般柔软和有光泽的膨松的毛。波斯猫一向给人一副高贵傲慢的气质，可爱的脸和表情，膨松的尾巴都是自古以来受欢迎的特征。性格温驯，乖巧，斯文，波斯猫的反应是非常快和热烈，所以深得饲主疼爱。波斯猫毛色艳丽多样。毛色有五大色系，约1种，其中有多种颜色得到国际各种养猫协会认定。白色系、黑色系、蓝色系、浅黄色系较常见，玳瑁色系和红色系较珍贵。性格特征波斯猫天资聪明，反应灵敏，容易训练；性格温顺，举止文雅，易与相处，叫声小，爱撒娇，深得人们喜爱。按毛色类型，可分为：全一色型、渐变色型、烟色型、斑纹型、多色型','第一、波斯猫的饮食习惯：给波斯猫喂饭的时间一定要保持一致。就像我们一样，给波斯猫的每日三餐拟定一个固定的时辰，按时进餐，让波斯猫培养成一个健康规律的饮食习惯，猫咪的肠胃比较脆弱，饮食不规律会让波斯猫消化系统功能紊乱，长期下去，波斯猫会出现营养不良，毛发枯败没有光泽等现象，会让波斯猫生长发育变缓慢，抵抗力下降，感染上各种疾病，严重的还会造成波斯猫的死亡，波斯猫比较适合不是很忙碌的家庭饲养，在饲养的时候，铲屎官在波斯猫的饮食上一定要用心，出现什么不良现象的时候，一定要把波斯猫带到医院检查。
-- 第二、波斯猫的用餐、休闲工具：每个猫咪都有磨爪子的习惯，这个习惯是从猫咪祖先遗留下来，铲屎官在饲养波斯猫的时候要给波斯猫准备一些类似于猫抓板的道具，不然的话，就得仔细了自家的沙发、门板和床，稍不留神，就会让猫主子重新换个花色了。
-- 第三、波斯猫的卫生：猫咪是比较注重自身整洁的家伙，它们会在闲暇时舔舐自己身上的毛发，清理身上的脏东西。波斯猫是长毛猫，保持周身的清洁尤为重要，经常给波斯猫洗澡可以让波斯猫的毛发更加柔顺飘逸，一身靓丽的毛发会让波斯猫的回头率更高，经常给波斯猫洗澡，可以有效地促进波斯的血液循环，加快波斯猫的新陈代谢，波斯猫洗完澡后，铲屎官要及时的吹干它的毛发，防止波斯猫患上各类皮肤病和寄生虫病。经常给波斯猫梳理毛发可以减少波斯猫吞入自己的毛发量，增加波斯猫和铲屎官之间的感情。'),
-- (null,2,'布偶猫','布偶猫，又称“布拉多尔（Ragdoll）”，发源于美国，是一种杂交品种宠物猫。是现存体型最大、体重最重的猫之一。头呈楔形，眼大而圆，被毛丰厚，四肢较长且富有肉感，尾长，身体柔软，毛色有重点色、手套色或双色等等。布偶猫较为温顺好静，对人友善。其美丽优雅又非常类似于狗的性格（Puppy cat）而又被称为"仙女猫"，"小狗猫"。特殊的外貌和温和的性格是布偶猫最大的特点之一。  
-- 布偶猫的体毛属于中长型，不会缠结在一起，质地柔滑。它的尾巴蓬松，颈部通常带"围脖"，而臀部的体毛也比较长。定期梳理毛发会让布偶猫感到十分舒服。布偶猫是最漂亮的纯种猫之一，带有独特的单色点或双色点的毛。体色有海豹色、蓝色，巧克力色、丁香色，红色，奶油色。','布偶猫是全身特别松弛柔软，像软绵绵的布偶一样。该猫体型大，身体长、肌肉发达、胸部宽、颈粗而短，发育期长，幼猫要4年左右才能完全发育成熟。其特征是头大而呈楔形，头顶扁平，眼睛为深蓝色，吻部呈圆形，短鼻子上略有凹陷，有的脸上有“V”形斑纹，颈部被毛较长，属毛长猫类。布偶猫手套色前脚掌上好像戴着手套，两只手套呈白色，大小相似，且不超出腿和脚掌形成的角度。后腿上白色靴子向上延伸至后脚踝关节，整个身体下方由下巴至尾部也都是白色。布偶猫有三种颜色图案：双色、手套和重点色。这些图案各分6种颜色：海豹色、蓝色、巧克力色、淡紫色、红色和乳色。所有颜色均可附加山猫纹、玳瑁或同时附加山猫及玳瑁。
-- 特征描述
-- 1、头部：呈等边三角形，双耳之间平坦； 面颊顺着面形线而成为楔形。
-- 2、耳朵 ：中等大小，微微张开底部阔；双耳间距宽阔; 耳尖**而向前倾。
-- 3、眼睛 ：大，明亮，蓝色、椭圆形；双眼间距宽阔，微微向上扬。
-- 4、鼻子 ：中等长度的鼻子。
-- 5、下巴 ：下巴要发育良好，强壮，并与上唇和鼻子成一直线。
-- 6、体重：布偶猫和缅因猫、西伯利亚猫同属最大的猫之一，公猫通常比母猫体形大。身体结实,肌肉发达，雄性平均体重4.5~9.1KG；雌性平均为3.6~6.8KG   。','布偶猫异常温柔，较适宜室内饲养。一般应为它们做绝育并提供适当的生
--  活环境，例如配备猫抓板来适应它们的抓挠习惯等：这些是维持它们健康长寿和快乐的基本条件。
-- 布偶猫会舔洗和梳理一身中等长度的丝状毛发。如果要给它们梳理毛发的话可以抱着用钢针排梳梳理，使它们举止优雅。
-- 布偶猫善于讨好主人，总是形影不离地围着主人转，这种猫喜静，但也爱玩玩具，并喜欢参与家中的日常生活。
-- 布偶猫是一个晚熟的品种，它们的毛色至少要到2岁才会足够丰满，而体格和体重则要至少4岁才能发育完。刚出生的幼猫全身是白色的，一周后幼猫的脸部，耳朵，尾巴开始有颜色变化，直到2岁时被毛才稳定下来，直到3-4岁才完全长成。
-- 布偶猫是猫，是猫总会掉毛，只是布偶掉的不严重而已。宠物掉毛多是温度问题，如果全年温度控制在21~22左右，能有效缓解这个问题。'),
-- (null,3,'加拿大无毛猫','加拿大无毛猫（Canadian Hairless）亦称斯芬克斯猫，是加拿大安大略省多伦多市养猫爱好者在1966年从一窝几乎是无毛的猫仔中，经过近交选育，特意为对猫毛过敏的爱猫者培育成的。这种猫是自然的基因突变产生的宠物猫，除了在耳、口、鼻、尾前段、脚等部位有些又薄又软的胎毛外，其它全身部分均无毛，皮肤多皱有弹性。加拿大无毛猫性情温顺，独立性强，无攻击性，能与其它猫狗相处。','加拿大无毛猫 毛发稀疏，在耳、口、鼻、尾前锻、脚等部位有些又薄又软的胎毛，其它全身部分均无毛，皮肤皱褶似羚羊皮，有弹性，越年轻的猫的面部越圆，皮肤的皱纹越多；刚生下的小猫身上就有许多皱纹，并布满了柔细的胎毛，随着年龄的增长，绒毛仅残留于头部、四肢、尾巴和身体的末端部位。
-- 加拿大无毛猫已经培育出所有猫的颜色，这些颜色全显现在皮肤上，但眼睛颜色与体色相称。在它们身体上本应该出现暗色皮毛的地方，会有色素存在。 
-- 体重一般达到3.5到7公斤，肌肉发达，胸深，背较驼，腹紧凑而不上收。四肢细长，骨骼纤细，后肢比前肢长。头部棱角分明，宽大而呈楔形，颧骨突出，两颊瘦削，脸呈正三角形，耳廓硕大、直立，高耸于头顶，耳端尖圆，微前倾；眼睛大而微突呈柠檬状，稍倾斜，多为蓝色和金黄色；上眼角斜向耳，间距较宽。 尾巴如老鼠般又细又长，像长鞭一样弯曲上翘。
-- 一般来说，抚摸加拿大无毛猫带给人的感觉就像在摸一块光滑柔软的小山羊皮。而有些加拿大无毛猫则长着了一层非常纤细，用眼睛难以察觉的体毛，这种无毛猫摸起来则更像个暖和而又新鲜的水蜜桃。','加拿大无毛猫在很多时候爱舔身子自我清洁并且经常清理自己的毛。无毛猫还会掩盖粪便。这种行为完全是出于生活的本能，是由祖先遗传来的。无毛猫的祖先——野无毛猫，为了防止天敌从其粪便气味发现它、追踪它，于是就将粪便掩盖起来。现代无毛猫的这种行为已丝毫没有这方面的意义了，但却使无毛猫赢得了讲卫生的好声誉。无毛猫至今仍然保持着肉食动物那种昼伏夜出的习性，很多活动（如捕鼠、求偶交配）常常是在夜间进行。斯芬克斯猫性情老实，忍耐力极强，脾气很好，而且在某些方面它们更像狗，容易与人亲近而且对主人忠诚。无毛猫和别的猫相比多汗，体温也比一般猫要高出 4 ℃ ，因而要不断进食才能维持其新陈代谢。无毛猫对阳光十分敏感，因为白色部位易晒黑。由于无毛，它们对外界温度调节能力差，既怕冷、又怕热。当室温保持在25~30度之间，会让该种猫感觉非常舒适，温度低于20度，它就会感觉到冷，而如果室内温度低于10度，无毛猫就会被冻死。这种猫适合公寓饲养。在夏天，主人需要给它们涂抹防晒霜以免晒伤；在冬天则需要给它们添加衣物来遮体保暖。'),
-- (null,4,'美国短毛猫','美国短毛猫，又称美洲短毛虎纹猫，是美国人把欧洲猫与美洲大陆的土种猫加以改良而育成，是家猫中的传统品种。1971年，其被选为美国最好的猫种之一。
-- 美国短毛猫（American Shorthair）是原产美国的一种猫，其祖先为欧洲早期移民带到北美的猫种，与英国短毛猫和欧洲短毛猫同类。美国短毛猫素以体格魁伟，骨胳粗壮，肌肉发达，生性聪明，性格温顺而著称，是短毛猫类中大型品种。被毛厚密，毛色多达30余种，其中银色条纹品种尤为名贵。','这种猫身强体壮，身体从中型到大型都有，脑袋呈长方形，脖子粗壮，胸部浑回。脊背平直，四肢发达，擅长跳跃。它的被毛柔软，厚实，但很短；其皮可以防寒、防雨，并防外伤，仿佛是一种短而厚的稠密外套。毛色有白、黑、斑纹等30余种。其中最受欢迎的，尤其是东方，是一种在银白色的体毛间嵌有鲜黑色条纹的银白虎纹猫。 
-- 总体：
-- 美国短毛猫为纯种工作猫（working cat），具体表现为体格强健、平衡力良好、身材匀称、有力量、性格活泼等。体型中到大，成年雌性体型要比雄性小一些。
-- 美国短毛猫在欧洲较罕见，在日本、美国等国比较受欢迎。根据CFA（Cat Fanciers Association 美国爱猫者协会）2010年的统计资料，美国短毛猫在当年全美最受欢迎猫咪种类排行中位列第八位','美国短毛猫遗传了其祖先的健壮、勇敢和吃苦耐劳，性格温和，不会因为环境或心情的改变而改变。充满耐性、和蔼可亲，不会乱发脾气，不喜欢乱吵乱叫，适合有小孩子的家庭饲养。美国短毛猫抵抗力较强。
-- 美国短毛猫也是十分聪明的猫种，主人可以教会它们答应自己的名字和远离沙发等家具，懂得控制食量。居家的美国短毛猫喜欢躺在主人的腿上，享受主人的爱抚。它们很珍惜自己的玩具，尤其是主人不在的时候，它们会发明多种不同的玩法，使自己不感到孤单。美国短毛猫很乐于跟其他的动物相处，当中也包括鸟和狗。
-- 美国短毛猫有许多讨人喜欢的特点。它既强壮又灵活，性格随和，忠于主人；有重越的运动神经和智慧，有时很淘气有时又很规矩。它的适应能力很强，可以在任何家庭中生活能够灵活地迎合主人的心意，调整自身的习性来适应主人的习惯。捕鼠的技巧是第一流的，为不可多得的捕鼠好手。'),
-- (null,5,'挪威森林猫','挪威森林猫（Norwegian Forest Cat），以白话直译的说法，就是在挪威森林里面栖息的，生存的猫，这是斯堪地半岛特有的品种，其起源不明，常常以像妖精的猫出现在北欧的神话之中。挪威森林猫外观与缅因猫相似，与西伯利亚森林猫同列。森林猫生长的环境非常寒冷和恶劣，因此它长有比其它猫更厚密的被毛和强壮的体格。挪威森林猫体大肢壮，奔跑速度极快，不怕日晒雨淋，行走时颈毛和尾毛飘逸，非常美丽。但是，生长在挪威森林内地的猫，数目已逐年减少，一时有绝迹的危机。因而，在进入一九七零年代初期，努力保存、繁殖，就显得格外重要','该猫祖先栖息在挪威森林，是斯堪的纳维亚半岛上特有的猫种，其起源可追溯到古代时期，常常是北欧故事的主人公。如有人记载，雷神上天使想把她带到天上去，却因为太大而没能带走。也有人说，女神弗露依亚经常乘一辆车出游，拉车的是两只挪威森林猫。不过这猫的品种名“挪威森林”早就透露玄机，它们的确从远古时代，就生活在北欧的森林里，绿意盎然的环境或许是它们最熟悉的原乡。特别是体型大丶胆子也大的公猫阿布，气定神闲缓慢踱步着，看来更彷佛像生自这片草地的野生动物，而非家里的娇贵宠物猫。之後大家相信，出现在神话里的猫咪就是挪威森林猫，被赋予如此戏剧性的想像，使得它们美丽威风的外表下，又多了些优雅灵动的特殊气质。
-- 本世纪30年代开始，繁育家们对这个品种进行改良，在二次大战前，曾在奥斯陆参加过展出。70年代后，人们对此猫的兴趣日益增加，挪威人把它当作大自然的活的纪念碑加以保护。而至今它已经被欧洲的几乎所有猫展所接受。直到1930年，才被公认为一个独立品种。挪威森林猫外貌上和缅因库恩猫一模一样，挪威森林猫与缅因库恩猫的主要区别是：其后腿比前腿稍长，被毛双层。','饲养需知：
--   挪威森林猫活泼好动，适合饲养在宽敞的家庭，这种猫的特技是爬树，所以以能干的狩猎者著称。饲养挪威森林猫不用担心它会和家里的其他的动物相处不好，性格温顺的它别说动物了就是小朋友也很合得来。
-- 　　第一，应该给挪威森林猫准备专用的食具和食物，而且不能随意更换。因为猫咪对食物和食具的更换都非常的敏感，甚至会因为更换食具和食物而拒绝饮食。当然，在猫咪每次饮食完后，主人都应该及时的清洗食具，并且定期消毒杀菌。
-- 　　第二，挪威森林猫每日的饮食的时间都应该固定不应随意变更。同时猫咪不喜欢在嘈杂、强光的环境中吃食。主人应该选择一个清新安静的地方，让它可以正常的饮食，不会受到外界因素的影响。
-- 　　第三，在饲养挪威森林猫的过程中，如果发现随地大小便，用爪钩取食物或把食物叼到食盘外边吃等不良习惯，主人都应该及时制止，并且立即调教训练，纠正它这种错误的行为。
-- 　　第四，饲养挪威森林猫还要注意一点，它喜欢温热的食物，所以喂食的时候应该将食物的温度保持在30-40度最好。不能给猫咪喂食冷的或者是凉食，这容易导致猫咪消化功能紊乱，患有肠胃疾病，对身体健康毫无意义。
-- 　　挪威森林猫身体上长有浓密的毛发，所以在炎热的夏季，主人要做好降温防暑的工作，避免猫咪中暑。虽然挪威森林猫对生活有诸多的要求，但只要主人细心，平常多花些时间和精力在猫咪身上，相信它也能开心健康的成长，而不会给主人增添其它麻烦和烦恼。'),
-- (null,6,'暹罗猫','暹（xiān）罗猫是世界著名的短毛猫，也是短毛猫的代表品种。种族原产于暹罗（今泰国），故名暹罗猫。在200多年前，这种珍贵的猫仅在泰国的皇宫和大寺院中饲养，是足不出户的贵族。暹罗猫能够较好适应主人当地的气候，且性格刚烈好动，机智灵活，好奇心特强，善解人意。','作为一种著名的宠物猫，暹罗猫能够较好适应主人当地的气候，且性格刚烈好动，机智灵活，好奇心特强，善解人意。暹罗猫喜欢与人为伴，可用皮带拴着散步。它需要主人的不断爱抚和关心，对主人忠心耿耿、感情深厚，如果强制与主人分开，则可能会抑郁而死。暹罗猫还十分聪明，能很快学会翻筋斗叼回抛物等技巧。暹罗猫的叫声独特或像小孩的啼哭声，而且声音很大。','1. 暹罗猫对寒冷非常敏感，所以暹罗猫的猫窝一定要在温暖的地方，最后在白天能够阳光直射，夜晚吹不到冷风的地方。这个猫王子对自己的猫窝很挑剔，所以猫窝里的设置一定要够舒适，否则猫猫可能不愿意睡觉。
-- 　　2. 暹罗猫很聪明，能很快就学会东西。所以主人不能浪费猫猫的天赋，要常常训练暹罗猫，例如翻筋斗、叼东西等等，暹罗猫也很乐意学习这些技能。
-- 　　3. 因为暹罗猫被毛非常漂亮，它们自己也很爱漂亮，我们在给暹罗猫进行皮毛护理时要格外小心。要常常为暹罗猫捉跳蚤，隔一段时间就要给猫猫洗澡，这些都是日常必须的，最重要的是要每天为暹罗猫梳毛，这样它们才会神清气爽。
-- 　　4. 暹罗猫喜欢和主人眼神交流，所以主人表达爱意时可以摸摸含情地看着它，暹罗猫会懂的。而且暹罗猫喜欢主人抱着和经常抚摸，所以主人也可以经常抱暹罗猫来增加彼此之间的感情。
-- 　　5. 暹罗猫爱打架，所以猫咪刚进家门的时候要隔离;如果有新宠物到家里来，也要隔离暹罗猫，因为好斗的暹罗常常是它撩起事端。'),
-- (null,7,'英国短毛猫','英国短毛猫，体形圆胖，四肢粗短发达，毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。大而圆的眼睛根据被毛不同而呈现各种颜色。作为一个古老的猫品种，其历史可追溯至古罗马时期的家猫，由于拥有悠久的育种历史，可以称得上是猫家族中的典范。英国短毛猫除了拥有固定而聚，代表性的遗传特征之外，又具有丰富的变异性，如背毛色眼睛颜色等。更重要的是，有了广泛的配种历史后，这种猫拥有了更健康的身体和更温驯的性格。','英短身体很厚实，胸部饱满宽阔，腿部粗壮，长度为短到中等，爪子浑圆，尾巴的根部粗壮，尾尖钝圆。头部为圆 形，两耳间距较宽，面颊浑圆，下巴结实，耳朵为中等大小，大而圆的眼睛睁得很开，鼻子宽度适中。被毛短并非常的密。公猫的腮部比母猫发达，而且从各方面来说都比母猫大。这个品种要完全发育成熟需要三到五年的时间。猫只应该表现出整体的匀称和比例，不应过分强调某一特征，以免诱使繁育过程中出现忽视或极端的倾向。由中型至大型，骨架及肌肉很发达。短而肥的颈，阔而平的肩膊相配合，适合捕猎。头部圆阔，最大的特点是支耳的距离很接近，尾巴的长度大约是全身的2/3。','适应力
-- 其适应能力很强，不会因为环境的改变而改变。所以，如果你买到了这只猫，不用担心它会因为环境的改变而让你头疼。
-- 性格
-- 英国短毛猫大胆好奇，但非常温柔，不会乱发脾气、更不会乱吵乱叫。
-- 运动
-- 英国短毛猫喜欢亲近主人，喜欢乖乖地趴在你的膝盖上睡觉。然而猫咪长期不做运动易会发胖，而体型过胖的猫咪，身体状况也会出现问题。所以，你每天至少要陪它做游戏半个小时左右。
-- 掉毛
-- 英国短毛猫的被毛像绒布一般柔软、厚实，很少脱落，容易打理。不过，猫一年四季都会脱毛，尤其是春、秋两季的换毛季节。猫自己梳理会将毛吞入胃内，久而久之在胃内形成毛球，如不能通过呕吐吐出，又不能及时通过肠道排出，滞留胃内，就会形成毛球堵塞，影响食欲，甚至危及生命。所以，如果其处在脱毛期，主人每天可以适量为其多梳理几次毛或让其食用化毛膏。'),
-- (null,8,'苏格兰折耳猫','苏格兰折耳猫(学名：Felis silvestris catus，英文名：Scottish Fold)是猫的一种在耳朵有基因突变的猫种。由于这猫种最初在苏格兰发现，所以以它的发现地和身体特征而命名。这种猫在软骨部份有一个折，使耳朵向前屈折，并指向头的前方。也正因如此，这种猫患有先天骨科疾病，时常用坐立的姿势来缓解痛苦。
-- 它乐意与人为伴，并用它特有的这种安宁的方式来表达。','苏格兰折耳猫特别平和的性格，对其他的猫和狗很友好。温柔，感情丰富，有爱心，很贪玩，非常珍惜家庭生活。他们的声音很柔和。生命力顽强，该品种的猫是优秀的猎手。被毛料理方面非常简单，每周一次梳理即可。在脱毛期间它的长毛绒状的被毛需要得到经常梳理。而且必须特别留心他的耳部。为了防止耳骨变形，两只折耳猫不能交配繁殖。它可以和立耳的 英国短毛猫和美国短毛猫交配。折耳猫的性状要到第三到第四周时才能显现出来。而且其卷耳的程度要到第五到第六周才确定下来。','苏格兰折耳猫由于继承了远祖刻苦耐劳的性格，所以它们的适应能力比较强，对于陌生环境能够泰然处之。但是，饲养一只健康的折耳猫，也要留意天气，湿度最好维持在50－60%，否则会很容易患上皮肤病。
-- 饮食：同大多数猫一样，它们的肠胃比较弱，喂养时所给的猫粮最好是固定品牌，如果需要为它们更换其它品牌的猫粮，一定要慢慢来，在转粮的过程中，还要特别留意它们的便便，因为，突然更换猫粮，很容易导致猫咪的腹泻。
-- 苏格兰折耳猫甜美的性格是天生的，它们就有着糖果般甜美的性格。它们喜欢参与你所作的任何事情，但通常只是静静地，但不会发出声音来打扰你。它们的运动天赋虽然一般，但并不表示它们不喜欢玩，只是更青睐于有主人的陪伴。苏格兰折耳猫喜欢平躺着睡觉。在无所事事的时候，它们会像水獭一样坐在那里向窗外张望，但这并不是因为他们慵懒的个性，而是患有先天性的骨骼遗传疾病，像水獭一样坐着仅仅是在缓解身体的疼痛。 
-- 和一般猫咪一样，折耳猫也有用舌头自我清洁的习惯，定期喂食吐毛膏，可以帮助它清理肠胃中不能消化的毛球，以减少出现肠胃不适的可能。');



































































































































































































