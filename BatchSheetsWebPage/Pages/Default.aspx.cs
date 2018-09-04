using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.Entity;
using System.Data.Common;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;


namespace BatchSheetsWebPage
{
    

    
    public partial class Default : System.Web.UI.Page
    {

        adageAzureEntities context = new adageAzureEntities();
        //adageAzureEntities conext1 = new adageAzureEntities();
        protected void Page_PreInit(object sender, EventArgs e)
        {

            
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillGridPanel2();
            }

        


           
        }

        
        
        protected void FillGridPanel()
        {
            using (adageAzureEntities context = new adageAzureEntities())

            {
                var data = (from batch in context.BATCH_SHEETS_New
                            where batch.BATCH_NUMBER != null
                            select new BatchSheet { Row = batch.Row, Adage_Item_Code = batch.Adage_Item_Code, AMOUNT1 = batch.AMOUNT1, AMOUNT2 = batch.AMOUNT2,
                                AMOUNT3 = batch.AMOUNT3, AMOUNT4 = batch.AMOUNT4, AMOUNT5 = batch.AMOUNT5, AMOUNT6 = batch.AMOUNT6, AMOUNT7 = batch.AMOUNT7,
                                AMOUNT8 = batch.AMOUNT8, AMOUNT9 = batch.AMOUNT9, AMOUNT10 = batch.AMOUNT10, AMOUNT11 = batch.AMOUNT11, AMOUNT12 = batch.AMOUNT12,
                                BATCH_NUMBER = batch.BATCH_NUMBER, BLADE_SPEED = batch.BLADE_SPEED, DATE = batch.DATE, EXPIRATION_DATE = batch.EXPIRATION_DATE,
                                FORM_VERSION = batch.FORM_VERSION, GRADE = batch.GRADE, INGRED = batch.INGRED, INGREDIENT1 = batch.INGREDIENT1, INGREDIENT2 = batch.INGREDIENT2,
                                INGREDIENT3 = batch.INGREDIENT3, INGREDIENT4 = batch.INGREDIENT4, INGREDIENT5 = batch.INGREDIENT5, INGREDIENT6 = batch.INGREDIENT6,
                                INGREDIENT7 = batch.INGREDIENT7, INGREDIENT8 = batch.INGREDIENT8, INGREDIENT9 = batch.INGREDIENT9, INGREDIENT10 = batch.INGREDIENT10,
                                INGREDIENT11 = batch.INGREDIENT11, INGREDIENT12 = batch.INGREDIENT12, INST2 = batch.INST2, LastUpdate = batch.LastUpdate,
                                LOADED_BY1 = batch.LOADED_BY1, LOADED_BY2 = batch.LOADED_BY2, LOADED_BY3 = batch.LOADED_BY3, LOADED_BY4 = batch.LOADED_BY4, LOADED_BY5 = batch.LOADED_BY5,
                                LOADED_BY6 = batch.LOADED_BY6, LOADED_BY7 = batch.LOADED_BY7, LOADED_BY8 = batch.LOADED_BY8, LOADED_BY9 = batch.LOADED_BY9, LOADED_BY10 = batch.LOADED_BY10,
                                LOADED_BY11 = batch.LOADED_BY11, LOADED_BY12 = batch.LOADED_BY12, LOT_NO1 = batch.LOT_NO1, LOT_NO2  = batch.LOT_NO2, LOT_NO3 =  batch.LOT_NO3,
                                LOT_NO4 = batch.LOT_NO4, LOT_NO5 = batch.LOT_NO5,LOT_NO6 = batch.LOT_NO6, LOT_NO7 = batch.LOT_NO7, LOT_NO8 = batch.LOT_NO8, LOT_NO9 = batch.LOT_NO9,
                                LOT_NO10 = batch.LOT_NO10, LOT_NO11 = batch.LOT_NO11, LOT_NO12 = batch.LOT_NO12, MIXER = batch.MIXER, MIXER_BATCH_SHEET = batch.MIXER_BATCH_SHEET,
                                MIXING_INSTRUCTIONS = batch.MIXING_INSTRUCTIONS, NameofMachine = batch.NameofMachine, NUMBER_OF_DRUMS = batch.NUMBER_OF_DRUMS, OPER = batch.OPER,
                                OPER_Copy = batch.OPER_Copy, POT_FORMULA = batch.POT_FORMULA, PRESS_DATA = batch.PRESS_DATA, REVISION_DATE = batch.REVISION_DATE, SAMPLE_AND_LABEL = batch.SAMPLE_AND_LABEL,
                                SPEED = batch.SPEED, STORAGE = batch.STORAGE, THEOR_WT= batch.THEOR_WT, TYPE_OF_DRUM = batch.TYPE_OF_DRUM, WEIGHT_PER_DRUM = batch.WEIGHT_PER_DRUM,
                                WEIGHT_PRODUCED = batch.WEIGHT_PRODUCED, WhichUser = batch.WhichUser}).ToList();
                BatchesGrid.DataSource = data;
                BatchesGrid.DataBind();
            }

        }

        protected void FillGridPanel2()
        {
            using (adageAzureEntities context = new adageAzureEntities())

            {

                var data = (from batch in context.BATCH_SHEETS_New

                            select batch).ToList();
                BatchesGrid.DataSource = data;
                BatchesGrid.DataBind();
            }


        }

        protected void SearchFillGridPanel()
        {
            using (adageAzureEntities context = new adageAzureEntities())
            {
                var search = (from batch in context.BATCH_SHEETS_New
                              where batch.GRADE.Contains(txtGradeSearch.Text)
                              select batch).ToList();
                BatchesGrid.DataSource = search;
                 BatchesGrid.DataBind();
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            using (adageAzureEntities context = new adageAzureEntities())
            {
                SearchFillGridPanel();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            FillGridPanel2();
            txtGradeSearch.Text = "";
        }


        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            if (txtGradeSearch.Text == "")
            {
                FillGridPanel2();
                BatchesGrid.PageIndex = e.NewPageIndex;

                BatchesGrid.DataBind();
            }

            else
            {
                using (adageAzureEntities context = new adageAzureEntities())
                {
                    var search = (from batch in context.BATCH_SHEETS_New
                                  where batch.GRADE.Contains(txtGradeSearch.Text)
                                  select batch).ToList();
                    BatchesGrid.DataSource = search;
                    BatchesGrid.PageIndex = e.NewPageIndex;

                    BatchesGrid.DataBind();
                }
             

            }
          
        }



        protected void BatchesGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName == "View")
            {



                int intSelectPage = Convert.ToInt32(e.CommandArgument);


                GridViewRow SelectedRow = BatchesGrid.Rows[intSelectPage];
                int intRow = Convert.ToInt32(SelectedRow.Cells[0].Text);
                hdnintRow.Value = Convert.ToInt32(SelectedRow.Cells[0].Text).ToString();
                int inthiddenvalue = Convert.ToInt32(hdnintRow.Value);
                #region view

                //int intRow = Convert.ToInt32(BatchesGrid.SelectedRow.Cells[0].Text);

                string strMixInst;
                string strComments;
                string strSampleAndLabel;
                string strIngred;
                string strPotFormula;
                string strPressData;
                using (adageAzureEntities context = new adageAzureEntities())

                {
                    var search = (from batch in context.BATCH_SHEETS_New
                                  where batch.Row == inthiddenvalue
                                  select batch).SingleOrDefault();

                    divInfo.Visible = true;
                    divButtons.Visible = true;
                    txtBatchDate.Text = search.DATE;
                    txtBatchNumber.Text = search.BATCH_NUMBER;
                    txtGrade.Text = search.GRADE;
                    txtAdageItemCode.Text = search.Adage_Item_Code;
                    txtMixer.Text = search.MIXER;


                    tcAmount1.Text = search.AMOUNT1;
                    tcAmount2.Text = search.AMOUNT2;
                    tcAmount3.Text = search.AMOUNT3;
                    tcAmount4.Text = search.AMOUNT4;
                    tcAmount5.Text = search.AMOUNT5;
                    tcAmount6.Text = search.AMOUNT6;
                    tcAmount7.Text = search.AMOUNT7;
                    tcAmount8.Text = search.AMOUNT8;
                    tcAmount9.Text = search.AMOUNT9;
                    tcAmount10.Text = search.AMOUNT10;
                    tcAmount11.Text = search.AMOUNT11;
                    tcAmount12.Text = search.AMOUNT12;

                    tcIng1.Text = search.INGREDIENT1;
                    tcIng2.Text = search.INGREDIENT2;
                    tcIng3.Text = search.INGREDIENT3;
                    tcIng4.Text = search.INGREDIENT4;
                    tcIng5.Text = search.INGREDIENT5;
                    tcIng6.Text = search.INGREDIENT6;
                    tcIng7.Text = search.INGREDIENT7;
                    tcIng8.Text = search.INGREDIENT8;
                    tcIng9.Text = search.INGREDIENT9;
                    tcIng10.Text = search.INGREDIENT10;
                    tcIng11.Text = search.INGREDIENT11;
                    tcIng12.Text = search.INGREDIENT12;

                    tcLoadedBy1.Text = search.LOADED_BY1;
                    tcLoadedBy2.Text = search.LOADED_BY2;
                    tcLoadedBy3.Text = search.LOADED_BY3;
                    tcLoadedBy4.Text = search.LOADED_BY4;
                    tcLoadedBy5.Text = search.LOADED_BY5;
                    tcLoadedBy6.Text = search.LOADED_BY6;
                    tcLoadedBy7.Text = search.LOADED_BY7;
                    tcLoadedBy8.Text = search.LOADED_BY8;
                    tcLoadedBy9.Text = search.LOADED_BY9;
                    tcLoadedBy10.Text = search.LOADED_BY10;
                    tcLoadedBy11.Text = search.LOADED_BY11;
                    tcLoadedBy12.Text = search.LOADED_BY12;

                    tcLotNo1.Text = search.LOT_NO1;
                    tcLotNo2.Text = search.LOT_NO2;
                    tcLotNo3.Text = search.LOT_NO3;
                    tcLotNo4.Text = search.LOT_NO4;
                    tcLotNo5.Text = search.LOT_NO5;
                    tcLotNo6.Text = search.LOT_NO6;
                    tcLotNo7.Text = search.LOT_NO7;
                    tcLotNo8.Text = search.LOT_NO8;
                    tcLotNo9.Text = search.LOT_NO9;
                    tcLotNo10.Text = search.LOT_NO10;
                    tcLotNo11.Text = search.LOT_NO11;
                    tcLotNo12.Text = search.LOT_NO12;

                    tc02INST.Text = search.INST2;
                    tcSpeed.Text = search.SPEED;
                    tcTypeOfDrum.Text = search.TYPE_OF_DRUM;
                    tcNumberofDrums.Text = search.NUMBER_OF_DRUMS;
                    tcWeightPerDrum.Text = search.WEIGHT_PER_DRUM;
                    tcWeightProduced.Text = search.WEIGHT_PRODUCED;
                    tcTheorWt.Text = search.THEOR_WT;
                    tcPrintedSheetValid.Text = DateTime.Now.ToString("d",
                            CultureInfo.CreateSpecificCulture("en-US"));

                    if (search.MIXING_INSTRUCTIONS != null)
                    {
                        strMixInst = search.MIXING_INSTRUCTIONS.Replace("\n", "<br />");
                    }
                    else
                    {
                        strMixInst = "";
                    }

                    if (search.COMMENTS != null)
                    {
                        strComments = search.COMMENTS.Replace("\n", "<br />");
                    }
                    else
                    {
                        strComments = "";
                    }

                    if (search.SAMPLE_AND_LABEL != null)
                    {
                        strSampleAndLabel = search.SAMPLE_AND_LABEL.Replace("\n", "<br />");
                    }
                    else
                    {
                        strSampleAndLabel = "";
                    }

                    if (search.INGRED != null)
                    {
                        strIngred = search.INGRED.Replace("\n", "<br />");
                    }
                    else
                    {
                        strIngred = "";
                    }


                    if (search.PRESS_DATA != null)
                    {
                        strPressData = search.PRESS_DATA.Replace("\n", "<br />");
                    }
                    else
                    {
                        strPressData = "";
                    }

                    if (search.POT_FORMULA != null)
                    {
                        strPotFormula = search.POT_FORMULA.Replace("\n", "<br />");
                    }
                    else
                    {
                        strPotFormula = "";
                    }


                    tcMixInst.Text = strMixInst;
                    tcComments.Text = strComments;
                    txtComments.Text = strComments;
                    tcSampleAndLabel.Text = strSampleAndLabel;
                    tcIngred.Text = strIngred;
                    tcPotFormula.Text = strPotFormula;
                    tcPressData.Text = strPressData;


                }
            }
            #endregion

            else if (e.CommandName == "Copy")
            {

                int intSelectPage = Convert.ToInt32(e.CommandArgument);
                GridViewRow SelectedRow = BatchesGrid.Rows[intSelectPage];
                int intRow = Convert.ToInt32(SelectedRow.Cells[0].Text);
                hdnintRow.Value = Convert.ToInt32(SelectedRow.Cells[0].Text).ToString();
                int inthiddenvalue = Convert.ToInt32(hdnintRow.Value);
                #region copy

                using (adageAzureEntities Copy = new adageAzureEntities())

                {

                    var cb = (from batch in Copy.BATCH_SHEETS_New
                              where batch.Row == inthiddenvalue
                              select batch).SingleOrDefault();

                    BATCH_SHEETS_New CopyBatch = new BATCH_SHEETS_New();
                    {

                        CopyBatch.DATE = cb.DATE;
                        CopyBatch.BATCH_NUMBER = cb.BATCH_NUMBER;
                        CopyBatch.GRADE = cb.GRADE;
                        CopyBatch.Adage_Item_Code = cb.Adage_Item_Code;
                        CopyBatch.MIXER = cb.MIXER;


                        CopyBatch.AMOUNT1 = cb.AMOUNT1;
                        CopyBatch.AMOUNT2 = cb.AMOUNT2;
                        CopyBatch.AMOUNT3 = cb.AMOUNT3;
                        CopyBatch.AMOUNT4 = cb.AMOUNT4;
                        CopyBatch.AMOUNT5 = cb.AMOUNT5;
                        CopyBatch.AMOUNT6 = cb.AMOUNT6;
                        CopyBatch.AMOUNT7 = cb.AMOUNT7;
                        CopyBatch.AMOUNT8 = cb.AMOUNT8;
                        CopyBatch.AMOUNT9 = cb.AMOUNT9;
                        CopyBatch.AMOUNT10 = cb.AMOUNT10;
                        CopyBatch.AMOUNT11 = cb.AMOUNT11;
                        CopyBatch.AMOUNT12 = cb.AMOUNT12;

                        CopyBatch.INGREDIENT1 = cb.INGREDIENT1;
                        CopyBatch.INGREDIENT2 = cb.INGREDIENT2;
                        CopyBatch.INGREDIENT3 = cb.INGREDIENT3;
                        CopyBatch.INGREDIENT4 = cb.INGREDIENT4;
                        CopyBatch.INGREDIENT5 = cb.INGREDIENT5;
                        CopyBatch.INGREDIENT6 = cb.INGREDIENT6;
                        CopyBatch.INGREDIENT7 = cb.INGREDIENT7;
                        CopyBatch.INGREDIENT8 = cb.INGREDIENT8;
                        CopyBatch.INGREDIENT9 = cb.INGREDIENT9;
                        CopyBatch.INGREDIENT10 = cb.INGREDIENT10;
                        CopyBatch.INGREDIENT11 = cb.INGREDIENT11;
                        CopyBatch.INGREDIENT12 = cb.INGREDIENT12;

                        CopyBatch.LOADED_BY1 = cb.LOADED_BY1;
                        CopyBatch.LOADED_BY2 = cb.LOADED_BY2;
                        CopyBatch.LOADED_BY3 = cb.LOADED_BY3;
                        CopyBatch.LOADED_BY4 = cb.LOADED_BY4;
                        CopyBatch.LOADED_BY5 = cb.LOADED_BY5;
                        CopyBatch.LOADED_BY6 = cb.LOADED_BY6;
                        CopyBatch.LOADED_BY7 = cb.LOADED_BY7;
                        CopyBatch.LOADED_BY8 = cb.LOADED_BY8;
                        CopyBatch.LOADED_BY9 = cb.LOADED_BY9;
                        CopyBatch.LOADED_BY10 = cb.LOADED_BY10;
                        CopyBatch.LOADED_BY11 = cb.LOADED_BY11;
                        CopyBatch.LOADED_BY12 = cb.LOADED_BY12;

                        CopyBatch.LOT_NO1 = cb.LOT_NO1;
                        CopyBatch.LOT_NO2 = cb.LOT_NO2;
                        CopyBatch.LOT_NO3 = cb.LOT_NO3;
                        CopyBatch.LOT_NO4 = cb.LOT_NO4;
                        CopyBatch.LOT_NO5 = cb.LOT_NO5;
                        CopyBatch.LOT_NO6 = cb.LOT_NO6;
                        CopyBatch.LOT_NO7 = cb.LOT_NO7;
                        CopyBatch.LOT_NO8 = cb.LOT_NO8;
                        CopyBatch.LOT_NO9 = cb.LOT_NO9;
                        CopyBatch.LOT_NO10 = cb.LOT_NO10;
                        CopyBatch.LOT_NO11 = cb.LOT_NO11;
                        CopyBatch.LOT_NO12 = cb.LOT_NO12;


                        CopyBatch.INST2 = cb.INST2;
                        CopyBatch.MIXING_INSTRUCTIONS = cb.MIXING_INSTRUCTIONS;
                        CopyBatch.COMMENTS = cb.COMMENTS;
                        CopyBatch.SPEED = cb.SPEED;
                        CopyBatch.TYPE_OF_DRUM = cb.TYPE_OF_DRUM;
                        CopyBatch.NUMBER_OF_DRUMS = cb.NUMBER_OF_DRUMS;
                        CopyBatch.WEIGHT_PER_DRUM = cb.WEIGHT_PER_DRUM;
                        CopyBatch.WEIGHT_PRODUCED = cb.WEIGHT_PRODUCED;
                        CopyBatch.THEOR_WT = cb.THEOR_WT;

                        Copy.BATCH_SHEETS_New.Add(CopyBatch);
                        Copy.SaveChanges();
                    }


                }



                #endregion
            }

            else if (e.CommandName == "Print")
            {


                int intSelectPage = Convert.ToInt32(e.CommandArgument);
                GridViewRow SelectedRow = BatchesGrid.Rows[intSelectPage];
                int intRow = Convert.ToInt32(SelectedRow.Cells[0].Text);
                hdnintRow.Value = Convert.ToInt32(SelectedRow.Cells[0].Text).ToString();
                int inthiddenvalue = Convert.ToInt32(hdnintRow.Value);


                string code = "var url = 'ReportPage.aspx?rowid=" + inthiddenvalue + "'; { window.open(url); } ; self.focus();";
                ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", code, true);




            }

            #region IText
            else if (e.CommandName == "Print2")
            {
                int intSelectPage = Convert.ToInt32(e.CommandArgument);


                GridViewRow SelectedRow = BatchesGrid.Rows[intSelectPage];
                int intRow = Convert.ToInt32(SelectedRow.Cells[0].Text);
                hdnintRow.Value = Convert.ToInt32(SelectedRow.Cells[0].Text).ToString();
                int inthiddenvalue = Convert.ToInt32(hdnintRow.Value);
                ReportData(inthiddenvalue);


                 
                using (MemoryStream PdfStream = new MemoryStream())
                {
                    var search = from batch in context.BATCH_SHEETS_New
                                  where batch.Row == inthiddenvalue
                                  select new BatchSheet { MIXER = batch.MIXER, DATE = batch.DATE };


                    Document document = new Document(PageSize.LETTER, 25, 25, 30, 30);
                    PdfWriter writer = PdfWriter.GetInstance(document, PdfStream);
                    document.Open();

                    

                    PdfPTable titleTable = new PdfPTable(4);
                    titleTable.DefaultCell.Border = Rectangle.NO_BORDER;
                    var boldFont = FontFactory.GetFont(FontFactory.TIMES_BOLD, 12);
                    var smallFont = FontFactory.GetFont(FontFactory.TIMES, 8);

                    CMYKColor fill = new CMYKColor(0,0,100,0);
                    PdfPCell titleCell = new PdfPCell(new Phrase("MIXER BATCH SHEET"));
                    titleCell.Colspan=4;
                    titleCell.HorizontalAlignment = Element.ALIGN_CENTER;
                    titleCell.Border = Rectangle.NO_BORDER;
                    PdfPCell cellBlankRow = new PdfPCell(new Phrase(" "));
                    cellBlankRow.Colspan = 4;
                    cellBlankRow.Border = Rectangle.NO_BORDER;
                   
                 



                    PdfPCell dateCell = new PdfPCell(new Phrase("DATE:",boldFont));
                    dateCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    dateCell.Border = Rectangle.NO_BORDER;
                    PdfPCell mixerCell = new PdfPCell(new Phrase("MIXER:",boldFont));
                    mixerCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    mixerCell.Border = Rectangle.NO_BORDER;
                    PdfPCell gradeCell = new PdfPCell(new Phrase("GRADE:", boldFont));
                    gradeCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    gradeCell.Border = Rectangle.NO_BORDER;
                    PdfPCell bnumberCell = new PdfPCell(new Phrase("BATCH NUMBER", boldFont));
                    bnumberCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    bnumberCell.Border = Rectangle.NO_BORDER;
                    PdfPCell acodeCell = new PdfPCell(new Phrase("ADAGE CODE", boldFont));
                    acodeCell.HorizontalAlignment = Element.ALIGN_RIGHT;
                    acodeCell.Border = Rectangle.NO_BORDER;
                    PdfPCell lockoutCell = new PdfPCell(new Phrase("LOCKOUT MIXER PRIOR TO SAMPLING, SCRAPING, OR ANYTHING THAT REQUIRES REACHING INTO THE MIXER", smallFont));
                    lockoutCell.BackgroundColor = fill;
                    lockoutCell.Border = Rectangle.NO_BORDER;
                    lockoutCell.Colspan = 2;


                    titleTable.AddCell(titleCell);
                    titleTable.AddCell(cellBlankRow);
                    titleTable.AddCell(cellBlankRow);
                    titleTable.AddCell(dateCell);



                    foreach (var d in search)
                    {
                        titleTable.AddCell(d.DATE);


                    }

                    titleTable.AddCell(mixerCell);
                    foreach (var d in search)
                    {
                        titleTable.AddCell(d.MIXER);
                    }


                    titleTable.AddCell(gradeCell);



                    foreach (var d in search)
                    {
                        titleTable.AddCell(d.GRADE);


                    }

                    titleTable.AddCell(bnumberCell);
                    foreach (var d in search)
                    {
                        titleTable.AddCell(d.BATCH_NUMBER);
                    }
                    titleTable.AddCell(acodeCell);
                    foreach (var d in search)
                    {
                        titleTable.AddCell(d.Adage_Item_Code);
                    }

                    titleTable.AddCell(lockoutCell);

                    //PdfPTable HeaderTable = new PdfPTable(1);
                    //HeaderTable.DefaultCell.Border = Rectangle.NO_BORDER;
                    //PdfPCell HeaderCell = new PdfPCell(new Phrase());
                    //HeaderCell.HorizontalAlignment = Element.ALIGN_CENTER;
                    //HeaderTable.AddCell(HeaderCell);
                    document.Add(titleTable);
                    //document.Add(HeaderTable);



                    //document.Add(new Paragraph("Hello World"));

                    document.Close();
                    writer.Close();
                    Response.ContentType = "pdf/application";
                    Response.AddHeader("content-disposition",
                    "attachment;filename=First PDF document.pdf");
                    Response.OutputStream.Write(PdfStream.GetBuffer(), 0, PdfStream.GetBuffer().Length);
                }
            }
            #endregion

            if (txtGradeSearch.Text == "")
            {
                FillGridPanel2();
                //BatchesGrid.PageIndex = e.NewPageIndex;

                BatchesGrid.DataBind();
            }

            else
            {
                using (adageAzureEntities context = new adageAzureEntities())
                {
                    var search = (from batch in context.BATCH_SHEETS_New
                                  where batch.GRADE.Contains(txtGradeSearch.Text)
                                  select batch).ToList();
                    BatchesGrid.DataSource = search;
                   // BatchesGrid.PageIndex = e.NewPageIndex;

                    BatchesGrid.DataBind();
                }


            }
        }
      
        protected void BatchesGrid_SelectedIndexChanged(object sender, EventArgs e)
        {


         
            
            #region view

            int intRow = Int32.Parse(BatchesGrid.SelectedRow.Cells[0].Text);
            string strMixInst;
            string strComments;
            string strSampleAndLabel;
            string strIngred;
            string strPotFormula;
            string strPressData;
            using (adageAzureEntities context = new adageAzureEntities())
            
            {
                var search = (from batch in context.BATCH_SHEETS_New
                              where batch.Row == intRow
                              select batch).SingleOrDefault();

                divInfo.Visible = true;
                divButtons.Visible = true;
                txtBatchDate.Text = search.DATE;
                txtBatchNumber.Text = search.BATCH_NUMBER;
                txtGrade.Text = search.GRADE;
                txtAdageItemCode.Text = search.Adage_Item_Code;
                txtMixer.Text = search.MIXER;


                tcAmount1.Text = search.AMOUNT1;
                tcAmount2.Text = search.AMOUNT2;
                tcAmount3.Text = search.AMOUNT3;
                tcAmount4.Text = search.AMOUNT4;
                tcAmount5.Text = search.AMOUNT5;
                tcAmount6.Text = search.AMOUNT6;
                tcAmount7.Text = search.AMOUNT7;
                tcAmount8.Text = search.AMOUNT8;
                tcAmount9.Text = search.AMOUNT9;
                tcAmount10.Text = search.AMOUNT10;
                tcAmount11.Text = search.AMOUNT11;
                tcAmount12.Text = search.AMOUNT12;

                tcIng1.Text = search.INGREDIENT1;
                tcIng2.Text = search.INGREDIENT2;
                tcIng3.Text = search.INGREDIENT3;
                tcIng4.Text = search.INGREDIENT4;
                tcIng5.Text = search.INGREDIENT5;
                tcIng6.Text = search.INGREDIENT6;
                tcIng7.Text = search.INGREDIENT7;
                tcIng8.Text = search.INGREDIENT8;
                tcIng9.Text = search.INGREDIENT9;
                tcIng10.Text = search.INGREDIENT10;
                tcIng11.Text = search.INGREDIENT11;
                tcIng12.Text = search.INGREDIENT12;

                tcLoadedBy1.Text = search.LOADED_BY1;
                tcLoadedBy2.Text = search.LOADED_BY2;
                tcLoadedBy3.Text = search.LOADED_BY3;
                tcLoadedBy4.Text = search.LOADED_BY4;
                tcLoadedBy5.Text = search.LOADED_BY5;
                tcLoadedBy6.Text = search.LOADED_BY6;
                tcLoadedBy7.Text = search.LOADED_BY7;
                tcLoadedBy8.Text = search.LOADED_BY8;
                tcLoadedBy9.Text = search.LOADED_BY9;
                tcLoadedBy10.Text = search.LOADED_BY10;
                tcLoadedBy11.Text = search.LOADED_BY11;
                tcLoadedBy12.Text = search.LOADED_BY12;

                tcLotNo1.Text = search.LOT_NO1;
                tcLotNo2.Text = search.LOT_NO2;
                tcLotNo3.Text = search.LOT_NO3;
                tcLotNo4.Text = search.LOT_NO4;
                tcLotNo5.Text = search.LOT_NO5;
                tcLotNo6.Text = search.LOT_NO6;
                tcLotNo7.Text = search.LOT_NO7;
                tcLotNo8.Text = search.LOT_NO8;
                tcLotNo9.Text = search.LOT_NO9;
                tcLotNo10.Text = search.LOT_NO10;
                tcLotNo11.Text = search.LOT_NO11;
                tcLotNo12.Text = search.LOT_NO12;

                tc02INST.Text = search.INST2;
                tcSpeed.Text = search.SPEED;
                tcTypeOfDrum.Text = search.TYPE_OF_DRUM;
                tcNumberofDrums.Text = search.NUMBER_OF_DRUMS;
                tcWeightPerDrum.Text = search.WEIGHT_PER_DRUM;
                tcWeightProduced.Text = search.WEIGHT_PRODUCED;
                tcTheorWt.Text = search.THEOR_WT;
                tcPrintedSheetValid.Text = DateTime.Now.ToString("d",
                        CultureInfo.CreateSpecificCulture("en-US"));

                if (search.MIXING_INSTRUCTIONS != null)
                {
                    strMixInst = search.MIXING_INSTRUCTIONS.Replace("\n", "<br />");
                }
                else
                {
                    strMixInst = "";
                }

                if(search.COMMENTS != null)
                {
                    strComments = search.COMMENTS.Replace("\n", "<br />");
                }
                else
                {
                    strComments = "";
                }

                if (search.SAMPLE_AND_LABEL != null)
                {
                    strSampleAndLabel = search.SAMPLE_AND_LABEL.Replace("\n", "<br />");
                }
                else
                {
                    strSampleAndLabel = "";
                }

                if (search.INGRED != null)
                {
                    strIngred = search.INGRED.Replace("\n", "<br />");
                }
                else
                {
                    strIngred = "";
                }


                if (search.PRESS_DATA != null)
                {
                    strPressData = search.PRESS_DATA.Replace("\n", "<br />");
                }
                else
                {
                    strPressData = "";
                }

                if (search.POT_FORMULA != null)
                {
                    strPotFormula = search.POT_FORMULA.Replace("\n", "<br />");
                }
                else
                {
                    strPotFormula = "";
                }


                tcMixInst.Text = strMixInst;
                tcComments.Text = strComments;
                tcSampleAndLabel.Text = strSampleAndLabel;
                tcIngred.Text = strIngred;
                tcPotFormula.Text = strPotFormula;
                tcPressData.Text = strPressData;


            }
            #endregion


        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            divInfo.Visible = false;
            divNew.Visible = true;
            divButtons.Visible = false;
            divNewButtons.Visible = true;
            tcNewPrintedSheetValid.Text = DateTime.Now.ToString("d",
                       CultureInfo.CreateSpecificCulture("en-US"));
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            divInfo.Visible = false;
            divEdit.Visible = true;
            divButtons.Visible = false;
            divEditButtons.Visible = true;

          
            int intRow = Int32.Parse(hdnintRow.Value);
            //string strMixInst;
            //string strSampleAndLabel;
            //string strIngred;
            //string strPotFormula;
            //string strPressData;
            using (adageAzureEntities context = new adageAzureEntities())

            {
                var search = (from batch in context.BATCH_SHEETS_New
                              where batch.Row == intRow
                              select batch).SingleOrDefault();


                txtEditDate.Text = search.DATE;
                txtEditBatchNumber.Text = search.BATCH_NUMBER;
                txtEditGrade.Text = search.GRADE;
                txtEditAdageItemCode.Text = search.Adage_Item_Code;
                txtEditMixer.Text = search.MIXER;


                txtEditAmount1.Text = search.AMOUNT1;
                txtEditAmount2.Text = search.AMOUNT2;
                txtEditAmount3.Text = search.AMOUNT3;
                txtEditAmount4.Text = search.AMOUNT4;
                txtEditAmount5.Text = search.AMOUNT5;
                txtEditAmount6.Text = search.AMOUNT6;
                txtEditAmount7.Text = search.AMOUNT7;
                txtEditAmount8.Text = search.AMOUNT8;
                txtEditAmount9.Text = search.AMOUNT9;
                txtEditAmount10.Text = search.AMOUNT10;
                txtEditAmount11.Text = search.AMOUNT11;
                txtEditAmount12.Text = search.AMOUNT12;
                


                txtEditIng1.Text = search.INGREDIENT1;
                txtEditIng2.Text = search.INGREDIENT2;
                txtEditIng3.Text = search.INGREDIENT3;
                txtEditIng4.Text = search.INGREDIENT4;
                txtEditIng5.Text = search.INGREDIENT5;
                txtEditIng6.Text = search.INGREDIENT6;
                txtEditIng7.Text = search.INGREDIENT7;
                txtEditIng8.Text = search.INGREDIENT8;
                txtEditIng9.Text = search.INGREDIENT9;
                txtEditIng10.Text = search.INGREDIENT10;
                txtEditIng11.Text = search.INGREDIENT11;
                txtEditIng12.Text = search.INGREDIENT12;

                txtEditLoadedBy1.Text = search.LOADED_BY1;
                txtEditLoadedBy2.Text = search.LOADED_BY2;
                txtEditLoadedBy3.Text = search.LOADED_BY3;
                txtEditLoadedBy4.Text = search.LOADED_BY4;
                txtEditLoadedBy5.Text = search.LOADED_BY5;
                txtEditLoadedBy6.Text = search.LOADED_BY6;
                txtEditLoadedBy7.Text = search.LOADED_BY7;
                txtEditLoadedBy8.Text = search.LOADED_BY8;
                txtEditLoadedBy9.Text = search.LOADED_BY9;
                txtEditLoadedBy10.Text = search.LOADED_BY10;
                txtEditLoadedBy11.Text = search.LOADED_BY11;
                txtEditLoadedBy12.Text = search.LOADED_BY12;

                txtEditLotNo1.Text = search.LOT_NO1;
                txtEditLotNo2.Text = search.LOT_NO2;
                txtEditLotNo3.Text = search.LOT_NO3;
                txtEditLotNo4.Text = search.LOT_NO4;
                txtEditLotNo5.Text = search.LOT_NO5;
                txtEditLotNo6.Text = search.LOT_NO6;
                txtEditLotNo7.Text = search.LOT_NO7;
                txtEditLotNo8.Text = search.LOT_NO8;
                txtEditLotNo9.Text = search.LOT_NO9;
                txtEditLotNo10.Text = search.LOT_NO10;
                txtEditLotNo11.Text = search.LOT_NO11;
                txtEditLotNo12.Text = search.LOT_NO12;

                txtEdit02INST.Text = search.INST2;
                txtEditSpeed.Text = search.SPEED;
                txtEditTypeOfDrum.Text = search.TYPE_OF_DRUM;
                txtEditNumberOfDrums.Text = search.NUMBER_OF_DRUMS;
                txtEditWeightPerDrum.Text = search.WEIGHT_PER_DRUM;
                txtEditWeightProduced.Text = search.WEIGHT_PRODUCED;
                txtEditTHEORWT.Text = search.THEOR_WT;
                tcEditPrintedSheetValid.Text = DateTime.Now.ToString("d",
                        CultureInfo.CreateSpecificCulture("en-US"));

                txtEditMixInst.Text = search.MIXING_INSTRUCTIONS;
                txtEditComments.Text = search.COMMENTS;
                txtEditSampleaAndLabel.Text = search.SAMPLE_AND_LABEL;
                txtEditIngred.Text = search.INGRED;
                txtEditPotFormula.Text = search.POT_FORMULA;
                txtEditPressData.Text = search.PRESS_DATA;


            }

        }
        protected void btnNewCancel_Click(object sender, EventArgs e)
        {
            divInfo.Visible = true;
            divNew.Visible = false;
            divButtons.Visible = true;
            divNewButtons.Visible = false;
        }
        protected void btnEditCancel_Click(object sender, EventArgs e)
        {
            divInfo.Visible = true;
            divEdit.Visible = false;
            divButtons.Visible = true;
            divEditButtons.Visible = false;
        }

        protected void btnNewBatch_Click (object sender, EventArgs e)
        {
            int intNextRow;


            using (adageAzureEntities context = new adageAzureEntities())
            {
                var nextrow = (from maxrow in context.BATCH_SHEETS_New
                               select maxrow.Row).Max();

                intNextRow = nextrow + 1;



                using (adageAzureEntities nb = new adageAzureEntities())
                {
                    BATCH_SHEETS_New Newbatch = new BATCH_SHEETS_New();
                    {

                        //Newbatch.BLADE_SPEED = intNextRow.ToString();

                        Newbatch.DATE = txtNewDate.Text;
                        Newbatch.BATCH_NUMBER = txtNewBatchNumber.Text;
                        Newbatch.GRADE = txtNewGrade.Text;
                        Newbatch.Adage_Item_Code = txtNewAdageItemCode.Text;
                        Newbatch.MIXER = txtNewMixer.Text;

                        
                        Newbatch.AMOUNT1 = txtAmount1.Text;
                        Newbatch.AMOUNT2 = txtAmount2.Text;
                        Newbatch.AMOUNT3 = txtAmount3.Text;
                        Newbatch.AMOUNT4 = txtAmount4.Text;
                        Newbatch.AMOUNT5 = txtAmount5.Text;
                        Newbatch.AMOUNT6 = txtAmount6.Text;
                        Newbatch.AMOUNT7 = txtAmount7.Text;
                        Newbatch.AMOUNT8 = txtAmount8.Text;
                        Newbatch.AMOUNT9 = txtAmount9.Text;
                        Newbatch.AMOUNT10 = txtAmount10.Text;
                        Newbatch.AMOUNT11 = txtAmount11.Text;
                        Newbatch.AMOUNT12 = txtAmount12.Text;

                        Newbatch.INGREDIENT1 = txtIng1.Text;
                        Newbatch.INGREDIENT2 = txtIng2.Text;
                        Newbatch.INGREDIENT3 = txtIng3.Text;
                        Newbatch.INGREDIENT4 = txtIng4.Text;
                        Newbatch.INGREDIENT5 = txtIng5.Text;
                        Newbatch.INGREDIENT6 = txtIng6.Text;
                        Newbatch.INGREDIENT7 = txtIng7.Text;
                        Newbatch.INGREDIENT8 = txtIng8.Text;
                        Newbatch.INGREDIENT9 = txtIng9.Text;
                        Newbatch.INGREDIENT10 = txtIng10.Text;
                        Newbatch.INGREDIENT11 = txtIng11.Text;
                        Newbatch.INGREDIENT12 = txtIng12.Text;

                        Newbatch.LOADED_BY1 = txtLoadedBy1.Text;
                        Newbatch.LOADED_BY2 = txtLoadedBy2.Text;
                        Newbatch.LOADED_BY3 = txtLoadedBy3.Text;
                        Newbatch.LOADED_BY4 = txtLoadedBy4.Text;
                        Newbatch.LOADED_BY5 = txtLoadedBy5.Text;
                        Newbatch.LOADED_BY6 = txtLoadedBy6.Text;
                        Newbatch.LOADED_BY7 = txtLoadedBy7.Text;
                        Newbatch.LOADED_BY8 = txtLoadedBy8.Text;
                        Newbatch.LOADED_BY9 = txtLoadedBy9.Text;
                        Newbatch.LOADED_BY10 = txtLoadedBy10.Text;
                        Newbatch.LOADED_BY11 = txtLoadedBy11.Text;
                        Newbatch.LOADED_BY12 = txtLoadedBy12.Text;

                        Newbatch.LOT_NO1 = txtLotNo1.Text;
                        Newbatch.LOT_NO2 = txtLotNo2.Text;
                        Newbatch.LOT_NO3 = txtLotNo3.Text;
                        Newbatch.LOT_NO4 = txtLotNo4.Text;
                        Newbatch.LOT_NO5 = txtLotNo5.Text;
                        Newbatch.LOT_NO6 = txtLotNo6.Text;
                        Newbatch.LOT_NO7 = txtLotNo7.Text;
                        Newbatch.LOT_NO8 = txtLotNo8.Text;
                        Newbatch.LOT_NO9 = txtLotNo9.Text;
                        Newbatch.LOT_NO10 = txtLotNo10.Text;
                        Newbatch.LOT_NO11 = txtLotNo11.Text;
                        Newbatch.LOT_NO12 = txtLoadedBy12.Text;

                        Newbatch.MIXING_INSTRUCTIONS = txtNewMix.Text;
                        Newbatch.COMMENTS = txtNewComments.Text;
                        Newbatch.SAMPLE_AND_LABEL = txtNewSampleandLabel.Text;
                        Newbatch.INGRED = txtNewIngred.Text;
                        Newbatch.POT_FORMULA = txtNewPotFormula.Text;
                        Newbatch.PRESS_DATA = txtNewPressData.Text;



                        Newbatch.INST2 = txtNew02INST.Text;
                        Newbatch.SPEED = txtNewSpeed.Text;
                        Newbatch.TYPE_OF_DRUM = txtNewTypeofDrum.Text;
                        Newbatch.NUMBER_OF_DRUMS = txtNewNumberofDrum.Text;
                        Newbatch.WEIGHT_PER_DRUM = txtNewWeightPerDrum.Text;
                        Newbatch.WEIGHT_PRODUCED = txtNewWeightProduced.Text;
                        Newbatch.THEOR_WT = txtNewTheorWt.Text;

                        Newbatch.REVISION_DATE = DateTime.Now.ToString();
                        //Newbatch.WhichUser = mem



                        nb.BATCH_SHEETS_New.Add(Newbatch);
                        nb.SaveChanges();
                     

                    };
                }
                
            }
            divInfo.Visible = true;
            divNew.Visible = false;
            divButtons.Visible = true;
            divNewButtons.Visible = false;

        }

        protected void btnEditBatch_Click(object sender, EventArgs e)
        {
            int intRow = Int32.Parse(hdnintRow.Value);
        
            using (adageAzureEntities eb = new adageAzureEntities())
            {



                #region Edit
                var _data = eb.BATCH_SHEETS_New.Where(x => x.Row == intRow).SingleOrDefault();


                _data.DATE = txtEditDate.Text;
                _data.BATCH_NUMBER = txtEditBatchNumber.Text;
                _data.GRADE = txtEditGrade.Text;
                _data.Adage_Item_Code = txtEditAdageItemCode.Text;
                _data.MIXER = txtEditMixer.Text;


                _data.AMOUNT1 = txtEditAmount1.Text;
                _data.AMOUNT2 = txtEditAmount2.Text;
                _data.AMOUNT3 = txtEditAmount3.Text;
                _data.AMOUNT4 = txtEditAmount4.Text;
                _data.AMOUNT5 = txtEditAmount5.Text;
                _data.AMOUNT6 = txtEditAmount6.Text;
                _data.AMOUNT7 = txtEditAmount7.Text;
                _data.AMOUNT8 = txtEditAmount8.Text;
                _data.AMOUNT9 = txtEditAmount9.Text;
                _data.AMOUNT10 = txtEditAmount10.Text;
                _data.AMOUNT11 = txtEditAmount11.Text;
                _data.AMOUNT12 = txtEditAmount12.Text;

                _data.INGREDIENT1 = txtEditIng1.Text;
                _data.INGREDIENT2 = txtEditIng2.Text;
                _data.INGREDIENT3 = txtEditIng3.Text;
                _data.INGREDIENT4 = txtEditIng4.Text;
                _data.INGREDIENT5 = txtEditIng5.Text;
                _data.INGREDIENT6 = txtEditIng6.Text;
                _data.INGREDIENT7 = txtEditIng7.Text;
                _data.INGREDIENT8 = txtEditIng8.Text;
                _data.INGREDIENT9 = txtEditIng9.Text;
                _data.INGREDIENT10 = txtEditIng10.Text;
                _data.INGREDIENT11 = txtEditIng11.Text;
                _data.INGREDIENT12 = txtEditIng12.Text;

                _data.LOADED_BY1 = txtEditLoadedBy1.Text;
                _data.LOADED_BY2 = txtEditLoadedBy2.Text;
                _data.LOADED_BY3 = txtEditLoadedBy3.Text;
                _data.LOADED_BY4 = txtEditLoadedBy4.Text;
                _data.LOADED_BY5 = txtEditLoadedBy5.Text;
                _data.LOADED_BY6 = txtEditLoadedBy6.Text;
                _data.LOADED_BY7 = txtEditLoadedBy7.Text;
                _data.LOADED_BY8 = txtEditLoadedBy8.Text;
                _data.LOADED_BY9 = txtEditLoadedBy9.Text;
                _data.LOADED_BY10 = txtEditLoadedBy10.Text;
                _data.LOADED_BY11 = txtEditLoadedBy11.Text;
                _data.LOADED_BY12 = txtEditLoadedBy12.Text;

                _data.LOT_NO1 = txtEditLotNo1.Text;
                _data.LOT_NO2 = txtEditLotNo2.Text;
                _data.LOT_NO3 = txtEditLotNo3.Text;
                _data.LOT_NO4 = txtEditLotNo4.Text;
                _data.LOT_NO5 = txtEditLotNo5.Text;
                _data.LOT_NO6 = txtEditLotNo6.Text;
                _data.LOT_NO7 = txtEditLotNo7.Text;
                _data.LOT_NO8 = txtEditLotNo8.Text;
                _data.LOT_NO9 = txtEditLotNo9.Text;
                _data.LOT_NO10 = txtEditLotNo10.Text;
                _data.LOT_NO11 = txtEditLotNo11.Text;
                _data.LOT_NO12 = txtEditLoadedBy12.Text;

                _data.MIXING_INSTRUCTIONS = txtEditMixInst.Text;
                _data.COMMENTS = txtEditComments.Text;
                _data.SAMPLE_AND_LABEL = txtEditSampleaAndLabel.Text;
                _data.INGRED = txtEditIngred.Text;
                _data.POT_FORMULA = txtEditPotFormula.Text;
                _data.PRESS_DATA = txtEditPressData.Text;



                _data.INST2 = txtEdit02INST.Text;
                _data.SPEED = txtEditSpeed.Text;
                _data.TYPE_OF_DRUM = txtEditTypeOfDrum.Text;
                _data.NUMBER_OF_DRUMS = txtEditNumberOfDrums.Text;
                _data.WEIGHT_PER_DRUM = txtEditWeightPerDrum.Text;
                _data.WEIGHT_PRODUCED = txtEditWeightProduced.Text;
                _data.THEOR_WT = txtEditTHEORWT.Text;
                eb.SaveChanges();
                divInfo.Visible = true;
                divEdit.Visible = false;
                divButtons.Visible = true;
                divEditButtons.Visible = false;
               
                #endregion
            }

            FillGridPanel2();

        } 

        public List<BatchSheet> ReportData(int hiddenvalue)
        {
           


            using (adageAzureEntities context = new adageAzureEntities())

            {

               var search = (from batch in context.BATCH_SHEETS_New
                                               where batch.Row == hiddenvalue
                                               select new BatchSheet { MIXER = batch.MIXER}).ToList();
              return search;

                // DataTable dt = search.CopyToDataTable<DataRow>();

            }
        }
    }



    public class BatchSheet
    {

        public int Row { get; set; }
        public string DATE { get; set; }
        public string MIXER { get; set; }
        public string GRADE { get; set; }
        public string BATCH_NUMBER { get; set; }
        public string INGREDIENT1 { get; set; }
        public string INGREDIENT2 { get; set; }
        public string INGREDIENT3 { get; set; }
        public string INGREDIENT4 { get; set; }
        public string INGREDIENT5 { get; set; }
        public string INGREDIENT6 { get; set; }
        public string INGREDIENT7 { get; set; }
        public string INGREDIENT8 { get; set; }
        public string INGREDIENT9 { get; set; }
        public string INGREDIENT10 { get; set; }
        public string INGREDIENT11 { get; set; }
        public string INGREDIENT12 { get; set; }
        public string LOT_NO1 { get; set; }
        public string LOT_NO2 { get; set; }
        public string LOT_NO3 { get; set; }
        public string LOT_NO4 { get; set; }
        public string LOT_NO5 { get; set; }
        public string LOT_NO6 { get; set; }
        public string LOT_NO7 { get; set; }
        public string LOT_NO8 { get; set; }
        public string LOT_NO9 { get; set; }
        public string LOT_NO10 { get; set; }
        public string LOT_NO11 { get; set; }
        public string LOT_NO12 { get; set; }
        public string AMOUNT1 { get; set; }
        public string AMOUNT2 { get; set; }
        public string AMOUNT3 { get; set; }
        public string AMOUNT4 { get; set; }
        public string AMOUNT5 { get; set; }
        public string AMOUNT6 { get; set; }
        public string AMOUNT7 { get; set; }
        public string AMOUNT8 { get; set; }
        public string AMOUNT9 { get; set; }
        public string AMOUNT10 { get; set; }
        public string AMOUNT11 { get; set; }
        public string AMOUNT12 { get; set; }
        public string LOADED_BY1 { get; set; }
        public string LOADED_BY2 { get; set; }
        public string LOADED_BY3 { get; set; }
        public string LOADED_BY4 { get; set; }
        public string LOADED_BY5 { get; set; }
        public string LOADED_BY6 { get; set; }
        public string LOADED_BY7 { get; set; }
        public string LOADED_BY8 { get; set; }
        public string LOADED_BY9 { get; set; }
        public string LOADED_BY10 { get; set; }
        public string LOADED_BY11 { get; set; }
        public string LOADED_BY12 { get; set; }
        public string MIXING_INSTRUCTIONS { get; set; }
        public string TYPE_OF_DRUM { get; set; }
        public string WEIGHT_PER_DRUM { get; set; }
        public string NUMBER_OF_DRUMS { get; set; }
        public string WEIGHT_PRODUCED { get; set; }
        public string REVISION_DATE { get; set; }
        public string FORM_VERSION { get; set; }
        public string MIXER_BATCH_SHEET { get; set; }
        public string INST2 { get; set; }
        public string SAMPLE_AND_LABEL { get; set; }
        public string INGRED { get; set; }
        public string POT_FORMULA { get; set; }
        public string BLADE_SPEED { get; set; }
        public string SPEED { get; set; }
        public string PRESS_DATA { get; set; }
        public string EXPIRATION_DATE { get; set; }
        public string STORAGE { get; set; }
        public string THEOR_WT { get; set; }
        public string OPER { get; set; }
        public string OPER_Copy { get; set; }
        public string Adage_Item_Code { get; set; }
        public Nullable<System.DateTime> LastUpdate { get; set; }
        public string WhichUser { get; set; }
        public string NameofMachine { get; set; }


    }
}