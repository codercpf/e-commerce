<?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 11:41
 */

$passwd = md5("king");
$sql = "insert imooc_admin(username,password,email) values('king','$passwd','877040117@qq.com')";

echo $sql;