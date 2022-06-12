using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DocShare
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using System.Data.SqlClient;
    using System.Data;
    using System.Configuration;
    using System.Collections;

    /// <summary>
    /// Summary description for Dbconnection
    /// </summary>
    public class Dbconnection
    {
        public SqlConnection conn = null;
        public Dbconnection()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public int executeQuery(string query)
        {
            int result = 0;
            SqlCommand cmd = null;
            DataSet ds = new DataSet();
            string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(con);
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd = new SqlCommand(query, conn);

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return result;
        }



        public int executeStoredPro(String proname, Hashtable para)
        {

            int result = 0;
            SqlCommand cmd = null;
            DataSet ds = new DataSet();
            string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(con);
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd = new SqlCommand(proname, conn);

                cmd.CommandType = CommandType.StoredProcedure;
                foreach (string param in para.Keys)
                {
                    cmd.Parameters.AddWithValue(param, para[param]);
                }
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return result;
        }

        public DataSet ExecuteDataSet(string query)
        {
            SqlDataAdapter da = null;
            SqlCommand cmd = null;
            DataSet ds = new DataSet();
            string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            conn = new SqlConnection(con);
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                cmd = new SqlCommand(query, conn);
                da = new SqlDataAdapter();
                cmd.CommandType = CommandType.Text;
                da.SelectCommand = cmd;
                da.Fill(ds);
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return ds;
        }
    }
}