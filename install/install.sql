# --- WireDatabaseBackup {"time":"2024-08-06 12:02:44","user":"","dbName":"regular","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '166');

DROP TABLE IF EXISTS `field_blocks`;
CREATE TABLE `field_blocks` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_blocks` (`pages_id`, `data`, `sort`) VALUES('1', '1113', '1');
INSERT INTO `field_blocks` (`pages_id`, `data`, `sort`) VALUES('1', '1116', '0');

DROP TABLE IF EXISTS `field_body`;
CREATE TABLE `field_body` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_body` (`pages_id`, `data`) VALUES('27', '<h1>404 Not Found</h1>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1020', '<blockquote>\n<p>Welcome to [Your Company Name]! We are a dynamic and innovative company specializing in [your industry or field]. Our mission is to [briefly describe your company\'s mission, e.g., \"provide cutting-edge technology solutions that make everyday life easier for our customers\"].</p>\n</blockquote>\n<h3>Our Story</h3>\n<p>Founded in [Year], [Your Company Name] began with a simple idea: [describe the initial idea or inspiration behind your company]. Since then, we have grown into a [size of your company, e.g., \"a leading provider of...\"] with a passionate team dedicated to [specific aspect of your service or product, e.g., \"delivering exceptional customer service and innovative products\"].</p>\n<h3>Our Values</h3>\n<p>At [Your Company Name], we believe in [core values, e.g., \"integrity, innovation, and community\"]. These values guide everything we do, from our relationships with customers to the products and services we offer. We are committed to [specific commitment, e.g., \"sustainability and ethical practices\"] in all aspects of our business.</p>\n<h3>What We Offer</h3>\n<p>Our team of experts is dedicated to [briefly describe what your company offers, e.g., \"developing high-quality software solutions tailored to meet the unique needs of our clients\"]. We take pride in our [unique selling points, e.g., \"attention to detail, cutting-edge technology, and personalized service\"].</p>\n<h3>Join Us</h3>\n<p>Whether you are a potential customer, a business partner, or someone interested in joining our team, we invite you to [call to action, e.g., \"explore our offerings and discover how we can work together to achieve your goals\"]. Feel free to [contact us, visit our office, etc.] to learn more about what we do and how we can help you.</p>\n<p>Thank you for visiting [Your Company Name]. We look forward to connecting with you!</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1022', '<p>Welcome to our Contact Page!</p>\n<p>We value your feedback and inquiries. Whether you have a question, a suggestion, or need assistance, please feel free to reach out to us using the form below. Our dedicated team is here to help and will get back to you as soon as possible.</p>\n<p><strong>Office Hours:</strong> Monday to Friday: 9:00 AM - 5:00 PM Saturday: 10:00 AM - 2:00 PM Sunday: Closed</p>\n<p>We look forward to hearing from you!</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1051', '<h3>Personal Data Processing</h3>\n<p>At [Your Company Name], we prioritize the privacy of our customers and users. Below, we outline how we collect, process, and protect your personal data.</p>\n<h4>What Personal Data Do We Collect?</h4>\n<p>We collect personal data necessary to provide our services and improve the quality of our customer service. This data may include:</p>\n<ul>\n<li><strong>Contact Information:</strong> Name, email address, phone number.</li>\n<li><strong>Identification Information:</strong> National ID number, passport number (if required).</li>\n<li><strong>Transaction Data:</strong> Purchase history, payment history.</li>\n<li><strong>Technical Data:</strong> IP address, browser and device information, cookies.</li>\n</ul>\n<h4>For What Purpose Do We Process Your Data?</h4>\n<p>Personal data is processed for the following purposes:</p>\n<ul>\n<li><strong>Service Provision:</strong> Order fulfillment, customer support.</li>\n<li><strong>Personalization of Offerings:</strong> Customizing content and offers to your preferences.</li>\n<li><strong>Marketing:</strong> Sending information about new products, promotions, and special offers (with user consent).</li>\n<li><strong>Analysis and Statistics:</strong> Improving our services and better understanding user needs.</li>\n</ul>\n<h4>How Do We Protect Your Data?</h4>\n<p>We employ advanced technical and organizational measures to protect your personal data from unauthorized access, loss, or destruction. Our servers are secured according to the highest security standards.</p>\n<h4>Sharing of Personal Data</h4>\n<p>Your personal data may be shared with:</p>\n<ul>\n<li><strong>Partner Entities:</strong> IT service providers, courier companies, marketing partners who support us in providing our services.</li>\n<li><strong>Law Enforcement and Public Authorities:</strong> In cases prescribed by law.</li>\n</ul>\n<h4>Your Rights</h4>\n<p>You have the right to:</p>\n<ul>\n<li><strong>Access Your Personal Data:</strong> Request information about the data we process.</li>\n<li><strong>Correct Your Data:</strong> Update your data if it is outdated or incorrect.</li>\n<li><strong>Delete Your Data:</strong> Request the deletion of your data, provided it does not conflict with legal obligations.</li>\n<li><strong>Object to Data Processing:</strong> Object to the processing of your personal data for specific purposes.</li>\n</ul>\n<h4>Contact</h4>\n<p>If you have any questions about the processing of your personal data or wish to exercise your rights, please contact us:</p>\n<p>[Your Company Name]<br />[Company Address]<br />[Contact Email]<br />[Contact Phone Number]</p>\n<p>Thank you for your trust, and we invite you to enjoy our services!</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1089', '<p>Search engine optimization (SEO) is an essential part of any online marketing strategy. In this article, we\'ll share some tips and best practices for improving your SEO ranking.<br>From optimizing your content for keywords to building high-quality backlinks, we\'ll cover everything you need to know to get ahead in the search results.</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1102', '<blockquote>\n<p>Choosing the right Content Management System (CMS) can significantly impact the success and efficiency of managing your website. ProcessWire CMS has gained popularity among developers and businesses for its unique blend of flexibility, power, and user-friendliness. In this article, we\'ll explore the key benefits of using ProcessWire CMS and how it can enhance your web development and content management experience.</p>\n</blockquote>\n<h4><strong>1. Unmatched Flexibility</strong></h4>\n<p>One of the most compelling benefits of ProcessWire is its unmatched flexibility. Unlike many other CMS platforms that impose rigid structures, ProcessWire provides a field-template system that allows developers to define custom content types and fields with ease. This flexibility means you can create a wide range of websites, from simple blogs to complex applications, without being restricted by the CMS\'s architecture. This customizable nature makes ProcessWire an excellent choice for projects that require unique data models or intricate design layouts.</p>\n<h4><strong>2. Powerful API</strong></h4>\n<p>ProcessWire\'s powerful API is a standout feature that empowers developers to create custom functionalities and integrations. The API is designed to be intuitive and consistent, making it easy to learn and use. Developers can access and manipulate content, users, and settings programmatically, enabling the creation of highly customized solutions. Whether you need to integrate third-party services, automate tasks, or build bespoke features, ProcessWire\'s API provides the tools necessary to get the job done.</p>\n<h4><strong>3. User-Friendly Interface</strong></h4>\n<p>Despite its powerful capabilities, ProcessWire maintains a user-friendly interface that is accessible to non-technical users. The admin panel is clean, modern, and intuitive, making content management straightforward. Users can easily add and manage pages, organize content hierarchically, and utilize a drag-and-drop interface for content arrangement. This ease of use ensures that editors and content creators can work efficiently without requiring extensive training.</p>\n<h4><strong>4. Robust Security</strong></h4>\n<p>Security is a top priority for any website, and ProcessWire excels in this regard. The CMS is built with security best practices in mind, offering strong user access controls and permission settings. It also includes features like anti-spam measures, form security, and protection against common web vulnerabilities. Additionally, the active development community and regular updates ensure that the platform remains secure against emerging threats.</p>\n<h4><strong>5. SEO-Friendly Features</strong></h4>\n<p>ProcessWire is designed to be SEO-friendly, helping you optimize your website for search engines. The CMS offers fine-grained control over URLs, metadata, and content structure, allowing you to implement SEO best practices easily. Furthermore, ProcessWire supports custom fields for adding specific SEO data, such as meta descriptions and keywords, directly within the content editor. This flexibility is invaluable for improving your site\'s visibility and ranking in search engine results.</p>\n<h4><strong>6. Multilingual Capabilities</strong></h4>\n<p>In today\'s global market, supporting multiple languages on your website is often essential. ProcessWire includes robust multilingual capabilities, allowing you to manage content in multiple languages seamlessly. The CMS supports multiple versions of pages and fields, providing a consistent and user-friendly experience for both administrators and end-users.</p>\n<h4><strong>7. Active Community and Support</strong></h4>\n<p>Another significant benefit of using ProcessWire is its active and supportive community. The community offers a wealth of resources, including documentation, tutorials, forums, and a module directory. Whether you\'re a beginner or an experienced developer, you can find assistance and guidance from fellow users and contributors. This strong community support enhances the overall experience of using ProcessWire and helps you get the most out of the platform.</p>\n<h4><strong>Conclusion</strong></h4>\n<p>ProcessWire CMS stands out as a versatile and robust platform that caters to the needs of developers, content creators, and businesses alike. Its flexibility, powerful API, user-friendly interface, and strong security features make it a compelling choice for any web development project. Whether you\'re building a simple blog or a complex application, ProcessWire provides the tools and capabilities needed to bring your vision to life. Embrace the benefits of ProcessWire and elevate your web development experience to new heights!</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1107', '<blockquote>\n<p>What is ProcessWire CMS?<br />ProcessWire is a flexible and open-source content management system that empowers users to efficiently create, manage, and organize digital content. Its key strength lies in its simplicity and adaptability, making it suitable for a wide range of projects, from personal blogs to complex corporate websites.</p>\n</blockquote>\n<ul>\n<li>User-Friendly Interface:<br />One of the standout features of ProcessWire is its intuitive user interface. With a clean and organized dashboard, users can easily navigate through the system\'s various sections. Adding new pages, editing existing content, and organizing media files are all straightforward tasks, even for those with limited technical expertise.<br /><br /></li>\n<li>Flexibility and Customization:<br />ProcessWire\'s flexibility sets it apart from many other CMS options. Instead of being tied down by rigid templates, developers can create and tailor templates to match their unique design preferences. This flexibility extends to content fields as well, allowing for the creation of custom data structures that suit your specific project requirements.<br /><br /></li>\n<li>Module Ecosystem:<br />To enhance the capabilities of ProcessWire, a thriving ecosystem of modules is available. These modules act as plugins, adding various functionalities to your website. Whether you need advanced SEO tools, e-commerce integration, or social media sharing options, chances are there\'s a module that can meet your needs.</li>\n<li>Scalability:<br />ProcessWire is designed to grow with your website. Whether you start small and gradually expand or launch a large-scale project from the outset, the system can accommodate your needs. Its efficient architecture ensures that performance remains optimal, even as your site\'s content and traffic increase.<br /><br /></li>\n<li>Security:<br />Security is a top priority for any website, and ProcessWire takes this seriously. The system offers built-in protection against common vulnerabilities, and its active development community ensures that any security issues are swiftly addressed through updates and patches.<br /><br /></li>\n<li>Conclusion:<br />ProcessWire CMS stands out as a user-friendly, flexible, and secure solution for managing digital content. Its intuitive interface, customization options, module ecosystem, scalability, and emphasis on security make it an excellent choice for both beginners and experienced developers. Whether you\'re setting up a personal blog or a complex business website, ProcessWire provides the tools you need to bring your online presence to life.</li>\n</ul>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1113', '<blockquote>\n<p>Welcome to our portfolio! Here, you can explore a selection of our recent projects, showcasing our expertise in various fields. Each project reflects our commitment to delivering high-quality solutions tailored to the unique needs of our clients. From cutting-edge e-commerce platforms to engaging mobile applications, discover how we bring ideas to life through innovation and creativity.</p>\n</blockquote>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1116', '<p>This module replaces the existing \"Children\" tab in the page editor with a new one that lets you edit all the child pages inline.<br>https://youtu.be/74z5JPJNAy8?feature=shared</p>');
INSERT INTO `field_body` (`pages_id`, `data`) VALUES('1188', '<ul>\n<li>Name: Alex</li>\n<li>Email: alex@gmail.com</li>\n<li>Message: Hello World</li>\n<li>Accept Personal Data : checked</li>\n</ul>');

DROP TABLE IF EXISTS `field_categories`;
CREATE TABLE `field_categories` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_categories` (`pages_id`, `data`, `sort`) VALUES('1102', '1091', '0');
INSERT INTO `field_categories` (`pages_id`, `data`, `sort`) VALUES('1107', '1091', '0');
INSERT INTO `field_categories` (`pages_id`, `data`, `sort`) VALUES('1089', '1105', '0');
INSERT INTO `field_categories` (`pages_id`, `data`, `sort`) VALUES('1102', '1109', '1');
INSERT INTO `field_categories` (`pages_id`, `data`, `sort`) VALUES('1107', '1109', '1');

DROP TABLE IF EXISTS `field_cbox`;
CREATE TABLE `field_cbox` (
  `pages_id` int unsigned NOT NULL,
  `data` tinyint NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_cbox` (`pages_id`, `data`) VALUES('1028', '1');
INSERT INTO `field_cbox` (`pages_id`, `data`) VALUES('1186', '1');

DROP TABLE IF EXISTS `field_cbox_1`;
CREATE TABLE `field_cbox_1` (
  `pages_id` int unsigned NOT NULL,
  `data` tinyint NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_comments`;
CREATE TABLE `field_comments` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  `sort` int unsigned NOT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint NOT NULL DEFAULT '0',
  `cite` varchar(128) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `created` int unsigned NOT NULL,
  `created_users_id` int unsigned NOT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `user_agent` varchar(250) NOT NULL DEFAULT '',
  `website` varchar(250) NOT NULL DEFAULT '',
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `code` varchar(128) DEFAULT NULL,
  `subcode` varchar(40) DEFAULT NULL,
  `upvotes` int unsigned NOT NULL DEFAULT '0',
  `downvotes` int unsigned NOT NULL DEFAULT '0',
  `stars` tinyint unsigned DEFAULT NULL,
  `meta` text,
  PRIMARY KEY (`id`),
  KEY `pages_id_sort` (`pages_id`,`sort`),
  KEY `status` (`status`,`email`),
  KEY `pages_id` (`pages_id`,`status`,`created`),
  KEY `created` (`created`,`status`),
  KEY `code` (`code`),
  KEY `subcode` (`subcode`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_comments` (`pages_id`, `data`, `sort`, `id`, `status`, `cite`, `email`, `created`, `created_users_id`, `ip`, `user_agent`, `website`, `parent_id`, `flags`, `code`, `subcode`, `upvotes`, `downvotes`, `stars`, `meta`) VALUES('1107', 'Hello ProcessWire Followers :)', '0', '1', '1', 'rafaoski', 'test@gmail.com', '1721716320', '40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', '', '0', '0', 'QHtbGfqhbRY5wok57Rvssdt0GuD5SzBTmdEFE6QoVpcSQcUBuG20Q71lj2feyBjEtUWm9IjVpRbvq56vKnAvq0BRZzaluqysYlsQbowPhO89FnTafTS24NZQLSgBrf1S', 'I5CtuiOTBm6wMeZZmcXaLHSnLfrYzdtYdUWWYcC1', '0', '0', NULL, '[]');

DROP TABLE IF EXISTS `field_comments_votes`;
CREATE TABLE `field_comments_votes` (
  `comment_id` int unsigned NOT NULL,
  `vote` tinyint NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `user_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`,`ip`,`vote`),
  KEY `created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_contactinfo`;
CREATE TABLE `field_contactinfo` (
  `pages_id` int unsigned NOT NULL,
  `data` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_contactinfo` (`pages_id`, `data`) VALUES('1018', '1053');

DROP TABLE IF EXISTS `field_date`;
CREATE TABLE `field_date` (
  `pages_id` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_date` (`pages_id`, `data`) VALUES('1107', '2024-07-24 08:35:00');
INSERT INTO `field_date` (`pages_id`, `data`) VALUES('1188', '2024-08-03 22:11:00');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_files`;
CREATE TABLE `field_files` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_friendlylinks`;
CREATE TABLE `field_friendlylinks` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  `count` int NOT NULL,
  `parent_id` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(1)),
  KEY `count` (`count`,`pages_id`),
  KEY `parent_id` (`parent_id`,`pages_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_friendlylinks` (`pages_id`, `data`, `count`, `parent_id`) VALUES('1018', '1028,1186', '2', '1027');

DROP TABLE IF EXISTS `field_images`;
CREATE TABLE `field_images` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  `tags` varchar(250) NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`),
  FULLTEXT KEY `tags` (`tags`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1089', 'undraw_hiking_re_k0bc.png', '0', '', '2024-07-22 21:56:50', '2024-07-22 21:56:50', '{\"uploadName\":\"undraw_Hiking_re_k0bc.png\"}', '13832', '41', '41', '1053', '952', '1.11', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1018', 'coffee.svg', '0', '', '2024-07-21 18:35:32', '2024-07-21 18:35:32', '', '644', '41', '41', '32', '32', '1.00', 'logo favicon');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1102', 'processwire-logo-svg-vector.svg', '0', '', '2024-07-22 22:05:05', '2024-07-22 22:05:05', '', '721', '41', '41', '2500', '2500', '1.00', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1107', 'undraw_outer_space_re_u9vd.png', '0', '', '2024-07-22 22:09:06', '2024-07-22 22:09:06', '{\"uploadName\":\"undraw_Outer_space_re_u9vd.png\"}', '19835', '41', '41', '1142', '986', '1.16', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1', 'processwire.png', '0', '', '2024-08-03 22:09:58', '2024-08-03 22:09:25', '{\"_100\":\"\"}', '6013', '41', '41', '512', '512', '1.00', 'contain');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1119', 'processwire.png', '0', '', '2024-07-25 09:27:22', '2024-07-25 09:09:44', '{\"_100\":\"\"}', '6013', '41', '41', '512', '512', '1.00', 'youtube_ryanCramer');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1020', 'undraw_hiking_re_k0bc.png', '0', '', '2024-07-25 15:41:09', '2024-07-25 15:41:09', '{\"uploadName\":\"undraw_Hiking_re_k0bc.png\",\"_100\":\"\"}', '13832', '41', '41', '1053', '952', '1.11', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('27', 'undraw_page_not_found_re_e9o6.png', '0', '', '2024-08-03 14:06:41', '2024-08-03 14:06:41', '{\"uploadName\":\"undraw_Page_not_found_re_e9o6.png\",\"_100\":\"\"}', '16574', '41', '41', '1100', '731', '1.50', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1022', 'undraw_inbox_oppv.png', '0', '', '2024-08-03 14:04:07', '2024-08-03 14:04:07', '{\"_100\":\"\"}', '11029', '41', '41', '916', '766', '1.20', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1051', 'undraw_multitasking_re_ffpb_-_kopia.png', '0', '', '2024-08-03 14:06:22', '2024-08-03 14:06:22', '{\"uploadName\":\"undraw_Multitasking_re_ffpb \\u2014 kopia.png\",\"_100\":\"\"}', '15909', '41', '41', '1128', '752', '1.50', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1087', 'undraw_graduation_re_gthn.png', '0', '', '2024-08-03 14:05:50', '2024-08-03 14:05:50', '{\"uploadName\":\"undraw_Graduation_re_gthn.png\",\"_100\":\"\"}', '6972', '41', '41', '1051', '464', '2.27', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1085', 'undraw_lightbulb_moment_re_ulyo.png', '0', '', '2024-08-03 14:05:28', '2024-08-03 14:05:28', '{\"_100\":\"\"}', '9404', '41', '41', '897', '936', '0.96', '');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_goals_re_lu76.png', '0', 'E-commerce Platform', '2024-08-04 09:38:19', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_Goals_re_lu76.png\",\"_100\":\"<blockquote>\\n<p>We developed a modern e-commerce platform with an intuitive user interface and advanced product management features.<\\/p>\\n<\\/blockquote>\\n<p>Our team created a responsive and efficient website, enabling easy online shopping. By implementing best UX practices, customers can quickly find and purchase the products they<\\/p>\"}', '15690', '41', '41', '1034', '822', '1.26', 'ecommerce webdevelopment');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_eco_conscious_re_r2bs.png', '1', 'Corporate Website', '2024-07-24 18:32:27', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_Eco_conscious_re_r2bs.png\",\"_100\":\"<blockquote>\\n<p>We designed a sleek corporate website to enhance the brand presence of a tech startup.<\\/p>\\n<\\/blockquote>\\n<p>The project involved creating a dynamic and visually appealing website that reflects the startup\'s innovative spirit. The site features a clean design, interactive elements, and easy navigation to engage visitors.<\\/p>\"}', '11537', '41', '41', '1121', '784', '1.43', 'startup corporate branding');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_my_universe_803e.png', '2', 'Online Art Gallery', '2024-07-25 00:02:27', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_My_universe_803e.png\",\"_100\":\"<blockquote>\\n<p>We launched an online art gallery showcasing works from emerging and established artists.<\\/p>\\n<\\/blockquote>\\n<p>The gallery offers a platform for artists to display their work, with features such as virtual exhibitions and artist profiles. Visitors can explore various art collections and purchase pieces directly through the site.<\\/p>\"}', '13040', '41', '41', '1022', '798', '1.28', 'artgallery online visualarts');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_online_gallery_re_3098.png', '3', 'Educational Portal', '2024-07-24 18:35:02', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_Online_gallery_re_3098.png\",\"_100\":\"<blockquote>\\n<p>We built an educational portal offering diverse learning resources and online courses.<\\/p>\\n<\\/blockquote>\\n<p>The portal provides students and educators with access to a wide range of educational materials, including videos, articles, and quizzes. It features a user-friendly interface and powerful search functionality.<\\/p>\"}', '8392', '41', '41', '1021', '819', '1.25', 'elearning portal education');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_joyride_re_968t.png', '4', 'Fitness Tracking', '2024-07-24 19:31:43', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_Joyride_re_968t.png\",\"_100\":\"<blockquote>\\n<p>We developed a mobile app that helps users track their fitness goals and progress.<\\/p>\\n<\\/blockquote>\\n<p>The app includes features such as workout tracking, goal setting, and progress analytics. It also integrates with wearable devices to provide real-time data on users\' physical activities.<\\/p>\"}', '13867', '41', '41', '1062', '855', '1.24', 'mobileapp fitness health');
INSERT INTO `field_images` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`, `tags`) VALUES('1113', 'undraw_drag_re_shc0.png', '5', 'Interactive Museum', '2024-07-24 18:37:34', '2024-07-24 18:28:31', '{\"uploadName\":\"undraw_Drag_re_shc0.png\",\"_100\":\"<blockquote>\\n<p>\\u00a0We created an interactive exhibit for a museum to enhance visitor engagement.<\\/p>\\n<\\/blockquote>\\n<p>The exhibit features touchscreens, augmented reality elements, and interactive displays that provide an immersive educational experience. It allows visitors to explore exhibits in a hands-on and engaging manner.<\\/p>\"}', '10307', '41', '41', '936', '671', '1.39', 'interactive museum exhibit');

DROP TABLE IF EXISTS `field_internallinks`;
CREATE TABLE `field_internallinks` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_internallinks` (`pages_id`, `data`, `sort`) VALUES('1018', '1022', '0');
INSERT INTO `field_internallinks` (`pages_id`, `data`, `sort`) VALUES('1018', '1051', '1');
INSERT INTO `field_internallinks` (`pages_id`, `data`, `sort`) VALUES('1018', '1123', '2');

DROP TABLE IF EXISTS `field_moreoptions`;
CREATE TABLE `field_moreoptions` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_opt`;
CREATE TABLE `field_opt` (
  `pages_id` int unsigned NOT NULL,
  `data` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_opt` (`pages_id`, `data`) VALUES('1', '1018');

DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int NOT NULL DEFAULT '0',
  `data` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1010', '165');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1012', '167');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1041', '181');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1042', '182');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1093', '183');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1095', '184');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1096', '185');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1097', '189');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1099', '190');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1104', '191');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_seo`;
CREATE TABLE `field_seo` (
  `pages_id` int unsigned NOT NULL,
  `data` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1', '1019');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1020', '1021');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1022', '1023');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1051', '1052');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('27', '1025');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1085', '1086');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1087', '1088');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1089', '1090');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1091', '1092');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1102', '1103');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1105', '1106');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1107', '1108');
INSERT INTO `field_seo` (`pages_id`, `data`) VALUES('1109', '1110');

DROP TABLE IF EXISTS `field_socialprofiles`;
CREATE TABLE `field_socialprofiles` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_socialprofiles` (`pages_id`, `data`, `sort`) VALUES('1018', '1033', '2');
INSERT INTO `field_socialprofiles` (`pages_id`, `data`, `sort`) VALUES('1018', '1034', '0');
INSERT INTO `field_socialprofiles` (`pages_id`, `data`, `sort`) VALUES('1018', '1035', '4');
INSERT INTO `field_socialprofiles` (`pages_id`, `data`, `sort`) VALUES('1018', '1036', '3');
INSERT INTO `field_socialprofiles` (`pages_id`, `data`, `sort`) VALUES('1018', '1190', '1');

DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Not Found');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1015', 'Repeaters');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1016', 'seo');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1017', 'opt');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1020', 'About');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1022', 'Contact');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1026', 'friendlyLinks');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1027', 'for-page-1');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1029', 'Advanced Options');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1030', 'Google analytics tracking code');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1031', 'Google webmaster verification code');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1032', 'Social Profiles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1033', 'X.com');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1034', 'Facebook');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1035', 'YouTube');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1036', 'TikTok');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1105', 'SEO');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1038', 'contactInfo');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1041', 'Adminer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1042', 'Adminer Renderer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1102', 'The Benefits of Using ProcessWire CMS');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1104', 'Export/Import');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1101', 'Clone a tree of pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'Personal Data');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1100', 'Clone a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1099', 'Clone');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1098', 'Use the comments manager');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1097', 'Comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1096', 'Helper Oembed');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1095', 'Helper Backup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1094', 'Run the profilehelper module');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1091', 'CMS');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1093', 'Profile Helper Module');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1117', 'Disable Contact Form');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1085', 'Blog');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1087', 'Categories');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1089', 'Boost Your SEO!');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1107', 'Exploring ProcessWire CMS');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1109', 'ProcessWire');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1111', 'Blocks');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1118', 'Disable comments');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1113', 'See our Works');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1114', 'First Content');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1116', 'WOW!!! Processwire has released a new plugin page edit children.');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1119', 'Oembed images');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1120', 'Copyright info');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1123', 'User Zone');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1188', 'example-alex@gmail.com - 2024-08-03 08:18:23');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1190', 'Instagram');

DROP TABLE IF EXISTS `field_txt`;
CREATE TABLE `field_txt` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1018', 'newRegular');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1019', 'Welcome To The ProcessWire CMS Site Starter! Your Little Buddy For A Kick-Start!');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1023', 'Our friendly and knowledgeable team is always here to help.');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1030', 'Ga Code - 12345');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1031', 'Google Webmaster - 12345');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1028', 'ProcessWire');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1053', '+1 (123) 456-7890');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1021', 'Get To Know Us Better!');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1108', 'In The Vast World Of Website Development, Finding The Right Content Management System (CMS) Can Be A Bit Overwhelming.');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1186', 'ProcessWire Weekly');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1103', 'Discover The Advantages Of ProcessWire CMS!');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('41', 'rafaoski');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1090', 'How to Improve Your SEO Ranking');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1120', 'Made by rafaoski :)');
INSERT INTO `field_txt` (`pages_id`, `data`) VALUES('1188', '127.0.0.1');

DROP TABLE IF EXISTS `field_txt_1`;
CREATE TABLE `field_txt_1` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_txt_1` (`pages_id`, `data`) VALUES('1018', 'en, en_GB');
INSERT INTO `field_txt_1` (`pages_id`, `data`) VALUES('1053', '1234 Main Street, Your City, Your Country');

DROP TABLE IF EXISTS `field_txtarea`;
CREATE TABLE `field_txtarea` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1018', 'Welcome in the new regular profile');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1019', '\"Dive into the ProcessWire CMS and watch your world transform! Embark on a journey that promises to reshape your digital landscape and open doors to endless possibilities.\"');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1023', 'Whether you have questions, feedback, or suggestions, contact us via phone, email, or our online form – we\'d love to hear from you.');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1021', 'Explore our dedicated team\'s mission to provide you with high-quality products and services that exceed your expectations. Discover our years of industry expertise and find out how we can help you achieve your goals.');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1053', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14092.755172908432!2d86.91467534652304!3d27.98811976636015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39e854a215bd9ebd%3A0x576dcf806abbab2!2sMount%20Everest!5e0!3m2!1spl!2spl!4v1719953996286!5m2!1spl!2spl\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1090', 'Explore essential tips and best practices for elevating your website\'s search engine ranking. From keyword optimization to building high-quality backlinks, we\'ve got your SEO covered.');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1103', 'Learn about its flexibility, power, and rich feature set that make it an excellent choice for managing your website\'s content.');
INSERT INTO `field_txtarea` (`pages_id`, `data`) VALUES('1108', 'ProcessWire CMS offers a simple and friendly solution for managing your website\'s content, making it a popular choice among developers and content creators alike. Let\'s dive into the basics of ProcessWire and discover why it\'s a great option for those seeking a user-friendly CMS.');

DROP TABLE IF EXISTS `field_url`;
CREATE TABLE `field_url` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1028', 'https://processwire.com/');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1033', 'https://x.com/');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1034', 'https://www.facebook.com/');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1035', '#');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1036', '#');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1186', 'https://weekly.pw/');
INSERT INTO `field_url` (`pages_id`, `data`) VALUES('1190', '#');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('97', 'repeater_seo');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('98', 'repeater_opt');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('99', 'contact');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('100', 'contact-item');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('101', 'repeater_friendlyLinks');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('102', '_optTxt');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('103', '_opt');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('104', '_optSocial');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'repeater_contactInfo');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'blog-post');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'blog');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'categories');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('110', 'category');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('111', '_blockImages');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('112', '_blockContent');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('113', 'field-images');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('114', '_optBool');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('115', '_oembedImages');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('116', 'user-zone');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'user-todo');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int unsigned NOT NULL DEFAULT '0',
  `fields_id` int unsigned NOT NULL DEFAULT '0',
  `sort` int unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '100', '0', '{\"collapsed\":\"2\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '118', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '105', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '99', '1', '{\"description\":\"A meta description is a brief snippet that describes the content of a web page. It is displayed beneath the link in Google search results and is intended to entice users to click on the page.\",\"label\":\"Description\",\"maxlength\":320,\"notes\":\"The optimal length for a meta description is around 150-160 characters. Although Google may display longer meta descriptions, it is recommended to stick to this length to ensure readability and precise information delivery. It\'s also a good practice to include key words but avoid overusing them.\",\"showCount\":\"1\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '100', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '1', '0', '{\"collapsed\":\"6\",\"label\":\"Fill content:\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('102', '98', '1', '{\"label\":\"Content\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '118', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '107', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '100', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '118', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '100', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '100', '5', '{\"label\":\"Message\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '115', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '98', '0', '{\"label\":\"Link name\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '107', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('101', '108', '2', '{\"label\":\"Target blank\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '115', '2', '{\"label\":\"Publish Date\",\"showIf\":\"cbox=1\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('103', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '117', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('104', '1', '0', '{\"collapsed\":\"6\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '92', '0', '{\"label\":\"E-Mail\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '98', '1', '{\"label\":\"Phone\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '98', '2', '{\"label\":\"IP\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '92', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('100', '114', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '113', '2', '{\"label\":\"Address\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '99', '3', '{\"label\":\"Company Map\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '100', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '108', '1', '{\"label\":\"Publish Post on date\",\"notes\":\"This will publish the page using `LazyCron`\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '101', '0', '{\"description\":\"Set the logo and favicon by adding the appropriate tag to the image field - logo, favicon\",\"label\":\"Logo\\/Favicon\",\"notes\":\"Basic usage:\\necho (new Site)->logo?->url;\\necho (new Site)->favicon?->url;\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '98', '1', '{\"label\":\"Site Name\",\"notes\":\"Basic usage:\\necho (new Site)->name;\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '99', '2', '{\"description\":\"In a few words, explain what this site is about. Example: \\u201cJust another ProcessWire site.\\u201d\",\"label\":\"Site Tagline\",\"notes\":\"Basic usage:\\necho (new Site)->tagline;\",\"rows\":1}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '113', '3', '{\"description\":\"Set the language code and Open Graph locale separately with commas like: \\nen, en_GB\",\"label\":\"Language\",\"notes\":\"Basic usage:\\necho (new Site)->lang\\necho (new Site)->ogLocale\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '112', '4', '{\"notes\":\"Basic usage:\\necho (new Site)->email;\\necho (new Site)->phone;\\necho (new Site)->address;\\necho (new Site)->map;\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '111', '5', '{\"notes\":\"Basic usage:\\nforeach ((new Site)->socialProfiles as $item) {\\n\\techo Html::a($item->URL, $item->title, [\'targetBlank\' => true]) . \'<br>\';\\n}\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '110', '6', '{\"notes\":\"Basic usage:\\nforeach ((new Site)->internalLinks as $item) {\\n\\techo Html::a($item->url, $item->title);\\n}\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '106', '7', '{\"notes\":\"Basic usage:\\nforeach ((new Site)->friendlyLinks as $item) {\\n\\techo Html::a($item->URL, $item->txt) . \'<br>\';\\n}\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('98', '109', '8', '{\"notes\":\"Basic usage:\\necho (new Site)->gaCode;\\necho (new Site)->gvCode;\\necho (new Site)->copyright;\\nbd((new Site)->disableComments);\\nbd((new Site)->disableContactForm);\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '119', '8', '{\"label\":\"Close comments\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '1', '0', '{\"collapsed\":\"4\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '104', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '100', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '104', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '100', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '98', '3', '{\"label\":\"Slug\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '100', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '100', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '101', '3', '{\"tagsList\":\"logo favicon\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '101', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '100', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '1', '0', '{\"label\":\"Set\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '116', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '101', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('97', '98', '0', '{\"description\":\"A title tag, also known as a meta title, is an HTML element used in the header of a web page. It is a short phrase or sentence that describes the content of a particular page. The title tag appears on the browser\'s title bar and in Google search results as the header of the link to your page.\",\"label\":\"Title\",\"maxlength\":140,\"notes\":\"The optimal length for a title tag is approximately 50-60 characters. It\'s important to include key words related to the page\'s content to attract user attention and improve search engine rankings.\",\"showCount\":\"1\"}');
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '118', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('99', '118', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '1', '0', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb3;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('98', 'FieldtypeText', 'txt', '0', 'txt', '{\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0,\"allowContexts\":[\"showCount\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('99', 'FieldtypeTextarea', 'txtarea', '0', 'txtarea', '{\"textformatters\":[\"TextformatterEntities\"],\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":0,\"collapsed\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5,\"allowContexts\":[\"showCount\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypeTextarea', 'body', '0', 'Body', '{\"inputfieldClass\":\"InputfieldTinyMCE\",\"contentType\":1,\"inlineMode\":1,\"height\":500,\"lazyMode\":1,\"features\":[\"toolbar\",\"menubar\",\"stickybars\",\"spellcheck\",\"purifier\",\"imgUpload\",\"imgResize\",\"pasteFilter\"],\"toolbar\":\"styles bold italic pwlink pwimage blockquote hr bullist numlist table anchor code\",\"plugins\":[\"anchor\",\"code\",\"fullscreen\",\"link\",\"lists\",\"pwimage\",\"pwlink\",\"table\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":15,\"icon\":\"book\",\"htmlOptions\":[2,4,8,16,32]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeImage', 'images', '0', 'Images', '{\"fileSchema\":271,\"maxFiles\":0,\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"gif jpg jpeg png svg\",\"outputFormat\":0,\"descriptionRows\":1,\"useTags\":9,\"gridMode\":\"grid\",\"focusMode\":\"on\",\"resizeServer\":0,\"clientQuality\":90,\"maxReject\":0,\"dimensionsByAspectRatio\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldImage\",\"icon\":\"file-image-o\",\"collapsed\":0,\"allowContexts\":[\"useTags\",\"tagsList\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypeFieldsetPage', 'contactInfo', '0', 'Contact Info', '{\"template_id\":52,\"parent_id\":1038,\"repeaterLoading\":2,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"repeaterFields\":[92,98,113,99],\"collapsed\":0,\"icon\":\"magic\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypePage', 'socialProfiles', '0', 'Social Profiles', '{\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"distinctAutojoin\":true,\"usePageEdit\":1,\"parent_id\":1032,\"labelFieldName\":\"title\",\"collapsed\":0,\"template_id\":50,\"icon\":\"paw\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeFieldsetPage', 'seo', '0', 'SEO', '{\"template_id\":43,\"parent_id\":1016,\"repeaterLoading\":2,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"repeaterFields\":[98,99],\"collapsed\":20,\"icon\":\"dot-circle-o\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeFieldsetPage', 'opt', '0', 'Options', '{\"template_id\":44,\"parent_id\":1017,\"repeaterLoading\":2,\"repeaterMaxItems\":1,\"repeaterMinItems\":1,\"collapsed\":10,\"repeaterFields\":[101,98,99,113,112,111,110,106,109],\"tags\":\"opt\",\"icon\":\"tachometer\",\"notes\":\"All examples:\\n\\n$site = new Site;\\n\\n\\/\\/ important pages\\necho $site->homePage->title . \'<br>\';\\necho $site->contactPage->title . \'<br>\';\\necho $site->personalDataPage->title . \'<br>\';\\n\\n\\/\\/ basic site info\\necho $site->name . \'<br>\';\\necho $site->tagline . \'<br>\';\\necho $site->email . \'<br>\';\\necho $site->phone . \'<br>\';\\necho $site->address . \'<br>\';\\necho sanitizer()->unentities($site->map) . \'<br>\';\\necho $site->logo?->url . \'<br>\';\\necho $site->favicon?->url . \'<br>\';\\necho $site->gaCode . \'<br>\';\\necho $site->gvCode . \'<br>\';\\necho $site->copyright . \'<br>\'; \\necho $site->url . \'<br>\';\\necho $site->httpUrl . \'<br>\';\\necho $site->hostUrl . \'<br>\';\\necho $site->lang . \'<br>\';\\necho $site->ogLocale . \'<br>\';\\necho $site->csrfInput . \'<br>\';\\n\\n\\/\\/ social profiles\\nforeach ($site->socialProfiles as $item) {\\n\\techo Html::a($item->URL, $item->title, [\'targetBlank\' => true]) . \'<br>\';\\n}\\n\\n\\/\\/ internal links\\nforeach ($site->internalLinks as $item) {\\n\\techo Html::a($item->url, $item->title) . \'<br>\';\\n}\\n\\n\\/\\/ friendly links\\nforeach ($site->friendlyLinks as $item) {\\n\\techo Html::a($item->URL, $item->txt) . \'<br>\';\\n}\\n\\n\\/\\/ All links\\necho $site->contactInfo();\\necho $site->socialProfiles();\\necho $site->internalLinks();\\necho $site->friendlyLinks();\\n\\n\\/\\/ language\\nbd($site->hasLanguageSupport); \\/\\/ bool\\n\\n\\/\\/ check csrf\\nbd($site->csrfValid); \\/\\/ bool\\n\\n\\/\\/ check htmx\\nbd($site->hxRequest); \\/\\/ bool\\nbd($site->hxBoosted); \\/\\/ bool\\nbd($site->hxPushUrl); \\/\\/ bool\\n\\n\\/\\/ check other\\nbd($site->isHome); \\/\\/ bool\\nbd($site->disableComments); \\/\\/ bool\\nbd($site->disableContactForm); \\/\\/ bool\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypeRepeater', 'friendlyLinks', '0', 'Friendly site links', '{\"template_id\":47,\"parent_id\":1026,\"repeaterFields\":[98,107,108],\"familyFriendly\":0,\"familyToggle\":0,\"repeaterCollapse\":0,\"repeaterLoading\":1,\"rememberOpen\":0,\"accordionMode\":0,\"loudControls\":0,\"noScroll\":0,\"collapsed\":0,\"icon\":\"link\",\"tags\":\"opt\",\"repeaterTitle\":\"#n{txt}\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeURL', 'URL', '0', 'URL', '{\"textformatters\":[\"TextformatterEntities\"],\"noRelative\":0,\"allowIDN\":0,\"allowQuotes\":0,\"addRoot\":0,\"collapsed\":0,\"minlength\":0,\"maxlength\":1024,\"showCount\":0,\"size\":0,\"icon\":\"link\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeCheckbox', 'cbox', '0', 'cbox', '{\"collapsed\":0,\"icon\":\"check\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypePage', 'moreOptions', '0', 'More Options', '{\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"distinctAutojoin\":true,\"usePageEdit\":1,\"parent_id\":1029,\"labelFieldName\":\"title\",\"collapsed\":0,\"template_id\":48,\"addable\":1,\"tags\":\"opt\",\"icon\":\"cogs\",\"template_ids\":[60]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypePage', 'internalLinks', '0', 'Site Internal links', '{\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"distinctAutojoin\":true,\"usePageEdit\":1,\"parent_id\":1,\"labelFieldName\":\"title\",\"collapsed\":0,\"tags\":\"opt\",\"icon\":\"link\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('113', 'FieldtypeText', 'txt_1', '0', 'txt_1', '{\"textformatters\":[\"TextformatterEntities\"],\"collapsed\":0,\"minlength\":0,\"maxlength\":2048,\"showCount\":0,\"size\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('114', 'FieldtypeFile', 'files', '0', 'files', '{\"maxFiles\":0,\"textformatters\":[\"TextformatterEntities\"],\"extensions\":\"pdf doc docx xls xlsx gif jpg jpeg png\",\"outputFormat\":0,\"descriptionRows\":1,\"useTags\":0,\"defaultValuePage\":0,\"inputfieldClass\":\"InputfieldFile\",\"fileSchema\":14,\"icon\":\"files-o\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeDatetime', 'date', '0', 'Date', '{\"dateOutputFormat\":\"j F Y g:i a\",\"dateInputFormat\":\"Y-m-d\",\"timeInputFormat\":\"g:i a\",\"inputType\":\"html\",\"htmlType\":\"datetime\",\"collapsed\":0,\"dateSelectFormat\":\"yMd\",\"yearFrom\":1924,\"yearTo\":2044,\"yearLock\":0,\"datepicker\":0,\"timeInputSelect\":0,\"size\":25,\"showAnim\":\"fade\",\"numberOfMonths\":1,\"changeMonth\":1,\"changeYear\":1,\"showButtonPanel\":0,\"showMonthAfterYear\":0,\"showOtherMonths\":0,\"defaultToday\":1,\"icon\":\"calendar\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypePage', 'categories', '0', 'categories', '{\"derefAsPage\":0,\"inputfield\":\"InputfieldAsmSelect\",\"distinctAutojoin\":true,\"usePageEdit\":0,\"parent_id\":1087,\"template_id\":56,\"labelFieldName\":\"title\",\"collapsed\":0,\"addable\":1,\"icon\":\"hashtag\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeComments', 'comments', '0', 'comments', '{\"moderate\":0,\"useNotify\":0,\"useNotifyText\":1,\"deleteSpamDays\":3,\"depth\":0,\"dateFormat\":\"relative\",\"useVotes\":0,\"useStars\":0,\"schemaVersion\":8,\"useManager\":1,\"redirectAfterPost\":1,\"quietSave\":1,\"sortNewest\":1,\"useGravatar\":\"g\",\"icon\":\"comment\",\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('118', 'FieldtypePageTable', 'blocks', '0', 'Blocks', '{\"template_id\":[58,57],\"parent_id\":1111,\"trashOnDelete\":1,\"unpubOnTrash\":1,\"unpubOnUnpub\":2,\"collapsed\":0,\"noclose\":1,\"icon\":\"square\",\"columns\":\"title=15\\nbody=30\\nimages\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('119', 'FieldtypeCheckbox', 'cbox_1', '0', 'cbox_1', '{\"collapsed\":0,\"icon\":\"check\"}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"admin_theme\",\"email\",\"pass\",\"txt\"]}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":20,\"coreVersion\":\"3.0.240\"}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldTinyMCE', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2024-07-14 07:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', '.Modules.wire/modules/', '8192', 'AdminTheme/AdminThemeDefault/AdminThemeDefault.module\nAdminTheme/AdminThemeReno/AdminThemeReno.module\nAdminTheme/AdminThemeUikit/AdminThemeUikit.module\nFieldtype/FieldtypeCache.module\nFieldtype/FieldtypeCheckbox.module\nFieldtype/FieldtypeComments/CommentFilterAkismet.module\nFieldtype/FieldtypeComments/FieldtypeComments.module\nFieldtype/FieldtypeComments/InputfieldCommentsAdmin.module\nFieldtype/FieldtypeDatetime.module\nFieldtype/FieldtypeDecimal.module\nFieldtype/FieldtypeEmail.module\nFieldtype/FieldtypeFieldsetClose.module\nFieldtype/FieldtypeFieldsetOpen.module\nFieldtype/FieldtypeFieldsetTabOpen.module\nFieldtype/FieldtypeFile/FieldtypeFile.module\nFieldtype/FieldtypeFloat.module\nFieldtype/FieldtypeImage/FieldtypeImage.module\nFieldtype/FieldtypeInteger.module\nFieldtype/FieldtypeModule.module\nFieldtype/FieldtypeOptions/FieldtypeOptions.module\nFieldtype/FieldtypePage.module\nFieldtype/FieldtypePageTable.module\nFieldtype/FieldtypePageTitle.module\nFieldtype/FieldtypePassword.module\nFieldtype/FieldtypeRepeater/FieldtypeFieldsetPage.module\nFieldtype/FieldtypeRepeater/FieldtypeRepeater.module\nFieldtype/FieldtypeRepeater/InputfieldRepeater.module\nFieldtype/FieldtypeSelector.module\nFieldtype/FieldtypeText.module\nFieldtype/FieldtypeTextarea.module\nFieldtype/FieldtypeToggle.module\nFieldtype/FieldtypeURL.module\nFileCompilerTags.module\nImage/ImageSizerEngineAnimatedGif/ImageSizerEngineAnimatedGif.module\nImage/ImageSizerEngineIMagick/ImageSizerEngineIMagick.module\nInputfield/InputfieldAsmSelect/InputfieldAsmSelect.module\nInputfield/InputfieldButton.module\nInputfield/InputfieldCheckbox/InputfieldCheckbox.module\nInputfield/InputfieldCheckboxes/InputfieldCheckboxes.module\nInputfield/InputfieldCKEditor/InputfieldCKEditor.module\nInputfield/InputfieldDatetime/InputfieldDatetime.module\nInputfield/InputfieldEmail.module\nInputfield/InputfieldFieldset.module\nInputfield/InputfieldFile/InputfieldFile.module\nInputfield/InputfieldFloat.module\nInputfield/InputfieldForm.module\nInputfield/InputfieldHidden.module\nInputfield/InputfieldIcon/InputfieldIcon.module\nInputfield/InputfieldImage/InputfieldImage.module\nInputfield/InputfieldInteger.module\nInputfield/InputfieldMarkup.module\nInputfield/InputfieldName.module\nInputfield/InputfieldPage/InputfieldPage.module\nInputfield/InputfieldPageAutocomplete/InputfieldPageAutocomplete.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelect.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelectMultiple.module\nInputfield/InputfieldPageName/InputfieldPageName.module\nInputfield/InputfieldPageTable/InputfieldPageTable.module\nInputfield/InputfieldPageTitle/InputfieldPageTitle.module\nInputfield/InputfieldPassword/InputfieldPassword.module\nInputfield/InputfieldRadios/InputfieldRadios.module\nInputfield/InputfieldSelect.module\nInputfield/InputfieldSelectMultiple.module\nInputfield/InputfieldSelector/InputfieldSelector.module\nInputfield/InputfieldSubmit/InputfieldSubmit.module\nInputfield/InputfieldText/InputfieldText.module\nInputfield/InputfieldTextarea.module\nInputfield/InputfieldTextTags/InputfieldTextTags.module\nInputfield/InputfieldTinyMCE/InputfieldTinyMCE.module.php\nInputfield/InputfieldToggle/InputfieldToggle.module\nInputfield/InputfieldURL.module\nJquery/JqueryCore/JqueryCore.module\nJquery/JqueryMagnific/JqueryMagnific.module\nJquery/JqueryTableSorter/JqueryTableSorter.module\nJquery/JqueryUI/JqueryUI.module\nJquery/JqueryWireTabs/JqueryWireTabs.module\nLanguageSupport/FieldtypePageTitleLanguage.module\nLanguageSupport/FieldtypeTextareaLanguage.module\nLanguageSupport/FieldtypeTextLanguage.module\nLanguageSupport/LanguageSupport.module\nLanguageSupport/LanguageSupportFields.module\nLanguageSupport/LanguageSupportPageNames.module\nLanguageSupport/LanguageTabs.module\nLanguageSupport/ProcessLanguage.module\nLanguageSupport/ProcessLanguageTranslator.module\nLazyCron.module\nMarkup/MarkupAdminDataTable/MarkupAdminDataTable.module\nMarkup/MarkupCache.module\nMarkup/MarkupHTMLPurifier/MarkupHTMLPurifier.module\nMarkup/MarkupPageArray.module\nMarkup/MarkupPageFields.module\nMarkup/MarkupPagerNav/MarkupPagerNav.module\nMarkup/MarkupRSS.module\nPage/PageFrontEdit/PageFrontEdit.module\nPagePathHistory.module\nPagePaths.module\nPagePermissions.module\nPageRender.module\nPages/PagesVersions/PagesVersions.module.php\nProcess/ProcessCommentsManager/ProcessCommentsManager.module\nProcess/ProcessField/ProcessField.module\nProcess/ProcessForgotPassword/ProcessForgotPassword.module\nProcess/ProcessHome.module\nProcess/ProcessList.module\nProcess/ProcessLogger/ProcessLogger.module\nProcess/ProcessLogin/ProcessLogin.module\nProcess/ProcessModule/ProcessModule.module\nProcess/ProcessPageAdd/ProcessPageAdd.module\nProcess/ProcessPageClone.module\nProcess/ProcessPageEdit/ProcessPageEdit.module\nProcess/ProcessPageEditImageSelect/ProcessPageEditImageSelect.module\nProcess/ProcessPageEditLink/ProcessPageEditLink.module\nProcess/ProcessPageList/ProcessPageList.module\nProcess/ProcessPageLister/ProcessPageLister.module\nProcess/ProcessPageSearch/ProcessPageSearch.module\nProcess/ProcessPagesExportImport/ProcessPagesExportImport.module\nProcess/ProcessPageSort.module\nProcess/ProcessPageTrash.module\nProcess/ProcessPageType/ProcessPageType.module\nProcess/ProcessPageView.module\nProcess/ProcessPermission/ProcessPermission.module\nProcess/ProcessProfile/ProcessProfile.module\nProcess/ProcessRecentPages/ProcessRecentPages.module\nProcess/ProcessRole/ProcessRole.module\nProcess/ProcessTemplate/ProcessTemplate.module\nProcess/ProcessUser/ProcessUser.module\nSession/SessionHandlerDB/ProcessSessionDB.module\nSession/SessionHandlerDB/SessionHandlerDB.module\nSession/SessionLoginThrottle/SessionLoginThrottle.module\nSystem/SystemNotifications/FieldtypeNotifications.module\nSystem/SystemNotifications/SystemNotifications.module\nSystem/SystemUpdater/SystemUpdater.module\nTextformatter/TextformatterEntities.module\nTextformatter/TextformatterMarkdownExtra/TextformatterMarkdownExtra.module\nTextformatter/TextformatterNewlineBR.module\nTextformatter/TextformatterNewlineUL.module\nTextformatter/TextformatterPstripper.module\nTextformatter/TextformatterSmartypants/TextformatterSmartypants.module\nTextformatter/TextformatterStripTags.module', '2024-07-14 07:23:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', '.Modules.site/modules/', '8192', 'TracyDebugger/TracyDebugger.module.php\nFileValidatorSvgSanitizer/FileValidatorSvgSanitizer.module.php\nLoginRegister/LoginRegister.module.php\nPageListCustomChildren/PageListCustomChildren.module.php\nProcessExportProfile/ProcessExportProfile.module\nProcessProfileHelper/HelperBackup/HelperBackup.module.php\nProcessProfileHelper/HelperMaintenance/HelperMaintenance.module.php\nProcessProfileHelper/HelperOembed/HelperOembed.module.php\nProcessProfileHelper/ProcessProfileHelper.module.php\nTracyDebugger/ProcessTracyAdminer.module.php\nTracyDebugger/ProcessTracyAdminerRenderer.module.php', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', '.Modules.info', '8192', '{\"180\":{\"name\":\"TracyDebugger\",\"title\":\"Tracy Debugger\",\"version\":\"4.26.34\",\"icon\":\"bug\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"2.7.2\"],\"PHP\":[\">=\",\"5.4.4\"]},\"installs\":[\"ProcessTracyAdminer\"],\"autoload\":100000,\"singular\":true,\"created\":1721064235,\"configurable\":3,\"namespace\":\"\\\\\"},\"148\":{\"name\":\"AdminThemeDefault\",\"title\":\"Default\",\"version\":14,\"autoload\":\"template=admin\",\"created\":1720934575,\"configurable\":19},\"166\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":34,\"autoload\":\"template=admin\",\"created\":1720934593,\"configurable\":4},\"97\":{\"name\":\"FieldtypeCheckbox\",\"title\":\"Checkbox\",\"version\":101,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"187\":{\"name\":\"FieldtypeComments\",\"title\":\"Comments\",\"version\":110,\"installs\":[\"InputfieldCommentsAdmin\"],\"singular\":1,\"created\":1721583816},\"188\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Comments Admin\",\"version\":104,\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1721583816},\"28\":{\"name\":\"FieldtypeDatetime\",\"title\":\"Datetime\",\"version\":105,\"created\":1720934575},\"29\":{\"name\":\"FieldtypeEmail\",\"title\":\"E-Mail\",\"version\":101,\"created\":1720934575},\"106\":{\"name\":\"FieldtypeFieldsetClose\",\"title\":\"Fieldset (Close)\",\"version\":100,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"105\":{\"name\":\"FieldtypeFieldsetOpen\",\"title\":\"Fieldset (Open)\",\"version\":101,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"107\":{\"name\":\"FieldtypeFieldsetTabOpen\",\"title\":\"Fieldset in Tab (Open)\",\"version\":100,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"6\":{\"name\":\"FieldtypeFile\",\"title\":\"Files\",\"version\":107,\"created\":1720934575,\"configurable\":4,\"permanent\":true},\"89\":{\"name\":\"FieldtypeFloat\",\"title\":\"Float\",\"version\":107,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"57\":{\"name\":\"FieldtypeImage\",\"title\":\"Images\",\"version\":102,\"created\":1720934575,\"configurable\":4,\"permanent\":true},\"84\":{\"name\":\"FieldtypeInteger\",\"title\":\"Integer\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"27\":{\"name\":\"FieldtypeModule\",\"title\":\"Module Reference\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"4\":{\"name\":\"FieldtypePage\",\"title\":\"Page Reference\",\"version\":107,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"193\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"singular\":true,\"created\":1721727580},\"111\":{\"name\":\"FieldtypePageTitle\",\"title\":\"Page Title\",\"version\":100,\"singular\":true,\"created\":1720934575,\"permanent\":true},\"133\":{\"name\":\"FieldtypePassword\",\"title\":\"Password\",\"version\":101,\"singular\":true,\"created\":1720934575,\"permanent\":true},\"173\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":113,\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"singular\":true,\"created\":1720935511,\"configurable\":3},\"175\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Page)\",\"version\":1,\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1720935511,\"configurable\":3},\"174\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":111,\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1720935511},\"3\":{\"name\":\"FieldtypeText\",\"title\":\"Text\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"1\":{\"name\":\"FieldtypeTextarea\",\"title\":\"Textarea\",\"version\":107,\"created\":1720934575,\"permanent\":true},\"135\":{\"name\":\"FieldtypeURL\",\"title\":\"URL\",\"version\":101,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"25\":{\"name\":\"InputfieldAsmSelect\",\"title\":\"asmSelect\",\"version\":203,\"created\":1720934575,\"permanent\":true},\"131\":{\"name\":\"InputfieldButton\",\"title\":\"Button\",\"version\":100,\"created\":1720934575,\"permanent\":true},\"37\":{\"name\":\"InputfieldCheckbox\",\"title\":\"Checkbox\",\"version\":106,\"created\":1720934575,\"permanent\":true},\"38\":{\"name\":\"InputfieldCheckboxes\",\"title\":\"Checkboxes\",\"version\":108,\"created\":1720934575,\"permanent\":true},\"94\":{\"name\":\"InputfieldDatetime\",\"title\":\"Datetime\",\"version\":108,\"created\":1720934575,\"permanent\":true},\"80\":{\"name\":\"InputfieldEmail\",\"title\":\"Email\",\"version\":102,\"created\":1720934575},\"78\":{\"name\":\"InputfieldFieldset\",\"title\":\"Fieldset\",\"version\":101,\"created\":1720934575,\"permanent\":true},\"55\":{\"name\":\"InputfieldFile\",\"title\":\"Files\",\"version\":129,\"created\":1720934575,\"permanent\":true},\"90\":{\"name\":\"InputfieldFloat\",\"title\":\"Float\",\"version\":105,\"created\":1720934575,\"permanent\":true},\"30\":{\"name\":\"InputfieldForm\",\"title\":\"Form\",\"version\":107,\"created\":1720934575,\"permanent\":true},\"40\":{\"name\":\"InputfieldHidden\",\"title\":\"Hidden\",\"version\":101,\"created\":1720934575,\"permanent\":true},\"168\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"created\":1720934597},\"56\":{\"name\":\"InputfieldImage\",\"title\":\"Images\",\"version\":129,\"created\":1720934575,\"permanent\":true},\"85\":{\"name\":\"InputfieldInteger\",\"title\":\"Integer\",\"version\":105,\"created\":1720934575,\"permanent\":true},\"79\":{\"name\":\"InputfieldMarkup\",\"title\":\"Markup\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"41\":{\"name\":\"InputfieldName\",\"title\":\"Name\",\"version\":100,\"created\":1720934575,\"permanent\":true},\"60\":{\"name\":\"InputfieldPage\",\"title\":\"Page\",\"version\":109,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"169\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Page Auto Complete\",\"version\":113,\"created\":1720934609},\"15\":{\"name\":\"InputfieldPageListSelect\",\"title\":\"Page List Select\",\"version\":101,\"created\":1720934575,\"permanent\":true},\"137\":{\"name\":\"InputfieldPageListSelectMultiple\",\"title\":\"Page List Select Multiple\",\"version\":103,\"created\":1720934575,\"permanent\":true},\"86\":{\"name\":\"InputfieldPageName\",\"title\":\"Page Name\",\"version\":106,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"194\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1721727580},\"112\":{\"name\":\"InputfieldPageTitle\",\"title\":\"Page Title\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"122\":{\"name\":\"InputfieldPassword\",\"title\":\"Password\",\"version\":102,\"created\":1720934575,\"permanent\":true},\"39\":{\"name\":\"InputfieldRadios\",\"title\":\"Radio Buttons\",\"version\":106,\"created\":1720934575,\"permanent\":true},\"36\":{\"name\":\"InputfieldSelect\",\"title\":\"Select\",\"version\":103,\"created\":1720934575,\"permanent\":true},\"43\":{\"name\":\"InputfieldSelectMultiple\",\"title\":\"Select Multiple\",\"version\":101,\"created\":1720934575,\"permanent\":true},\"149\":{\"name\":\"InputfieldSelector\",\"title\":\"Selector\",\"version\":28,\"autoload\":\"template=admin\",\"created\":1720934575,\"configurable\":3,\"addFlag\":32},\"32\":{\"name\":\"InputfieldSubmit\",\"title\":\"Submit\",\"version\":103,\"created\":1720934575,\"permanent\":true},\"34\":{\"name\":\"InputfieldText\",\"title\":\"Text\",\"version\":106,\"created\":1720934575,\"permanent\":true},\"35\":{\"name\":\"InputfieldTextarea\",\"title\":\"Textarea\",\"version\":103,\"created\":1720934575,\"permanent\":true},\"170\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text Tags\",\"version\":7,\"icon\":\"tags\",\"created\":1720934609},\"155\":{\"name\":\"InputfieldTinyMCE\",\"title\":\"TinyMCE\",\"version\":618,\"icon\":\"keyboard-o\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"],\"MarkupHTMLPurifier\":[\">=\",0]},\"created\":1720934575,\"configurable\":4},\"172\":{\"name\":\"InputfieldToggle\",\"title\":\"Toggle\",\"version\":1,\"created\":1720935370},\"108\":{\"name\":\"InputfieldURL\",\"title\":\"URL\",\"version\":103,\"created\":1720934575},\"116\":{\"name\":\"JqueryCore\",\"title\":\"jQuery Core\",\"version\":\"1.12.4\",\"singular\":true,\"created\":1720934575,\"permanent\":true},\"151\":{\"name\":\"JqueryMagnific\",\"title\":\"jQuery Magnific Popup\",\"version\":\"1.1.0\",\"singular\":1,\"created\":1720934575},\"103\":{\"name\":\"JqueryTableSorter\",\"title\":\"jQuery Table Sorter Plugin\",\"version\":\"2.31.3\",\"singular\":1,\"created\":1720934575},\"117\":{\"name\":\"JqueryUI\",\"title\":\"jQuery UI\",\"version\":\"1.10.4\",\"singular\":true,\"created\":1720934575,\"permanent\":true},\"45\":{\"name\":\"JqueryWireTabs\",\"title\":\"jQuery Wire Tabs Plugin\",\"version\":110,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"179\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"autoload\":true,\"singular\":true,\"created\":1720970011},\"67\":{\"name\":\"MarkupAdminDataTable\",\"title\":\"Admin Data Table\",\"version\":107,\"created\":1720934575,\"permanent\":true},\"156\":{\"name\":\"MarkupHTMLPurifier\",\"title\":\"HTML Purifier\",\"version\":497,\"created\":1720934575},\"113\":{\"name\":\"MarkupPageArray\",\"title\":\"PageArray Markup\",\"version\":100,\"autoload\":true,\"singular\":true,\"created\":1720934575},\"98\":{\"name\":\"MarkupPagerNav\",\"title\":\"Pager (Pagination) Navigation\",\"version\":105,\"created\":1720934575},\"176\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":105,\"icon\":\"rss-square\",\"created\":1720935536,\"configurable\":3},\"114\":{\"name\":\"PagePermissions\",\"title\":\"Page Permissions\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1720934575,\"permanent\":true},\"115\":{\"name\":\"PageRender\",\"title\":\"Page Render\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"189\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Comments\",\"version\":12,\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"singular\":1,\"created\":1721583881,\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Approved\"},{\"url\":\"?go=pending\",\"label\":\"Pending\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"All\"}]},\"48\":{\"name\":\"ProcessField\",\"title\":\"Fields\",\"version\":114,\"icon\":\"cube\",\"permission\":\"field-admin\",\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"192\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Forgot Password\",\"version\":104,\"permission\":\"page-view\",\"singular\":1,\"created\":1721596662,\"configurable\":4},\"87\":{\"name\":\"ProcessHome\",\"title\":\"Admin Home\",\"version\":101,\"permission\":\"page-view\",\"created\":1720934575,\"permanent\":true},\"76\":{\"name\":\"ProcessList\",\"title\":\"List\",\"version\":101,\"permission\":\"page-view\",\"created\":1720934575,\"permanent\":true},\"167\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"icon\":\"tree\",\"permission\":\"logs-view\",\"singular\":1,\"created\":1720934597,\"useNavJSON\":true},\"10\":{\"name\":\"ProcessLogin\",\"title\":\"Login\",\"version\":109,\"permission\":\"page-view\",\"created\":1720934575,\"configurable\":4,\"permanent\":true},\"50\":{\"name\":\"ProcessModule\",\"title\":\"Modules\",\"version\":121,\"permission\":\"module-admin\",\"created\":1720934575,\"permanent\":true,\"useNavJSON\":true,\"nav\":[{\"url\":\"?site#tab_site_modules\",\"label\":\"Site\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?site=1\"},{\"url\":\"?core#tab_core_modules\",\"label\":\"Core\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?core=1\"},{\"url\":\"?configurable#tab_configurable_modules\",\"label\":\"Configure\",\"icon\":\"gear\",\"navJSON\":\"navJSON\\/?configurable=1\"},{\"url\":\"?install#tab_install_modules\",\"label\":\"Install\",\"icon\":\"sign-in\",\"navJSON\":\"navJSON\\/?install=1\"},{\"url\":\"?new#tab_new_modules\",\"label\":\"New\",\"icon\":\"plus\"},{\"url\":\"?reset=1\",\"label\":\"Refresh\",\"icon\":\"refresh\"}]},\"17\":{\"name\":\"ProcessPageAdd\",\"title\":\"Page Add\",\"version\":109,\"icon\":\"plus-circle\",\"permission\":\"page-edit\",\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"190\":{\"name\":\"ProcessPageClone\",\"title\":\"Page Clone\",\"version\":106,\"permission\":\"page-clone\",\"autoload\":\"template=admin\",\"singular\":true,\"created\":1721595815,\"configurable\":4},\"7\":{\"name\":\"ProcessPageEdit\",\"title\":\"Page Edit\",\"version\":112,\"icon\":\"edit\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"129\":{\"name\":\"ProcessPageEditImageSelect\",\"title\":\"Page Edit Image\",\"version\":121,\"permission\":\"page-edit\",\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"121\":{\"name\":\"ProcessPageEditLink\",\"title\":\"Page Edit Link\",\"version\":112,\"icon\":\"link\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1720934575,\"configurable\":4,\"permanent\":true},\"12\":{\"name\":\"ProcessPageList\",\"title\":\"Page List\",\"version\":124,\"icon\":\"sitemap\",\"permission\":\"page-edit\",\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"150\":{\"name\":\"ProcessPageLister\",\"title\":\"Lister\",\"version\":26,\"icon\":\"search\",\"permission\":\"page-lister\",\"created\":1720934575,\"configurable\":true,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"104\":{\"name\":\"ProcessPageSearch\",\"title\":\"Page Search\",\"version\":108,\"permission\":\"page-edit\",\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"191\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"singular\":1,\"created\":1721596653},\"14\":{\"name\":\"ProcessPageSort\",\"title\":\"Page Sort and Move\",\"version\":101,\"permission\":\"page-edit\",\"created\":1720934575,\"permanent\":true},\"109\":{\"name\":\"ProcessPageTrash\",\"title\":\"Page Trash\",\"version\":103,\"singular\":1,\"created\":1720934575,\"permanent\":true},\"134\":{\"name\":\"ProcessPageType\",\"title\":\"Page Type\",\"version\":101,\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"83\":{\"name\":\"ProcessPageView\",\"title\":\"Page View\",\"version\":106,\"permission\":\"page-view\",\"created\":1720934575,\"permanent\":true},\"136\":{\"name\":\"ProcessPermission\",\"title\":\"Permissions\",\"version\":101,\"icon\":\"gear\",\"permission\":\"permission-admin\",\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"138\":{\"name\":\"ProcessProfile\",\"title\":\"User Profile\",\"version\":105,\"permission\":\"profile-edit\",\"singular\":1,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"165\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"singular\":1,\"created\":1720934593,\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"68\":{\"name\":\"ProcessRole\",\"title\":\"Roles\",\"version\":104,\"icon\":\"gears\",\"permission\":\"role-admin\",\"created\":1720934575,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"47\":{\"name\":\"ProcessTemplate\",\"title\":\"Templates\",\"version\":114,\"icon\":\"cubes\",\"permission\":\"template-admin\",\"created\":1720934575,\"configurable\":4,\"permanent\":true,\"useNavJSON\":true},\"66\":{\"name\":\"ProcessUser\",\"title\":\"Users\",\"version\":107,\"icon\":\"group\",\"permission\":\"user-admin\",\"created\":1720934575,\"configurable\":\"ProcessUserConfig.php\",\"permanent\":true,\"useNavJSON\":true},\"125\":{\"name\":\"SessionLoginThrottle\",\"title\":\"Session Login Throttle\",\"version\":103,\"autoload\":\"function\",\"singular\":true,\"created\":1720934575,\"configurable\":3},\"139\":{\"name\":\"SystemUpdater\",\"title\":\"System Updater\",\"version\":20,\"singular\":true,\"created\":1720934575,\"configurable\":3,\"permanent\":true},\"61\":{\"name\":\"TextformatterEntities\",\"title\":\"HTML Entity Encoder (htmlspecialchars)\",\"version\":100,\"created\":1720934575},\"171\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"singular\":1,\"created\":1720935329,\"configurable\":4},\"178\":{\"name\":\"FileValidatorSvgSanitizer\",\"title\":\"SVG File Sanitizer\\/Validator\",\"version\":5,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.148\"]},\"created\":1720954893,\"configurable\":\"FileValidatorSvgSanitizer.config.php\",\"validates\":[\"svg\"]},\"195\":{\"name\":\"PageListCustomChildren\",\"title\":\"Page List Custom Children\",\"version\":2,\"icon\":\"sitemap\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"]},\"autoload\":\"template=admin\",\"created\":1721854632,\"configurable\":4},\"177\":{\"name\":\"ProcessExportProfile\",\"title\":\"Export Site Profile\",\"version\":501,\"icon\":\"truck\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"]},\"singular\":1,\"created\":1720954190},\"183\":{\"name\":\"ProcessProfileHelper\",\"title\":\"Profile Helper Module, based on ProcessHello module\",\"version\":1,\"icon\":\"thumbs-up\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.164\"]},\"installs\":[\"HelperBackup\",\"HelperOembed\",\"HelperMaintenance\"],\"permission\":\"profilehelper\",\"autoload\":true,\"singular\":true,\"created\":1721583749,\"configurable\":4,\"nav\":[{\"url\":\"\",\"label\":\"Hello\",\"icon\":\"smile-o\"},{\"url\":\"something\\/\",\"label\":\"Something\",\"icon\":\"beer\"},{\"url\":\"something-else\\/\",\"label\":\"Something Else\",\"icon\":\"glass\"},{\"url\":\"form\\/\",\"label\":\"Simple form\",\"icon\":\"building\"}]},\"184\":{\"name\":\"HelperBackup\",\"title\":\"Helper site Backup\",\"version\":\"1\",\"icon\":\"database\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0],\"LazyCron\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1721583749,\"configurable\":4},\"186\":{\"name\":\"HelperMaintenance\",\"title\":\"Helper Maintenance\",\"version\":\"1\",\"icon\":\"lock\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1721583749,\"configurable\":4},\"185\":{\"name\":\"HelperOembed\",\"title\":\"Helper Oembed\",\"version\":\"1\",\"icon\":\"file-code-o\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1721583749,\"configurable\":4},\"181\":{\"name\":\"ProcessTracyAdminer\",\"title\":\"Process Tracy Adminer\",\"version\":\"2.0.1\",\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"2.7.2\"],\"PHP\":[\">=\",\"5.4.4\"],\"TracyDebugger\":[\">=\",0],\"ProcessTracyAdminerRenderer\":[\">=\",0]},\"installs\":[\"ProcessTracyAdminerRenderer\"],\"singular\":true,\"created\":1721064236,\"namespace\":\"\\\\\"},\"182\":{\"name\":\"ProcessTracyAdminerRenderer\",\"title\":\"Process Tracy Adminer Renderer\",\"version\":\"2.0.2\",\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"2.7.2\"],\"PHP\":[\">=\",\"5.4.4\"],\"TracyDebugger\":[\">=\",0]},\"singular\":true,\"created\":1721064236,\"namespace\":\"\\\\\"}}', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', '.ModulesVerbose.info', '8192', '{\"180\":{\"summary\":\"Tracy debugger from Nette with many PW specific custom tools.\",\"author\":\"Adrian Jones\",\"href\":\"https:\\/\\/processwire.com\\/talk\\/forum\\/58-tracy-debugger\\/\",\"versionStr\":\"4.26.34\"},\"148\":{\"summary\":\"Minimal admin theme that supports all ProcessWire features.\",\"core\":true,\"versionStr\":\"0.1.4\"},\"166\":{\"summary\":\"Uikit v3 admin theme\",\"core\":true,\"versionStr\":\"0.3.4\"},\"97\":{\"summary\":\"This Fieldtype stores an ON\\/OFF toggle via a single checkbox. The ON value is 1 and OFF value is 0.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"187\":{\"summary\":\"Field that stores user posted comments for a single Page\",\"core\":true,\"versionStr\":\"1.1.0\"},\"188\":{\"summary\":\"Provides an administrative interface for working with comments\",\"core\":true,\"versionStr\":\"1.0.4\"},\"28\":{\"summary\":\"Field that stores a date and optionally time\",\"core\":true,\"versionStr\":\"1.0.5\"},\"29\":{\"summary\":\"Field that stores an e-mail address\",\"core\":true,\"versionStr\":\"1.0.1\"},\"106\":{\"summary\":\"Close a fieldset opened by FieldsetOpen. \",\"core\":true,\"versionStr\":\"1.0.0\"},\"105\":{\"summary\":\"Open a fieldset to group fields. Should be followed by a Fieldset (Close) after one or more fields.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"107\":{\"summary\":\"Open a fieldset to group fields. Same as Fieldset (Open) except that it displays in a tab instead.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"6\":{\"summary\":\"Field that stores one or more files\",\"core\":true,\"versionStr\":\"1.0.7\"},\"89\":{\"summary\":\"Field that stores a floating point number\",\"core\":true,\"versionStr\":\"1.0.7\"},\"57\":{\"summary\":\"Field that stores one or more GIF, JPG, or PNG images\",\"core\":true,\"versionStr\":\"1.0.2\"},\"84\":{\"summary\":\"Field that stores an integer\",\"core\":true,\"versionStr\":\"1.0.2\"},\"27\":{\"summary\":\"Field that stores a reference to another module\",\"core\":true,\"versionStr\":\"1.0.2\"},\"4\":{\"summary\":\"Field that stores one or more references to ProcessWire pages\",\"core\":true,\"versionStr\":\"1.0.7\"},\"193\":{\"summary\":\"A fieldtype containing a group of editable pages.\",\"core\":true,\"versionStr\":\"0.0.8\"},\"111\":{\"summary\":\"Field that stores a page title\",\"core\":true,\"versionStr\":\"1.0.0\"},\"133\":{\"summary\":\"Field that stores a hashed and salted password\",\"core\":true,\"versionStr\":\"1.0.1\"},\"173\":{\"summary\":\"Maintains a collection of fields that are repeated for any number of times.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"175\":{\"summary\":\"Fieldset with fields isolated to separate namespace (page), enabling re-use of fields.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"174\":{\"summary\":\"Repeats fields from another template. Provides the input for FieldtypeRepeater.\",\"core\":true,\"versionStr\":\"1.1.1\"},\"3\":{\"summary\":\"Field that stores a single line of text\",\"core\":true,\"versionStr\":\"1.0.2\"},\"1\":{\"summary\":\"Field that stores multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.7\"},\"135\":{\"summary\":\"Field that stores a URL\",\"core\":true,\"versionStr\":\"1.0.1\"},\"25\":{\"summary\":\"Multiple selection, progressive enhancement to select multiple\",\"core\":true,\"versionStr\":\"2.0.3\"},\"131\":{\"summary\":\"Form button element that you can optionally pass an href attribute to.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"37\":{\"summary\":\"Single checkbox toggle\",\"core\":true,\"versionStr\":\"1.0.6\"},\"38\":{\"summary\":\"Multiple checkbox toggles\",\"core\":true,\"versionStr\":\"1.0.8\"},\"94\":{\"summary\":\"Inputfield that accepts date and optionally time\",\"core\":true,\"versionStr\":\"1.0.8\"},\"80\":{\"summary\":\"E-Mail address in valid format\",\"core\":true,\"versionStr\":\"1.0.2\"},\"78\":{\"summary\":\"Groups one or more fields together in a container\",\"core\":true,\"versionStr\":\"1.0.1\"},\"55\":{\"summary\":\"One or more file uploads (sortable)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"90\":{\"summary\":\"Floating point number with precision\",\"core\":true,\"versionStr\":\"1.0.5\"},\"30\":{\"summary\":\"Contains one or more fields in a form\",\"core\":true,\"versionStr\":\"1.0.7\"},\"40\":{\"summary\":\"Hidden value in a form\",\"core\":true,\"versionStr\":\"1.0.1\"},\"168\":{\"summary\":\"Select an icon\",\"core\":true,\"versionStr\":\"0.0.3\"},\"56\":{\"summary\":\"One or more image uploads (sortable)\",\"core\":true,\"versionStr\":\"1.2.9\"},\"85\":{\"summary\":\"Integer (positive or negative)\",\"core\":true,\"versionStr\":\"1.0.5\"},\"79\":{\"summary\":\"Contains any other markup and optionally child Inputfields\",\"core\":true,\"versionStr\":\"1.0.2\"},\"41\":{\"summary\":\"Text input validated as a ProcessWire name field\",\"core\":true,\"versionStr\":\"1.0.0\"},\"60\":{\"summary\":\"Select one or more pages\",\"core\":true,\"versionStr\":\"1.0.9\"},\"169\":{\"summary\":\"Multiple Page selection using auto completion and sorting capability. Intended for use as an input field for Page reference fields.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"15\":{\"summary\":\"Selection of a single page from a ProcessWire page tree list\",\"core\":true,\"versionStr\":\"1.0.1\"},\"137\":{\"summary\":\"Selection of multiple pages from a ProcessWire page tree list\",\"core\":true,\"versionStr\":\"1.0.3\"},\"86\":{\"summary\":\"Text input validated as a ProcessWire Page name field\",\"core\":true,\"versionStr\":\"1.0.6\"},\"194\":{\"summary\":\"Inputfield to accompany FieldtypePageTable\",\"core\":true,\"versionStr\":\"0.1.4\"},\"112\":{\"summary\":\"Handles input of Page Title and auto-generation of Page Name (when name is blank)\",\"core\":true,\"versionStr\":\"1.0.2\"},\"122\":{\"summary\":\"Password input with confirmation field that doesn&#039;t ever echo the input back.\",\"core\":true,\"versionStr\":\"1.0.2\"},\"39\":{\"summary\":\"Radio buttons for selection of a single item\",\"core\":true,\"versionStr\":\"1.0.6\"},\"36\":{\"summary\":\"Selection of a single value from a select pulldown\",\"core\":true,\"versionStr\":\"1.0.3\"},\"43\":{\"summary\":\"Select multiple items from a list\",\"core\":true,\"versionStr\":\"1.0.1\"},\"149\":{\"summary\":\"Build a page finding selector visually.\",\"author\":\"Avoine + ProcessWire\",\"core\":true,\"versionStr\":\"0.2.8\"},\"32\":{\"summary\":\"Form submit button\",\"core\":true,\"versionStr\":\"1.0.3\"},\"34\":{\"summary\":\"Single line of text\",\"core\":true,\"versionStr\":\"1.0.6\"},\"35\":{\"summary\":\"Multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.3\"},\"170\":{\"summary\":\"Enables input of user entered tags or selection of predefined tags.\",\"core\":true,\"versionStr\":\"0.0.7\"},\"155\":{\"summary\":\"TinyMCE rich text editor version 6.8.2.\",\"core\":true,\"versionStr\":\"6.1.8\"},\"172\":{\"summary\":\"A toggle providing similar input capability to a checkbox but much more configurable.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"108\":{\"summary\":\"URL in valid format\",\"core\":true,\"versionStr\":\"1.0.3\"},\"116\":{\"summary\":\"jQuery Core as required by ProcessWire Admin and plugins\",\"href\":\"https:\\/\\/jquery.com\",\"core\":true,\"versionStr\":\"1.12.4\"},\"151\":{\"summary\":\"Provides lightbox capability for image galleries. Replacement for FancyBox. Uses Magnific Popup by @dimsemenov.\",\"href\":\"https:\\/\\/github.com\\/dimsemenov\\/Magnific-Popup\\/\",\"core\":true,\"versionStr\":\"1.1.0\"},\"103\":{\"summary\":\"Provides a jQuery plugin for sorting tables.\",\"href\":\"https:\\/\\/mottie.github.io\\/tablesorter\\/\",\"core\":true,\"versionStr\":\"2.31.3\"},\"117\":{\"summary\":\"jQuery UI as required by ProcessWire and plugins\",\"href\":\"https:\\/\\/ui.jquery.com\",\"core\":true,\"versionStr\":\"1.10.4\"},\"45\":{\"summary\":\"Provides a jQuery plugin for generating tabs in ProcessWire.\",\"core\":true,\"versionStr\":\"1.1.0\"},\"179\":{\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"core\":true,\"versionStr\":\"1.0.4\"},\"67\":{\"summary\":\"Generates markup for data tables used by ProcessWire admin\",\"core\":true,\"versionStr\":\"1.0.7\"},\"156\":{\"summary\":\"Front-end to the HTML Purifier library.\",\"core\":true,\"versionStr\":\"4.9.7\"},\"113\":{\"summary\":\"Adds renderPager() method to all PaginatedArray types, for easy pagination output. Plus a render() method to PageArray instances.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"98\":{\"summary\":\"Generates markup for pagination navigation\",\"core\":true,\"versionStr\":\"1.0.5\"},\"176\":{\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"114\":{\"summary\":\"Adds various permission methods to Page objects that are used by Process modules.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"115\":{\"summary\":\"Adds a render method to Page and caches page output.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"189\":{\"summary\":\"Manage comments in your site outside of the page editor.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.1.2\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"searchable\":\"comments\",\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"}},\"48\":{\"summary\":\"Edit individual fields that hold page data\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"fields\"},\"192\":{\"summary\":\"Provides password reset\\/email capability for the Login process.\",\"core\":true,\"versionStr\":\"1.0.4\"},\"87\":{\"summary\":\"Acts as a placeholder Process for the admin root. Ensures proper flow control after login.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"76\":{\"summary\":\"Lists the Process assigned to each child page of the current\",\"core\":true,\"versionStr\":\"1.0.1\"},\"167\":{\"summary\":\"View and manage system logs.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"}},\"10\":{\"summary\":\"Login to ProcessWire\",\"core\":true,\"versionStr\":\"1.0.9\"},\"50\":{\"summary\":\"List, edit or install\\/uninstall modules\",\"core\":true,\"versionStr\":\"1.2.1\"},\"17\":{\"summary\":\"Add a new page\",\"core\":true,\"versionStr\":\"1.0.9\"},\"190\":{\"summary\":\"Provides ability to clone\\/copy\\/duplicate pages in the admin. Adds a &quot;copy&quot; option to all applicable pages in the PageList.\",\"core\":true,\"versionStr\":\"1.0.6\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"7\":{\"summary\":\"Edit a Page\",\"core\":true,\"versionStr\":\"1.1.2\"},\"129\":{\"summary\":\"Provides image manipulation functions for image fields and rich text editors.\",\"core\":true,\"versionStr\":\"1.2.1\"},\"121\":{\"summary\":\"Provides a link capability as used by some Fieldtype modules (like rich text editors).\",\"core\":true,\"versionStr\":\"1.1.2\"},\"12\":{\"summary\":\"List pages in a hierarchical tree structure\",\"core\":true,\"versionStr\":\"1.2.4\"},\"150\":{\"summary\":\"Admin tool for finding and listing pages by any property.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.2.6\",\"permissions\":{\"page-lister\":\"Use Page Lister\"}},\"104\":{\"summary\":\"Provides a page search engine for admin use.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"191\":{\"summary\":\"Enables exporting and importing of pages. Development version, not yet recommended for production use.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.1\",\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"14\":{\"summary\":\"Handles page sorting and moving for PageList\",\"core\":true,\"versionStr\":\"1.0.1\"},\"109\":{\"summary\":\"Handles emptying of Page trash\",\"core\":true,\"versionStr\":\"1.0.3\"},\"134\":{\"summary\":\"List, Edit and Add pages of a specific type\",\"core\":true,\"versionStr\":\"1.0.1\"},\"83\":{\"summary\":\"All page views are routed through this Process\",\"core\":true,\"versionStr\":\"1.0.6\"},\"136\":{\"summary\":\"Manage system permissions\",\"core\":true,\"versionStr\":\"1.0.1\"},\"138\":{\"summary\":\"Enables user to change their password, email address and other settings that you define.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"165\":{\"summary\":\"Shows a list of recently edited pages in your admin.\",\"author\":\"Ryan Cramer\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"}},\"68\":{\"summary\":\"Manage user roles and what permissions are attached\",\"core\":true,\"versionStr\":\"1.0.4\"},\"47\":{\"summary\":\"List and edit the templates that control page output\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"templates\"},\"66\":{\"summary\":\"Manage system users\",\"core\":true,\"versionStr\":\"1.0.7\",\"searchable\":\"users\"},\"125\":{\"summary\":\"Throttles login attempts to help prevent dictionary attacks.\",\"core\":true,\"versionStr\":\"1.0.3\"},\"139\":{\"summary\":\"Manages system versions and upgrades.\",\"core\":true,\"versionStr\":\"0.2.0\"},\"61\":{\"summary\":\"Entity encode ampersands, quotes (single and double) and greater-than\\/less-than signs using htmlspecialchars(str, ENT_QUOTES). It is recommended that you use this on all text\\/textarea fields except those using a rich text editor or a markup language like Markdown.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"171\":{\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"core\":true,\"versionStr\":\"1.8.0\"},\"178\":{\"summary\":\"Validates and\\/or sanitizes uploaded SVG files.\",\"author\":\"Adrian and Ryan\",\"versionStr\":\"0.0.5\"},\"195\":{\"summary\":\"Makes children\\/subpages in PageList customizable so they can appear under multiple parents.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.2\"},\"177\":{\"summary\":\"Create a site profile that can be used for a fresh install of ProcessWire.\",\"versionStr\":\"5.0.1\",\"page\":{\"name\":\"export-site-profile\",\"parent\":\"setup\"}},\"183\":{\"summary\":\"A starting point module skeleton from which to build your own Process module.\",\"author\":\"rafaoski\",\"versionStr\":\"0.0.1\",\"permissions\":{\"profilehelper\":\"Run the profilehelper module\"},\"page\":{\"name\":\"profile-helper\",\"parent\":\"setup\",\"title\":\"Profile Helper Module\"}},\"184\":{\"summary\":\"Creates a copy of your site.\",\"author\":\"rafaoski\",\"versionStr\":\"0.0.1\",\"page\":{\"name\":\"helper-backup\",\"parent\":\"setup\",\"title\":\"Helper Backup\"}},\"186\":{\"summary\":\"Maintenance mode.\",\"author\":\"rafaoski\",\"versionStr\":\"0.0.1\"},\"185\":{\"summary\":\"This module uses the Embera Oembed library which supports +150 sites, such as Youtube, Twitter, Livestream, Dailymotion, Instagram, Vimeo and many many more.\",\"author\":\"rafaoski\",\"versionStr\":\"0.0.1\",\"page\":{\"name\":\"helper-oembed\",\"parent\":\"setup\",\"title\":\"Helper Oembed\"}},\"181\":{\"summary\":\"Adminer page for TracyDebugger.\",\"author\":\"Adrian Jones\",\"href\":\"https:\\/\\/processwire.com\\/talk\\/topic\\/12208-tracy-debugger\\/\",\"versionStr\":\"2.0.1\",\"page\":{\"name\":\"adminer\",\"parent\":\"setup\",\"title\":\"Adminer\"}},\"182\":{\"summary\":\"Adminer renderer for TracyDebugger.\",\"author\":\"Adrian Jones\",\"href\":\"https:\\/\\/processwire.com\\/talk\\/topic\\/12208-tracy-debugger\\/\",\"versionStr\":\"2.0.2\",\"page\":{\"name\":\"adminer-renderer\",\"parent\":\"setup\",\"title\":\"Adminer Renderer\",\"status\":\"hidden\"}}}', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', '.ModulesUninstalled.info', '8192', '{\"AdminThemeReno\":{\"name\":\"AdminThemeReno\",\"title\":\"Reno\",\"version\":17,\"versionStr\":\"0.1.7\",\"author\":\"Tom Reno (Renobird)\",\"summary\":\"Admin theme for ProcessWire 2.5+ by Tom Reno (Renobird)\",\"requiresVersions\":{\"AdminThemeDefault\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"AdminThemeUikit\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":34,\"versionStr\":\"0.3.4\",\"summary\":\"Uikit v3 admin theme\",\"autoload\":\"template=admin\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"FieldtypeCache\":{\"name\":\"FieldtypeCache\",\"title\":\"Cache\",\"version\":102,\"versionStr\":\"1.0.2\",\"summary\":\"Caches the values of other fields for fewer runtime queries. Can also be used to combine multiple text fields and have them all be searchable under the cached field name.\",\"created\":1720714558,\"installed\":false,\"core\":true},\"CommentFilterAkismet\":{\"name\":\"CommentFilterAkismet\",\"title\":\"Comment Filter: Akismet\",\"version\":200,\"versionStr\":\"2.0.0\",\"summary\":\"Uses the Akismet service to identify comment spam. Module plugin for the Comments Fieldtype.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeComments\":{\"name\":\"FieldtypeComments\",\"title\":\"Comments\",\"version\":110,\"versionStr\":\"1.1.0\",\"summary\":\"Field that stores user posted comments for a single Page\",\"installs\":[\"InputfieldCommentsAdmin\"],\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldCommentsAdmin\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Comments Admin\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides an administrative interface for working with comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeDecimal\":{\"name\":\"FieldtypeDecimal\",\"title\":\"Decimal\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Field that stores a decimal number\",\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeOptions\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"versionStr\":\"0.0.2\",\"summary\":\"Field that stores single and multi select options.\",\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypePageTable\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"A fieldtype containing a group of editable pages.\",\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeFieldsetPage\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Page)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Fieldset with fields isolated to separate namespace (page), enabling re-use of fields.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeRepeater\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":113,\"versionStr\":\"1.1.3\",\"summary\":\"Maintains a collection of fields that are repeated for any number of times.\",\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"InputfieldRepeater\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":111,\"versionStr\":\"1.1.1\",\"summary\":\"Repeats fields from another template. Provides the input for FieldtypeRepeater.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeSelector\":{\"name\":\"FieldtypeSelector\",\"title\":\"Selector\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Avoine + ProcessWire\",\"summary\":\"Build a page finding selector visually.\",\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeToggle\":{\"name\":\"FieldtypeToggle\",\"title\":\"Toggle (Yes\\/No)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Configurable yes\\/no, on\\/off toggle alternative to a checkbox, plus optional \\u201cother\\u201d option.\",\"requiresVersions\":{\"InputfieldToggle\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"FileCompilerTags\":{\"name\":\"FileCompilerTags\",\"title\":\"Tags File Compiler\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables {var} or {var.property} variables in markup sections of a file. Can be used with any API variable.\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"ImageSizerEngineAnimatedGif\":{\"name\":\"ImageSizerEngineAnimatedGif\",\"title\":\"Animated GIF Image Sizer\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations for animated GIFs.\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"ImageSizerEngineIMagick\":{\"name\":\"ImageSizerEngineIMagick\",\"title\":\"IMagick Image Sizer\",\"version\":3,\"versionStr\":\"0.0.3\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations to use PHP\'s ImageMagick library when possible.\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"InputfieldCKEditor\":{\"name\":\"InputfieldCKEditor\",\"title\":\"CKEditor\",\"version\":172,\"versionStr\":\"1.7.2\",\"summary\":\"CKEditor textarea rich text editor.\",\"installs\":[\"MarkupHTMLPurifier\"],\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldIcon\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"versionStr\":\"0.0.3\",\"summary\":\"Select an icon\",\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldPageAutocomplete\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Page Auto Complete\",\"version\":113,\"versionStr\":\"1.1.3\",\"summary\":\"Multiple Page selection using auto completion and sorting capability. Intended for use as an input field for Page reference fields.\",\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldPageTable\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"versionStr\":\"0.1.4\",\"summary\":\"Inputfield to accompany FieldtypePageTable\",\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldTextTags\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text Tags\",\"version\":7,\"versionStr\":\"0.0.7\",\"summary\":\"Enables input of user entered tags or selection of predefined tags.\",\"icon\":\"tags\",\"created\":1720714558,\"installed\":false,\"core\":true},\"InputfieldToggle\":{\"name\":\"InputfieldToggle\",\"title\":\"Toggle\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"A toggle providing similar input capability to a checkbox but much more configurable.\",\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypePageTitleLanguage\":{\"name\":\"FieldtypePageTitleLanguage\",\"title\":\"Page Title (Multi-Language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"author\":\"Ryan Cramer\",\"summary\":\"Field that stores a page title in multiple languages. Use this only if you want title inputs created for ALL languages on ALL pages. Otherwise create separate languaged-named title fields, i.e. title_fr, title_es, title_fi, etc. \",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0],\"FieldtypeTextLanguage\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeTextareaLanguage\":{\"name\":\"FieldtypeTextareaLanguage\",\"title\":\"Textarea (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a multiple lines of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"FieldtypeTextLanguage\":{\"name\":\"FieldtypeTextLanguage\",\"title\":\"Text (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a single line of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"LanguageSupport\":{\"name\":\"LanguageSupport\",\"title\":\"Languages Support\",\"version\":104,\"versionStr\":\"1.0.4\",\"author\":\"Ryan Cramer\",\"summary\":\"ProcessWire multi-language support.\",\"installs\":[\"ProcessLanguage\",\"ProcessLanguageTranslator\"],\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true,\"addFlag\":32},\"LanguageSupportFields\":{\"name\":\"LanguageSupportFields\",\"title\":\"Languages Support - Fields\",\"version\":101,\"versionStr\":\"1.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language fields.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"installs\":[\"FieldtypePageTitleLanguage\",\"FieldtypeTextareaLanguage\",\"FieldtypeTextLanguage\"],\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"core\":true},\"LanguageSupportPageNames\":{\"name\":\"LanguageSupportPageNames\",\"title\":\"Languages Support - Page Names\",\"version\":14,\"versionStr\":\"0.1.4\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language page names.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0],\"LanguageSupportFields\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"LanguageTabs\":{\"name\":\"LanguageTabs\",\"title\":\"Languages Support - Tabs\",\"version\":117,\"versionStr\":\"1.1.7\",\"author\":\"adamspruijt, ryan, flipzoom\",\"summary\":\"Organizes multi-language fields into tabs for a cleaner easier to use interface.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessLanguage\":{\"name\":\"ProcessLanguage\",\"title\":\"Languages\",\"version\":103,\"versionStr\":\"1.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Manage system languages\",\"icon\":\"language\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"permissions\":{\"lang-edit\":\"Administer languages and static translation files\"},\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true,\"useNavJSON\":true},\"ProcessLanguageTranslator\":{\"name\":\"ProcessLanguageTranslator\",\"title\":\"Language Translator\",\"version\":103,\"versionStr\":\"1.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Provides language translation capabilities for ProcessWire core and modules.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"LazyCron\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"core\":true},\"MarkupCache\":{\"name\":\"MarkupCache\",\"title\":\"Markup Cache\",\"version\":101,\"versionStr\":\"1.0.1\",\"summary\":\"A simple way to cache segments of markup in your templates. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/markupcache\\/\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"MarkupPageFields\":{\"name\":\"MarkupPageFields\",\"title\":\"Markup Page Fields\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Adds $page->renderFields() and $page->images->render() methods that return basic markup for output during development and debugging.\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"core\":true,\"permanent\":true},\"MarkupRSS\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":105,\"versionStr\":\"1.0.5\",\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"icon\":\"rss-square\",\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"PageFrontEdit\":{\"name\":\"PageFrontEdit\",\"title\":\"Front-End Page Editor\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables front-end editing of page fields.\",\"icon\":\"cube\",\"permissions\":{\"page-edit-front\":\"Use the front-end page editor\"},\"autoload\":true,\"created\":1720714558,\"installed\":false,\"configurable\":\"PageFrontEditConfig.php\",\"core\":true,\"license\":\"MPL 2.0\"},\"PagePathHistory\":{\"name\":\"PagePathHistory\",\"title\":\"Page Path History\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"Keeps track of past URLs where pages have lived and automatically redirects (301 permanent) to the new location whenever the past URL is accessed.\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"PagePaths\":{\"name\":\"PagePaths\",\"title\":\"Page Paths\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Enables page paths\\/urls to be queryable by selectors. Also offers potential for improved load performance. Builds an index at install (may take time on a large site).\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"PagesVersions\":{\"name\":\"PagesVersions\",\"title\":\"Pages Versions\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Provides a version control API for pages in ProcessWire.\",\"icon\":\"code-fork\",\"autoload\":true,\"singular\":true,\"created\":1720714558,\"installed\":false,\"core\":true},\"ProcessCommentsManager\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Comments\",\"version\":12,\"versionStr\":\"0.1.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Manage comments in your site outside of the page editor.\",\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"created\":1720714558,\"installed\":false,\"searchable\":\"comments\",\"core\":true,\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"},\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Approved\"},{\"url\":\"?go=pending\",\"label\":\"Pending\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"All\"}]},\"ProcessForgotPassword\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Forgot Password\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides password reset\\/email capability for the Login process.\",\"permission\":\"page-view\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessLogger\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"View and manage system logs.\",\"icon\":\"tree\",\"permission\":\"logs-view\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"created\":1720714558,\"installed\":false,\"core\":true,\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"},\"useNavJSON\":true},\"ProcessPageClone\":{\"name\":\"ProcessPageClone\",\"title\":\"Page Clone\",\"version\":106,\"versionStr\":\"1.0.6\",\"summary\":\"Provides ability to clone\\/copy\\/duplicate pages in the admin. Adds a &quot;copy&quot; option to all applicable pages in the PageList.\",\"permission\":\"page-clone\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"autoload\":\"template=admin\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true,\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"ProcessPagesExportImport\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Enables exporting and importing of pages. Development version, not yet recommended for production use.\",\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"created\":1720714558,\"installed\":false,\"core\":true,\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"ProcessRecentPages\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Shows a list of recently edited pages in your admin.\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"created\":1720714558,\"installed\":false,\"core\":true,\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"},\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"ProcessSessionDB\":{\"name\":\"ProcessSessionDB\",\"title\":\"Sessions\",\"version\":5,\"versionStr\":\"0.0.5\",\"summary\":\"Enables you to browse active database sessions.\",\"icon\":\"dashboard\",\"requiresVersions\":{\"SessionHandlerDB\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true,\"page\":{\"name\":\"sessions-db\",\"parent\":\"access\",\"title\":\"Sessions\"}},\"SessionHandlerDB\":{\"name\":\"SessionHandlerDB\",\"title\":\"Session Handler Database\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Installing this module makes ProcessWire store sessions in the database rather than the file system. Note that this module will log you out after install or uninstall.\",\"installs\":[\"ProcessSessionDB\"],\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeNotifications\":{\"name\":\"FieldtypeNotifications\",\"title\":\"Notifications\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Field that stores user notifications.\",\"requiresVersions\":{\"SystemNotifications\":[\">=\",0]},\"created\":1720714558,\"installed\":false,\"core\":true},\"SystemNotifications\":{\"name\":\"SystemNotifications\",\"title\":\"System Notifications\",\"version\":12,\"versionStr\":\"0.1.2\",\"summary\":\"Adds support for notifications in ProcessWire (currently in development)\",\"icon\":\"bell\",\"installs\":[\"FieldtypeNotifications\"],\"autoload\":true,\"created\":1720714558,\"installed\":false,\"configurable\":\"SystemNotificationsConfig.php\",\"core\":true},\"TextformatterMarkdownExtra\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"versionStr\":\"1.8.0\",\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true},\"TextformatterNewlineBR\":{\"name\":\"TextformatterNewlineBR\",\"title\":\"Newlines to XHTML Line Breaks\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to XHTML line break <br \\/> tags. \",\"created\":1720714558,\"installed\":false,\"core\":true},\"TextformatterNewlineUL\":{\"name\":\"TextformatterNewlineUL\",\"title\":\"Newlines to Unordered List\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to <li> list items and surrounds in an <ul> unordered list. \",\"created\":1720714558,\"installed\":false,\"core\":true},\"TextformatterPstripper\":{\"name\":\"TextformatterPstripper\",\"title\":\"Paragraph Stripper\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips paragraph <p> tags that may have been applied by other text formatters before it. \",\"created\":1720714558,\"installed\":false,\"core\":true},\"TextformatterSmartypants\":{\"name\":\"TextformatterSmartypants\",\"title\":\"SmartyPants Typographer\",\"version\":171,\"versionStr\":\"1.7.1\",\"summary\":\"Smart typography for web sites, by Michel Fortin based on SmartyPants by John Gruber. If combined with Markdown, it should be applied AFTER Markdown.\",\"created\":1720714558,\"installed\":false,\"configurable\":4,\"core\":true,\"url\":\"https:\\/\\/github.com\\/michelf\\/php-smartypants\"},\"TextformatterStripTags\":{\"name\":\"TextformatterStripTags\",\"title\":\"Strip Markup Tags\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips HTML\\/XHTML Markup Tags\",\"created\":1720714558,\"installed\":false,\"configurable\":3,\"core\":true},\"HelperBackup\":{\"name\":\"HelperBackup\",\"title\":\"Helper site Backup\",\"version\":\"1\",\"versionStr\":\"0.0.1\",\"author\":\"rafaoski\",\"summary\":\"Creates a copy of your site.\",\"icon\":\"database\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0],\"LazyCron\":[\">=\",0]},\"autoload\":true,\"created\":1720936778,\"installed\":false,\"configurable\":4,\"page\":{\"name\":\"helper-backup\",\"parent\":\"setup\",\"title\":\"Helper Backup\"}},\"HelperFunctions\":{\"name\":\"HelperFunctions\",\"title\":\"Helper Functions\",\"version\":\"1\",\"versionStr\":\"0.0.1\",\"author\":\"rafaoski\",\"summary\":\"Custom functions.\",\"icon\":\"code\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0]},\"autoload\":true,\"created\":1720946281,\"installed\":false,\"configurable\":4},\"HelperMaintenance\":{\"name\":\"HelperMaintenance\",\"title\":\"Helper Maintenance\",\"version\":\"1\",\"versionStr\":\"0.0.1\",\"author\":\"rafaoski\",\"summary\":\"Maintenance mode.\",\"icon\":\"lock\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0]},\"autoload\":true,\"created\":1720936778,\"installed\":false,\"configurable\":4},\"HelperOembed\":{\"name\":\"HelperOembed\",\"title\":\"Helper Oembed\",\"version\":\"1\",\"versionStr\":\"0.0.1\",\"author\":\"rafaoski\",\"summary\":\"This module uses the Embera Oembed library which supports +150 sites, such as Youtube, Twitter, Livestream, Dailymotion, Instagram, Vimeo and many many more.\",\"icon\":\"file-code-o\",\"requiresVersions\":{\"ProcessProfileHelper\":[\">=\",0]},\"autoload\":true,\"created\":1720936778,\"installed\":false,\"configurable\":4,\"page\":{\"name\":\"helper-oembed\",\"parent\":\"setup\",\"title\":\"Helper Oembed\"}},\"ProcessProfileHelper\":{\"name\":\"ProcessProfileHelper\",\"title\":\"Profile Helper Module, based on ProcessHello module\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"rafaoski\",\"summary\":\"A starting point module skeleton from which to build your own Process module.\",\"icon\":\"thumbs-up\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.164\"]},\"installs\":[\"HelperBackup\",\"HelperOembed\",\"HelperMaintenance\",\"HelperFunctions\"],\"permission\":\"profilehelper\",\"permissions\":{\"profilehelper\":\"Run the profilehelper module\"},\"autoload\":true,\"created\":1720936778,\"installed\":false,\"configurable\":4,\"page\":{\"name\":\"profile-helper\",\"parent\":\"setup\",\"title\":\"Profile Helper Module\"},\"nav\":[{\"url\":\"\",\"label\":\"Hello\",\"icon\":\"smile-o\"},{\"url\":\"something\\/\",\"label\":\"Something\",\"icon\":\"beer\"},{\"url\":\"something-else\\/\",\"label\":\"Something Else\",\"icon\":\"glass\"},{\"url\":\"form\\/\",\"label\":\"Simple form\",\"icon\":\"building\"}]},\"LoginRegister\":{\"name\":\"LoginRegister\",\"title\":\"Login\\/Register\",\"version\":2,\"versionStr\":\"0.0.2\",\"summary\":\"Login or register for an account in ProcessWire\",\"icon\":\"user-plus\",\"created\":1722538928,\"installed\":false,\"configurable\":4}}', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('164', '.ModulesVersions.info', '8192', '[]', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('165', 'ProcessRecentPages', '1', '', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('166', 'AdminThemeUikit', '10', '', '2024-07-14 07:23:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('167', 'ProcessLogger', '1', '', '2024-07-14 07:23:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('168', 'InputfieldIcon', '0', '', '2024-07-14 07:23:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'InputfieldPageAutocomplete', '0', '', '2024-07-14 07:23:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'InputfieldTextTags', '0', '', '2024-07-14 07:23:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('171', 'TextformatterMarkdownExtra', '1', '', '2024-07-14 07:35:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('172', 'InputfieldToggle', '0', '', '2024-07-14 07:36:10');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('173', 'FieldtypeRepeater', '3', '{\"repeatersRootPageID\":1015}', '2024-07-14 07:38:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('174', 'InputfieldRepeater', '0', '', '2024-07-14 07:38:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('175', 'FieldtypeFieldsetPage', '35', '{\"repeatersRootPageID\":1015}', '2024-07-14 07:38:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('176', 'MarkupRSS', '0', '{\"title\":\"Untitled RSS Feed\",\"url\":\"\",\"description\":\"\",\"xsl\":\"\",\"css\":\"\",\"copyright\":\"\",\"itemTitleField\":\"title\",\"itemDateField\":\"created\",\"itemDescriptionField\":\"\",\"itemDescriptionLength\":1024,\"itemContentField\":\"\",\"ttl\":60}', '2024-07-14 07:38:56');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('178', 'FileValidatorSvgSanitizer', '0', '{\"removeRemoteReferences\":1,\"minify\":\"\",\"customTags\":\"\",\"customAttrs\":\"\"}', '2024-07-14 13:01:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('179', 'LazyCron', '3', '', '2024-07-14 17:13:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('190', 'ProcessPageClone', '11', '{\"alwaysUseForm\":1}', '2024-07-21 23:03:35');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('180', 'TracyDebugger', '3', '{\"enabled\":1,\"use_php_session\":\"\",\"superuserForceDevelopment\":\"\",\"guestForceDevelopmentLocal\":\"\",\"forceIsLocal\":\"\",\"recordGuestDumps\":false,\"ipAddress\":\"\",\"restrictSuperusers\":\"\",\"strictMode\":\"\",\"strictModeAjax\":\"\",\"forceScream\":\"\",\"outputMode\":\"detect\",\"showLocation\":[\"Tracy\\\\Dumper::LOCATION_SOURCE\",\"Tracy\\\\Dumper::LOCATION_LINK\",\"Tracy\\\\Dumper::LOCATION_CLASS\"],\"logSeverity\":[],\"excludedPwLogFiles\":[\"session\",\"modules\",\"file-compiler\"],\"excludedTracyLogFiles\":[],\"numLogEntries\":10,\"collapse\":14,\"collapse_count\":7,\"maxDepth\":3,\"maxLength\":150,\"maxItems\":100,\"maxAjaxRows\":3,\"showDebugBar\":[\"frontend\",\"backend\"],\"hideDebugBar\":\"\",\"hideDebugBarFrontendTemplates\":[],\"hideDebugBarBackendTemplates\":[],\"hideDebugBarModals\":[],\"frontendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"tracyExceptions\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"backendPanels\":[\"processwireInfo\",\"requestInfo\",\"processwireLogs\",\"tracyLogs\",\"tracyExceptions\",\"methodsInfo\",\"debugMode\",\"console\",\"panelSelector\",\"tracyToggler\"],\"restrictedUserDisabledPanels\":[],\"nonToggleablePanels\":[],\"panelSelectorTracyTogglerButton\":1,\"showUserBar\":\"\",\"showUserBarTracyUsers\":null,\"userBarFeatures\":[\"admin\",\"editPage\"],\"userBarCustomFeatures\":\"\",\"userBarBackgroundColor\":null,\"userBarBackgroundOpacity\":\"1\",\"userBarIconColor\":\"#666666\",\"userBarTopBottom\":\"bottom\",\"userBarLeftRight\":\"left\",\"showPanelLabels\":\"\",\"barPosition\":\"bottom-right\",\"panelZindex\":100,\"styleWhere\":[\"backend\",\"frontend\"],\"styleAdminElements\":\"body::before {\\n\\tcontent: \\\"[type]\\\";\\n\\tbackground: [color];\\n\\tposition: fixed;\\n\\tleft: 0;\\n\\tbottom: 100%;\\n\\tcolor: #ffffff;\\n\\twidth: 100vh;\\n\\tpadding: 0;\\n\\ttext-align: center;\\n\\tfont-weight: 600;\\n\\ttext-transform: uppercase;\\n\\ttransform: rotate(90deg);\\n\\ttransform-origin: bottom left;\\n\\tz-index: 999999;\\n\\tfont-family: sans-serif;\\n\\tfont-size: 11px;\\n\\theight: 13px;\\n\\tline-height: 13px;\\npointer-events: none;\\n}\",\"styleAdminColors\":\"local|#FF9933\\n*.local|#FF9933\\ndev.*|#FF9933\\n*.test|#FF9933\\nstaging.*|#8b0066\\n*.com|#009900\",\"styleAdminType\":[\"favicon\"],\"showPWInfoPanelIconLabels\":1,\"linksNewTab\":\"\",\"pWInfoPanelLinksNewTab\":\"\",\"customPWInfoPanelLinks\":[\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"],\"adminerEditFieldLink\":1,\"adminerStandAlone\":\"\",\"adminerThemeColor\":\"blue\",\"adminerJsonMaxLevel\":\"3\",\"adminerJsonInTable\":1,\"adminerJsonInEdit\":1,\"adminerJsonMaxTextLength\":\"200\",\"captainHookShowDescription\":1,\"captainHookToggleDocComment\":\"\",\"apiExplorerShowDescription\":1,\"apiExplorerToggleDocComment\":\"\",\"apiExplorerModuleClasses\":[],\"requestInfoPanelSections\":[\"moduleSettings\",\"templateSettings\",\"fieldSettings\",\"pageInfo\",\"redirectInfo\",\"pagePermissions\",\"languageInfo\",\"templateInfo\",\"pageMeta\",\"fieldsListValues\",\"serverRequest\",\"inputGet\",\"inputPost\",\"inputCookie\",\"session\",\"editLinks\"],\"processwireInfoPanelSections\":[\"versionsList\",\"adminLinks\",\"documentationLinks\",\"gotoId\",\"processWireWebsiteSearch\"],\"debugModePanelSections\":[\"pagesLoaded\",\"modulesLoaded\",\"hooks\",\"databaseQueries\",\"selectorQueries\",\"timers\",\"user\",\"cache\",\"autoload\"],\"diagnosticsPanelSections\":[\"filesystemFolders\"],\"dumpPanelTabs\":[\"debugInfo\",\"fullObject\"],\"requestMethods\":[\"GET\",\"POST\",\"PUT\",\"DELETE\",\"PATCH\"],\"requestLoggerMaxLogs\":10,\"requestLoggerReturnType\":\"array\",\"imagesInFieldListValues\":\"\",\"snippetsPath\":\"templates\",\"consoleBackupLimit\":25,\"consoleCodePrefix\":\"\",\"userSwitcherSelector\":\"\",\"userSwitcherRestricted\":[],\"userSwitcherIncluded\":[],\"todoIgnoreDirs\":\"git, svn, images, img, errors, sass-cache, node_modules\",\"todoScanModules\":\"\",\"todoScanAssets\":\"\",\"todoAllowedExtensions\":\"php, module, inc, txt, latte, html, htm, md, css, scss, less, js\",\"variablesShowPwObjects\":\"\",\"alwaysShowDebugTools\":1,\"respectConfigDebugTools\":null,\"userDevTemplate\":\"\",\"userDevTemplateSuffix\":\"dev\",\"customPhpCode\":\"\",\"linksCode\":\"\",\"fromEmail\":\"\",\"email\":\"\",\"clearEmailSent\":\"\",\"slackChannel\":\"\",\"slackAppOauthToken\":\"\",\"showFireLogger\":1,\"reservedMemorySize\":500000,\"referencePageEdited\":1,\"debugInfo\":1,\"editor\":\"vscode:\\/\\/file\\/%file:%line\",\"useOnlineEditor\":[],\"onlineEditor\":\"tracy\",\"forceEditorLinksToTracy\":1,\"localRootPath\":\"\",\"aceTheme\":\"tomorrow_night_bright\",\"codeFontSize\":14,\"codeLineHeight\":24,\"codeShowInvisibles\":\"1\",\"codeTabSize\":4,\"codeUseSoftTabs\":\"1\",\"codeShowDescription\":1,\"customSnippetsUrl\":\"\",\"pwAutocompletions\":1,\"fileEditorAllowedExtensions\":\"php, module, js, css, txt, log, htaccess\",\"fileEditorExcludedDirs\":\"site\\/assets\",\"fileEditorBaseDirectory\":\"templates\",\"enableShortcutMethods\":1,\"enabledShortcutMethods\":[\"addBreakpoint\",\"bp\",\"barDump\",\"bd\",\"barEcho\",\"be\",\"barDumpBig\",\"bdb\",\"debugAll\",\"da\",\"dump\",\"d\",\"dumpBig\",\"db\",\"l\",\"templateVars\",\"tv\",\"timer\",\"t\"]}', '2024-07-15 19:23:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('181', 'ProcessTracyAdminer', '1', '', '2024-07-15 19:23:56');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('182', 'ProcessTracyAdminerRenderer', '1', '', '2024-07-15 19:23:56');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('183', 'ProcessProfileHelper', '3', '', '2024-07-21 19:42:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('184', 'HelperBackup', '3', '', '2024-07-21 19:42:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('185', 'HelperOembed', '3', '{\"instagram_access_token\":\"Instagram Access Token\",\"facebook_access_token\":\"Facebook Access Token\",\"profiles_img_page_id\":\"1119\",\"duration\":\"21600\",\"clearCache\":\"\"}', '2024-07-21 19:42:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('186', 'HelperMaintenance', '3', '{\"maintenance_mode\":\"\",\"maintenance_mode_user_message\":\"\",\"send_form_HelperMaintenance\":\"1\"}', '2024-07-21 19:42:29');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('187', 'FieldtypeComments', '1', '', '2024-07-21 19:43:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('188', 'InputfieldCommentsAdmin', '0', '', '2024-07-21 19:43:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('189', 'ProcessCommentsManager', '1', '', '2024-07-21 19:44:41');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('191', 'ProcessPagesExportImport', '1', '', '2024-07-21 23:17:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('192', 'ProcessForgotPassword', '1', '{\"emailFrom\":\"\",\"askEmail\":\"\",\"maxPerIP\":3,\"useLog\":1,\"confirmFields\":[\"email:92\"],\"allowRoles\":[],\"blockRoles\":[]}', '2024-07-21 23:17:42');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('193', 'FieldtypePageTable', '3', '', '2024-07-23 11:39:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('194', 'InputfieldPageTable', '0', '', '2024-07-23 11:39:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('195', 'PageListCustomChildren', '10', '{\"definitions\":\"template=category >> parent=\\/blog, categories=page.id\"}', '2024-07-24 22:57:12');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('196', 'LoginRegister', '0', '{\"features\":[\"login\",\"register\",\"profile\",\"login-email\",\"forgot\"],\"registerFields\":[\"email\",\"pass\"],\"profileFields\":[\"pass\",\"email\"],\"registerRoles\":[\"login-register:1122\"]}', '2024-08-01 21:02:13');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `templates_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1193 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2024-08-06 11:57:40', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'proc', '1035', '2024-07-25 08:31:10', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2024-07-14 07:23:21', '40', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2024-07-14 07:23:23', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2024-07-14 07:23:22', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '29', 'http404', '1035', '2024-08-03 14:06:41', '41', '2024-07-14 07:22:55', '3', '2024-07-14 07:22:55', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'test', '1', '2024-07-21 20:42:50', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '41', '2024-07-14 07:22:55', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2024-07-14 07:22:55', '40', '2024-07-14 07:22:55', '40', '2024-07-14 07:22:55', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2024-07-14 07:22:55', '40', '2024-07-14 07:22:55', '40', '2024-07-14 07:22:55', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '3', '2', 'recent-pages', '1', '2024-07-14 07:23:13', '40', '2024-07-14 07:23:13', '40', '2024-07-14 07:23:13', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '31', '5', 'page-edit-recent', '1', '2024-07-14 07:23:13', '40', '2024-07-14 07:23:13', '40', '2024-07-14 07:23:13', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '22', '2', 'logs', '1', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-view', '1', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '31', '5', 'logs-edit', '1', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '40', '2024-07-14 07:23:17', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1015', '2', '2', 'repeaters', '1036', '2024-07-14 07:38:31', '41', '2024-07-14 07:38:31', '41', '2024-07-14 07:38:31', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1016', '1015', '2', 'for-field-104', '17', '2024-07-14 07:41:49', '41', '2024-07-14 07:41:49', '41', '2024-07-14 07:41:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1017', '1015', '2', 'for-field-105', '17', '2024-07-14 07:42:44', '41', '2024-07-14 07:42:44', '41', '2024-07-14 07:42:44', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1018', '1017', '44', 'for-page-1', '1', '2024-08-06 11:57:40', '41', '2024-07-14 07:45:00', '41', '2024-07-14 07:45:00', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1019', '1016', '43', 'for-page-1', '1', '2024-08-06 11:57:40', '41', '2024-07-14 11:29:54', '41', '2024-07-14 11:29:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1020', '1', '29', 'about', '1', '2024-08-03 14:03:13', '41', '2024-07-14 12:42:23', '41', '2024-07-14 12:42:25', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1021', '1016', '43', 'for-page-1020', '1', '2024-08-03 14:03:13', '41', '2024-07-14 12:42:23', '41', '2024-07-14 12:42:25', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1022', '1', '45', 'contact', '1', '2024-08-03 14:04:07', '41', '2024-07-14 12:46:17', '41', '2024-07-14 12:46:19', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1023', '1016', '43', 'for-page-1022', '1', '2024-08-03 14:04:07', '41', '2024-07-14 12:46:17', '41', '2024-07-14 12:46:19', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1025', '1016', '43', 'for-page-27', '1025', '2024-08-03 14:06:41', '41', '2024-07-14 15:01:43', '40', '2024-07-14 15:01:43', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1026', '1015', '2', 'for-field-106', '17', '2024-07-18 12:39:54', '41', '2024-07-14 21:57:04', '41', '2024-07-14 21:57:04', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1027', '1026', '2', 'for-page-1018', '17', '2024-07-14 22:09:19', '41', '2024-07-14 22:09:19', '41', '2024-07-14 22:09:19', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1028', '1027', '47', '1720987764-3657-1', '1', '2024-07-15 08:13:19', '41', '2024-07-14 22:09:24', '41', '2024-07-14 23:20:15', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1029', '2', '49', 'advanced-options', '1029', '2024-07-25 00:31:20', '41', '2024-07-14 22:14:46', '41', '2024-07-14 22:14:46', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1030', '1029', '48', 'ga_code', '1025', '2024-07-25 00:29:58', '41', '2024-07-14 22:18:26', '41', '2024-07-14 22:18:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1031', '1029', '48', 'gv_code', '1025', '2024-07-25 00:30:01', '41', '2024-07-14 22:24:16', '41', '2024-07-14 22:24:16', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1032', '2', '49', 's_prof', '1029', '2024-07-25 00:31:28', '41', '2024-07-14 23:33:16', '41', '2024-07-14 23:33:18', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1033', '1032', '50', 'x', '1025', '2024-07-25 09:35:08', '41', '2024-07-14 23:35:39', '41', '2024-07-14 23:35:41', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1034', '1032', '50', 'facebook', '1025', '2024-07-25 09:35:12', '41', '2024-07-14 23:35:50', '41', '2024-07-14 23:35:53', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1035', '1032', '50', 'youtube', '1025', '2024-07-25 09:35:15', '41', '2024-07-14 23:36:15', '41', '2024-07-14 23:36:15', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1036', '1032', '50', 'tiktok', '1025', '2024-07-25 09:35:18', '41', '2024-07-14 23:36:53', '41', '2024-07-14 23:36:55', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1038', '1015', '2', 'for-field-112', '17', '2024-07-18 14:32:09', '41', '2024-07-15 08:40:13', '41', '2024-07-15 08:40:13', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '1016', '43', 'for-page-1051', '1025', '2024-08-03 14:06:30', '41', '2024-07-16 00:52:59', '41', '2024-07-16 00:53:03', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1041', '22', '2', 'adminer', '1', '2024-07-15 19:23:56', '41', '2024-07-15 19:23:56', '41', '2024-07-15 19:23:56', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1042', '22', '2', 'adminer-renderer', '1024', '2024-07-15 19:23:56', '41', '2024-07-15 19:23:56', '41', '2024-07-15 19:23:56', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1053', '1038', '52', 'for-page-1018', '1', '2024-08-06 11:57:40', '41', '2024-07-18 14:32:58', '41', '2024-07-18 14:32:58', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1103', '1016', '43', 'for-page-1102', '1', '2024-07-25 15:58:57', '41', '2024-07-21 23:04:07', '41', '2024-07-21 23:04:11', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1102', '1085', '53', 'the-benefits-of-using-processwire-cms', '1', '2024-07-25 15:58:57', '41', '2024-07-21 23:04:06', '41', '2024-07-21 23:04:11', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1100', '31', '5', 'page-clone', '1', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1101', '31', '5', 'page-clone-tree', '1', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1051', '1', '29', 'personal-data', '1029', '2024-08-03 14:06:30', '41', '2024-07-16 00:52:59', '41', '2024-07-16 00:53:03', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1099', '3', '2', 'clone', '1024', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '41', '2024-07-21 23:03:35', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1098', '31', '5', 'comments-manager', '1', '2024-07-21 19:44:41', '41', '2024-07-21 19:44:41', '41', '2024-07-21 19:44:41', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1097', '22', '2', 'comments', '1', '2024-07-21 19:44:41', '41', '2024-07-21 19:44:41', '41', '2024-07-21 19:44:41', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1096', '22', '2', 'helper-oembed', '1', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1095', '22', '2', 'helper-backup', '1', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1094', '31', '5', 'profilehelper', '1', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1093', '22', '2', 'profile-helper', '1', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '40', '2024-07-21 19:42:29', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1091', '1087', '56', 'cms', '1', '2024-07-21 18:49:26', '41', '2024-07-21 18:49:26', '41', '2024-07-21 18:49:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1092', '1016', '43', 'for-page-1091', '1', '2024-07-21 18:49:26', '41', '2024-07-21 18:49:26', '41', '2024-07-21 18:49:26', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1117', '1029', '60', 'd_cf', '1029', '2024-07-25 00:34:03', '41', '2024-07-25 00:26:49', '41', '2024-07-25 00:26:49', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1085', '1', '54', 'blog', '1', '2024-08-03 14:05:28', '41', '2024-07-21 18:46:06', '41', '2024-07-21 18:46:08', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1086', '1016', '43', 'for-page-1085', '1', '2024-08-03 14:05:28', '41', '2024-07-21 18:46:06', '41', '2024-07-21 18:46:08', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1087', '1', '55', 'categories', '1', '2024-08-03 14:05:50', '41', '2024-07-21 18:46:27', '41', '2024-07-21 18:46:29', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1088', '1016', '43', 'for-page-1087', '1', '2024-08-03 14:05:50', '41', '2024-07-21 18:46:27', '41', '2024-07-21 18:46:29', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1089', '1085', '53', 'boost-your-seo', '1', '2024-07-22 21:58:03', '41', '2024-07-21 18:46:48', '41', '2024-07-21 18:46:52', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1090', '1016', '43', 'for-page-1089', '1', '2024-07-22 21:58:03', '41', '2024-07-21 18:46:48', '41', '2024-07-21 18:46:52', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1104', '3', '2', 'export-import', '1', '2024-07-21 23:17:33', '41', '2024-07-21 23:17:33', '41', '2024-07-21 23:17:33', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1105', '1087', '56', 'seo', '1', '2024-07-22 21:57:58', '41', '2024-07-22 21:57:58', '41', '2024-07-22 21:57:58', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1106', '1016', '43', 'for-page-1105', '1', '2024-07-22 21:57:58', '41', '2024-07-22 21:57:58', '41', '2024-07-22 21:57:58', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1107', '1085', '53', 'exploring-processwire-cms', '0', '2024-07-26 19:02:09', '41', '2024-07-22 22:07:05', '41', '2024-07-25 12:22:36', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1108', '1016', '43', 'for-page-1107', '1', '2024-07-26 19:02:09', '41', '2024-07-22 22:07:05', '41', '2024-07-25 12:22:36', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1109', '1087', '56', 'processwire', '1', '2024-07-22 22:08:00', '41', '2024-07-22 22:08:00', '41', '2024-07-22 22:08:00', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1110', '1016', '43', 'for-page-1109', '1', '2024-07-22 22:08:00', '41', '2024-07-22 22:08:00', '41', '2024-07-22 22:08:00', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1111', '2', '49', 'blocks', '1029', '2024-07-25 00:31:33', '41', '2024-07-23 11:53:15', '41', '2024-07-23 11:53:17', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1113', '1111', '57', 'see-our-works', '1', '2024-08-04 09:38:19', '41', '2024-07-23 12:07:59', '41', '2024-07-23 12:08:25', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1118', '1029', '60', 'd_c', '1029', '2024-07-25 00:34:10', '41', '2024-07-25 00:29:38', '41', '2024-07-25 00:29:46', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1114', '1111', '58', 'first-content', '1', '2024-07-24 00:27:19', '41', '2024-07-24 00:27:16', '41', '2024-07-24 00:27:19', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1116', '1111', '58', 'processwire-has-released-a-new-plugin-wow-page-edit-children-is-here', '1', '2024-07-26 23:41:22', '41', '2024-07-24 23:27:21', '41', '2024-07-24 23:34:58', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1119', '2', '61', 'oembed-images', '1025', '2024-07-25 09:27:24', '41', '2024-07-25 08:29:35', '41', '2024-07-25 08:31:33', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1120', '1029', '48', 'copyright_info', '1025', '2024-07-25 09:58:23', '41', '2024-07-25 09:31:29', '41', '2024-07-25 09:31:31', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1122', '30', '4', 'login-register', '1', '2024-08-01 21:02:13', '41', '2024-08-01 21:02:13', '41', '2024-08-01 21:02:13', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1123', '1', '62', 'user-zone', '1029', '2024-08-06 11:57:21', '41', '2024-08-01 21:04:33', '41', '2024-08-01 21:04:36', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1186', '1027', '47', '1722664836-8543-1', '1', '2024-08-05 15:39:32', '41', '2024-08-03 08:00:36', '41', '2024-08-03 08:01:11', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1188', '1022', '46', 'example-alex-gmail.com-2024-08-03-08-18-23', '3072', '2024-08-03 22:12:16', '41', '2024-08-03 08:18:23', '40', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1190', '1032', '50', 'instagram', '1025', '2024-08-05 16:31:06', '41', '2024-08-05 16:30:52', '41', '2024-08-05 16:31:00', '4');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int NOT NULL,
  `templates_id` int NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2024-07-14 07:22:55');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2024-07-14 07:23:13');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2024-07-14 07:23:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1014', '2', '2024-07-14 07:23:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1018', '2', '2024-07-14 07:45:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1019', '2', '2024-07-14 11:29:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1021', '2', '2024-07-14 12:42:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1020', '1', '2024-07-14 12:42:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1023', '2', '2024-07-14 12:46:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1022', '1', '2024-07-14 12:46:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1025', '2', '2024-07-14 15:01:43');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1028', '2', '2024-07-14 22:09:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1029', '2', '2024-07-14 22:14:46');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1030', '2', '2024-07-14 22:18:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1031', '2', '2024-07-14 22:24:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1032', '2', '2024-07-14 23:33:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1033', '2', '2024-07-14 23:35:39');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1034', '2', '2024-07-14 23:35:50');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1035', '2', '2024-07-14 23:36:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1036', '2', '2024-07-14 23:36:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1051', '1', '2024-07-16 00:53:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1106', '2', '2024-07-22 21:57:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1053', '2', '2024-07-18 14:32:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1103', '2', '2024-07-21 23:04:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1102', '1', '2024-07-21 23:04:07');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '2', '2024-07-16 00:53:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1101', '2', '2024-07-21 23:03:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1100', '2', '2024-07-21 23:03:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1089', '1', '2024-07-21 18:46:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1090', '2', '2024-07-21 18:46:48');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1087', '1', '2024-07-21 18:46:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1088', '2', '2024-07-21 18:46:27');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1085', '1', '2024-07-21 18:46:06');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1086', '2', '2024-07-21 18:46:06');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1098', '2', '2024-07-21 19:44:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1094', '2', '2024-07-21 19:42:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1091', '1', '2024-07-21 18:49:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1092', '2', '2024-07-21 18:49:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1117', '2', '2024-07-25 00:26:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1105', '1', '2024-07-22 21:57:58');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1108', '2', '2024-07-22 22:07:05');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1107', '1', '2024-07-22 22:07:05');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1110', '2', '2024-07-22 22:08:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1109', '1', '2024-07-22 22:08:00');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1111', '2', '2024-07-23 11:53:15');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1116', '2', '2024-07-24 23:27:21');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1113', '2', '2024-07-24 00:27:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1114', '2', '2024-07-24 00:27:16');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1118', '2', '2024-07-25 00:29:38');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1119', '2', '2024-07-25 08:29:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1120', '2', '2024-07-25 09:31:29');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1122', '2', '2024-08-01 21:02:13');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1123', '1', '2024-08-01 21:04:33');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1188', '1', '2024-08-03 08:18:23');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1190', '2', '2024-08-05 16:30:52');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1186', '2', '2024-08-03 08:00:36');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int unsigned NOT NULL,
  `parents_id` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('7', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1015', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1016', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1016', '1015');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1017', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1017', '1015');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1026', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1026', '1015');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1027', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1027', '1015');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1027', '1026');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1029', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1032', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1038', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1038', '1015');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1111', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1113', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1113', '1111');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_sortfields` (`pages_id`, `sortfield`) VALUES('1022', '-created');
INSERT INTO `pages_sortfields` (`pages_id`, `sortfield`) VALUES('1085', '-created');

DROP TABLE IF EXISTS `process_forgot_password`;
CREATE TABLE `process_forgot_password` (
  `id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `token` char(32) NOT NULL,
  `ts` int unsigned NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `ts` (`ts`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int unsigned NOT NULL DEFAULT '0',
  `last_attempt` int unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `fieldgroups_id` int unsigned NOT NULL DEFAULT '0',
  `flags` int NOT NULL DEFAULT '0',
  `cache_time` mediumint NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1720714558,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"compile\":0,\"nameContentTab\":1,\"modified\":1721587362,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"noParents\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-home title\",\"compile\":0,\"modified\":1722938278,\"ns\":\"ProcessWire\",\"_lazy\":1,\"roles\":[37]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-book title\",\"compile\":0,\"modified\":1722937991,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('43', 'repeater_seo', '97', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"FieldsetPage\",\"pageLabelField\":\"for_page_path\",\"noGlobal\":1,\"compile\":3,\"modified\":1720935709}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('44', 'repeater_opt', '98', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"FieldsetPage\",\"pageLabelField\":\"for_page_path\",\"noGlobal\":1,\"compile\":3,\"modified\":1720935764}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('45', 'contact', '99', '0', '0', '{\"noParents\":-1,\"childTemplates\":[46],\"slashUrls\":1,\"pageLabelField\":\"fa-bullhorn title\",\"compile\":0,\"tags\":\"contact\",\"modified\":1722233100,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('46', 'contact-item', '100', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[45],\"slashUrls\":1,\"pageLabelField\":\"fa-user-circle title\",\"compile\":0,\"tags\":\"contact\",\"modified\":1721898412,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('47', 'repeater_friendlyLinks', '101', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"RepeaterPage\",\"noGlobal\":1,\"compile\":3,\"modified\":1721299194,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('48', '_optTxt', '102', '0', '0', '{\"parentTemplates\":[49],\"slashUrls\":1,\"pageLabelField\":\"fa-cog title\",\"compile\":0,\"tags\":\"options\",\"modified\":1721897616,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('49', '_opt', '103', '0', '0', '{\"parentTemplates\":[2],\"slashUrls\":1,\"pageLabelField\":\"fa-cogs title\",\"compile\":0,\"tags\":\"options\",\"modified\":1721897656,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('50', '_optSocial', '104', '0', '0', '{\"parentTemplates\":[49],\"slashUrls\":1,\"pageLabelField\":\"fa-cog title\",\"compile\":0,\"tags\":\"options\",\"modified\":1722868371,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'blog-post', '107', '0', '0', '{\"parentTemplates\":[54],\"allowPageNum\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-paw title\",\"compile\":0,\"tags\":\"blog\",\"modified\":1722664631,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'repeater_contactInfo', '106', '8', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageClass\":\"FieldsetPage\",\"pageLabelField\":\"for_page_path\",\"noGlobal\":1,\"compile\":3,\"modified\":1721305929,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'blog', '108', '0', '0', '{\"noParents\":-1,\"childTemplates\":[53],\"allowPageNum\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-coffee title\",\"compile\":0,\"tags\":\"blog\",\"modified\":1722688106,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'categories', '109', '0', '0', '{\"noParents\":-1,\"childTemplates\":[56],\"allowPageNum\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-hashtag title\",\"compile\":0,\"tags\":\"blog\",\"modified\":1721898261,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'category', '110', '0', '0', '{\"noChildren\":1,\"parentTemplates\":[55],\"allowPageNum\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-dot-circle-o title\",\"compile\":0,\"tags\":\"blog\",\"modified\":1722664535,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('57', '_blockImages', '111', '0', '0', '{\"parentTemplates\":[49],\"slashUrls\":1,\"pageLabelField\":\"fa-file-image-o title\",\"compile\":0,\"label\":\"Block images\",\"tags\":\"block\",\"modified\":1721898092,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('58', '_blockContent', '112', '0', '0', '{\"parentTemplates\":[49],\"slashUrls\":1,\"pageLabelField\":\"fa-file-text-o title\",\"compile\":0,\"label\":\"Block content\",\"tags\":\"block\",\"modified\":1721898021,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'field-images', '113', '0', '0', '{\"noChildren\":1,\"noParents\":1,\"slashUrls\":1,\"pageLabelField\":\"fa-cog\",\"noGlobal\":true,\"compile\":0,\"modified\":1721897828,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('60', '_optBool', '114', '0', '0', '{\"parentTemplates\":[49],\"slashUrls\":1,\"pageLabelField\":\"fa-cog title\",\"compile\":0,\"modified\":1721897583,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', '_oembedImages', '115', '0', '0', '{\"noChildren\":1,\"noParents\":-1,\"slashUrls\":1,\"pageLabelField\":\"fa-file-image-o title\",\"compile\":0,\"modified\":1721898477,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'user-zone', '116', '0', '0', '{\"noParents\":-1,\"slashUrls\":1,\"pageLabelField\":\"fa-users title\",\"compile\":0,\"tags\":\"user\",\"modified\":1722677899,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'user-todo', '117', '0', '0', '{\"parentTemplates\":[3],\"slashUrls\":1,\"pageLabelField\":\"fa-list-ul title\",\"compile\":0,\"tags\":\"user\",\"modified\":1722665563,\"_lazy\":1}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":34,"numCreateTables":40,"numInserts":714,"numSeconds":0}