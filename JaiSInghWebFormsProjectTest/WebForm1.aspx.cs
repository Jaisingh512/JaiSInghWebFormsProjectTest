using JaisinghTest;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JaiSInghWebFormsProjectTest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                getlistofcustom();



            }




        }


        protected void refreshthispage(object sender, EventArgs e)
        {


            Response.Redirect(Request.RawUrl);


        }




        //protected void editformdata(object sender, EventArgs e)
        //{


        //    string edit = "edit";

        //    Server.Transfer("~/WebForm1.aspx?mode=" + edit + "&code=" + hidden1.Value);



        //}

        protected void editformdata(object sender, EventArgs e)
        {
            Hidden2.Value = "editmode";
            custombercls objnew = new custombercls();
            Mockcustomber mobj = new Mockcustomber();
            objnew = mobj.getdataforedit(hidden1.Value.Trim());
            name.Text = objnew.name;
            Email.Text = objnew.email;
            phone.Text = objnew.phone;

            getlistofcustom();

            //Server.Transfer("~/WebForm1.aspx?mode=" + edit + "&code=" + hidden1.Value);



        }

        protected void deleteformdata(object sender, EventArgs e)
        {
          
            Mockcustomber mobj = new Mockcustomber();
            bool isdel = mobj.deletecustomer(hidden1.Value.Trim());
           

            getlistofcustom();
             if (isdel == true)
            {

                Response.Write("<script>alert('Deleted succesfully  employ ID=" +  hidden1.Value.Trim()  +"');</script>");

            }
            //Server.Transfer("~/WebForm1.aspx?mode=" + edit + "&code=" + hidden1.Value);



        }





        protected void submitFormData(object sender, EventArgs e)
        { string mode = "";
                custombercls objnew = new custombercls();
                objnew.name = name.Text;
                objnew.email = Email.Text;
                objnew.phone = phone.Text;

                Mockcustomber mobj = new Mockcustomber();

            bool isaved=false;
            if (Hidden2.Value == "editmode")
            {
                mode = "edit";
               isaved =       mobj.updatecustom(objnew,hidden1.Value.Trim());

               
            }
            else
            {

                isaved = mobj.savecustomberdata(objnew);
            }

               
                getlistofcustom();
                if (isaved == true && mode == "edit")
                {

                name.Text = "";
                Email.Text = "";
                phone.Text = "";
                string ss = hidden1.Value;
                hidden1.Value = "";


              
                Response.Write("<script>alert('updated succesfully employ ID=  " + ss  +" ');</script>");

               
            }
            else if(isaved == true && mode != "edit")
            {
                name.Text = "";
                Email.Text = "";
                phone.Text = "";
                Response.Write("<script>alert('saved succesfully');</script>");

            }else if(hidden1.Value=="" || hidden1.Value == null)
            {

                Response.Write("<script>alert('Please select the employ to EDIT ');</script>");


            }
            else
            {

                Response.Write("<script>alert('Not Saved');</script>");

            }



           




        }
        public void getlistofcustom()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());



            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "spgetlistCustomber";
            cmd.Connection = conn;
            SqlDataAdapter das = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            das.Fill(ds, "Customerinfo");
            DataTable dt = new DataTable();
            dt = ds.Tables["Customerinfo"];


           




            foreach (DataRow dr in dt.Rows)
            {

                TableRow tr = new TableRow();

                TableCell tt6 = new TableCell();
                tt6.Text = dr["id"].ToString();
                tr.Cells.Add(tt6);



                TableCell tt = new TableCell();
                tt.Text = dr["name"].ToString();
                tr.Cells.Add(tt);

              

                TableCell tt1 = new TableCell();
                tt1.Text = dr["phone"].ToString();
                tr.Cells.Add(tt1);




                TableCell tt2 = new TableCell();
                tt2.Text = dr["email"].ToString();
                tr.Cells.Add(tt2);


                TableCell tt4 = new TableCell();
                Button bt = new Button();
                bt.Text = "Edit";
                bt.OnClientClick = "val(this); return false";
                bt.PostBackUrl = "";
                bt.ID = dr["id"].ToString();











                tt4.Controls.Add(bt);

                Button bt2 = new Button();
                bt2.Text = "DELETE";
                bt2.OnClientClick = "deleteemploy(this); return false";
                bt2.PostBackUrl = "";
                bt2.ID = dr["id"].ToString();











                tt4.Controls.Add(bt2);

                tr.Cells.Add(tt4);






                Table1.Rows.Add(tr);






                



            }



           

        }
    }
}