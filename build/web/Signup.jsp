<%-- 
    Document   : Signup
    Created on : Apr 22, 2021, 8:49:06 PM
    Author     : this pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Merch store | Sign Up</title>
        <link rel="icon" href="images/logo.png">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <script type="text/javascript">
            
            function checkUsernameExists(){
                
               var typeText = document.getElementById('username').value;
               console.log("typing"+typeText);
               var xhttp = new XMLHttpRequest();
               
               xhttp.onreadystatechange = function (){
                   
                   if(this.readyState == 4 && this.status == 200){
                       
                        console.log(this.responseText);
                        document.getElementById('usermessage').innerHTML=this.responseText;
                       
                   }
                   
               }
               
               xhttp.open("GET","CheckUsername?username="+typeText,true);
               xhttp.send();
               
            }
            
            function checkEmailExists(){
                
               var typeText = document.getElementById('email').value;
               console.log("typing"+typeText);
               var xhttp = new XMLHttpRequest();
               
               xhttp.onreadystatechange = function (){
                   
                   if(this.readyState == 4 && this.status == 200){
                       
                        console.log(this.responseText);
                        document.getElementById('emailmessage').innerHTML=this.responseText;
                       
                   }
                   
               }
               
               xhttp.open("GET","CheckEmail?email="+typeText,true);
               xhttp.send();
               
            }
            
        </script>
        
        <div class="main">
        <!-- Sign up form -->
        <center>
            <img src="images/heading.jpg" alt="MERCH STORE">
        </center>
        
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" action="UserSignUp" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name"/>
                            </div>
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-tag"></i></label>
                                <input type="text" onkeyup="checkUsernameExists()" name="username" id="username" placeholder="Your username"/>
                            </div>
                            <p style="color: red; font-family: Calibri; font-size: 11px" id="usermessage"></p><br>
                            <div class="form-group">
                                <label for="address"><i class="zmdi zmdi-mall"></i></label>
                                <input type="text" name="address" id="address" placeholder="Your Address"/>
                            </div>
                            <div class="form-group">
                                <label for="mobile"><i class="zmdi zmdi-phone"></i></label>
                                <input type="number" name="mobile" id="mobile" placeholder="Your mobile number"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" onkeyup="checkEmailExists()" name="email" id="email" placeholder="Your Email"/>
                            </div>
                            <p style="color: red; font-family: Calibri; font-size: 11px" id="emailmessage"></p><br>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="index.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>
        </div>
        
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
