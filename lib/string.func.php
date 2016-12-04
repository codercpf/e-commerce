<?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 15:35
 */

//产生随机字符串
function buildRandomString($type=1, $length=4){
    if($type==1){                           //只产生数字
        $chars=join("",range(0,9));
    }elseif($type==2){                      //只产生字母
        $chars=join("",array_merge(range("a","z"),range("A","Z")));
    }elseif($type==3){                      //产生数字和字母
        $chars=join("",array_merge(range("a","z"),range("A","Z"),range(0,9)));
    }

    if($length > strlen($chars)){
        exit("字符串长度不够");
    }

    $chars = str_shuffle($chars);           //将字符串顺序打乱
    return substr($chars,0,$length);        //截取设定长度的字符串
}

