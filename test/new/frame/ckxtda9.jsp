<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style3 {color: #996600}
-->
</style>
</head>

<body>
<h2>ϰ </a>�� �� </h2>
<p>�� <span class="style3">����ʵ��������������Ҫ��ʾ��������ȱ�㡣</span> </p>
<p>������Ҫ��ʾ�������ṹģ�͡��ֽ�ģ�͡��߽�ģ�͡� </p>
<p>�ṹģ�ͣ� </p>
<p>�ŵ㣺�� 1 �� ���ݽṹ�Ƚϼ򵥣��������Ƚ�С���ڲ����ݵĹ���Ƚ����� �� </p>
<p>�� 2 �� �������Ч���Զ��õ���֤�� </p>
<p>�� 3 �� CSG ������ʾ���������״���Ƚ������޸ġ� </p>
<p>ȱ�㣺�� 1 �� ������ı�ʾ�����ص�����Ͷ����ز�������������ƣ�Ҳ����˵�� CSG ������ʾ����ĸ������нϴ�ľ����� �� </p>
<p>�� 2 �� ������ľֲ���������ʵ�֣����磬���ܶԻ������صĽ��ߵ�Բ�� �� </p>
<p>�� 3 �� ��������ı߽缸��Ԫ�أ��㡢�ߡ��棩�������ر�ʾ�� CSG �У�����ʾ����� CSG ��ʾ��������Ҫ�ϳ���ʱ�䣻 </p>
<p>�� 4 ����ʾ��Ψһ�� </p>
<p>�ֽ�ģ�ͣ� </p>
<p>�ŵ㣺�� 1 ���ֽ�ģ���ܱ����ָ��ӵ�ʵ�壻 </p>
<p>�� 2 ���ֽ�ģ�ͺ����ھֲ��ӹ���ֲ��޸ģ�����һЩ�����Ӧ��ϵͳ����ܵ�ģ�⣬ ��һ�ֺ����˵�ģ�͡� </p>
<p>�� 3 ���ֽ�ģ�ͶԲ��������ͼ�������հ�������ģ�ͽṹ���ϸ��������ʣ���������ͺͼ���ȽϷ��� </p>
<p>ȱ�㣺�� 1 ���ֽ�ģ�͵ı�ﾫ�Ƚϵͣ� </p>
<p>�� 2 ���ֽ�ģ�͵Ľ����Բ��ѣ��ռ俪���� </p>
<p>�� 3 �����ڷֽ�ģ�����������ȱ���������ݣ����Զ�����Ʊ߽��һЩ���������߿���ȡ�ȵȱȽ����ѡ� </p>
<p>�߽�ģ�� </p>
<p>�ŵ㣺�� 1 ���߽�ģ���м�ǿ�ı�����������ȿ��Ա��ʵ�壬�ֿ��Ա�����棬�� CSG �и���ı�︲���ʣ� </p>
<p>�� 2 ���߽�ģ�͵�ͻ���ŵ������ں�ͼ������ӿڣ�һ��ͼ��ѧ�㷨������ֱ�������ڱ߽�ģ���е��溯���� </p>
<p>ȱ�㣺�� 1 ���߽�ģ�ͶԼ��ϲ��������հ�����Ҫ�ڲ���֮�������ݽṹ�Ŀռ�����ԣ� </p>
<p>�� 2 ���߽�ģ�͵Ľ����Բ��ã���ռ�нϴ�Ŀռ䣻 </p>
<p>�� 3 ��һ��������ת���ı߽�ģ�Ͳ���Ψһ�ģ� </p>
<p>�� 4 �����Ĳ����㷨Ҳ�ܸ��ӡ� </p>
<p>&nbsp;</p>
<p>�� <span class="style3">�������κ�����ϵͳ�ʺϱ����Ķ��� </span></p>
<p>�������������÷��� (Fractal) ����ѧ���������ԣ����ø���ģ����ʵͼ�ε�ģ�ͣ�ʹ�������ɵľ�����ֳ�ϸ�ڵ�����ع����ʵķ����������ɵľ����У������нṹ�Խ�ǿ������Ҳ�����ǽṹ�Խ����Ļ��ơ��̣������������ж�̬���ԵĻ��桢�˵ȡ� </p>
<p>����ϵͳ������Ϊֹ��������Ϊģ�ⲻ����ģ��������Ϊ�ɹ���һ��ͼ�������㷨������������˲�����ģ������Ķ�̬�Ժ�����ԣ��ܺܺõ�ģ����ơ�ˮ��ɭ�ֺ�ԭҰ����Ȼ���ۺͲ��Ͽ�ѧ����ѧ�������ѧ�������Ӷ�̬�仯����̬�� </p>
<p>�� ��ζ������˲�����ʾ��������в������㣿 </p>
<p>�� n1 �� n2 ���󽻵����Ű˲�������ͬλ�õĶ�Ӧ�㣬 n3 �ǲ�������������еĶ�Ӧ�ڵ㡣 </p>
<p>�����㣺 </p>
<p>1 ����� n1 �� n2 ͬΪҶ�ڵ㣬���У� </p>
<p><img width="180" height="36" src="ckxtda9_clip_image002.gif"></p>
<p>2 ����� n1 ��Ҷ�ڵ㣬 n2 ���ǣ����У� </p>
<p><img width="180" height="41" src="ckxtda9_clip_image004.gif"></p>
<p>&nbsp;</p>
<p>3 ��<span class="style3">��� n1 �� n2 ͬΪ��Ҷ�ڵ㣬�� n1 �� n2 �� n3 ͬʱ�ֽ������Ӳ��ٽ����󽻡�</span> </p>
<p>�����㣺 </p>
<p>1 ����� n1 �� n2 ͬΪҶ�ڵ㣬���У� </p>
<p><img width="180" height="36" src="ckxtda9_clip_image006.gif"></p>
<p>2 ����� n1 ��Ҷ�ڵ㣬 n2 ���ǣ����У� </p>
<p><img width="168" height="38" src="ckxtda9_clip_image008.gif"></p>
<p>3 ����� n1 �� n2 ͬΪ��Ҷ�ڵ㣬�� n1 �� n2 �� n3 ͬʱ�ֽ������Ӳ��ٽ����󲢡� </p>
<p>�� <span class="style3">д�����������߱�ʾģ�͵ľ������ݡ�</span> </p>
<table cellspacing="0" cellpadding="0">
  <tr>
    <td width="568" valign="top"><p align="center"><img width="388" height="433" src="ckxtda9_clip_image010.jpg"></p></td>
  </tr>
  <tr>
    <td width="568" valign="top"><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ͼ 9.13 ��������߽ṹ </p></td>
  </tr>
</table>
</body>
</html>
