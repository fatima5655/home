<SCRIPT language="javascript">
function backward()
{
      history.back();
}
function teacher()
{
window.location="new/frame/index.html";
}


</SCRIPT>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	background-color: #99CCFF;
	background-image: url(images/bj36.gif);
}
-->
</style></head>

<body>


<p>
  <%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
boolean a;
String select;
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
//��ȡ�ύ�ı�����
String uid=request.getParameter("uid");
String pwd=request.getParameter("pwd");
String career=request.getParameter("select");
//���ɲ�ѯ��sql����
String sql="select * from custom where uid='"+uid+"'and pwd='"+pwd+"'";
//rsΪ���ؽ����ResultSet����
ResultSet rs=stmt.executeQuery(sql);
a=rs.next();

if(a==true)
{
//�û�id������������ȷ�����
System.out.println("student");
rs.close();
session.setAttribute("uid",uid);
%>
  <img src="images/logon.GIF" width="134" height="36" /><img src="images/xingxing.gif" width="121" height="19" /></p>
<!--<table width="434" border="0">
  <tr>
    <td width="57"><form name="form2" id="form2" method="post" action="logoff.jsp">
      <input type="submit" name="Submit" value="ע��" />
    </form></td>
    <td width="118"><form name="form3" id="form3" method="post" action="edit1.jsp">
      <input type="submit" name="Submit22" value="�鿴/�޸ĸ�����Ϣ" />
    </form></td>
    <td width="124">&nbsp;</td>
    <td width="117">&nbsp;</td>
  </tr>
</table>-->

<script language="javascript">
teacher();
</script>
<%}
else
{
//�����������
//System.out.println(a);
//System.out.println(select);
rs.close();
%>
</p>
<p>&nbsp;</p>
<p>�Բ�����������������������д��</p>
<p><input type="button" name="Button2" value="������һ��" onclick="backward()"></p>
<%}%>
</body>
</html>
