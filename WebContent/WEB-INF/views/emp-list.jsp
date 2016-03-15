<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="scripts/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(function() {
        $(".delete").click(function() {
            var $tr = $(this).parent().parent();
            var lastName = $(this).next(":hidden").val();
            var flag = confirm("Delete the record of " + lastName + " ?");
            
            if (flag) {
                var url = this.href;
                var args = { "time": new Date() };
                $.post(url, args, function(data) {
                    if (data == 0) {
                        alert("Record deleted!");
                        $tr.remove();
                    } else {
                        alert("Error occurred!");
                    }
                });
            }
            return false;
        });
    });
</script>
</head>
<body>

  <h4>Information of All Employees</h4>

  <table border="1" cellpadding="10" cellspacing="0">
    <thead>
      <tr>
        <th>ID</th>
        <th>LAST NAME</th>
        <th>EMAIL</th>
        <th>BIRTH</th>
        <th>CREATE TIME</th>
        <th>DEPARTMENT</th>
        <th>EDIT</th>
        <th>DELETE</th>
      </tr>
    </thead>

    <tbody>
      <s:iterator value="#request.employees">
        <tr>
          <td>${id }</td>
          <td>${lastName }</td>
          <td>${email }</td>
          <td><s:date name="birth" format="yyyy-MM-dd" /></td>
          <td><s:date name="createTime" format="yyyy-MM-dd hh:mm:ss" /></td>
          <td>${department.departmentName }</td>
          <td><a href="emp-input?id=${id }">edit</a></td>
          <td><a href="emp-delete?id=${id }" class="delete">delete</a><input type="hidden" value="${lastName }" /></td>
        </tr>
      </s:iterator>
    </tbody>
  </table>

</body>
</html>