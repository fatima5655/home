<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<style type="text/css">
<!--
body {
	background-color: #ADBACE;
}
-->
</style>
<link href="css/site.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
String uid=(String)session.getValue("uid");
if(uid==null||uid=="")
{%>
<p>����û�е�½��</p>
<p><a href="default.jsp">�ص���ҳ</a>
<%}else{%>
</p>
<form action="edit2.jsp" method="post">
  <div align="center">
    <p>
      <%
Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
String driver = "jdbc:microsoft:sqlserver://localhost:1433";
String user="jsp";
String password="820728";
Connection conn = DriverManager.getConnection(driver,user,password);
Statement stmt = conn.createStatement();
//���ɲ�ѯ��sql����
String sql="select * from custom where uid='"+uid+"'";
//rsΪ���ؽ����ResultSet����
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String nickname=rs.getString("nickname").trim();
String name=rs.getString("name").trim();
String gender=rs.getString("gender").trim();
String career=rs.getString("career").trim();
String address=rs.getString("address").trim();
String email=rs.getString("email").trim();
String tel=rs.getString("tel").trim();
String birth=rs.getString("birth").trim();
String year=birth.substring(0,4);
String month=birth.substring(5,7);
String date=birth.substring(8,10);
%>
    �밴���±��޸�������Ϣ��</p>
    <hr />
    <table width="527" border="0">
      <tr>
        <td width="153" height="32">�û� ID: </td>
        <td width="364" ><%=uid%>&nbsp;</td>
		<input type="hidden" name="uid" value="<%=uid%>">
      </tr>
      <tr>
        <td height="29">���趨�������룺</td>
        <td><input type="password" name="pwd" /></td>
      </tr>
      <tr>
        <td height="34">��ȷ���������룺</td>
        <td><input type="password" name="pwd1" /></td>
      </tr>
      <tr>
        <td height="27">�����������ǳƣ�</td>
        <td><input type="text" name="nickname"  value="<%=nickname%>"/></td>
      </tr>
      <tr>
        <td height="31">��ѡ�������Ա�</td>
        <td><input name="gender" type="radio" <%if(gender.compareTo("male")==0) out.print("checked");%> value="male" />
    ��
      <input type="radio" name="gender" <%if(gender.compareTo("female")==0) out.print("checked");%> value="female" />
    Ů</td>
      </tr>
      <tr>
        <td height="25">������������ʵ������</td>
        <td><input type="text" name="name"  value="<%=name%>"/></td>
      </tr>
      <tr>
        <td height="24">����������ͨѶ��ַ��</td>
        <td><input type="text" name="address" value="<%=address%>"/></td>
      </tr>
      <tr>
        <td height="25">������������䣺</td>
        <td><input type="text" name="email" value="<%=email%>"/></td>
      </tr>
      <tr>
        <td height="30">��������ϵ�绰��</td>
        <td><input type="text" name="tel" value="<%=tel%>" /></td>
      </tr>
      <tr>
        <td height="28">�������������գ�</td>
        <td><input name="year" type="text" size="10"  value="<%=year%>"/>
    ��
      <input name="month" type="text" size="5"  value="<%=month%>"/>
    ��
    <input name="date" type="text" size="5" value="<%=date%>"/>
    ��(yyyy-mm-dd)</td>
      </tr>
      <tr>
        <td height="28">ְҵ��</td>
        <td><input type="text" name="career"  value="<%=career%>"/></td>
      </tr>
    </table>
    <hr />
    <table width="320" border="0">
      <tr>
        <td height="31"><input type="submit" name="Submit" value="ȷ��" /></td>
        <td><input type="reset" name="Submit2" value="���" /></td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;    </p>
  </div>
</form>
<%}%>
</body>
</html>
