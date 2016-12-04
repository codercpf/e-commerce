<?php 
require_once '../include.php';

$username = $_POST['username'];
$password = md5($_POST['password']);
$verify = $_POST['verify'];
$verify01 = $_SESSION['verify'];

//自动登录选项
$autoFlag = $_POST['autoFlag'];

/*
echo "<pre>";
print_r($_POST);
echo "<pre>";
exit;
*/

if($verify==$verify01){
    $sql="select * from imooc_admin where username='{$username}' and password='{$password}'";
    $row = checkAdmin($sql);
    if($row){
        //选中了一周内自动登录
        if($autoFlag){
            setcookie("adminId",$row['id'],time()+7*24*3600);
            setcookie("adminName",$row['username'],time()+7*24*3600);
        }

        $_SESSION['adminName'] = $row['username'];
        $_SESSION['adminId'] = $row['id'];
//        header('location:index.php');
        alertMes('登录成功！','index.php');
    }else{
        alertMes('登录失败，重新登录','login.php');
    }
}else{
    alertMes('验证码错误','login.php');
}