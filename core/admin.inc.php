<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/12/4
 * Time: 22:10
 */

 function checkAdmin($sql){
    return fetchOne($sql);
 }

 function checkLogined(){
    if($_SESSION['adminId'] == "" && $_COOKIE['adminId']==""){
        alertMes("请先登录","login.php");
    }
}

//注销管理员
function logout(){
    $_SESSION = array();
    if(isset($_COOKIE[session_name()])){
        setcookie(session_name(),"",time()-1);      //清空cookie中保存的变量值
    }
    if(isset($_COOKIE['adminId'])){
        setcookie("adminId","",time()-1);           //清空设置的cookie中adminId的值
    }
    if(isset($_COOKIE['adminName'])){
        setcookie("adminName","",time()-1);         //清空设置的cookie中adminName的值
    }
    session_destroy();
    header("location:login.php");
}