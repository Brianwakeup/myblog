/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.36.111
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : 192.168.36.111:3306
 Source Schema         : zlt_blog

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 18/10/2024 23:18:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `ftype` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `fkey` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `author_id` int NULL DEFAULT NULL,
  `created` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_attach
-- ----------------------------

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments`  (
  `coid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int UNSIGNED NULL DEFAULT 0,
  `created` int UNSIGNED NULL DEFAULT 0,
  `author` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `author_id` int UNSIGNED NULL DEFAULT 0,
  `owner_id` int UNSIGNED NULL DEFAULT 0,
  `mail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `agent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'comment',
  `status` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'approved',
  `parent` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`coid`) USING BTREE,
  INDEX `cid`(`cid` ASC) USING BTREE,
  INDEX `created`(`created` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
INSERT INTO `t_comments` VALUES (6, 6, 1729987200, '陈得', 0, 1, '123@qq.com', '', '0:0:0:0:0:0:0:1', NULL, '你好呀，博主', 'comment', 'approved', 0);

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents`  (
  `cid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created` int UNSIGNED NULL DEFAULT 0,
  `modified` int UNSIGNED NULL DEFAULT 0,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容文字',
  `author_id` int UNSIGNED NULL DEFAULT 0,
  `type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'post',
  `status` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'publish',
  `tags` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `categories` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `hits` int UNSIGNED NULL DEFAULT 0,
  `comments_num` int UNSIGNED NULL DEFAULT 0,
  `allow_comment` tinyint(1) NULL DEFAULT 1,
  `allow_ping` tinyint(1) NULL DEFAULT 1,
  `allow_feed` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `created`(`created` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_contents
-- ----------------------------
INSERT INTO `t_contents` VALUES (1, 'about zlt-blog', 'about', 1729987200, 1729987200, '', 1, 'page', 'publish', NULL, NULL, 50, 0, 1, 1, 1);
INSERT INTO `t_contents` VALUES (5, 'Spring Boot常用注解（绝对经典）', 'boot-good', 1729987200, 1729987200, '****背景：**\r\n**PySpider**：一个国人编写的强大的网络爬虫系统并带有强大的WebUI。采用Python语言编写，分布式架构，支持多种数据库后端，强大的WebUI支持脚本编辑器，任务监视器，项目管理器以及结果查看器。在线示例： **http://demo.pyspider.org/**\r\n**官方文档： http://docs.pyspider.org/en/latest/** \r\n**Github :  https://github.com/binux/pyspider** \r\n本文爬虫代码 Github 地址：**https://github.com/zhisheng17/Python-Projects/blob/master/v2ex/V2EX.py**\r\n<!-- more -->\r\n***\r\n说了这么多，我们还是来看正文吧！\r\n**前提:** 你已经安装好了Pyspider 和 MySQL-python（保存数据）\r\n如果你还没安装的话，请看看我的前一篇文章，防止你也走弯路。\r\n1. [**Pyspider 框架学习时走过的一些坑**](http://blog.csdn.net/tzs_1041218129/article/details/52877949)\r\n2. [**HTTP 599: SSL certificate problem: unable to get local issuer certificate错误**](http://blog.csdn.net/tzs_1041218129/article/details/52853465)\r\n我所遇到的一些错误：\r\n首先，**本爬虫目标**：使用 Pyspider 框架爬取 [V2EX](www.v2ex.com) 网站的帖子中的问题和内容，然后将爬取的数据保存在本地。\r\nV2EX 中大部分的帖子查看是不需要登录的，当然也有些帖子是需要登陆后才能够查看的。（因为后来爬取的时候发现一直 error ，查看具体原因后才知道是需要登录的才可以查看那些帖子的）所以我觉得没必要用到 Cookie，当然如果你非得要登录，那也很简单，简单地方法就是添加你登录后的 cookie 了。\r\n我们在 https://www.v2ex.com/ 扫了一遍，发现并没有一个列表能包含所有的帖子，只能退而求其次，通过抓取分类下的所有的标签列表页，来遍历所有的帖子： https://www.v2ex.com/?tab=tech 然后是 https://www.v2ex.com/go/programmer  最后每个帖子的详情地址是 （举例）： https://www.v2ex.com/t/314683#reply1\r\n**创建一个项目**\r\n在 pyspider 的 dashboard 的右下角，点击 “Create” 按钮\r\n替换 on_start 函数的 self.crawl 的 URL：\r\n```\r\n@every(minutes=24 * 60)\r\n    def on_start(self):\r\n        self.crawl(\'https://www.v2ex.com/\', callback=self.index_page, validate_cert=False)\r\n```\r\n> + self.crawl 告诉 pyspider 抓取指定页面，然后使用 callback 函数对结果进行解析。\r\n> + @every) 修饰器，表示 on_start 每天会执行一次，这样就能抓到最新的帖子了。\r\n> + validate_cert=False 一定要这样，否则会报 HTTP 599: SSL certificate problem: unable to get local issuer certificate错误\r\n**首页：**\r\n点击绿色的 run 执行，你会看到 follows 上面有一个红色的 1，切换到 follows 面板，点击绿色的播放按钮：\r\n第二张截图一开始是出现这个问题了，解决办法看前面写的文章，后来问题就不再会出现了。\r\n<br>\r\n**Tab 列表页 : **\r\n![这里写图片描述](http://img.blog.csdn.net/20161022194637692)\r\n在 tab 列表页 中，我们需要提取出所有的主题列表页 的 URL。你可能已经发现了，sample handler 已经提取了非常多大的 URL\r\n代码：\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def index_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/?tab=\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.tab_page, validate_cert=False)\r\n```\r\n> + 由于帖子列表页和 tab列表页长的并不一样，在这里新建了一个 callback 为 self.tab_page\r\n> + @config(age=10 * 24 * 60 * 60) 在这表示我们认为 10 天内页面有效，不会再次进行更新抓取\r\n**Go列表页 : **\r\n![这里写图片描述](http://img.blog.csdn.net/20161022195235290)\r\n代码：\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def tab_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/go/\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n```\r\n**帖子详情页（T）:**\r\n![这里写图片描述](http://img.blog.csdn.net/20161022200023793)\r\n你可以看到结果里面出现了一些reply的东西，对于这些我们是可以不需要的，我们可以去掉。\r\n同时我们还需要让他自己实现自动翻页功能。\r\n代码：\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def board_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/t/\"]\').items():\r\n            url = each.attr.href\r\n            if url.find(\'#reply\')>0:\r\n                url = url[0:url.find(\'#\')]\r\n            self.crawl(url, callback=self.detail_page, validate_cert=False)\r\n        for each in response.doc(\'a.page_normal\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False) #实现自动翻页功能\r\n```\r\n此时我们已经可以匹配了所有的帖子的 url 了。\r\n点击每个帖子后面的按钮就可以查看帖子具体详情了。\r\n代码：\r\n```\r\n@config(priority=2)\r\n    def detail_page(self, response):\r\n        title = response.doc(\'h1\').text()\r\n        content = response.doc(\'div.topic_content\').html().replace(\'\"\', \'\\\\\"\')\r\n        self.add_question(title, content)  #插入数据库\r\n        return {\r\n            \"url\": response.url,\r\n            \"title\": title,\r\n            \"content\": content,\r\n        }\r\n```\r\n插入数据库的话，需要我们在之前定义一个add_question函数。\r\n```\r\n#连接数据库\r\ndef __init__(self):\r\n        self.db = MySQLdb.connect(\'localhost\', \'root\', \'root\', \'wenda\', charset=\'utf8\')\r\n    def add_question(self, title, content):\r\n        try:\r\n            cursor = self.db.cursor()\r\n            sql = \'insert into question(title, content, user_id, created_date, comment_count) values (\"%s\",\"%s\",%d, %s, 0)\' % (title, content, random.randint(1, 10) , \'now()\');   #插入数据库的SQL语句\r\n            print sql\r\n            cursor.execute(sql)\r\n            print cursor.lastrowid\r\n            self.db.commit()\r\n        except Exception, e:\r\n            print e\r\n            self.db.rollback()\r\n```\r\n查看爬虫运行结果：\r\n![这里写图片描述](http://img.blog.csdn.net/20161022201700801)\r\n> 1. 先debug下，再调成running。pyspider框架在windows下的bug\r\n> 2. 设置跑的速度，建议不要跑的太快，否则很容易被发现是爬虫的，人家就会把你的IP给封掉的\r\n> 3. 查看运行工作\r\n> 4. 查看爬取下来的内容\r\n![这里写图片描述](http://img.blog.csdn.net/20161022202033227)\r\n![这里写图片描述](http://img.blog.csdn.net/20161022202048258)\r\n然后再本地数据库GUI软件上查询下就可以看到数据已经保存到本地了。\r\n自己需要用的话就可以导入出来了。\r\n在开头我就告诉大家爬虫的代码了，如果详细的看看那个project，你就会找到我上传的爬取数据了。（仅供学习使用，切勿商用！）\r\n当然你还会看到其他的爬虫代码的了，如果你觉得不错可以给个 Star，或者你也感兴趣的话，你可以fork我的项目，和我一起学习，这个项目长期更新下去。\r\n**最后：**\r\n代码：\r\n```\r\n# created by 10412\r\n# !/usr/bin/env python\r\n# -*- encoding: utf-8 -*-\r\n# Created on 2016-10-20 20:43:00\r\n# Project: V2EX\r\nfrom pyspider.libs.base_handler import *\r\nimport re\r\nimport random\r\nimport MySQLdb\r\nclass Handler(BaseHandler):\r\n    crawl_config = {\r\n    }\r\n    def __init__(self):\r\n        self.db = MySQLdb.connect(\'localhost\', \'root\', \'root\', \'wenda\', charset=\'utf8\')\r\n    def add_question(self, title, content):\r\n        try:\r\n            cursor = self.db.cursor()\r\n            sql = \'insert into question(title, content, user_id, created_date, comment_count) values (\"%s\",\"%s\",%d, %s, 0)\' % (title, content, random.randint(1, 10) , \'now()\');\r\n            print sql\r\n            cursor.execute(sql)\r\n            print cursor.lastrowid\r\n            self.db.commit()\r\n        except Exception, e:\r\n            print e\r\n            self.db.rollback()\r\n    @every(minutes=24 * 60)\r\n    def on_start(self):\r\n        self.crawl(\'https://www.v2ex.com/\', callback=self.index_page, validate_cert=False)\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def index_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/?tab=\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.tab_page, validate_cert=False)\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def tab_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/go/\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def board_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/t/\"]\').items():\r\n            url = each.attr.href\r\n            if url.find(\'#reply\')>0:\r\n                url = url[0:url.find(\'#\')]\r\n            self.crawl(url, callback=self.detail_page, validate_cert=False)\r\n        for each in response.doc(\'a.page_normal\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n    @config(priority=2)\r\n    def detail_page(self, response):\r\n        title = response.doc(\'h1\').text()\r\n        content = response.doc(\'div.topic_content\').html().replace(\'\"\', \'\\\\\"\')\r\n        self.add_question(title, content)  #插入数据库\r\n        return {\r\n            \"url\": response.url,\r\n            \"title\": title,\r\n            \"content\": content,\r\n        }\r\n```**', 1, 'post', 'publish', 'java', 'Java', 41, 0, 1, 1, 1);
INSERT INTO `t_contents` VALUES (6, 'springboot 自动配置原理', 'boot', 1729987200, 1729987200, 'springboot 自动配置原理\r\n一、springboot自动配置\r\n1、概述\r\n\r\n自动配置的功能是其简化运用的关键技术，思想就是约定大于配置，意思就是一个工程约定必须要有事务功能，要有aop功能，要有mvc功能等，所以springboot在创建工程的时候自动把这些功能所需的类实例化并加入到spring容器了，这个就是约定大于配置，约定了必须要有这些功能。\r\n\r\n2、springboot中的SPI机制\r\n\r\njava原生的SPI，是一种服务发现机制（ Service Provider Interface）。它通过在ClassPath路径下的META-INF/services文件夹查找文件，自动加载文件里所定义的类。 这一机制为很多框架扩展提供了可能，比如在Dubbo、JDBC中都使用到了SPI。\r\n\r\n2.1、JDK中的SPI机制\r\n\r\npublic interface Log {\r\n boolean support(String type); \r\n void info(); \r\n }\r\n1\r\n2\r\n3\r\n4\r\n在resources/META-INF/services目录创建文件，文件名称必须跟接口的完整限定名相同。这个接口文件中配置了该接口的所有实现类的完整限定名。然后jdk api 加载配置文件\r\n\r\n//jdk api 加载配置文件配置实例\r\n ServiceLoader<Log> all = ServiceLoader.load(Log.class);\r\n1\r\n2\r\n2.2、springboot中的SPI机制\r\n具体流程和上面差不多，在工程的resources下面创建META-INF文件夹，在文件夹下创建spring.factories文件，在文件配置内容如下：\r\n\r\ncom.ss.yc.spi.Log=\\ \r\ncom.ss.yc.spi.Log4j,\\\r\ncom.ss.yc.spi.Logback,\\ \r\ncom.ss.yc.spi.Slf4j\r\n1\r\n2\r\n3\r\n4\r\n配置的key就是接口完整限定名，value就是接口的各个实现类，用\",\"号隔开。\r\n\r\nloadFactoryNames方法获取实现了接口的所有类的名称\r\n@Test\r\npublic void test() {\r\nList<String> strings = SpringFactoriesLoader\r\n.loadFactoryNames(Log.class, ClassUtils.getDefaultClassLoader());\r\n\r\nfor (String string : strings) { System.out.println(string); \r\n }\r\n}\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\nloadFactories方法获取实现了接口的所有类的实例\r\n@Test\r\npublic void test1() {\r\nList<String> strings = SpringFactoriesLoader\r\n.loadFactories(Log.class, ClassUtils.getDefaultClassLoader());\r\n\r\nfor (String string : strings) { System.out.println(string); \r\n }\r\n}\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n2.3、我们以SpringFactoriesLoader.loadFactoryNames(Log.class, ClassUtils.getDefaultClassLoader());方法调用为例分析其源码\r\n\r\n可以看到springboot spi是加载了整个工程的jar包和自己工程定义的spring.factories文件的。\r\n其核心代码\r\n\r\nProperties properties = PropertiesLoaderUtils.loadProperties(resource);\r\n1\r\npublic static Properties loadProperties(Resource resource) \r\nthrows IOException { \r\nProperties props = new Properties(); \r\n//核心代码，把文件包装成properties对象\r\n fillProperties(props, resource);\r\n  return props;\r\n }\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\nspringboot中的SPI其实就是加载整个工程里面的spring.factories文件，然后把文件里面的内容建立一个key和value的映射关系，只是这个映射关系是一个类型和list的映射关系。', 1, 'post', 'publish', 'Java', 'Java', 26, 1, 1, 1, 1);
INSERT INTO `t_contents` VALUES (7, 'aaaaaa1', 'aaaaaa1', 1729987200, 1729987200, '33', 1, 'page', 'publish', NULL, NULL, 0, 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `data` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `author_id` int NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
INSERT INTO `t_logs` VALUES (29, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (31, '保存系统设置', '{\"social_zhihu\":\"\",\"social_github\":\"\",\"social_twitter\":\"\",\"social_weibo\":\"\"}', 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (32, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (33, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (34, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (35, '删除文章', '/upload/2022/05/2v7l3f9thsi4kptjfjnf7v42jv.jpg', 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (36, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (37, '修改个人信息', '{\"uid\":1,\"email\":\"1503515578@qq.com\",\"screenName\":\"陈佳旭\"}', 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (38, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (39, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (40, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (41, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (42, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (43, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (44, '删除文章', '4', 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (45, '删除文章', '3', 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (46, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (47, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (48, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (49, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (50, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729987200);
INSERT INTO `t_logs` VALUES (51, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729263835);
INSERT INTO `t_logs` VALUES (52, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1729264177);

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas`  (
  `mid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `sort` int UNSIGNED NULL DEFAULT 0,
  `parent` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `slug`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_metas
-- ----------------------------
INSERT INTO `t_metas` VALUES (1, 'default', NULL, 'category', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (8, '随笔', '随笔', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (9, 'Java', 'Java', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (10, 'Java', 'Java', 'category', '有关Java的博客', 0, 0);
INSERT INTO `t_metas` VALUES (11, 'HashMap', 'HashMap', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (12, 'HashTable', 'HashTable', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (13, 'HashSet', 'HashSet', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (14, 'ConcurrentHashMap', 'ConcurrentHashMap', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (15, 'Pyspider', 'Pyspider', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (16, 'Python', 'Python', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (17, '爬虫', '爬虫', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (19, 'Python', 'Python', 'category', '有关Python的博客', 0, 0);
INSERT INTO `t_metas` VALUES (20, '随笔', NULL, 'category', NULL, 0, 0);

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options`  (
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `value` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_options
-- ----------------------------
INSERT INTO `t_options` VALUES ('allow_install', '', '');
INSERT INTO `t_options` VALUES ('site_description', 'SpringBoot+Mybatis+thymeleaf 搭建的 Java 博客系统', NULL);
INSERT INTO `t_options` VALUES ('site_keywords', 'Blog', NULL);
INSERT INTO `t_options` VALUES ('site_theme', 'default', NULL);
INSERT INTO `t_options` VALUES ('site_title', 'Blog', '');
INSERT INTO `t_options` VALUES ('social_weibo', '', NULL);
INSERT INTO `t_options` VALUES ('social_zhihu', '', NULL);

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships`  (
  `cid` int UNSIGNED NOT NULL,
  `mid` int UNSIGNED NOT NULL,
  PRIMARY KEY (`cid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
INSERT INTO `t_relationships` VALUES (5, 9);
INSERT INTO `t_relationships` VALUES (5, 10);
INSERT INTO `t_relationships` VALUES (6, 9);
INSERT INTO `t_relationships` VALUES (6, 10);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `uid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `home_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `screen_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `created` int UNSIGNED NULL DEFAULT 0,
  `activated` int UNSIGNED NULL DEFAULT 0,
  `logged` int UNSIGNED NULL DEFAULT 0,
  `group_name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'visitor',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `name`(`username` ASC) USING BTREE,
  UNIQUE INDEX `mail`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', '8888888@qq.com', NULL, '陈礼涛', 1729987200, 0, 0, 'admin');

SET FOREIGN_KEY_CHECKS = 1;
