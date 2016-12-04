<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/12/4
 * Time: 22:40
 */

require_once '../include.php';

$act=$_REQUEST['act'];
if($act=="logout"){
    logout();
}