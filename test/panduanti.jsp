<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ж���</title>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body class="chinese">
<hr />
<p align="left">
<%!
int i=0;
int rightcount=0;
int times=0;
%>
<%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
int zhang=Integer.parseInt(request.getParameter("zhang"));
ResultSet rs=stmt.executeQuery("SELECT * FROM panduanti");
//�ж�request�����Ƿ��ô�������
//��δ����������Ŀ�����л�����ݣ��򽫼���ɼ�
if(request.getParameter("submit1")==null)
{i=0;
 rightcount=0;%>
<!--����Ĵ��彫��post�����������ݴ��͸�xuanze.jsp�ļ�-->
<!-- ��Ϊ�����ֶΣ���Ĭ��ֵΪϵͳʱ��-->
<form name="allmyans" action="panduanti.jsp" method="post">
<input type="hidden" name="zhang" value="<%=zhang%>">
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
   <td><%=i%>��<%String Qus=rs.getString("tigan");%><%=Qus%>
   <%//session.setAttribute("i",i);
     answer=rs.getString("daan");
     session.setAttribute("Qus"+i,Qus);
	 session.setAttribute("Ans"+i,answer);
	%></td>
</tr>
<table>
<tr>
<td width="100%"><a href="" target="_blank">�鿴��</a></td>


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
        <td width="147"><input name="submit1" type="submit" class="button1" value="�ύ" /></td>
        <td width="137"><input name="submit2" type="reset" class="button1" value="���" /></td>
      </tr>
  </table>
</form>
<%
}
if(i==0)
{%>
������ʱû���ж�����Ŀ����
<%
}
}
else
{
	String zhang1=request.getParameter("zhang");
	System.out.println(zhang1);
	//int i=(int)session.getAttribute("i");
	int j=1;
	for(j=1;j<=i;j++)
	{%>
	<p>��<%=j%>����
	<%
	//��session�����л����Ŀ���
	String Ans=(String)session.getAttribute("Ans"+j);
	String UserAns=request.getParameter("myans"+j);
	%>

	<%
	if(UserAns==null)
	{%>
	<FONT size="4" color="RED">δ����</FONT><BR>��Ŀ��
	<font color="green"><B>
	<!--�����Ŀ-->
	<%=session.getAttribute("Qus"+j)%>
	</B></font><br>����<font color="brown"><B><!--�����-->
	[<%=Ans%>]</B></font>
	<%
	}else if(UserAns.equals(Ans))
	{
	//System.out.println(UserAns);
	 rightcount++;
	 %>
	 ��<font size="4" color="blue" >��</font>��

	</p>
	<%
	}
	else {
	
	%>��<font size="4" color="red">��</font>��</p>
		��Ŀ��
	<font color="green"><B>
	<!--�����Ŀ-->
	<%=session.getAttribute("Qus"+j)%>
	</B></font><br>����<font color="brown"><B><!--�����-->
	[<%=Ans%>]</B></font>
	<%}
	}
	
	%>
	<h3><%=i%>�������������<%=rightcount%>��</h3>
	<a href=panduanti.jsp?zhang=<%=zhang1%>>�����ģ�����һ��</a>
<%
/*String uid="fafa";
String career=null;
int id=0;
int zhang=1;
times++;
String sql="insert into custom (id,uid,career,zhang,rightcount,times) values('"+id+"','"+uid+"','"+career+"','"+zhang+"','"+rightcount+"','"+times+"','"+"')";
stmt.executeUpdate(sql);*/
String uid="fafa";//(String)session.getAttribute("uid");
String career=null;
int id=0;
//int zhang=1;
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
String sql="insert into students_panduan values('"+uid+"','"+career+"',"+zhang+","+rightcount+","+times+",'"+dateOut+"')";

//stmt.executeUpdate(sql);
}
rs.close();
stmt.close();
conn.close();
%>
<p align="left"><a href="panduanti_view.jsp">�鿴���������������</a></p>
</body>
</html>
