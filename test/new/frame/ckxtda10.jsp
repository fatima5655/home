<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<link href="../../css/site.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style4 {font-size: 18px}
.style5 {color: #996600}
-->
</style>
</head>

<body>
<span class="style4">ϰ �� ʮ</span><br>
��<span class="style5">д���߽��ʾ�İ�����ݽṹ�и�����solid, loop, edge, halfedge, vertex�������ݽṹ�����Ը������еĳ�Ա�ĺ�����Խ��͡�</span><br>
struct solid<br>
{<br>
Id Solidno; /*solid identifier*/<br>
Face *sfaces; /*pointer to list faces*/<br>
Edge *sedges; /*pointer to list of vertices*/<br>
Vertex *sverts; /*pointer to list of solid*/<br>
Solid *nexts; /*pointer to next solid*/<br>
Solid *prevs; /*pointer to previous solid*/<br>
};<br>
struct face<br>
{<br>
Id faceno; /*face identifier*/<br>
Solid *fsolid; /*back pointer to solid*/<br>
Loop *flout; /*pointer to outer loop*/<br>
Loop *floops; /*pointer to list of loops*/<br>
vector feq; /*face equation*/ ��SURFACE *fgeom ;��<br>
Face *nextf; /*pointer to next face*/<br>
Face *prevf; /*pointer to previous face*/<br>
};
<p>struct loop<br>
  {<br>
  HalfEdge *lege; /*pointer to ring of halfedges*/<br>
  Face *lface; /*back pointer to face*/<br>
  Loop *nextl; /*pointer to next loop*/<br>
  Loop *prevl; /*pointer to previous face*/<br>
  };<br>
  struct halfedge<br>
  {<br>
  Edge *edg; /*pointer to parent edge*/<br>
  Vertex *vtx; /*pointer to starting vertex*/<br>
  Loop *wloop; /*back pointer to loop*/<br>
  HalfEdge *nxt; /*pointer to next halfedge*/<br>
  HalfEdge *prv; /*pointer to previous halfedge*/<br>
  };<br>
  struct vertex<br>
  {<br>
  Id vertexno; /*vertex identifier*/<br>
  HalfEdge *vedge; /*pointer to a halfedge*/<br>
  vector vcoord; /*vertex coordinates*/<br>
  Vertex *nextv; /*pointer to next vertex*/<br>
  Vertex *prevv; /*pointer to previous vertex*/<br>
  };<br>
  struct edge<br>
  {<br>
  HalfEdge *he1; /*pointer to right halfedge*/<br>
  HalfEdge *he2; /*pointer to left halfedge*/<br>
  Edge *nexte; /*pointer to next edge*/<br>
  Edge *preve; /*pointer to previous edge*/<br>
  Curve *cgeom ;<br>
  };<br>
</p>
<p>��<span class="style5">��֪vΪ������ݽṹ�е�һ���㣬��������v���ߵ������������㡣</span><br>
  Ҫʵ����һ�����Ĺؼ���Ҫ�Զ���һ��ת�����ڵ���һ�档�������´�����ʵ�֣�����mate(he)�ĺ������������he���ߵ���һ����ߣ���<br>
  #define mate(he) (((he)= =(he)-&gt;edg-&gt;he1 ? (he)-&gt;edg-&gt;he2 : (he)-&gt;edg-&gt;he1)<br>
  void listneighbor(Vertex *v)<br>
  {<br>
  HalfEdge *adj;<br>
  adj = v-&gt;vedge;<br>
  if (adj)<br>
  {<br>
  do<br>
  {<br>
  printf(��%d��,adj-&gt;nxt-&gt;vtx-&gt;vertexno);<br>
  }while((adj �C mate(adj)-&gt;nxt) != v-&gt;vedge);<br>
  }<br>
  else<br>
  printf(��no adjacent vertices��);<br>
  printf(��\n��);<br>
  }<br>
</p>
<p>�� <span class="style5">д����ŷ������������ɨ����Ĺ��̡�</span><br>
  �ƶ���ɨ�㷨ʹ��һ������ƽ��FACE����ָ��һ���ƶ�����dx,dy,dz��������dx,dy,dz�ֱ��ʾ�ƶ���������Ϸ�����ͨ��ŷ���������Զ�����һ��������İ�����ݽṹ��<br>
  �����㷨���£�<br>
  / * procedure sweep is a translation sweeping routine<br>
  It takes a face fac of a solid, and sweeps it along<br>
  a vector [dx, dy, dz ].<br>
  * / <br>
  void sweep(fac, dx, dy, dz)<br>
  Face * fac;<br>
  Float dx, dy, dz;<br>
  {<br>
  Loop * l;<br>
  HalfEdge*first, *scan;<br>
Vertex * v;</p>
<p>lgetmaxnames(fac-&gt;fsolid);<br>
  l = fac-&gt;floops;<br>
  while(l)<br>
  {<br>
  first = l-&gt;ledg; / * a * /<br>
  scan = first-&gt;nxt;<br>
  v =scan-&gt;vtx;<br>
  lmev(scan, scan, ++maxv,<br>
  v-&gt;vcoord[0]+dx,<br>
  v-&gt;vcoord[1]+dy,<br>
  v-&gt;vcoord[2]+dz); / * b * /</p>
<p>while(scam ! = first)<br>
  {<br>
  v = scan-&gt;nxt-&gt;vtx;<br>
  lmev(scan-&gt;nxt, scan-&gt;nxt, ++maxv,<br>
  v-&gt;vcoord[0]+dx,<br>
  v-&gt;vcoord[1]+dy,<br>
  v-&gt;vcoord[2]+dz); / * c * /<br>
  lmef(scan-&gt;prv, scan-&gt;nxt-&gt;nxt, ++maxf); / * d * /<br>
  scan = mate(scan-&gt;nxt)-&gt;nxt;<br>
  } / * e * /<br>
  lmef(scan-&gt;prv, scan-&gt;nxt, ++maxf);<br>
  l = l-&gt;nextl;<br>
  }<br>
  }<br>
  / * end of sweep * /<br>
  �����ӳ���lgetmaxnames(fac��fsolid)�Ĺ��ܣ�����solid��face t��vertex�е�����ţ���Id���֣����������Ƿֱ𸳸�����maxf��maxv �����������¶������������֮ʱ��������++maxv�ķ��������׵����Ը��������������ֵ�Ψһ�ԡ�<br>
</p>
<p>�� <span class="style5">�����������</span><br>
  �����ǲ�����������Ԫ������һ���Ĺ������壻������һ������״����ӳ���ϵ�����п�Ԥ�Ե����ʡ�<br>
</p>
</body>
</html>
