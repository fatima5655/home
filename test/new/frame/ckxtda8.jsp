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
<h2>ϰ �� �� </a></h2>
<p>�� <span class="style3">��д���� bezier ���ߵĳ��� </span></p>
<p align="left">#include &lt;math.h&gt; </p>
<p align="left">/* ����Bernstein���ͺ���ֵ,B i,n (t)*/ </p>
<p align="left">float Basis( int n, int i, float t) </p>
<p align="left">{ </p>
<p align="left">float basis=1; </p>
<p align="left">float ti; </p>
<p align="left">float tni; </p>
<p align="left">int k=n-i; </p>
<p align="left">if (i&gt;k) </p>
<p align="left">{ </p>
<p align="left">while (n&gt;i) </p>
<p align="left">{ </p>
<p align="left">basis*=n; </p>
<p align="left">--n; </p>
<p align="left">if (k&gt;1) </p>
<p align="left">{ </p>
<p align="left">basis/=k; </p>
<p align="left">--k; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">else </p>
<p align="left">{ </p>
<p align="left">while (n&gt;k) </p>
<p align="left">{ </p>
<p align="left">basis*=n; </p>
<p align="left">--n; </p>
<p align="left">if (i&gt;1) </p>
<p align="left">{ </p>
<p align="left">basis/=i; </p>
<p align="left">--i; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">if (t==0. &amp;&amp; i == 0) ti=1.0; else ti = pow(t,i); </p>
<p align="left">if (n==i &amp;&amp; t==1.) tni=1.0; else tni = pow((1-t),(n-i)); </p>
<p align="left">basis*=ti*tni; /* calculate Bernstein basis function */ </p>
<p align="left">return basis; </p>
<p align="left">} </p>
<p align="left">/*��ֵ���� bezier���� </p>
<p align="left">npts�����Ƶ���� </p>
<p align="left">b������ο��Ƶ��������飬b[3*i+1]Ϊx������b[3*i+2]Ϊy������b[3*i+3]Ϊz���� </p>
<p align="left">cpts����Ҫ��������ߵ���� </p>
<p align="left">p������������ߵ���������飬��Ϊ������� </p>
<p align="left">*/ </p>
<p align="left">void bezier( int npts, float b[], int cpts, float p[]) </p>
<p align="left">{ </p>
<p align="left">int i,j,k; </p>
<p align="left">int icount,jcount; </p>
<p align="left">float step,t; </p>
<p align="left">icount = 0; </p>
<p align="left">t = 0; </p>
<p align="left">step = 1.0/(( float )(cpts -1)); </p>
<p align="left">for (k = 1; k&lt;=cpts; k++) </p>
<p align="left">{ </p>
<p align="left">if ((1.0 - t) &lt; 5e-6) t = 1.0; </p>
<p align="left">for (j = 1; j &lt;= 3; j++) </p>
<p align="left">{ </p>
<p align="left">jcount = j; </p>
<p align="left">p[icount+j] = 0.; </p>
<p align="left">for (i = 1; i &lt;= npts; i++) </p>
<p align="left">{ </p>
<p align="left">p[icount + j] = p[icount + j] + Basis(npts-1,i-1,t)*b[jcount]; </p>
<p align="left">jcount = jcount + 3; </p>
<p align="left">} </p>
<p align="left">} </p>
<p align="left">icount = icount + 3; </p>
<p align="left">t = t + step; </p>
<p align="left">} </p>
<p align="left">} </p>
<p>�� <span class="style3">��֪ Bezier ���� <img width="325" height="118" src="ckxtda8_clip_image002.gif">�� <img width="57" height="21" src="ckxtda8_clip_image004.gif">�� <img width="80" height="22" src="ckxtda8_clip_image006.gif">�� <img width="85" height="22" src="ckxtda8_clip_image008.gif">�� <img width="72" height="22" src="ckxtda8_clip_image010.gif">�����ü�����ͼ�����ֳ� De Casteljau �㷨������ t=0.25 �� Bezier �����ϵĵ㡣 </span></p>
<p>P01=(16, 32), P11=(80, 128), P21=(144, 96) </p>
<p>P02=(32, 56), P12=(96, 120) </p>
<p>P03=(48, 72) </p>
<p>��˸õ�����Ϊ (48, 72) </p>
<p>&nbsp;</p>
<p>�� <span class="style3">���й��� Bezier ���ߵ����ʣ��ĸ�����ȷ�ģ�</span> A �� C �� D </p>
<p>&#149;&nbsp; �������յ㴦�����߷���Ϳ��ƶ���ε�һ���ߺ����һ���ߵķ���һ�£� </p>
<p>&#149;&nbsp; �ڶ˵㴦�� R �׵��������� R �����ڸ����ƶ����йأ� </p>
<p>&#149;&nbsp; ������ԭȫ�������λ�ò��䣬ֻ�ǰѴ���ߵ����������µ� Bezier ������״���䣬�������෴���� </p>
<p>&#149;&nbsp; ���ߵ���״������ƶ����λ���йأ�ͬʱ����������ϵ��ѡ�� </p>
<p>&nbsp;</p>
<p>�� <span class="style3">��ζ� NURBS �������ף�</span> </p>
<p>�� <img width="145" height="40" src="ckxtda8_clip_image012.gif">Ϊ������ <img width="115" height="21" src="ckxtda8_clip_image014.gif">�ϵ� <img width="16" height="17" src="ckxtda8_clip_image016.gif">�� NURBS ���ߣ�������Ҫ������ <img width="36" height="21" src="ckxtda8_clip_image018.gif">�� </p>
<p><img width="255" height="40" src="ckxtda8_clip_image020.gif"></p>
<p>�� <img width="85" height="20" src="ckxtda8_clip_image022.gif">��ʾ�ڲ����ڵ���ظ��ȣ� </p>
<p><img width="339" height="40" src="ckxtda8_clip_image024.gif"></p>
<p>�� </p>
<p><img width="340" height="64" src="ckxtda8_clip_image026.gif"></p>
<p><img width="93" height="19" src="ckxtda8_clip_image028.gif"></p>
<p><img width="161" height="67" src="ckxtda8_clip_image030.gif"></p>
<p>�� NURBS ���ߵĽڵ�����㷨�� </p>
<p>�� <img width="155" height="45" src="ckxtda8_clip_image032.gif">Ϊ������ <img width="115" height="21" src="ckxtda8_clip_image033.gif">�ϵ� NURBS ���ߣ��� <img width="84" height="21" src="ckxtda8_clip_image035.gif">�����ڽ� <img width="15" height="17" src="ckxtda8_clip_image037.gif">���뵽 <em>U </em>�У������µĽڵ�ʸ���� </p>
<p><img width="360" height="24" src="ckxtda8_clip_image039.gif"></p>
<p>���ϵ� NURBS ����Ϊ�� </p>
<p align="center"><img width="155" height="45" src="ckxtda8_clip_image041.gif"></p>
<p>�ɴ˿ɵã� </p>
<p align="center"><img width="220" height="117" src="ckxtda8_clip_image043.gif"></p>
</body>
</html>
