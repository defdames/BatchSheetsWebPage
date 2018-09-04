<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BatchSheetsWebPage.Default"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />

</head>

<body>
    <form id="form1" runat="server">

        <div style="height: 1500px; width: 550px; overflow: scroll; float: left">


            <asp:Label ID="Label1" runat="server" Text="Search By Grade"></asp:Label>
            <asp:TextBox ID="txtGradeSearch" runat="server"></asp:TextBox>
            <br />
         
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />


            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />


  
            
            <asp:HiddenField ID="hdnRowID" runat="server" />
            <asp:HiddenField ID="hdPageIndex" runat="server" />
            <asp:GridView runat="server" ID="BatchesGrid" AllowSorting="true" AutoGenerateColumns="false" AlternatingRowStyle-BackColor="#cff0fa" OnRowCommand="BatchesGrid_RowCommand"
                AllowPaging="true" PageSize="25" OnPageIndexChanging="gridView_PageIndexChanging" OnSelectedIndexChanged="BatchesGrid_SelectedIndexChanged" Width="525px" DataKeyNames="Row">
                <PagerSettings PageButtonCount="15" />
                <RowStyle Height="20px" />
                <AlternatingRowStyle BackColor="#CFF0FA"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="Row" HeaderText="Row" />
                    <asp:BoundField DataField="DATE" HeaderText="Date" />
                    <asp:BoundField DataField="GRADE" HeaderText="Grade" />
                    <asp:BoundField DataField="MIXER" HeaderText="Mixer" />
                    <asp:BoundField DataField="COMMENTS" HeaderText="Comments" />
                   
                    <asp:ButtonField ButtonType="Link" Text="View" CommandName="View"/>
                    <asp:ButtonField ButtonType="Link" Text="Copy" CommandName="Copy" />
                    <asp:ButtonField ButtonType="Link" Text="Print" CommandName="Print" />
                    <%--<asp:ButtonField ButtonType="Link" Text="Print2" CommandName="Print2" />--%>



                </Columns>

            </asp:GridView>


           
        </div>
        <div id="divHiddenField" runat="server" visible="false" style="height: 46px; margin-left:560px;">
            <asp:HiddenField ID="hdnintRow" runat="server"/>
        </div>
        <div id="divButtons" runat="server" visible="false" style="height: 46px; margin-left:560px;">
            <asp:Button runat="server" id ="btnNew" Text="New" OnClick="btnNew_Click" />&nbsp;<asp:Button runat="server" id ="btnEdit" Text="Edit" OnClick="btnEdit_Click"/>&nbsp;<asp:Button runat="server" id ="btnCancel" Text="Cancel"/>
        </div>
        <div id="divNewButtons" runat="server" visible="false" style="height: 46px; margin-left:560px;">
            <asp:Button runat="server" id ="btnInsert" Text="Insert"  OnClick="btnNewBatch_Click"/>&nbsp<asp:Button runat="server" id ="btnNewCancel" Text="Cancel" OnClick="btnNewCancel_Click"/>
        </div>
         <div id="divEditButtons" runat="server" visible="false" style="height: 46px; margin-left:560px;">
            <asp:Button runat="server" id ="btnUpdate" Text="Update"  OnClick="btnEditBatch_Click"/>&nbsp<asp:Button runat="server" id ="btnEditCancel" Text="Cancel" OnClick="btnEditCancel_Click"/>
        </div>
        <div id="divInfo" runat="server" visible="false" style="height: 1500px; margin-left:560px; overflow: scroll;">
            
            <asp:Table ID="tblBatchInfo" runat="server" >
                <asp:TableRow>
                    <asp:TableCell  Text="DATE:">
                         <asp:TextBox ID="txtBatchDate" runat="server" BorderStyle="None" Enabled="false" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                   
                   <asp:TableCell Text="MIXER:" BorderStyle="None">
                      <asp:TextBox ID="txtMixer" runat="server" BorderStyle="None" Enabled="false" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="GRADE:">
                       <asp:TextBox ID="txtGrade" runat="server" BorderStyle="None" Enabled="false" Width="150px"></asp:TextBox>
                    </asp:TableCell>
          
                   <asp:TableCell  Text="BATCH NUMBER:">
                         <asp:TextBox ID="txtBatchNumber" runat="server" BorderStyle="None" Enabled="false" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                
                
                <asp:TableRow>
                    <asp:TableCell runat="server" Width="150px">

                    </asp:TableCell>
                    <asp:TableCell Text="COMMENTS">
                        <asp:TextBox ID="txtComments" runat="server" BorderStyle="None" Enabled="false" Width="300px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label6" runat="server" Width="150px"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell  BackColor="Yellow" Text="LOCKOUT MIXER PRIOR TO SAMPLING, SCRAPING, OR ANYTHING THAT REQUIRES REACHING INTO THE MIXER" Font-Size="XX-Small">
                       
                    </asp:TableCell>
                 
               </asp:TableRow>
                <asp:TableRow>
                     <asp:TableCell Text="Adage Item Code:" >
                        <asp:TextBox ID="txtAdageItemCode" runat="server" BorderStyle="None" Enabled="false" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                 
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <asp:Table runat="server" ID="tblBatchIngredients" BorderStyle="Groove" CssClass="info">
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label9" runat="server" Text="Row"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label10" runat="server" Text="INGREDIENT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label11" runat="server" Text="LOT NO"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label12" runat="server" Text="AMOUNT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label13" runat="server" Text="LOADED BY"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label14" runat="server" Text="1"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng1">
                        <%--<asp:TextBox ID="txtIng1" runat="server" Enabled="false" BorderStyle="None" CssClass="input"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo1">
                        <%--<asp:TextBox ID="txtLotNo1" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount1">
                        <%--<asp:TextBox ID="txtAmount1" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy1">
                        <%--<asp:TextBox ID="txtLoadedBy1" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label15" runat="server" Text="2"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng2">
                        <%--<asp:TextBox ID="txtIng2" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo2">
                        <%--<asp:TextBox ID="txtLotNo2" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount2">
                        <%--<asp:TextBox ID="txtAmount2" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy2">
                        <%--<asp:TextBox ID="txtLoadedBy2" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label16" runat="server" Text="3"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng3">
                        <%--<asp:TextBox ID="txtIng3" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo3">
                        <%--<asp:TextBox ID="txtLotNo3" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount3">
                        <%--<asp:TextBox ID="txtAmount3" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy3">
                        <%--<asp:TextBox ID="txtLoadedBy3" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label17" runat="server" Text="4"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng4">
                        <%--<asp:TextBox ID="txtIng4" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo4">
                        <%--<asp:TextBox ID="txtLotNo4" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount4">
                        <%--<asp:TextBox ID="txtAmount4" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy4">
                        <%--<asp:TextBox ID="txtLoadedBy4" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label18" runat="server" Text="5"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng5">
                        <%--<asp:TextBox ID="txtIng5" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo5">
                        <%--<asp:TextBox ID="txtLotNo5" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount5">
                        <%--<asp:TextBox ID="txtAmount5" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy5">
                        <%--<asp:TextBox ID="txtLoadedBy5" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label19" runat="server" Text="6"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng6">
                        <%--<asp:TextBox ID="txtIng6" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo6">
                        <%--<asp:TextBox ID="txtLotNo6" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount6">
                        <%--<asp:TextBox ID="txtAmount6" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy6">
                        <%--<asp:TextBox ID="txtLoadedBy6" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label20" runat="server" Text="7"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng7">
                        <%--<asp:TextBox ID="txtIng7" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo7">
                        <%--<asp:TextBox ID="txtLotNo7" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount7">
                        <%--<asp:TextBox ID="txtAmount7" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy7">
                        <%--<asp:TextBox ID="txtLoadedBy7" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label21" runat="server" Text="8"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng8">
                        <%--<asp:TextBox ID="txtIng8" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID ="tcLotNo8">
                        <%--<asp:TextBox ID="txtLotNo8" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount8">
                        <%--<asp:TextBox ID="txtAmount8" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy8">
                        <%--<asp:TextBox ID="txtLoadedBy8" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label22" runat="server" Text="9"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng9">
                        <%--<asp:TextBox ID="txtIng9" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo9">
                        <%--<asp:TextBox ID="txtLotNo9" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount9">
                        <%--<asp:TextBox ID="txtAmount9" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy9">
                        <%--<asp:TextBox ID="txtLoadedBy9" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label23" runat="server" Text="10"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng10">
                        <%--<asp:TextBox ID="txtIng10" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo10">
                        <%--<asp:TextBox ID="txtLotNo10" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount10">
                        <%--<asp:TextBox ID="txtAmount10" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy10">
                        <%--<asp:TextBox ID="txtLoadedBy10" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label24" runat="server" Text="11"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng11">
                        <%--<asp:TextBox ID="txtIng11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo11">
                        <%--<asp:TextBox ID="txtLotNo11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount11">
                        <%--<asp:TextBox ID="txtAmount11" runat="server" Enabled="false" BorderStyle="None" BackColor="White"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy11">
                        <%--<asp:TextBox ID="txtLoadedBy11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label51" runat="server" Text="12"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcIng12">
                        <%--<asp:TextBox ID="txtIng11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLotNo12">
                        <%--<asp:TextBox ID="txtLotNo11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcAmount12">
                        <%--<asp:TextBox ID="txtAmount11" runat="server" Enabled="false" BorderStyle="None" BackColor="White"></asp:TextBox>--%>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcLoadedBy12">
                        <%--<asp:TextBox ID="txtLoadedBy11" runat="server" Enabled="false" BorderStyle="None"></asp:TextBox>--%>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Speed:" Width="50px" ForeColor="Blue" Font-Size="XX-Small"  BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                    <asp:TableCell ID="tcSpeed" BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell Text="O2 INST:" Width="50px" ForeColor="Blue" Font-Size="XX-Small"  BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                    <asp:TableCell ID="tc02INST"  BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            <br />
            <br />
            <asp:Table  runat ="server" ID="tblInstructions">
                <asp:TableRow>
                    <asp:TableCell Text ="MIXING INSTRUCTIONS" Font-Bold="true">

                    </asp:TableCell>
                   
                    <asp:TableCell Text="BEFORE LOADING ENSURE MIXER INSULATION IS INTACT. IF NOT, NOTIFY SUPERVISOR." ForeColor="Red" HorizontalAlign="Left" Font-Size="X-Small">

                    </asp:TableCell>
                </asp:TableRow>
               
                <asp:TableRow>
                    <asp:TableCell ColumnSpan ="2" ID="tcMixInst">


                    </asp:TableCell>
                </asp:TableRow>
                 
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" ID="tcComments">

                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            <br />
            <br />
            <br />
            <br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell ID="tcPotFormula">

                    </asp:TableCell>
                    <asp:TableCell Width="100px">

                    </asp:TableCell>
                    <asp:TableCell ID="tcSampleAndLabel">

                    </asp:TableCell>
                    <asp:TableCell Width="100px">

                    </asp:TableCell>
                    <asp:TableCell ID="tcPressData">

                    </asp:TableCell>
                    <asp:TableCell Width="100px">

                    </asp:TableCell>

                    <asp:TableCell ID="tcIngred">

                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Type of Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcTypeOfDrum" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="Number of Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcNumberofDrums" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="Weight Per Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcWeightPerDrum" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="Weight Produced" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcWeightProduced" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="PRINTED SHEET VALID" Font-Bold="true">

                    </asp:TableCell>
                    <asp:TableCell id="tcPrintedSheetValid" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="THEOR WT" Font-Bold="true">

                    </asp:TableCell>
                    <asp:TableCell id="tcTheorWt" Width ="200px" HorizontalAlign="Left">
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4" HorizontalAlign="Right" Font-Size="XX-Small" Text="REVISION NO. 002<br />
                                                            FORM NO. PB-010"></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" ID="Button1" Text="New" OnClick="btnNew_Click" />&nbsp;<asp:Button runat="server" ID="Button2" Text="Edit" OnClick="btnEdit_Click" />&nbsp;<asp:Button runat="server" ID="Button3" Text="Cancel" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
        <div id ="divNew" runat="server" visible="false" style="height: 1500px; margin-left:560px; overflow: scroll;">
             <asp:Table ID="Table1" runat="server" >
                <asp:TableRow>
                    <asp:TableCell Text="DATE:" >
                       
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox ID="txtNewDate" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                   <asp:TableCell Text="MIXER:">
                       
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox ID="txtNewMixer" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="GRADE:">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNewGrade" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                   <asp:TableCell Text="BATCH NUMBER:" >
                        
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtNewBatchNumber" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                      </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                     <asp:TableCell Text="Adage Item Code:">
                       
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNewAdageItemCode" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell Text="Comments:">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNewComments" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            <br />
            <asp:Table runat="server" ID="tblNewBatch" BorderStyle="Groove" CssClass="info">
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label32" runat="server" Text="Row"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label33" runat="server" Text="INGREDIENT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label34" runat="server" Text="LOT NO"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label35" runat="server" Text="AMOUNT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label36" runat="server" Text="LOADED BY"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label37" runat="server" Text="1"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng1">
                        <asp:TextBox ID="txtIng1" runat="server" Enabled="true" BorderStyle="None" CssClass="input"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo1">
                        <asp:TextBox ID="txtLotNo1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount1">
                        <asp:TextBox ID="txtAmount1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy1">
                        <asp:TextBox ID="txtLoadedBy1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label38" runat="server" Text="2"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng2">
                        <asp:TextBox ID="txtIng2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo2">
                        <asp:TextBox ID="txtLotNo2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount2">
                        <asp:TextBox ID="txtAmount2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy2">
                        <asp:TextBox ID="txtLoadedBy2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label39" runat="server" Text="3"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng3">
                        <asp:TextBox ID="txtIng3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo3">
                        <asp:TextBox ID="txtLotNo3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount3">
                        <asp:TextBox ID="txtAmount3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy3">
                        <asp:TextBox ID="txtLoadedBy3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label40" runat="server" Text="4"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng4">
                        <asp:TextBox ID="txtIng4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo4">
                        <asp:TextBox ID="txtLotNo4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount4">
                        <asp:TextBox ID="txtAmount4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy4">
                        <asp:TextBox ID="txtLoadedBy4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label41" runat="server" Text="5"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng5">
                        <asp:TextBox ID="txtIng5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo5">
                        <asp:TextBox ID="txtLotNo5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount5">
                        <asp:TextBox ID="txtAmount5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy5">
                        <asp:TextBox ID="txtLoadedBy5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label42" runat="server" Text="6"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng6">
                        <asp:TextBox ID="txtIng6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo6">
                        <asp:TextBox ID="txtLotNo6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount6">
                        <asp:TextBox ID="txtAmount6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy6">
                        <asp:TextBox ID="txtLoadedBy6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label43" runat="server" Text="7"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng7">
                        <asp:TextBox ID="txtIng7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo7">
                        <asp:TextBox ID="txtLotNo7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount7">
                        <asp:TextBox ID="txtAmount7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy7">
                        <asp:TextBox ID="txtLoadedBy7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label44" runat="server" Text="8"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng8">
                        <asp:TextBox ID="txtIng8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID ="tcNewLotNo8">
                        <asp:TextBox ID="txtLotNo8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount8">
                        <asp:TextBox ID="txtAmount8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy8">
                        <asp:TextBox ID="txtLoadedBy8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label45" runat="server" Text="9"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng9">
                        <asp:TextBox ID="txtIng9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo9">
                        <asp:TextBox ID="txtLotNo9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount9">
                        <asp:TextBox ID="txtAmount9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy9">
                        <asp:TextBox ID="txtLoadedBy9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label46" runat="server" Text="10"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng10">
                        <asp:TextBox ID="txtIng10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo10">
                        <asp:TextBox ID="txtLotNo10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount10">
                        <asp:TextBox ID="txtAmount10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy10">
                        <asp:TextBox ID="txtLoadedBy10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label47" runat="server" Text="11"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng11">
                        <asp:TextBox ID="txtIng11" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo11">
                        <asp:TextBox ID="txtLotNo11" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount11">
                        <asp:TextBox ID="txtAmount11" runat="server" Enabled="true" BorderStyle="None" BackColor="White"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy11">
                        <asp:TextBox ID="txtLoadedBy11" runat="server" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label52" runat="server" Text="12"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewIng12">
                        <asp:TextBox ID="txtIng12" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLotNo12">
                        <asp:TextBox ID="txtLotNo12" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewAmount12">
                        <asp:TextBox ID="txtAmount12" runat="server" Enabled="true" BorderStyle="None" BackColor="White"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcNewLoadedBy12">
                        <asp:TextBox ID="txtLoadedBy12" runat="server" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Speed:" Width="50px" ForeColor="Blue" Font-Size="XX-Small" BorderStyle="Groove" HorizontalAlign="Center">
                        
                    </asp:TableCell>
                    <asp:TableCell ID="tcSpeedNew" BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:TextBox runat="server" ID="txtNewSpeed" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="O2 INST:" Width="50px" ForeColor="Blue" Font-Size="XX-Small" BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                    <asp:TableCell ID="tc02INSTNew" BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:TextBox runat="server" ID="txtNew02INST" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
           

            <asp:Table  runat ="server" ID="tblNewIntruction">
                <asp:TableRow>
                    <asp:TableCell Text ="MIXING INSTRUCTIONS" Font-Bold="true">
                    </asp:TableCell>
                   
                    <asp:TableCell Text="BEFORE LOADING ENSURE MIXER INSULATION IS INTACT. IF NOT, NOTIFY SUPERVISOR." ForeColor="Red" HorizontalAlign="Left" Font-Size="X-Small">

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan ="2" ID="tcNewMixInst">
                         <asp:TextBox runat="server" ID="txtNewMix" Enabled="True" BorderStyle="Solid"  Wrap="true" TextMode="MultiLine" Width="600px" Height="100px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                
             
            </asp:Table>
            <br />
            <br />
            <br />
            <br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Pot Formula">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewPotFormula" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                 
                    <asp:TableCell Text="Sample And Label">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewSampleandLabel" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="Press Data">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewPressData" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>

                    <asp:TableCell Text="Ingred">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewIngred" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
             <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Type of Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox runat="server" ID="txtNewTypeofDrum" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                    <asp:TableCell Text="Number of Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewNumberofDrum" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="Weight Per Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewWeightPerDrum" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="Weight Produced" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:TextBox runat="server" ID="txtNewWeightProduced" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="PRINTED SHEET VALID" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcNewPrintedSheetValid" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="THEOR WT"  ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtNewTheorWt" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4" HorizontalAlign="Right" Font-Size="XX-Small" Text="REVISION NO. 002<br />
                                                            FORM NO. PB-010"></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" ID="btnNewInsert2" Text="Insert" OnClick="btnNewBatch_Click" />&nbsp;<asp:Button runat="server" ID="Button6" Text="Cancel" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
          <div id ="divEdit" runat="server" visible="false" style="height: 1500px; margin-left:560px; overflow: scroll;">
             <asp:Table ID="Table2" runat="server" >
                <asp:TableRow>
                    <asp:TableCell Text="DATE:" >
                       
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox ID="txtEditDate" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                   <asp:TableCell Text="MIXER:">
                       
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox ID="txtEditMixer" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="GRADE:">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEditGrade" runat="server" BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                   <asp:TableCell Text="BATCH NUMBER:" >
                        
                    </asp:TableCell>
                      <asp:TableCell>
                          <asp:TextBox ID="txtEditBatchNumber" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                      </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                     <asp:TableCell Text="Adage Item Code:">
                       
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEditAdageItemCode" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell Text="Comments">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEditComments" runat="server"  BorderStyle="Solid" BorderWidth="1" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
            <br />
            <br />
            <asp:Table runat="server" ID="Table3" BorderStyle="Groove" CssClass="info">
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label2" runat="server" Text="Row"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label3" runat="server" Text="INGREDIENT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label4" runat="server" Text="LOT NO"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label5" runat="server" Text="AMOUNT"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label7" runat="server" Text="LOADED BY"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label8" runat="server" Text="1"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng1">
                        <asp:TextBox ID="txtEditIng1" runat="server" Enabled="true" BorderStyle="None" CssClass="input"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo1">
                        <asp:TextBox ID="txtEditLotNo1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount1">
                        <asp:TextBox ID="txtEditAmount1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy1">
                        <asp:TextBox ID="txtEditLoadedBy1" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label25" runat="server" Text="2"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng2">
                        <asp:TextBox ID="txtEditIng2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo2">
                        <asp:TextBox ID="txtEditLotNo2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount2">
                        <asp:TextBox ID="txtEditAmount2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy2">
                        <asp:TextBox ID="txtEditLoadedBy2" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label26" runat="server" Text="3"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng3">
                        <asp:TextBox ID="txtEditIng3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo3">
                        <asp:TextBox ID="txtEditLotNo3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount3">
                        <asp:TextBox ID="txtEditAmount3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy3">
                        <asp:TextBox ID="txtEditLoadedBy3" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label27" runat="server" Text="4"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng4">
                        <asp:TextBox ID="txtEditIng4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo4">
                        <asp:TextBox ID="txtEditLotNo4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount4">
                        <asp:TextBox ID="txtEditAmount4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy4">
                        <asp:TextBox ID="txtEditLoadedBy4" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label28" runat="server" Text="5"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng5">
                        <asp:TextBox ID="txtEditIng5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo5">
                        <asp:TextBox ID="txtEditLotNo5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount5">
                        <asp:TextBox ID="txtEditAmount5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy5">
                        <asp:TextBox ID="txtEditLoadedBy5" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label29" runat="server" Text="6"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng6">
                        <asp:TextBox ID="txtEditIng6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo6">
                        <asp:TextBox ID="txtEditLotNo6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount6">
                        <asp:TextBox ID="txtEditAmount6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy6">
                        <asp:TextBox ID="txtEditLoadedBy6" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label30" runat="server" Text="7"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng7">
                        <asp:TextBox ID="txtEditIng7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo7">
                        <asp:TextBox ID="txtEditLotNo7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount7">
                        <asp:TextBox ID="txtEditAmount7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy7">
                        <asp:TextBox ID="txtEditLoadedBy7" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label31" runat="server" Text="8"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng8">
                        <asp:TextBox ID="txtEditIng8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID ="tcEditLotNo8">
                        <asp:TextBox ID="txtEditLotNo8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount8">
                        <asp:TextBox ID="txtEditAmount8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy8">
                        <asp:TextBox ID="txtEditLoadedBy8" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label48" runat="server" Text="9"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng9">
                        <asp:TextBox ID="txtEditIng9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo9">
                        <asp:TextBox ID="txtEditLotNo9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount9">
                        <asp:TextBox ID="txtEditAmount9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy9">
                        <asp:TextBox ID="txtEditLoadedBy9" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label49" runat="server" Text="10"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng10">
                        <asp:TextBox ID="txtEditIng10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo10">
                        <asp:TextBox ID="txtEditLotNo10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount10">
                        <asp:TextBox ID="txtEditAmount10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy10">
                        <asp:TextBox ID="txtEditLoadedBy10" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label50" runat="server" Text="11"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng11">
                        <asp:TextBox ID="txtEditIng11" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo11">
                        <asp:TextBox ID="txtEditLotNo11" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount11">
                        <asp:TextBox ID="txtEditAmount11" runat="server" Enabled="true" BorderStyle="None" BackColor="White"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy11">
                        <asp:TextBox ID="txtEditLoadedBy11" runat="server" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:Label ID="Label53" runat="server" Text="12"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditIng12">
                        <asp:TextBox ID="txtEditIng12" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLotNo12">
                        <asp:TextBox ID="txtEditLotNo12" runat="server" Enabled="true" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditAmount12">
                        <asp:TextBox ID="txtEditAmount12" runat="server" Enabled="true" BorderStyle="None" BackColor="White"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell BorderStyle="Groove" HorizontalAlign="Center" ID="tcEditLoadedBy12">
                        <asp:TextBox ID="txtEditLoadedBy12" runat="server" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Speed:" Width="50px" ForeColor="Blue" Font-Size="XX-Small" BorderStyle="Groove" HorizontalAlign="Center">
                        
                    </asp:TableCell>
                    <asp:TableCell ID="tcSpeedEdit" BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:TextBox runat="server" ID="txtEditSpeed" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="O2 INST:" Width="50px" ForeColor="Blue" Font-Size="XX-Small" BorderStyle="Groove" HorizontalAlign="Center">

                    </asp:TableCell>
                    <asp:TableCell ID="tc02INSTEdit" BorderStyle="Groove" HorizontalAlign="Center">
                        <asp:TextBox runat="server" ID="txtEdit02INST" Enabled="True" BorderStyle="None"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
           

            <asp:Table  runat ="server" ID="Table4">
                <asp:TableRow>
                    <asp:TableCell Text ="MIXING INSTRUCTIONS" Font-Bold="true">
                    </asp:TableCell>
                   
                    <asp:TableCell Text="BEFORE LOADING ENSURE MIXER INSULATION IS INTACT. IF NOT, NOTIFY SUPERVISOR." ForeColor="Red" HorizontalAlign="Left" Font-Size="X-Small">

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan ="2" ID="tcEditMixInst">
                         <asp:TextBox runat="server" ID="txtEditMixInst" Enabled="True" BorderStyle="Solid"  Wrap="true" TextMode="MultiLine" Width="600px" Height="100px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                
               
            </asp:Table>
            <br />
            <br />
            <br />
            <br />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Pot Formula">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditPotFormula" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                 
                    <asp:TableCell Text="Sample And Label">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditSampleaAndLabel" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Text="Press Data">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditPressData" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>

                    <asp:TableCell Text="Ingred">
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditIngred" BorderStyle="Solid" BorderWidth="1" TextMode="MultiLine" Height="50px" Width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
             <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Type of Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:TextBox runat="server" ID="txtEditTypeOfDrum" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                    <asp:TableCell Text="Number of Drums" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditNumberOfDrums" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="Weight Per Drum" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditWeightPerDrum" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="Weight Produced" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:TextBox runat="server" ID="txtEditWeightProduced" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                  <asp:TableCell Text="PRINTED SHEET VALID" ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell id="tcEditPrintedSheetValid" Width ="200px" HorizontalAlign="Left">

                    </asp:TableCell>
                    
                    <asp:TableCell Width ="100px">

                    </asp:TableCell>

                     <asp:TableCell Text="THEOR WT"  ForeColor="Blue">

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="txtEditTHEORWT" BorderStyle="Solid" BorderWidth="1" TextMode="SingleLine"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4" HorizontalAlign="Right" Font-Size="XX-Small" Text="REVISION NO. 002<br />
                                                            FORM NO. PB-010"></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" ID="Button4" Text="Update" OnClick="btnEditBatch_Click" />&nbsp;<asp:Button runat="server" ID="Button5" Text="Cancel" OnClick="btnEditCancel_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
