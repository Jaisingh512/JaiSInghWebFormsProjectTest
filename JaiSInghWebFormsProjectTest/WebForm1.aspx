<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JaiSInghWebFormsProjectTest.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .col-sm-6 {
            padding: 3px;
        }

        
        .spancs{

            color:red;
        }

        ul > li {
            display: inline-block;
            padding-left: 0px;
        }

        ul {
            border: 1px solid black;
            padding: 0px;
        }


         .table  input[type=button]{


           padding:3px;
           border-radius:4px;

        }
    </style>
</head>
<body>
    <script>  
        $(document).ready(function () {

            window.history.replaceState('', '', window.location.href);
           

           
            document.getElementById("updatedvalue").innerText = document.getElementById("<%= hidden10.ClientID%>").value; 


          
            var isedit = document.getElementById("<%= Hidden2.ClientID%>").value;
            if (isedit != "" && isedit != null) {

                if (isedit == "editmode") {


                    document.getElementById("eid").innerText = document.getElementById("<%= hidden1.ClientID%>").value;
                    document.getElementById("addingemploy").innerText = "EDIT EMPLOY";
                    document.getElementById("btnaddnew").style.display = "block";
                    document.getElementById("eid1").style.display = "block";
                  
                    document.getElementById("sumbitorupdate").innerText = "UPDATE";
                }




            }








        });



        function checkforname() {

            var v = document.getElementById("name").value;
            if (v == "" || v == null) {

                namechk = true;

                document.getElementById("namechk").innerText = "Name can not be empty";
                return false;


            } else {

                document.getElementById("namechk").innerText = "";
                return true;

            }




        }

        function ValidateEmail(inputText) {

            var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (inputText.match(mailformat)) {


                return true;
            }
            else {


                return false;
            }
        }


        function checkforemail() {


            var v = document.getElementById("Email").value;

            var s = ValidateEmail(v);






            if (s) {
                document.getElementById("emailchk").innerText = "";
                return true;





            } else {


                document.getElementById("emailchk").innerText = "invalid email";
                return false;
            }




        }


        function checkforemail() {


            var v = document.getElementById("Email").value;

            var s = ValidateEmail(v);






            if (s) {
                document.getElementById("emailchk").innerText = "";
                return true;





            } else {


                document.getElementById("emailchk").innerText = "invalid email";
                return false;
            }




        }


        function phonenumber(inputtxt) {
            var phoneno = /^\d{10}$/;
            if (inputtxt.match(phoneno)) {
                return true;
            }
            else {

                return false;
            }
        }

        function checkforphone() {


            var v = document.getElementById("phone").value;

            var s = phonenumber(v);






            if (s) {
                document.getElementById("phonechk").innerText = "";
                return true;





            } else {


                document.getElementById("phonechk").innerText = "invalid Phone no";
                return false;
            }




        }

        function val(x) {

        

            editdetails();


            document.getElementById("<%= hidden1.ClientID%>").value = x.id;

            document.getElementById("<%= button2.ClientID%>").click();

        }

        function editdetails() {



            document.getElementById("addingemploy").innerText = "EDIT EMPLOY";

        }


        function deleteemploy(x) {

           
            document.getElementById("<%= hidden1.ClientID%>").value = x.id;

            document.getElementById("<%= button3.ClientID%>").click();





        }



        function sumbmitdata() {

            var nchk = checkforname();
            if (!nchk) {
                alert("enter the name")
                return;

            }



            var chph = checkforphone();
            if (!chph) {

                alert("enter the phone")
                return;

            }

            var chem = checkforemail();
            if (!chem) {

                alert("enter the email")
                return;
            }






            document.getElementById("<%= button4.ClientID%>").click();

        }


    </script>

    <div class="container">
        <form id="form1" runat="server">
            <div>
                <div style="text-align: center; background-color:deepskyblue;color:white; font-size: 20px; font-weight: bold">
                    <span id="addingemploy"></span><span style="display: none;" id="eid1">(<span id="eid" style="color: red;"></span>)</span>
                </div>
                <div style="padding-top: 20px; padding-bottom: 20px;border-radius:10px;background-color:aliceblue;">
                    <span id="updatedvalue" style="color:blue;"></span>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="col-sm-3">
                                <label>Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox  onblur="checkforname()" runat="server" ID="name"> </asp:TextBox>
                                      <span class="spancs" id="namechk"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="col-sm-3">
                                <label>Email</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox  onblur="checkforemail()"  runat="server" ID="Email"> </asp:TextBox>
                                    <span class="spancs"  id="emailchk"></span>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="col-sm-3">
                                <label>phone</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox   onblur="checkforphone()"  runat="server" ID="phone"> </asp:TextBox>
                                   <span class="spancs" id="phonechk"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="background-color:white;margin-top:10px;" >


                    <div class="col-sm-1">
                       <button type="button" id="sumbitorupdate" style="margin-right:3px;"  class="btn btn-primary" onclick="sumbmitdata()" >submit</button>
                    </div>
                    <div class="col-sm-1" style="padding-left:0px;margin-left:5px;">
                        <asp:Button ID="btnaddnew"  CssClass="btn"
                            Style="display: none;background-color:hotpink;" OnClick="refreshthispage" Text="ADD NEW" runat="server" />
                    </div>
                </div>



                <div>
                </div>

            </div>
            <asp:HiddenField runat="server" ID="hidden1" />
             <asp:HiddenField runat="server" ID="hidden10" />
            <asp:HiddenField runat="server" ID="Hidden2" />
         <asp:Button ID="button4" OnClick="submitFormData" Style="display: none" Text="submit" runat="server" />
            <asp:Button ID="button2" OnClick="editformdata" Style="display: none" Text="submit" runat="server" />
               <asp:Button ID="button3" OnClick="deleteformdata" Style="display: none" Text="submit" runat="server" />

            <div>
                <h1>List of Employs</h1>
                <asp:Table CssClass="table table-responsive-lg" ID="Table1" runat="server"></asp:Table>
            </div>
        </form>


    </div>



    <script>
        document.getElementById("addingemploy").innerText = "ADD EMPLOY";
    </script>

</body>
</html>
