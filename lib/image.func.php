 <?php
/**
 * Created by PhpStorm.
 * User: cpf
 * Date: 2016/12/2
 * Time: 15:34
 *
 *
 * 通过GD库做验证码
 *
*/
 require_once 'string.func.php';

 function verifyImage($type=1,$length=4,$pixel=0,$line=0,$sess_name="verify"){
     //创建画布
     $width=80;
     $height=28;
     $image = imagecreatetruecolor($width, $height);
     $white = imagecolorallocate($image, 255, 255, 255);    //填充画布的颜色，白色，即背景色
     $black = imagecolorallocate($image, 0,0,0);            //画笔颜色，黑色

     //用填充矩形填充画布
     imagefilledrectangle($image,1,1,$width-2,$height-2,$white);    //白色填充画布

     $chars = buildRandomString($type,$length);             //调用函数产生验证码
     //将验证码存入session
     $_SESSION[$sess_name] = $chars;

     //验证码字体
     $fontfiles = array('arial.ttf','Candara.ttf','cour.ttf','msyh.ttc');
     //循环产生一个验证码
     for($i=0; $i<$length; $i++){
         $size = mt_rand(14,18);        //字体大小14_18之间随机
         $angle = mt_rand(-15,15);      //角度在-15到15之间
         $x = 5 + $i * $size;           //横坐标
         $y = mt_rand(20,26);           //纵坐标
         //产生随机颜色
         $color = imagecolorallocate($image, mt_rand(50,90), mt_rand(80,200), mt_rand(90,180));
         $fontfile="../fonts/".$fontfiles[mt_rand(0,count($fontfiles)-1)];    //随机取一个字体

         //产生的随机码中每次截取一个，截取$length次，相当于产生一个$length长度的字符串
         $text = substr($chars,$i,1);

         imagettftext($image,$size,$angle,$x,$y,$color,$fontfile,$text);
     }

     //添加干扰元素，背景黑点
     if($pixel){
         for($i=0;$i<50;$i++){
             imagesetpixel($image, mt_rand(0,$width-1), mt_rand(0,$height-1), $black);
         }
     }
     //添加直线干扰元素
     if($line){
         for($i=1;$i<$line;$i++){
             $color = imagecolorallocate($image, mt_rand(50,90), mt_rand(80,200), mt_rand(90,180));
             imageline($image,mt_rand(0,$width-1),mt_rand(0,$height-1),mt_rand(0,$width-1),mt_rand(0,$height-1),$color);
         }
     }

     ob_clean();            //清除缓存——————必需，否则不显示图片

     header("content-type:image/jpeg");      //设置要显示的内容为image/gif
     imagejpeg($image);          //显示画布
     imagedestroy($image);      //销毁画布
 }


















