using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;

namespace BatchSheetsWebPage.Pages
{
    
    public partial class ReportPage : System.Web.UI.Page
    {

 
       
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            int rowd = Convert.ToInt32(Request.QueryString["rowid"]);

            using (adageAzureEntities context = new adageAzureEntities())

            {


                //DataSet1 dataset1 = new DataSet1();
                //DataSet1TableAdapters.BATCH_SHEETS_NewTableAdapter Batch_Sheets_NewTableAdapter1 = new DataSet1TableAdapters.BATCH_SHEETS_NewTableAdapter();
                //Batch_Sheets_NewTableAdapter1.Fill(dataset1.BATCH_SHEETS_New, rowd);
                //DataSet1.BATCH_SHEETS_NewDataTable batch_sheet_table;
                //batch_sheet_table = Batch_Sheets_NewTableAdapter1.GetData(rowd);
                //var search = (from batch in context.BATCH_SHEETS_New
                //              where batch.Row == rowd
                //              select batch).SingleOrDefault();
            }
            
            

            
        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }

        protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {

        }
    }
  
}