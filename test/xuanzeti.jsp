<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ѡ����</title>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>
<hr>
<p align="center">&nbsp;</p>
<span class="chinese">
<%!
int i=0;
int zhang=1;//Integer.parseInt(request.getParameter("zhang"));
int rightcount=0;
int times=0;
String uid="fafa";
%>
<%
session.setAttribute("uid",uid);
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM xuanzeti");

//�ж�request�����Ƿ��ô�������
//��δ����������Ŀ�����л�����ݣ��򽫼���ɼ�
if(request.getParameter("submit1")==null)
{i=0;

 rightcount=0;%>
<!--����Ĵ��彫��post�����������ݴ��͸�xuanze.jsp�ļ�-->
<!-- ��Ϊ�����ֶΣ���Ĭ��ֵΪϵͳʱ��-->

</span>
<form name="allmyans" action="xuanzeti.jsp" method="post">
<span class="chinese">
<input type="hidden" name="zhang" value="<%=zhang%>">
</span>
<table width="85%" border=0>
<%
String answer;
String answer1;
String answer2;
String answer3;
String answer4;
while(rs.next()){
i++;
%>

<tr>
   <td class="chinese"><%=i%>��
       <%String Qus=rs.getString("tigan");
       System.out.println(Qus);%>
       <%=Qus%>
       <%//session.setAttribute("i",i);
     answer=rs.getString("daan");
     answer1=rs.getString("a");
	 answer2=rs.getString("b");
	 answer3=rs.getString("c");
	 answer4=rs.getString("d");
     session.setAttribute("Qus"+i,Qus);
	 session.setAttribute("Ans"+i,answer);
	 session.setAttribute("Ansa"+i,answer1);
	 session.setAttribute("Ansb"+i,answer2);
	 session.setAttribute("Ansc"+i,answer3);
	 session.setAttribute("Ansd"+i,answer4);

	%>
   </td>
</tr>
<table>
<tr>
   <td class="chinese">
   <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     A.<%=answer1%></td>
   <td class="chinese">
     <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     B.<%=answer2%></td>
   <td class="chinese">
        <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     C.<%=answer3%></td>
   <td class="chinese">
       <!--  <input name="myans<%=i%>" type="radio" value="a" />-->
     D.<%=answer4%></td>
    
</tr>
<tr>
<a href="" target="_blank">�鿴��</a>
</tr>
</table>
<tr>
<td></td>
</tr>
<tr></tr>
<%}
if(i!=0)
{
%>
</table>
<table width="294" border="0">
      <tr>
        <td width="147" class="chinese">
        <input name="submit1" type="submit" class="button1" value="�ύ" />
        </td>
        <td width="137" class="chinese">
        <input name="submit2" type="reset" class="button1" value="���" />
        </td>
      </tr>
  </table>
</form>

<span class="chinese">
<%}
if(i==0){
%>
������ʱû����Ŀ����


<%
}
}
else
{

	//int i=(int)session.getAttribute("i");
//	String zhang1=request.getParameter("zhang");
	int j=1;
	for(j=1;j<=i;j++)
	{%>
</span>
<p class="chinese">��<%=j%>����
  <%
	//��session�����л����Ŀ���
	String Ans=(String)session.getAttribute("Ans"+j);
	String UserAns=request.getParameter("myans"+j);
	%>

  <%
	if(UserAns==null)
	{%>
  <FONT size="4" color="RED">δ����</FONT><BR>
  ��Ŀ��
	<font color="green"><B>
	<!--�����Ŀ-->
	<%=session.getAttribute("Qus"+j)%>
	</B></font><br>
  ����<font color="brown"><B>
  <!--�����-->
  [<%=Ans%>]��<%=session.getAttribute("Ans"+Ans+j)%></B></font>
  <%
	}else if(UserAns.equals(Ans))
	{
	//System.out.println(UserAns);
	 rightcount++;
	 %>
  ��<font size="4" color="blue" >��</font>��

</p>
	<span class="chinese">
	<%
	}
	else {
	%>
	��<font size="4" color="red">��</font>��
	</p>
		��Ŀ��
	    <font color="green"><B>
	<!--�����Ŀ-->
	<%=session.getAttribute("Qus"+j)%>
	    </B></font><br>
	    ����<font color="brown"><B>
	<!--�����-->
	[<%=Ans%>]��<%=session.getAttribute("Ans"+Ans+j)%></B></font>
	    <%}
	}
	
	%>
	</span>
	<h3 class="chinese"><%=i%>�������������<%=rightcount%>��</h3>
	<p class="chinese"><a href=xuanzeti.jsp?zhang=<%=request.getParameter("zhang")%>>�����ģ�����һ��</a>
      <%
String uid=(String)session.getAttribute("uid");
String career=null;
int id=0;
//int zhang1=zhang;
times++;
java.util.Date today;
String dateOut,dateOut1;
Locale currentLocale=new Locale("zh","CN");
DateFormat formatter;
formatter = DateFormat.getDateInstance(DateFormat.LONG,currentLocale);
DateFormat formatter1;
formatter1=DateFormat.getTimeInstance(DateFormat.LONG,currentLocale);
today = new java.util.Date();
dateOut = formatter.format(today);
dateOut1=formatter1.format(today);
//System.out.println(dateOut + " " + currentLocale.toString());
//System.out.println(dateOut1 + " " + currentLocale.toString());
dateOut=dateOut+dateOut1;
String sql="insert into students_xuanze values('"+uid+"','"+career+"',"+zhang+","+rightcount+","+times+",'"+dateOut+"')";
stmt.executeUpdate(sql);
}
//rs.close();
stmt.close();
conn.close();
%>
</p>
	<p class="chinese"><a href="xuanzeti_view.jsp">�鿴���������������</a></p>
	<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
</body>
</html>
