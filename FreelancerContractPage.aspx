<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="FreelancerContractPage.aspx.cs" Inherits="FreelancerContractPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row heading">
        <h2>Print Contract</h2>
        <p></p>
    </div>
    <section class="main-container col1-layout">
        <div class="main container">
            <div class="row">
                <div class="tools">
                    <a href="#colors_sketch" data-tool="marker">Marker</a> <a href="#colors_sketch" data-tool="eraser">Eraser</a>
                </div>
                <br />
                <canvas id="colors_sketch" width="300px" height="100pxs" ></canvas>
                <br />
                <br />

                <asp:Button ID="btnAdd" Text="Submit" runat="server" class="btn btn-warning" OnClick="btnAdd_Click" />

                <hr />
                <asp:HiddenField ID="ImageVal" runat="server" />
            </div>
        </div>
    </section>
    <%-- <table class="table table-striped">
        <tbody>
            <tr>
                <td colspan="1">

                    <fieldset>
                    

<h2 align=center style='text-align:center'><span lang=EN-GB>DESIGN AGREEMENT</span></h2>

<p class=MsoNormal align=center style='text-align:center'><b><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></b></p>

<p class=MsoNormal style='text-align:justify'><b><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            </span></b><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>This
Graphic Design Agreement (the <b>“Agreement”</b>) is entered into
____________________ (the <b>“Effective Date”</b>), by and between
________________________, with an address of _____________________________ (the
<b>“Client”</b>) and _________________, with an address of
_______________________________, (the <b>“Designer”</b>), collectively “the <b>Parties.</b>”</span></p>

<ol style='margin-top:0cm' start=1 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Project
     Description. </span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'>Client wishes to hire
     Designer to provide Graphic Design services. The specific documents
     requested and the requirements and details required in those documents as
     requested by Client are as follows (the “<b>Deliverables</b>”):</span></li>
</ol>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            ________________________________________________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            ________________________________________________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            ________________________________________________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            ________________________________________________________________________</span></p>

<ol style='margin-top:0cm' start=2 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Schedule.
     </span></b><span lang=EN-GB style='font-size:12.0pt;line-height:107%;
     font-family:"Open Sans",sans-serif'>The Parties agree to the following
     schedule:</span></li>
</ol>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>            Time Frame : _______________________________________________________</span></p>

<ol style='margin-top:0cm' start=3 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Client
     Approval and Revisions. </span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'>Client must approve all materials before project and revision finalization.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Payment.</span></b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'> The Parties agree to the following Payment:</span></li>
</ol>

<p class=MsoNormal style='margin-left:36.0pt;text-align:justify;border:none'><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif;
color:black'>Total Fee for Services: _____________________________________________________</span></p>

<ol style='margin-top:0cm' start=5 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Confidentiality.</span></b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>
     During the course of this Agreement, it may be necessary for Client to
     share proprietary information, including trade secrets, industry
     knowledge, and other confidential information, to Designer in order for
     Designer to complete the Graphic Design services and Deliverables in their
     final form. Designer will not share any of this proprietary information at
     any time. Designer also will not use any of this proprietary information
     for his/her personal benefit at any time. This section remains in full
     force and effect even after termination of the Agreement by it’s natural
     termination or the early termination by either party.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Termination.
     </span></b><span lang=EN-GB style='font-size:12.0pt;line-height:107%;
     font-family:"Open Sans",sans-serif'>This Agreement shall automatically
     terminate upon Client’s acceptance of the deliverables. This Agreement may
     otherwise be terminated at any time by either Party upon written notice to
     the other party. Client will be responsible for all costs and expenses
     incurred prior to the date of termination. </span></li>
</ol>

<p class=MsoNormal style='margin-left:36.0pt;text-align:justify'><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Upon
termination, Designer shall return all Client content, materials, and all
copies of Deliverables to the Client at its earliest convenience, but in no
event beyond thirty (30) days after the date of termination.</span></p>

<ol style='margin-top:0cm' start=7 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Ownership
     Rights.</span></b><span lang=EN-GB style='font-size:12.0pt;line-height:
     107%;font-family:"Open Sans",sans-serif'> Client continues to own any and
     all proprietary information it shares with Designer during the term of
     this Agreement for the purposes of the Agreement. Designer has no rights
     to this proprietary information and may not use it except to complete the
     Graphic Design services. Upon completion of the Agreement, Client will own
     the final Graphic Design Deliverables. </span></li>
</ol>

<p class=MsoNormal style='margin-left:36.0pt;text-align:justify'><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>While
Designer will customize Client’s Graphic Design Deliverables to Client’s
specifications, Client recognizes that Graphic Designs generally can have a
common structure and basis. Designer continues to own any and all template
designs it may have created prior to this Agreement. Designer will further own
any template designs it may create as a result of this Agreement.</span></p>

<ol style='margin-top:0cm' start=8 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Representations
     and Warranties. </span></b></li>
</ol>

<p class=MsoNormal style='margin-left:36.0pt;text-align:justify;border:none'><u><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif;
color:black'>Designer</span></u><span lang=EN-GB style='font-size:12.0pt;
line-height:107%;font-family:"Open Sans",sans-serif;color:black'>. Designer
represents and warrants that he/she has the right to enter into and perform
this Agreement. Designer further represents and warrants that he/she has the
right to utilize and distribute the designs created for Client and that such
designs are not owned by anyone else to Designer’s knowledge. In the event that
Designer does not have these rights, Designer will repay any associated damages
Client may experience or will take responsibility so that Client does not
experience any damages.</span></p>

<p class=MsoNormal style='margin-left:36.0pt;text-align:justify;border:none'><u><span
lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif;
color:black'>Client</span></u><span lang=EN-GB style='font-size:12.0pt;
line-height:107%;font-family:"Open Sans",sans-serif;color:black'>. Client
represents and warrants that is has the rights to use any proprietary
information, including, but not limited to trade secrets, trademarks, logos,
copyrights, images, data, figures, content, and the like that it may provide to
Designer to be included in this Website. In the event that Client does not have
these rights, Client will repay any associated damages Designer may experience
or will take responsibility so that Designer does not experience any damages.</span></p>

<ol style='margin-top:0cm' start=9 type=1>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Disclaimer
     of Warranties.</span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'> Designer shall
     complete Graphic Design services for Client’s purposes and to Client’s
     specifications. DESIGNER DOES NOT REPRESENT OR WARRANT THAT SUCH DELIVERABLES
     WILL CREATE ANY ADDITIONAL PROFITS, SALES, EXPOSURE, BRAND RECOGNITION, OR
     THE LIKE. DESIGNER HAS NO RESPONSIBILITY TO CLIENT IF THE DELIVERABLES DO
     NOT LEAD TO CLIENT’S DESIRED RESULT(S). </span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Limitation
     of Liability. </span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'>UNDER NO
     CIRCUMSTANCES SHALL EITHER PARTY BE LIABILE TO THE OTHER PARTY OR ANY
     THIRD PARTY FOR ANY DAMAGES RESULTING FROM ANY PART OF THIS AGREEMENT SUCH
     AS, BUT NOT LIMITED TO, LOSS OF REVENUE OR ANTICIPATED PROFIT OR LOST
     BUSINESS, COSTS OF DELAY OR FAILURE OF DELIVERY.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Severability.</span></b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>
     In the event any provision of this Agreement is deemed invalid or
     unenforceable, in whole or in part, that part shall be severed from the
     remainder of the Agreement and all other provisions should continue in
     full force and effect as valid and enforceable. </span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Legal
     Fees. </span></b><span lang=EN-GB style='font-size:12.0pt;line-height:
     107%;font-family:"Open Sans",sans-serif'>In the event of a dispute
     resulting in legal action, the successful party will be entitled to its
     legal fees, including, but not limited to its attorneys’ fees.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Legal
     and Binding Agreement.</span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'> This Agreement is
     legal and binding between the Parties as stated above. This Agreement may
     be entered into and is legal and binding both in the United States and
     throughout Europe. The Parties each represent that they have the authority
     to enter into this Agreement.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Governing
     Law and Jurisdiction. </span></b><span lang=EN-GB style='font-size:12.0pt;
     line-height:107%;font-family:"Open Sans",sans-serif'>The Parties agree
     that this Agreement shall be governed by the State and/or Country in which
     both Parties do business. In the event that the Parties do business in
     different States and/or Countries, this Agreement shall be governed by
     _________ law.</span></li>
 <li class=MsoNormal style='color:black;text-align:justify;border:none'><b><span
     lang=EN-GB style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Entire
     Agreement.</span></b><span lang=EN-GB style='font-size:12.0pt;line-height:
     107%;font-family:"Open Sans",sans-serif'> The Parties acknowledge and
     agree that this Agreement represents the entire agreement between the
     Parties. In the event that the Parties desire to change, add, or otherwise
     modify any terms, they shall do so in writing to be signed by both
     parties.</span></li>
</ol>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>The
Parties agree to the terms and conditions set forth above as demonstrated by
their signatures as follows:</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><b><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>“CLIENT”</span></b></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Signed:
<b>_____________________________________</b></span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>By:
________________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Date:
_______________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><b><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>“DESIGNER”</span></b></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Signed:
_____________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>By:
________________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>Date:
______________________________________</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>

<p class=MsoNormal style='text-align:justify'><span lang=EN-GB
style='font-size:12.0pt;line-height:107%;font-family:"Open Sans",sans-serif'>&nbsp;</span></p>


</div>

                        </div>
                    </fieldset>

                </td>
            </tr>
        </tbody>
    </table>--%>
</asp:Content>

