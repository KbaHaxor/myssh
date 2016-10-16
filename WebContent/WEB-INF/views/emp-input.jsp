<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add New Employee</title>
<link rel="stylesheet" href="assets/uikit/css/uikit.almost-flat.min.css">
<link rel="stylesheet" href="assets/uikit/css/datepicker.almost-flat.min.css">
<style>
  #emp-edit-form {
    text-align: center;
  }
  #emp-edit-form input {
    display: inline-block;
  }
</style>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/uikit/js/uikit.min.js"></script>
<script src="assets/uikit/js/datepicker.min.js"></script>
<script>
    $(function() {
        $(":input[name=lastName]").change(function() {
            var $this = $(this);
            var lastName = $this.val();
            lastName = $.trim(lastName);
            
            var url = "emp-validateLastName";
            var args = { "lastName": lastName, "time": new Date() };
            
            if (lastName != "") {
                
                $this.nextAll("font").remove();
                
                $.post(url, args, function(data) {
                    if (data == "0") {
                        $this.after("&nbsp;<font color='green'>该用户名可用</font>");
                    } else if (data == "1") {
                        $this.after("&nbsp;<font color='red'>该用户名不可用!</font>");
                    } else {
                        alert("Server Error!");
                    }
                });
            } else {
                alert("LastName 不能为空");
                $(this).val("");
                $this.focus();
            }
        });
    });
</script>
</head>
<body>

  <h2 class="uk-text-muted uk-text-center uk-margin-top">Employee Editing Page</h2>

  <s:form action="emp-save" method="post" id="emp-edit-form" theme="simple" class="uk-form">
    <fieldset data-uk-margin>
        <legend>Add or Edit Employee Information</legend>
        <div class="uk-form-row">
          <s:if test="id != null">
            <s:textfield name="lastName" label="LAST NAME" disabled="true"></s:textfield>
            <%-- 不要忘了把 edit 带过来的 id 带过去，否则在 Action 类里面永远是创建新记录，而非修改记录 --%>
            <s:hidden name="id"></s:hidden>
          </s:if>
          <s:else>
            <s:textfield name="lastName" label="LAST NAME"  placeholder="Last Name"></s:textfield>
          </s:else>
        </div>
        
        <div class="uk-form-row">
          <s:textfield name="email" label="EMAIL" placeholder="Email"></s:textfield>
        </div>
        
        <div class="uk-form-row">
          <s:textfield name="birth" label="BIRTH" placeholder="Birthday" data-uk-datepicker="{format:'YYYY-MM-DD'}"></s:textfield>
        </div>
        <%-- 这里整理日期格式需要配置 Struts2 的日期转换器，即字符串和日期类型的相互转换 --%>
    
        <div class="uk-form-row">
          <label>Departments: </label>
          <s:select list="#request.departments" listKey="id" listValue="departmentName" name="department.id" label="Departments"></s:select>
          &nbsp;&nbsp;&nbsp;<button type="submit" class="uk-button">Submit</button>
        </div>
        <%-- listKey 对应具体生成的 HTML 属性里的 value，listValue 对应显示的内容，name 对应表单提交的属性名 --%>
    </fieldset>
  </s:form>

  <div class="uk-container uk-container-center uk-margin-top">
    <a href="index.jsp" class="uk-button uk-button-primary uk-button-large uk-width-1-3 uk-align-center"><span class="uk-icon-home uk-icon-small"></span>&nbsp;&nbsp;Back to Entry Page</a>
  </div>

</body>
</html>