<?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 17:41
 */

session_start();

define("ROOT", dirname(__FILE__));     //当前目录为根目录

//设置要包含文件的目录，可在后面添加多个目录
set_include_path(".".PATH_SEPARATOR.ROOT."/lib"
    .PATH_SEPARATOR.ROOT."/core"
    .PATH_SEPARATOR.ROOT."/configs"
    .PATH_SEPARATOR.get_include_path());

require_once 'common.func.php';
require_once 'string.func.php';
require_once 'mysql.func.php';
require_once 'image.func.php';
require_once 'page.func.php';
require_once 'configs.php';
require_once 'admin.inc.php';
connect();
