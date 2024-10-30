using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

using System.Xml.Linq;

namespace JaisinghTest
{
    public class Mockcustomber
    {
        
        public bool savecustomberdata(custombercls obj)
        {


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool issaved = false;

           
            conn.Open();
            SqlCommand cmd = new SqlCommand();
           
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "spSaveCustomber";
            cmd.Parameters.AddWithValue("@name", obj.name);
            cmd.Parameters.AddWithValue("@email", obj.email);
            cmd.Parameters.AddWithValue("@phone", obj.phone);
            cmd.Connection = conn;
          int intx=   cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                issaved = true;
            }else
            {
                issaved = false;
            }
            

            return issaved;

        }


        public bool updatecustom(custombercls obj,string id)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool isupdated = false;

          
            conn.Open();
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "speditCustomber";
            cmd.Parameters.AddWithValue("@name", obj.name);
            cmd.Parameters.AddWithValue("@email", obj.email);
            cmd.Parameters.AddWithValue("@phone", obj.phone);
            cmd.Parameters.AddWithValue("@id", id.Trim());
            cmd.Connection = conn;

            int intx = cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                isupdated = true;
            }
            else
            {
                isupdated = false;
            }


            return isupdated;

        }


        public bool deletecustomer(string id)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());
            bool isdeleted = false;

           
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "spdeleteCustomber";
            cmd.Parameters.AddWithValue("@id", id.Trim());

            cmd.Connection = conn;
            int intx = cmd.ExecuteNonQuery();

            conn.Close();

            if (intx > 0)
            {
                isdeleted = true;
            }
            else
            {
                isdeleted = false;
            }


            return isdeleted;




        }



      
        public custombercls getdataforedit(string id)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mytest"].ToString());


          
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = "spgeteditCustomber";
            cmd.Parameters.AddWithValue("@id", id.Trim());
            cmd.Connection = conn;
      
            SqlDataAdapter das = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            das.Fill(ds, "Customerinfo");
            DataTable dt = new DataTable();
            dt = ds.Tables["Customerinfo"];



            custombercls objj = new custombercls();
            if(dt.Rows.Count > 0)
            {

              objj.name=     dt.Rows[0]["name"].ToString();
                objj.email = dt.Rows[0]["email"].ToString();
                objj.phone = dt.Rows[0]["phone"].ToString();
                objj.id = dt.Rows[0]["id"].ToString();

            }
         



            return objj;



        }
    }
}