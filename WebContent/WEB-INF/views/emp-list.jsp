<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee List</title>
<link rel="stylesheet" href="assets/uikit/css/uikit.almost-flat.min.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/uikit/js/uikit.min.js"></script>
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

  <h2 class="uk-text-muted uk-text-center uk-margin-top">Information of All Employees</h2>
  
  <div class="uk-container uk-container-center" data-uk-margin>
    <table class="uk-table uk-table-striped uk-table-middle">
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
            <td>${id}</td>
            <td>${lastName}</td>
            <td>${email}</td>
            <td><s:date name="birth" format="yyyy-MM-dd" /></td>
            <td><s:date name="createTime" format="yyyy-MM-dd hh:mm:ss" /></td>
            <td>${department.departmentName}</td>
            <td><a href="emp-input?id=${id}" class="uk-button uk-button-small">Edit</a></td>
            <td><a href="emp-delete?id=${id}" class="delete uk-button uk-button-small uk-button-danger">Delete</a><input type="hidden" value="${lastName }" /></td>
          </tr>
        </s:iterator>
      </tbody>
    </table>
  </div>

  <div class="uk-container uk-container-center">
    <a href="index.jsp" class="uk-button uk-button-primary uk-button-large uk-width-1-3 uk-align-center"><span class="uk-icon-home uk-icon-small"></span>&nbsp;&nbsp;Back to Entry Page</a>
  </div>

</body>
</html>