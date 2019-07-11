/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : sku

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 11/07/2019 13:56:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand`  (
  `vid` int(11) NOT NULL COMMENT '对应属性的 pid:vid 串中的vid',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'vid的值',
  `pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '品牌的属性id',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '品牌的属性名',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feature
-- ----------------------------
DROP TABLE IF EXISTS `feature`;
CREATE TABLE `feature`  (
  `attr_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性键',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性值'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `num_iid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品数字id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题,不能超过60字节',
  `nick` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '卖家昵称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型(fixed:一口价;auction:拍卖)注：取消团购',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `props` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品属性 格式：pid:vid;pid:vid',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品主图片地址',
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品数量',
  `valid_thru` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '有效期,7或者14（默认是14天）',
  `list_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '上架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `delist_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '下架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品价格，格式：5.00；单位：元；精确到：分',
  `has_discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支持会员打折,true/false',
  `has_invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否有发票,true/false',
  `has_warranty` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否有保修,true/false',
  `has_showcase` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '橱窗推荐,true/false',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品修改时间（格式：yyyy-MM-dd HH:mm:ss）',
  `approve_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品上传后的状态。onsale出售中，instock库中',
  `postage_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板',
  `outer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)',
  `is_virtual` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '虚拟商品的状态字段',
  `is_taobao` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否在淘宝显示',
  `is_ex` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否在外部网店显示',
  `sold_quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品销量',
  `is_cspu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否为达尔文挂接成功了的商品',
  `is_offline` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是线下商品。1：线上商品（默认值）；2：线上或线下商品；3：线下商品。',
  `after_sale_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '售后说明模板id',
  `sub_stock` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品是否支持拍下减库存:1支持;2取消支持(付款减库存);0(默认)不更改集市卖家默认拍下减库存;商城卖家默认付款减库存',
  `is_xinpin` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品是否为新品。只有在当前类目开通新品,并且当前用户拥有该类目下发布新品权限时才能设置is_xinpin为true，否则设置true后会返回错误码:isv.invalid-permission:add-xinpin。同时只有一口价全新的宝贝才能设置为新品，否则会返回错误码：isv.invalid-parameter:xinpin。不设置该参数值或设置为false效果一致。',
  `weight` double DEFAULT NULL COMMENT '商品的重量(商超卖家专用字段)',
  `auction_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品的积分返点比例。如:5,表示:返点比例0.5%. 注意：返点比例必须是>0的整数，而且最大是90,即为9%.B商家在发布非虚拟商品时，返点必须是 5的倍数，即0.5%的倍数。其它是1的倍数，即0.1%的倍数。无名良品商家发布商品时，复用该字段记录积分宝返点比例，返点必须是对应类目的返点步长的整数倍，默认是5，即0.5%。注意此时该字段值依旧必须是>0的整数，最高值不超过500，即50%',
  `increment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '加价(降价)幅度。如果为0，代表系统代理幅度。对于增价拍和荷兰拍来说是加价幅度，对于降价拍来说是降价幅度。',
  `freight_payer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '运费承担方式。可选值:seller（卖家承担）,buyer(买家承担);默认值:seller。卖家承担不用设置邮费和postage_id.买家承担的时候，必填邮费和postage_id 如果用户设置了运费模板会优先使用运费模板，否则要同步设置邮费（post_fee,express_fee,ems_fee）',
  PRIMARY KEY (`num_iid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_cat
-- ----------------------------
DROP TABLE IF EXISTS `item_cat`;
CREATE TABLE `item_cat`  (
  `cid` int(11) NOT NULL COMMENT '商品所属类目ID',
  `parent_cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '父类目ID=0时，代表的是一级的类目',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类目名称',
  `is_parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '该类目是否为父类目(即：该类目是否还有子类目)',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态。可选值:normal(正常),deleted(删除)',
  `sort_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数',
  `taosir_cat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否度量衡类目',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_img
-- ----------------------------
DROP TABLE IF EXISTS `item_img`;
CREATE TABLE `item_img`  (
  `id` int(11) NOT NULL COMMENT '商品图片id(如果是更新图片，则需要传该参数)',
  `num_iid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品数字ID，该参数必须',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片序号',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片内容类型:JPG,GIF;最大:3M 。支持的文件类型：gif,jpg,jpeg,png',
  `is_major` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否将该图片设为主图,可选值:true,false;默认值:false(非主图)',
  `is_rectangle` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否3:4长方形图片，绑定3:4主图视频时用于上传3:4商品主图',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片链接地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_prop
-- ----------------------------
DROP TABLE IF EXISTS `item_prop`;
CREATE TABLE `item_prop`  (
  `pid` int(11) NOT NULL COMMENT '属性 ID 例：品牌的PID=20000',
  `parent_pid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '上级属性ID',
  `parent_vid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '上级属性值ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '	属性名',
  `is_key_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否关键属性。可选值:true(是),false(否)',
  `is_sale_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否销售属性。可选值:true(是),false(否)',
  `is_color_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否颜色属性。可选值:true(是),false(否)',
  `is_enum_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是可枚举属性。可选值:true(是),false(否)',
  `is_item_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否商品属性。可选值:true(是),false(否)',
  `must` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布产品或商品时是否为必选属性。可选值:true(是),false(否)',
  `multi` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL COMMENT '发布产品或商品时是否可以多选。可选值:true(是),false(否)',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态。可选值:normal(正常),deleted(删除)',
  `sort_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号。取值范围:大于零的整排列序号。取值范围:大于零的整数',
  `child_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '子属性的模板（卖家自行输入属性时需要用到）',
  `is_allow_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许别名。可选值：true（是），false（否）',
  `is_input_prop` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '在is_enum_prop是true的前提下，是否是卖家可以自行输入的属性（注：如果is_enum_prop返回false，该参数统一返回false）。可选值:true(是),false(否)。对于品牌和型号属性（包括子属性）：如果用户是C卖家，则可自定义属性；如果是B卖家，则不可自定义属性，而必须要授权的属性。',
  `is_taosir` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否度量衡属性项',
  `is_material` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否是材质 属性项',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `outer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '外部产品ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品名称',
  `binds` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的非关键属性列表.格式:pid:vid;pid:vid.',
  `sale_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的销售属性列表.格式:pid:vid;pid:vid',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的市场价.单位为元.精确到2位小数;如:200.07',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的描述.最大25000个字节',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的主图片地址.(绝对地址,格式:http://host/image_path)',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间.格式:yyyy-mm-dd hh:mm:ss',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '当前状态(0 商家确认 1 屏蔽 3 小二确认 2 未确认 -1 删除)',
  `vertical_market` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '垂直市场,如：3（3C），4（鞋城）',
  `customer_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户自定义属性,结构：pid1:value1;pid2:value2 例如：“20000:优衣库”，表示“品牌:优衣库”',
  `property_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '销售属性值别名。格式为pid1:vid1:alias1;pid1:vid2:alia2。',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间.格式:yyyy-mm-dd hh:mm:ss',
  `tsc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '淘宝标准产品编码',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类目ID.必须是叶子类目ID',
  `cat_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品类目名称',
  `props` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的关键属性列表.格式：pid:vid;pid:vid',
  `props_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的关键属性字符串列表.比如:品牌:诺基亚;型号:N73(注：属性名称中的冒号\":\"被转换为：\"#cln#\"; 分号\";\"被转换为：\"#scln#\")',
  `binds_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的非关键属性字符串列表.格式同props_str(注：属性名称中的冒号\":\"被转换为：\"#cln#\"; 分号\";\"被转换为：\"#scln#\")',
  `sale_props_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品的销售属性字符串列表.格式同props_str(注：属性名称中的冒号\":\"被转换为：\"#cln#\"; 分号\";\"被转换为：\"#scln#\")',
  `sell_pt` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品卖点描述，长度限制20个汉字 例如:明星同款',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` int(11) NOT NULL COMMENT '产品图片ID',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片所属产品的ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址.(绝对地址,格式:http://host/image_path)',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片序号。产品里的图片展示顺序，数据越小越靠前。要求是正整数。',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '添加时间.格式:yyyy-mm-dd hh:mm:ss',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间.格式:yyyy-mm-dd hh:mm:ss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_prop_img
-- ----------------------------
DROP TABLE IF EXISTS `product_prop_img`;
CREATE TABLE `product_prop_img`  (
  `id` int(11) NOT NULL COMMENT '产品属性图片ID',
  `product_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片所属产品的ID',
  `props` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性串(pid:vid),目前只有颜色属性.如:颜色:红色表示为　1627207:28326',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片地址.(绝对地址,格式:http://host/image_path)',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片序号。产品里的图片展示顺序，数据越小越靠前。要求是正整数。',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '添加时间.格式:yyyy-mm-dd hh:mm:ss',
  `modified` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '修改时间.格式:yyyy-mm-dd hh:mm:ss',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prop_value
-- ----------------------------
DROP TABLE IF EXISTS `prop_value`;
CREATE TABLE `prop_value`  (
  `vid` bigint(20) NOT NULL COMMENT '属性值ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '属性 ID',
  `cid` bigint(20) NOT NULL COMMENT '类目ID',
  `prop_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性值',
  `name_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '属性值别名',
  `is_parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '是否为父类目属性',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态。可选值:normal(正常),deleted(删除)',
  `sort_order` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '排列序号。取值范围:大于零的整数',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sku
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku`  (
  `sku_id` int(11) NOT NULL COMMENT 'sku的id',
  `num_iid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品数字id',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `properties` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Sku属性串。格式:pid:vid;pid:vid,如:1627207:3232483;1630696:3284570,表示:机身颜色:军绿色;手机套餐:一电一充。',
  `quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Sku的库存数量。sku的总数量应该小于等于商品总数量(Item的NUM)。取值范围:大于零的整数',
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Sku的销售价格。商品的价格要在商品所有的sku的价格之间。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `outer_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Sku的商家外部id',
  `item_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所属商品的价格。当用户新增sku，使商品价格不属于sku价格之间的时候，用于修改商品的价格，使sku能够添加成功',
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'Sku文字的版本。可选值:zh_HK(繁体),zh_CN(简体);默认值:zh_CN',
  `ignorewarning` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '忽略警告提示.',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'sku状态。 normal:正常 ；delete:删除,淘宝天猫此字段无效',
  `sku_spec_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `barcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品级别的条形码',
  `with_hold_quantity` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品在付款减库存的状态下，该sku上未付款的订单数量',
  `properties_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……\r\n20000:3275069:品牌:盈讯;1753146:3485013:型号:F908;-1234:-5678:自定义属性1:属性值1',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
