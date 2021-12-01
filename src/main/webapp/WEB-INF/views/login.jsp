<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/bootstrap.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/app.css'/>">
<link rel="stylesheet"
	href="<c:url value='/resources/assets/css/pages/auth.css'/>">
</head>

<body>
	<div id="auth">

		<div class="row h-100">
			<div class="col-lg-5 col-12">
				<div id="auth-left">
					<div class="auth-logo">
						<a href="index.html"><img
							src="<c:url value="resources/assets/images/logo/logo1.png"/>"></a>
					</div>
					<h1 class="auth-title">Đăng nhập.</h1>
					<p class="auth-subtitle mb-5">Đăng nhập vào hệ thống Quản lí
						sinh viên PTIT</p>
					<c:if test="${error!=null}">
						<i style="color: red; float: left;"> ${error}</i>
					</c:if>
					<form action="login"  method="POST">
						<div class="form-group position-relative has-icon-left mb-4">
							<%-- <i style="color: red; float: left;"><form:errors
									path="matkhau"></form:errors></i> <i
								style="color: red; float: left;"><form:errors
									path="tendn"></form:errors></i>  --%>

							<input name="tendn" type="text"
								class="form-control form-control-xl" placeholder="Tên đăng nhập" />

							<div class="form-control-icon">
								<i class="bi bi-person"></i>
							</div>
						</div>
						<div class="form-group position-relative has-icon-left mb-4">
							<input name="matkhau" type="password"
								class="form-control form-control-xl" placeholder="Mật khẩu" />
							<div class="form-control-icon">
								<i class="bi bi-shield-lock"></i>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="form-check form-check-lg d-flex align-items-end">
							<input class="form-check-input me-2" type="checkbox" value=""
								id="flexCheckDefault"> <label
								class="form-check-label text-gray-600" for="flexCheckDefault">
								Giữ đăng nhập </label>
						</div>
						
						<button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Đăng
							nhập</button>
					</form>
					<div class="text-center mt-5 text-lg fs-4">
						<p class="text-gray-600">
							Don't have an account? <a href="auth-register.html"
								class="font-bold">Sign up</a>.
						</p>
						<p>
							<a class="font-bold" href="forgotpasswd">Forgot
								password?</a>.
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-7 d-none d-lg-block">
				<div id="auth-right"></div>
			</div>
		</div>

	</div>
	<script>
        // Switch mode Controller ==================================================================================
       
            // Back button => Login 
        $('.back').on('click', function() {
                $(this).parent().addClass('d-none');
                $('#login').removeClass('d-none');
            })
            // Forget-Password button => Forget Password 
        $('.forget-password').on('click', function() {
                $(this).parent().addClass('d-none');
                $('#forget-password').removeClass('d-none');
            })
            // Signup button => Forget Password
        $('.signup').on('click', function() {
            $(this).parent().addClass('d-none');
            $('#signup').removeClass('d-none');
        })
		// Init =================================================================================================
			$('input:not(input[type="radio"])').val('');
        	$('input[ name="birthday"]').val("1999-08-30");
             $('.err').text('');
             $('.invald').removeClass('invald');
             // For all
             $('input').on('change', function() {
                 $(this).removeClass('invaild')
                 $(this).parent().next('.err').text('');
             })
        // Submit Controller ==================================================================================
        // Login 
        $('#loginform').on('submit', function(e) {
                e.preventDefault();
                // Get Variable
                var user = $('#loginform input[type="text"]');
                var pass = $('#loginform input[type="password"]');
                // Validate
                if (user.val() == "") {
                    user.parent().next().text("Please fill in Email");
                    user.addClass('invaild');
                }
                if (pass.val() == "") {
                    pass.parent().next().text("Please fill in Password");
                    pass.addClass('invaild');
                }else if(pass.val().length < 8){
                	pass.parent().next().text("The length of password at least 8 characters");
                    pass.addClass('invaild');
                } 
                
                // AJAX
                if (user.val() != "" && pass.val() != "" && pass.val().length >= 8) {
                    $.ajax({
                        type: 'POST',
                        url: 'login.htm',
                        data: {
                            username : user.val(),
                            password: pass.val()
                        },
                        success: function(d) {
                        	if(d == "")
                    			await swal('Welcome', 'Nice to see u '+d, 'success');
                    		location.href="admin";
                        	else if(d=="false"){
                        		swal('Oops', 'Wrong password', 'error');
                        	}else if(d != ""){
                        		async function sequence(){
                        			await swal('Welcome', 'Nice to see u '+d, 'success');
                            		location.href="admin";
                                 	}
                                 sequence();
                        		
                        	}
                        	
                        },
                        error: function(e) {
                            swal('Oops', 'This is unavailable email you can sign up with this email 123', 'warning');
                        }
                    })
                }

            })
            function check(what){
        	 if (what.val() == "") {
                 what.parent().next().text("Please fill in "+what.attr('name'));
                 what.addClass('invaild');
                 return false;
             }else
            	 return true;
        	}
        	function checkregex(what, regex){
        		 if (!what.val().match(regex)) {
                     what.parent().next().text("Wrong data type");
                     what.addClass('invaild');
                     return false;
                 }else
                	 return true;
        	}
              // Signup
            $('#signupform').on('submit', function(e) {
                    e.preventDefault();
                    // Get Variable
                    var firstname = $('#signupform input[name="firstname"]');
                    
                    var lastname = $('#signupform input[name="lastname"]');
                    var birthday = $('#signupform input[name="birthday"]');
                    var gender = $('#signupform input[name="gender"]')
                    var email = $('#signupform input[name="email"]');
                    var pass = $('#signupform input[name="password"]');
                    var repass = $('#signupform input[name="repassword"]');
                    var utf8="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
    	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
    	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
                    if(check(firstname) && checkregex(firstname,utf8))
                    	if(check(lastname) && checkregex(lastname,utf8))
                    		if(check(email))
                    			if(check(pass))
                    				if(pass.val().length >=8)
                    				{
	                    				if(check(repass))
		                    					if(pass.val() == repass.val())
		                    						{
		                    						 $('.err').text('');
		                    						 $('.invaild').removeClass('invaild');
		                    						// AJAX
		                    							 $.ajax({
									                        type: 'POST',
									                        url: 'register.htm',
									                        data: {
									                          firstname: firstname.val(),
									                          lastname: lastname.val(),
									                          email: email.val(),
									                          password: pass.val(),
									                          birthday: birthday.val(),
		                    							 	  gender : gender.val(),
									                        },
									                        success: function(d) {
									                        	if(d!="")
									                            swal('Congratulation', "Create new user successfully", "success");
									                        	else
									                        		swal("Sorry","This Email have been taken","error");
									                        },
									                        error: function(e) {
									                            swal('Oops', 'Something happen with database', 'warning');
									                        }
									                    })
		                    						}
		                    					else{
		                    						 pass.parent().next().text("Password and Repassword must be the same");
		                    		                 pass.addClass('invaild');
		                    		                 repass.parent().next().text("Password and Repassword must be the same");
		                    		                 repass.addClass('invaild');
		                    		                
		                    		             }
                    				}else{
                    					
                   					pass.parent().next().text("Password at least 8 characters");
              		                pass.addClass('invaild');
              		          
                   				}
                    
            })
            var codewesent = "";
            var id = 0;
             // Forgot Password
        $('#getcodeform').on('submit', function(e) {
            e.preventDefault();
            // Get Variable
            var email = $('#getcodeform input[type="email"]');
            // Validate
            if (email.val() == "") {
                email.parent().next().text("Please fill in Email");
                email.addClass('invaild');
            } else {
                // AJAX
                $.ajax({
                        type: 'POST',
                        url: 'changepw.htm',
                        data: {
                            email: email.val()
                        },
                        success: function(d) {
                        	if(d.split(',')[0].match("\\d+")){
	                            swal('All right', "We have send some code to your email", "success")
	                            $('#getcodeform').addClass('d-none');
	                            $('#confirmform').removeClass('d-none');
	                            id = parseInt(d.split(',')[1]);
	                            codewesent = d.split(',')[0];
                        	}else if(d == "false"){
                        		 swal('Oops', "Seem like don't have this email in database", "error")
                        	}
                        },
                        error: function(e) {
                            swal('Oops', 'Something went wrong', 'error')
                        }
                    })
                   
            }
        })
        $('#confirmform').on('submit', function(e) {
                e.preventDefault();
                // Get Variable
                var codesent = codewesent; 
               // console.log(codesent);
               // console.log(id);
                var code = $('#confirmform input[name="code"]');
                var pass = $('#confirmform input[name="password"]');
                var repass = $('#confirmform input[name="repassword"]');
                // Validate
                if(check(code))
                	if(check(pass))
                		if(pass.val().length < 8)
                			{
                			pass.parent().next().text("Password must have at least 8 characters");
   		                	 pass.addClass('invaild');
   		                
                			}else	
                			if(check(repass))
                				if(repass.val().length < 8)
                    			{
                					repass.parent().next().text("Password must have at least 8 characters");
          		                	repass.addClass('invaild');
                    			}else
                    				if(pass.val() == repass.val()){
                    					$('.invaild').removeClass('invaild');
                    					$('.err').text('');
                    					$.ajax({
                                            type: 'POST',
                                            url: 'confirmpw.htm',
                                            data: {
                                            	id: id,
                                                pass: pass.val(),
                                                code: code.val()
                                             
                                            },
                                            success: function(d) {
                                            	 if(d=="false"){
                                             		swal('Oops', 'Wrong Code', 'error');
                                             	}
                                            	 else {swal('All right', "Your password have been changed successfully", "success");
                                                $('input:not(input[type="radio"])').val('');
                                            	 }
                                            },
                                            error: function(e) {
                                                swal('Oops', 'Something went wrong', 'error')
                                            }
                                        })
                    				}
                    				else
                    					{
                    					 pass.parent().next().text("Password and Repassword must be the same");
                		                 pass.addClass('invaild');
                		                 repass.parent().next().text("Password and Repassword must be the same");
                		                 repass.addClass('invaild');
                		                 $('input').on('change', function() {
                		                     $(this).removeClass('invaild')
                		                     $(this).parent().next('.err').text('');
                    					})
                    					}
                
              	
        })
               
         
    </script>
</body>

</html>