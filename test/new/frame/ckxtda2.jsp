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
<p>�� <span class="style1">DDA ������ֱ�ߵĻ���ԭ����ʲô�� </span></p>
<p>DDA ������΢�ַ���ʽ (Digital Differential Analyser) ����д����ֱ�ߵ����Ϊ (x1, y1) ���յ�Ϊ (x2, y2) ����б�� m Ϊ </p>
<p align="center"><img width="107" height="41" src="ckxtda2_clip_image002.gif"></p>
<p>ֱ���е�ÿһ�����궼������ǰһ������仯һ������ (Dx, Dy) ���õ�������ʾΪ�ݹ�ʽ </p>
<p align="center">xi+1 = xi + Dx </p>
<p align="center">yi+1 = yi + Dy </p>
<br>
<p>���й�ϵ </p>
<p align="center">Dy = m ? Dx </p>
<p>�ݹ�ʽ�ĳ�ֵΪֱ�ߵ���� (x1, y1) ���������Ϳ����üӷ�������һ��ֱ�ߡ� </p>
<p>&nbsp;</p>
<p>�� <span class="style1">Ϊʲô˵ Bresenham ��Բ���㷨Ч�ʽϸߣ� </span></p>
<p>Bresenham Բ�������㷨˼�����£� </p>
<p>�� ������ֵ�� p1=3 - 2r �� i=1 ������ (0, r) �� </p>
<p>�� ����һ����դλ�ã����� xi+1=xi+1 ����� pi&lt;0 �� yi+1=yi ������ yi+1=yi - 1 �� </p>
<p>�� ���� (xi+1, yi+1) �� </p>
<p>�� ������һ������� pi&lt;0 �� pi+1=pi+4xi+6 ������ pi+1=pi+4(xi - yi)+10 �� </p>
<p>�� i=i+1 ����� x=y ����������򷵻ز��� 2 �� </p>
<p>��Ȼʽ (2.7) ��ʾ pi+1 ���㷨�ƺ��ܸ��ӣ�����Ϊ yi+1 ֻ��ȡֵ yi �� yi - 1 ��������㷨�У��� 4 ������ʽ��úܼ򵥣�ֻ�����ӷ��ͳ� 4 �ĳ˷������Բ�� Bresenham �㷨�����ٶ�Ҳ�Ǻܿ�ģ�����������Ӳ����ʵ�֡� </p>
<p>&nbsp;</p>
<p>�� <span class="style1">������άͼ�μ��õĻ���ԭ����ѡ�õĲü����ԡ� </span></p>
<p>�����ڱ�ȷ��֮��ֻ�д����ڵ�������ܱ���ʾ����������������嶼�ǲ��ɼ��ġ���ˣ�������������Բ��μӱ�׼��ת����������ʾ�������Ӷ���Լ����ʱ�䡣�ü� (clipping) �ǲ�ȥ����֮����������岿�ֵ�һ�ֲ����� </p>
<p>���÷�Ϊֱ�߼��ã�����μ��ã��ַ������á� </p>
<p>&nbsp;</p>
<p>��<span class="style1"> ��ֱ�ߵ��㷨���ļ��֣���Բ�����㷨���ļ��֣�дһ�������߿�����ߵĳ���</span> </p>
<p>ͨ����ֱ�ߵķ��������֣��� 1 �����ȽϷ����� 2 ����ֵ΢�ַ����� 3 �� Bresenham �㷨�������ߵĳ��÷����У��� 1 �����ȽϷ����� 2 ���Ƕ� DDA ������ 3 �� Bresenham �㷨��һ��������ֵ΢�ַ��Ĵ��߿�Ļ����ߵĲο��������£� </p>
<p>Draw_wide_dashed(int x0,int y0,int x1,int y1,int width,int color) </p>
<p>{ </p>
<p>int j; </p>
<p>float dx,dy,k,x,y,startx,starty; </p>
<p>dx=abs(x1-x0); </p>
<p>dy=abs(y1-y0); </p>
<p>k=dy/dx; </p>
<p>if (abs(k)&lt;=1)// ���б�ʲ����� 1 ���� x ���������� y �������� </p>
<p>{ </p>
<p>startx=x0&lt;x1?x0:x1; </p>
<p>for (j=width;j&gt;0;j++) </p>
<p>{ y=starty;// </p>
<p>for(x=startx;x&lt;startx+dx;x+=2) </p>
<p>{ </p>
<p>drawpixel(x,int(y+0.5),color); </p>
<p>y=y+k; </p>
<p>}; </p>
<p>starty=starty+1;// ÿ�λ�һ����Ϊ 1 ��б��ʱ���µ������ </p>
<p>startx=startx-1/k; </p>
<p>} </p>
<p>} </p>
<p>else </p>
<p>{ </p>
<p>starty=y0&lt;y1?y0:y1; </p>
<p>for (j=width;j&gt;0;j++) </p>
<p>{ x=startx; </p>
<p>for(y=starty;y&lt;starty+dy;y+=2) </p>
<p>{ </p>
<p>drawpixel(int(x+0.5),y,color); </p>
<p>x=x+1/k; </p>
<p>}; </p>
<p>startx=startx+1; </p>
<p>starty=starty-1/k; </p>
<p>} </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>�� <span class="style1">дһ��������ͼ�ĳ����ò�ͬ����ɫ����������</span> </p>
<p>Draw_pie(int x, int y,float radius ,float *percent) </p>
<p>{ </p>
<p>float seed_x,seed_y; </p>
<p>int color,i; </p>
<p>color=0; </p>
<p>float angle=0; </p>
<p>draw_circle(x,y,radius); </p>
<p>draw_line(x,y,x+radius,y); </p>
<p>for(i=0;percent[i]&lt;=0;i++) </p>
<p>{ seed_x=x+radius*cos(angle+PI*percent[i]/100); </p>
<p>seed_y=y+radius*sin(angle+PI*percent[i]/100); </p>
<p>/* ���µ������м���һ�����ӵ���Ϊ��ɫ֮�� */ </p>
<p>angle=angle+2*PI*percent[i]/100; </p>
<p>draw_line(x,y,x+radius*cos(),y+radius*sin()); </p>
<p>seed_filling(seed_x,seed_y,color++,BACKGROUND_COLOR); </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>�� <span class="style1">дһ����ʾһ���ַ��ĳ���</span> </p>
<p>��ʾһ���ַ��Ĳο��������£� </p>
<p>Graph_puts(int x0,int y0,char *string) </p>
<p>{ </p>
<p>char current_char; </p>
<p>int font_mask[FONT_WIDTH][FONT_HEIGHT]; </p>
<p>int i,j; </p>
<p>for (j=0;string[j]!=&quot;\0&quot;;j++) </p>
<p>{current_char=string[j]; </p>
<p>get_font(font_mask,current_char);// ���ֿ���ȡ�õ�ǰ����ģ </p>
<p>for(i=0;i&lt;FONT_WIDTH,i++) </p>
<p>for(j=0;j&lt;FONT_HEIGHT,j++) </p>
<p>if (font_mask[i][j]) </p>
<p>write_pixel(x0+i,y0+j,FONT_COLOR); </p>
<p>else </p>
<p>write_pixel(x0+i,y0+j,BACKGROUND_COLOR); </p>
<p>} </p>
<p>} </p>
<p>&nbsp;</p>
<p>�� <span class="style1">д�������߲ü��㷨��д�����ֶ���βü��㷨��</span> </p>
<p>1 ��ʸ���ü��� </p>
<p>2 ������ü��� </p>
<p>3 ���е�ָ�ü��� </p>
<p>����εĲü��㷨�� </p>
<p>1 ����߲ü��� </p>
<p>2 ��˫�߲ü��� </p>
<p>�� ��д���ܻ�������� Bresenham �����㷨������ʾ���ٶ�ֱ�ߵ�б���� 0 �� 1 ֮�䣬�����κγ���������Ի�α���Ա��� </p>
<p>�� �����߶βü��� Cohen-Sutherland �㷨�����߶� <em>AB </em>���вü��� <em>CDEF </em>Ϊ�ü���ֱ�� <em>AB </em>���ֵش����˿򣩡������ü��Ļ������̡� </p>
<p>�㷨����Ҫ˼���ǣ����ζ�ÿ��ֱ�� P1P2 �����´��� </p>
<p>�� ��ֱ�����˵� P1 �� P2 ���������ڵ�������롣 P1 �� P2 �ı���ֱ��Ϊ </p>
<p>C1(P1)={a1, b1, c1, d1} �� C2(P2)={a2, b2, c2, d2} </p>
<p>���У� ai �� bi �� ci �� di ȡֵ��ΧΪ {1, 0} �� i �� {1, 2} �� </p>
<p>�� ��� ai=bi=ci=di=0 ������ʾ����ֱ�ߣ�ȡ����һ��ֱ�ߣ������� (1) �����򣬽��벽�� (3) �� </p>
<p>�� ��� |a1 - a2|=1 ������ֱ���봰�ϱ� (y=yw-max) �Ľ��㣬��ɾȥ�������ϲ��֡���� |b1 - b2|=1 ������ֱ���봰�±� (y=yw-min) �Ľ��㣬��ɾȥ�������²��֡���� |c1 - c2|=1 ������ֱ���봰�ұ� (x=xw-max) �Ľ��㣬��ɾȥ�������Ҳ��֡���� |d1 - d2|=1 ������ֱ���봰��� (x=xw-min) �Ľ��㣬��ɾȥ�������󲿷֡� </p>
�� ������ (1) ��
</body>
</html>
