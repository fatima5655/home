<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {color: #996600}
-->
</style>
</head>

<body>
<h2>ϰ </a>�� �� </h2>
<p>�� ���ü��ֲ�ͬ˳��ļ򵥼��α任�������ƽ���ϵ��� <em>P </em>1 ( <em>x </em>1 , <em>y </em>1 ) �� <em>P </em>2 ( <em>x </em>2 , <em>y </em>2 ) Ϊ�˵��ֱ�߶α任Ϊ <em>x </em>��ı任���󣬲�˵�����Ч�ԡ� </p>
<p>�� ֤����ά����� <em>x </em>�����Գơ������ <em>y </em>= - <em>x </em>ֱ�����ԳƱ任��ȫ�ȼ��ڸõ��������ԭ������ת�任�� </p>
<p>�� <span class="style1">�ֱ�д��ƽ�ơ���ת�����ż�����ϵı任���� </span></p>
<p>�� 1 �� ƽ�Ʊ任�� </p>
<p><img width="328" height="131" src="ckxtda3_clip_image002_0000.gif"></p>
<p>���У� <img width="17" height="24" src="ckxtda3_clip_image004.gif">�� <img width="17" height="25" src="ckxtda3_clip_image006.gif">�� <img width="17" height="24" src="ckxtda3_clip_image008.gif">���������������귽���ϵ�λ������ </p>
<p>�� 2 ����ת�任�� </p>
<p>�� Z ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image010.gif"></p>
<p>�� X ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image012.gif"></p>
<p>�� Y ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image014.gif"></p>
<p>�����ת���Ƶ��᲻�������ᣬ����Ϊ�������� p1,p2 �������ʸ������ת�Ƕ�Ϊ �� ������� 7 �������任��Ϲ��ɣ� </p>
<p>&#149;&nbsp; T(-x 1 ,-y 1 ,-z 1 ) ��ʹ p1, ����ԭ���غϣ� </p>
<p>&#149;&nbsp; R x ( �� ) ��ʹ�� p1p2 ����ƽ�� xoz �ڣ� </p>
<p>&#149;&nbsp; R y ( �� ) ��ʹ p1p2 �� z ���غϣ� </p>
<p>&#149;&nbsp; R z ( �� ) ��ִ���� p1p2 ��ĦȽ���ת�� </p>
<p>&#149;&nbsp; R y (- �� ) �� �� 3 ����任�� </p>
<p>&#149;&nbsp; R x (- �� ) ���� 2 ����任�� </p>
<p>&#149;&nbsp; T(x 1 ,y 1 ,z 1 ) ���� 1 ����任�� </p>
<p>�� 3 �����ű任�� <strong></strong></p>
<p><img width="327" height="96" src="ckxtda3_clip_image016.gif"></p>
<p>���� S x �� S y �� S z �����������������ϵı����仯������Ϊ S(S x ,S y ,S z ) �� </p>
<p>������ĳ����ԭ��ο��� (x f ,y f ,z f ) ���й̶������ű任����ͨ�����µļ����任ʵ�֣� </p>
<p>T(-x f ,-y f ,-z f ) . S(S x ,S y ,S z ) . T(x f , y f , z f ) </p>
<p>&nbsp;</p>
<p>�� <span class="style1">����� ���α任ʵ������ϵ�ı任 </a>�� </span></p>
<p>����ϵ�ı任���༴��ĳһ����ϵ lcs1 �еĵ� <img width="76" height="27" src="ckxtda3_clip_image018.gif">�任Ϊ��һ������ϵ lcs2 �µ����� <img width="71" height="27" src="ckxtda3_clip_image020.gif">���� <img width="243" height="27" src="ckxtda3_clip_image022.gif">�� <img width="16" height="19" src="ckxtda3_clip_image024.gif">������Ƶ��������� </p>
<p>&#149;&nbsp; �� lcs1 �еĵ�任����������ϵ�ľ��� <img width="24" height="24" src="ckxtda3_clip_image026.gif">; </p>
<p><img width="280" height="96" src="ckxtda3_clip_image028.gif"></p>
<p>x_axis, y_axis, z_axis Ϊ lcs1 �� x,y,z ��ʸ������������ϵ�ı�ʾ </p>
<p>org Ϊ lcs1 ��ԭ������������ϵ�ı�ʾ </p>
<p>&#149;&nbsp; ����������ϵ�ĵ�任�� lcs2 �еĵ���� <img width="25" height="24" src="ckxtda3_clip_image030.gif">; </p>
<p><img width="253" height="96" src="ckxtda3_clip_image032.gif"></p>
<p>x_axis, y_axis, z_axis Ϊ lcs1 �� x,y,z ��ʸ������������ϵ�ı�ʾ </p>
<p>org Ϊ lcs1 ��ԭ������������ϵ�ı�ʾ </p>
<p>a = - x_axis.x * org.x - x_axis.y * org.y - x_axis.z * org.z </p>
<p>b = - y_axis.x * org.x - y_axis.y * org.y - y_axis.z * org.z </p>
<p>c = - z_axis.x * org.x - z_axis.y * org.y - z_axis.z * org.z </p>
<p>&#149;&nbsp; <img width="16" height="19" src="ckxtda3_clip_image033.gif">= <img width="24" height="24" src="ckxtda3_clip_image034.gif"><img width="25" height="24" src="ckxtda3_clip_image035.gif"></p>
<p>&nbsp;</p>
<p>�� <span class="style1">д��͸�ӱ任����͸���ͶӰ������ͼ��������бͶӰ���任����</span> </p>
<p>͸�ӱ任������ʽΪ�� <img width="112" height="96" src="ckxtda3_clip_image037.gif"></p>
<p>����ͼ�� <img width="96" height="96" src="ckxtda3_clip_image039.gif">����ͼ�� <img width="96" height="96" src="ckxtda3_clip_image041.gif"></p>
<p>����ͼ�� <img width="96" height="96" src="ckxtda3_clip_image043.gif"></p>
<p>����⣺ <img width="195" height="96" src="ckxtda3_clip_image045.gif"></p>
<p>бͶӰ�� <img width="221" height="96" src="ckxtda3_clip_image047.gif"></p>
<p>�� <span class="style1">�۲�ռ�����Щ��������������ʲô��д��������ռ�����ϵ���۲�ռ�����ϵ��ת������</span> </p>
<p>���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� </p>
<p>VRP �۲�ο��� ȷ���۲�����ϵԭ�� </p>
<p>VPN �۲�ƽ�淨�� ȷ���۲�ƽ�淨�� </p>
<p>VUP �۲����� ȷ���۲�ƽ���� v ��ķ��� </p>
<p>F ǰ������� ȷ��ǰ����λ�� </p>
<p>B �������� ȷ�������λ�� </p>
<p>Pt ͶӰ���� ����ͶӰ��ƽ��ͶӰ����͸��ͶӰ </p>
<p>PRP ͶӰ�ο��� ȷ��ͶӰ���Ļ�ͶӰ���� </p>
<p>Umin,Umax,Vmin,Vmax �۲촰�� �ڹ۲�ƽ���϶���۲촰�� </p>
<p>������ռ�����ϵ���۲�ռ�����ϵ��ת������ </p>
<p><img width="151" height="144" src="ckxtda3_clip_image049.gif"></p>
<p>&nbsp;</p>
<p>�� <span class="style1">�ֱ�д������͸��ͶӰ��ƽ��ͶӰ���Ӳü��ռ䵽�淶��ͶӰ�ռ��ת������</span> </p>
<p><img width="173" height="99" src="ckxtda3_clip_image051.gif"></p>
<p><img width="175" height="120" src="ckxtda3_clip_image053.gif"></p>
<p><img width="196" height="104" src="ckxtda3_clip_image055.gif"></p>
<p><img width="288" height="163" src="ckxtda3_clip_image057.gif"></p>
<p><img width="396" height="176" src="ckxtda3_clip_image059.gif"></p>
<p>ƽ��ͶӰ�� T vcper =T 3 T 4 T 5par T 6par </p>
<p>͸��ͶӰ�� T vcper =T 3 T 4 T 5per </p>
<p>&nbsp;</p>
<p>�� <span class="style1">д���ӹ淶��ͶӰ�ռ䵽ͼ��ռ��ת������</span> </p>
<p><img width="175" height="141" src="ckxtda3_clip_image061.gif"></p>
<p>&nbsp;</p>
<p>�� <span class="style1">��д����άͼ�μ��α任�����һ������ʽ����˵�����и����Ӿ���ı任���ܡ� </span></p>
<p>�� 1 �� . ƽ�Ʊ任�� </p>
<p><img width="328" height="131" src="ckxtda3_clip_image062.gif"></p>
<p>���У� <img width="17" height="24" src="ckxtda3_clip_image063.gif">�� <img width="17" height="25" src="ckxtda3_clip_image064.gif">�� <img width="17" height="24" src="ckxtda3_clip_image065.gif">���������������귽���ϵ�λ������ </p>
<p>�� 2 ������ת�任�� </p>
<p>�� Z ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image066.gif"></p>
<p>�� X ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image067.gif"></p>
<p>�� Y ����ת�Ĺ�ʽΪ�� </p>
<p><img width="356" height="96" src="ckxtda3_clip_image068.gif"></p>
<p>�� 3 �������ű任�� <strong></strong></p>
<p><img width="327" height="96" src="ckxtda3_clip_image069.gif"></p>
<p>&nbsp;</p>
<p>�� <span class="style1">�Զ�ά��������µ����Ա任���� <em>M </em>��д��ƽ�ơ���ת����ԭ�㣩������������ȣ��ʹ�������µı任������ʽ������������ <em>P </em>( <em>x </em>1 , <em>y </em>1 ) �� <em>Q </em>( <em>x </em>2 , <em>y </em>2 ) Ϊ�˵��ֱ�߶α任���� <em>x </em>���غϵľ���任��ʽ��</span> </p>
<p>�� 1 ��ƽ�ƣ� <img width="96" height="77" src="ckxtda3_clip_image071.gif"></p>
<p>�� 2 ����ת����ԭ�㣩�� <img width="123" height="75" src="ckxtda3_clip_image073.gif"></p>
<p>�� 3 �������� <img width="76" height="75" src="ckxtda3_clip_image075.gif"></p>
<p>�� 4 �����У� <img width="79" height="75" src="ckxtda3_clip_image077.gif"></p>
<p>�� 5 ������ <em>P </em>( <em>x </em>1 , <em>y </em>1 ) �� <em>Q </em>( <em>x </em>2 , <em>y </em>2 ) Ϊ�˵��ֱ�߶α任���� <em>x </em>���غϵľ���任��ʽ�� </p>
<p><img width="113" height="75" src="ckxtda3_clip_image079.gif"><img width="133" height="75" src="ckxtda3_clip_image081.gif"></p>
<p>���У� <img width="13" height="19" src="ckxtda3_clip_image083.gif">Ϊֱ�߶� PQ �� <em>x </em>�����ɵĽ� </p>
</body>
</html>
