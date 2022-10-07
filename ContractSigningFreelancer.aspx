<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContractSigningFreelancer.aspx.cs" Inherits="ContractSigningFreelancer" %>


<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Ease Maker</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- All Plugin Css -->
    <link rel="stylesheet" href="css/plugins.css">

    <link href='https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    <!-- Style & Common Css -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

    <nav class="navbar navbar-default navbar-sticky bootsnav">

        <div class="container">
            <!-- Start Header Navigation -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="default2.aspx"><img src="img/logo.png" class="logo" width="100" /></a>
            </div>
            <!-- End Header Navigation -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                    <li><a href="Default2.aspx">Home</a></li>
                      <li><a href="joblistfreelancer.aspx?ST=&yrs=&cat=">Project List</a></li>
                      <li><a href="ProjectManagementLanding.aspx">My Projects</a></li>
                        <li><a href="billinglistFreelancer.aspx">Billing list</a></li>
                    <%--							<li><a href="companies.html">Companies</a></li> 
                        <li><a href="companies.html">Jobs</a></li> --%>
                    <%--  <li><a href="login.html">Login</a></li>--%>
                  <%--  <li class="dropdown">
                        <a href="addresume.aspx" class="dropdown-toggle" data-toggle="dropdown">File Maintenance</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                           <li class="active"><a href="browse-job.html">Job List</a></li>

                        </ul>
                    </li>--%>
                   <%-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Transaction</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                       <li class="active"><a href="browse-job.html">Job List</a></li>
                              <li class="active"><a href="browse-job.html">Projects</a></li>
                        </ul>
                    </li>--%>
               <%--     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports</a>
                        <ul class="dropdown-menu animated fadeOutUp" style="display: none; opacity: 1;">
                            <li class="active"><a href="browse-job.html">Browse Jobs</a></li>
                            <li><a href="company-detail.html">Job Detail</a></li>
                            <li><a href="resume.html">Resume Detail</a></li>
                        </ul>
                    </li>--%>
                     <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account</a>
                        <ul class="dropdown-menu">
                            <li><a href="myprofileapplicant.aspx">My Profile</a></li>
                            <li><a href="Myportfolio.aspx">My Portfolio</a></li>
                            <li><a href="logout.aspx">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->

    <form runat="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server" />
        

<%--<script language="javascript">
        function printdiv(printpage) {
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item(printpage).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }
    </script>--%>
        <section class="jobs">
        <div class="container">

            <div class="companies">
                <div class="row heading">
                    <h2 class="text-primary"><b>Freelancer Project Contract Signing</b></h2>
                    <p class="text-danger"><small><i>Please Read the contract before signing</i></small></p>
     
        <hr />
                    <div id="div_print">
        <table class="table table-striped">
            <tbody>
                <tr>
                    <td colspan="1">

                        <fieldset style='font-size: 12.0pt; line-height: 150%; font-family: "Open Sans",sans-serif; color: black'>


                            <h2 align="center" style='text-align: center'><span lang="EN-GB">DESIGN AGREEMENT</span></h2>

                            <p class="MsoNormal" align="center" style='text-align: center'>
                                <b><span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>&nbsp;</span></b>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <b><span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'></span></b><span
                                        lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>This
Graphic Design Agreement (the <b>“Agreement”</b>) is entered into
<u><asp:Label ID="lblDate" runat="server"></asp:Label></u> (the <b>“Effective Date”</b>), by and between
<u><asp:Label ID="lblEmployername" runat="server"></asp:Label></u> , with an address of <u><asp:Label ID="lblEmployerAddress" runat="server"></asp:Label></u>  (the
                                        <b>“Client”</b>) and <u><asp:Label ID="lblFreelancename" runat="server"></asp:Label></u> , with an address of
<u><asp:Label ID="lblFreelanceaddress" runat="server"></asp:Label></u> , (the <b>“Designer”</b>), collectively “the <b>Parties.</b>”</span>
                            </p>

                            <ol style='margin-top: 0cm' start="1" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Project
     Description. </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Client wishes to hire
     Designer to provide Graphic Design services. The specific documents
     requested and the requirements and details required in those documents as
     requested by Client:</span></li>
                            </ol>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'><u><asp:Label ID="lblProjectDescription" runat="server"></asp:Label></u> </span>
                            </p>

     <%--                       <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>________________________________________________________________________</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>________________________________________________________________________</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>________________________________________________________________________</span>
                            </p>--%>

                            <ol style='margin-top: 0cm' start="2" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Schedule.
                                </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>The Parties agree to the following
     schedule:</span></li>
                            </ol>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Time Frame : <u><asp:Label ID="lblTimeFrame" runat="server"></asp:Label></u> </span>
                            </p>

                            <ol style='margin-top: 0cm' start="3" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Client
     Approval and Revisions. </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Client must approve all materials before project and revision finalization.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Payment.</span></b><span
                                        lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'> The Parties agree to the following Payment:</span></li>
                            </ol>

                            <p class="MsoNormal" style='margin-left: 36.0pt; text-align: justify; border: none'>
                                <span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif; color: black'>Total Fee for Services: <u><asp:Label ID="lblAmount" runat="server"></asp:Label></u> </span>
                            </p>

                            <ol style='margin-top: 0cm' start="5" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Confidentiality.</span></b><span
                                        lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>
     During the course of this Agreement, it may be necessary for Client to
     share proprietary information, including trade secrets, industry
     knowledge, and other confidential information, to Designer in order for
     Designer to complete the Graphic Design services and Deliverables in their
     final form. Designer will not share any of this proprietary information at
     any time. Designer also will not use any of this proprietary information
     for his/her personal benefit at any time. This section remains in full
     force and effect even after termination of the Agreement by it’s natural
     termination or the early termination by either party.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Termination.
                                </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>This Agreement shall automatically
     terminate upon Client’s acceptance of the deliverables. This Agreement may
     otherwise be terminated at any time by either Party upon written notice to
     the other party. Client will be responsible for all costs and expenses
     incurred prior to the date of termination. </span></li>
                            </ol>

                            <p class="MsoNormal" style='margin-left: 36.0pt; text-align: justify'>
                                <span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Upon
termination, Designer shall return all Client content, materials, and all
copies of Deliverables to the Client at its earliest convenience, but in no
event beyond thirty (30) days after the date of termination.</span>
                            </p>

                            <ol style='margin-top: 0cm' start="7" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Ownership
     Rights.</span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'> Client continues to own any and
     all proprietary information it shares with Designer during the term of
     this Agreement for the purposes of the Agreement. Designer has no rights
     to this proprietary information and may not use it except to complete the
     Graphic Design services. Upon completion of the Agreement, Client will own
     the final Graphic Design Deliverables. </span></li>
                            </ol>

                            <p class="MsoNormal" style='margin-left: 36.0pt; text-align: justify'>
                                <span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>While
Designer will customize Client’s Graphic Design Deliverables to Client’s
specifications, Client recognizes that Graphic Designs generally can have a
common structure and basis. Designer continues to own any and all template
designs it may have created prior to this Agreement. Designer will further own
any template designs it may create as a result of this Agreement.</span>
                            </p>

                            <ol style='margin-top: 0cm' start="8" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Representations
     and Warranties. </span></b></li>
                            </ol>

                            <p class="MsoNormal" style='margin-left: 36.0pt; text-align: justify; border: none'>
                                <u><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif; color: black'>Designer</span></u><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif; color: black'>. Designer
represents and warrants that he/she has the right to enter into and perform
this Agreement. Designer further represents and warrants that he/she has the
right to utilize and distribute the designs created for Client and that such
designs are not owned by anyone else to Designer’s knowledge. In the event that
Designer does not have these rights, Designer will repay any associated damages
Client may experience or will take responsibility so that Client does not
experience any damages.</span>
                            </p>

                            <p class="MsoNormal" style='margin-left: 36.0pt; text-align: justify; border: none'>
                                <u><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif; color: black'>Client</span></u><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif; color: black'>. Client
represents and warrants that is has the rights to use any proprietary
information, including, but not limited to trade secrets, trademarks, logos,
copyrights, images, data, figures, content, and the like that it may provide to
Designer to be included in this Website. In the event that Client does not have
these rights, Client will repay any associated damages Designer may experience
or will take responsibility so that Designer does not experience any damages.</span>
                            </p>

                            <ol style='margin-top: 0cm' start="9" type="1">
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Disclaimer
     of Warranties.</span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'> Designer shall
     complete Graphic Design services for Client’s purposes and to Client’s
     specifications. DESIGNER DOES NOT REPRESENT OR WARRANT THAT SUCH DELIVERABLES
     WILL CREATE ANY ADDITIONAL PROFITS, SALES, EXPOSURE, BRAND RECOGNITION, OR
     THE LIKE. DESIGNER HAS NO RESPONSIBILITY TO CLIENT IF THE DELIVERABLES DO
     NOT LEAD TO CLIENT’S DESIRED RESULT(S). </span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Limitation
     of Liability. </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>UNDER NO
     CIRCUMSTANCES SHALL EITHER PARTY BE LIABILE TO THE OTHER PARTY OR ANY
     THIRD PARTY FOR ANY DAMAGES RESULTING FROM ANY PART OF THIS AGREEMENT SUCH
     AS, BUT NOT LIMITED TO, LOSS OF REVENUE OR ANTICIPATED PROFIT OR LOST
     BUSINESS, COSTS OF DELAY OR FAILURE OF DELIVERY.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Severability.</span></b><span
                                        lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>
     In the event any provision of this Agreement is deemed invalid or
     unenforceable, in whole or in part, that part shall be severed from the
     remainder of the Agreement and all other provisions should continue in
     full force and effect as valid and enforceable. </span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Legal
     Fees. </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>In the event of a dispute
     resulting in legal action, the successful party will be entitled to its
     legal fees, including, but not limited to its attorneys’ fees.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Legal
     and Binding Agreement.</span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'> This Agreement is
     legal and binding between the Parties as stated above. This Agreement may
     be entered into and is legal and binding both in the United States and
     throughout Europe. The Parties each represent that they have the authority
     to enter into this Agreement.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Governing
     Law and Jurisdiction. </span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>The Parties agree
     that this Agreement shall be governed by the State and/or Country in which
     both Parties do business. In the event that the Parties do business in
     different States and/or Countries, this Agreement shall be governed by
     _________ law.</span></li>
                                <li class="MsoNormal" style='color: black; text-align: justify; border: none'><b><span
                                    lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Entire
     Agreement.</span></b><span lang="EN-GB" style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'> The Parties acknowledge and
     agree that this Agreement represents the entire agreement between the
     Parties. In the event that the Parties desire to change, add, or otherwise
     modify any terms, they shall do so in writing to be signed by both
     parties.</span></li>
                            </ol>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>&nbsp;</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>The
Parties agree to the terms and conditions set forth above as demonstrated by
their signatures as follows:</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>&nbsp;</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <b><span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>“CLIENT”</span></b>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Signed:
                                    <b> <asp:Image ID="imgSignClient" runat="server" Width="200" Height="70" /></b></span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>By: <u><asp:Label ID="lblemployer" runat="server"></asp:Label></u></span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Date:<u><asp:Label ID="lblDateEmployer" runat="server"></asp:Label></u></span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>&nbsp;</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>&nbsp;</span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <b><span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>“DESIGNER”</span></b>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Signed:<asp:Image ID="Image1" runat="server" Width="200" Height="70" /></span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>By: <u><asp:Label ID="lblFreelancer" runat="server"></asp:Label></u></span>
                            </p>

                            <p class="MsoNormal" style='text-align: justify'>
                                <span lang="EN-GB"
                                    style='font-size: 12.0pt; line-height: 107%; font-family: "Open Sans",sans-serif'>Date:<u><asp:Label ID="lblDateFreelancer" runat="server"></asp:Label></u></span>
                            </p>                            

                           <%-- </div>

                        </div>--%>
                        </fieldset>

                    </td>
                </tr>
            </tbody>
        </table>
            </div>
                    
                </div></div>
            <div class="text-center">
                <button class="btn btn-warning" width="100%" name="b_print" onclick="printdiv('div_print');" type="button><i class="fa fa-print"></i> Print</button>
            </div>
            </section> 
        
       <div id="divSignature" class = "main container text-center">
           <hr />
                <div class="row">
                    <h4>Please Affix your Signature Here:</h4>
                </div>
                <div class="row">
                    <div class="tools">
                        <a class="btn btn-xs btn-info" href="#colors_sketch" data-tool="marker"><i class="fa fa-pencil"></i> Marker</a> 
                        <a class="btn btn-xs btn-danger" href="#colors_sketch" data-tool="eraser"><i class="fa fa-eraser"></i> Eraser</a>
                    </div>
                    <br />
        
                    <canvas id="colors_sketch" style="border: 2px solid black"  width="400px" height="150pxs" > </canvas>
      
                    <br />
                    <br />

                    <asp:Button ID="btnAdd" Text="Submit" runat="server" class="btn btn-success" width="100%" OnClick="btnAdd_Click" />

                    <hr />
                    <asp:HiddenField ID="ImageVal" runat="server" />
                </div>
            </div>
    </form>




    <!-- footer start -->
    <footer>
        <%--	<div class="container">
				<div class="col-md-3 col-sm-6">
					<h4>Featured Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Latest Job</h4>
					<ul>
						<li><a href="#">Browse Jobs</a></li>
						<li><a href="#">Premium MBA Jobs</a></li>
						<li><a href="#">Access Database</a></li>
						<li><a href="#">Manage Responses</a></li>
						<li><a href="#">Report a Problem</a></li>
						<li><a href="#">Mobile Site</a></li>
						<li><a href="#">Jobs by Skill</a></li>
					</ul>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Reach Us</h4>
					<address>
					<ul>
					<li>1201, Murakeu Market, QUCH07<br>
					United Kingdon</li>
					<li>Email: Support@job.com</li>
					<li>Call: 044 123 458 65879</li>
					<li>Skype: job@skype</li>
					<li>FAX: 123 456 85</li>
					</ul>
					</address>
				</div>
				
				<div class="col-md-3 col-sm-6">
					<h4>Drop A Mail</h4>
					<form>
						<input type="text" class="form-control input-lg" placeholder="Your Name">
						<input type="text" class="form-control input-lg" placeholder="Email...">
						<textarea class="form-control" placeholder="Message"></textarea>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
				
				
			</div>--%>
        
    </footer>


    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/owl.carousel.min.js"></script>
    <script src="js/bootsnav.js"></script>
    <script src="js/main.js"></script>
    <script src="https://cdn.rawgit.com/mobomo/sketch.js/master/lib/sketch.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            "use strict";
            $('#colors_sketch').sketch();
            $(".tools a").eq(0).attr("style", "color:#000");
            $(".tools a").click(function () {
                $(".tools a").removeAttr("style");
                $(this).attr("style", "color:#000");
            });
            $("#btnAdd").bind("click", function () {
                var base64 = $('#colors_sketch')[0].toDataURL();
                $('[Id*=ImageVal]').val(base64);
            });
        });
    </script>
    <script language="javascript">
        function printdiv(printpage) {
            var headstr = "<html><head><title></title></head><body>";
            var footstr = "</body>";
            var newstr = document.all.item(printpage).innerHTML;
            var oldstr = document.body.innerHTML;
            document.body.innerHTML = headstr + newstr + footstr;
            window.print();
            document.body.innerHTML = oldstr;
            return false;
        }
    </script>
    <script>
        var signatureFile = document.getElementById("Image1").src
        if (signatureFile != null || signatureFile != '' || !signatureFile.empty()) {
            var divSign = document.getElementById("divSignature")
            divSign.remove()
        }

    </script>
</body>

</html>



