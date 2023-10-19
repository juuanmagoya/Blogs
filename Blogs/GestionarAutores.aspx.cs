using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blogs
{
    public partial class GestionarAutores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                actualizarLabel();
            }
        }
        protected void actualizarLabel()
        {
            lbl.Text = "";
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                lbl.Text += row["nombre"].ToString()+" " + row["apellido"].ToString() + " - ";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource1.Insert();
            if (result != 0)
            {
                lblAutor.Text = "Se ha agregado " + result.ToString() + "Autor";
                actualizarLabel();
                TxtNombre.Text = "";
                txtApellido.Text = "";
            }
            else
            {
                lblAutor.Text = "No se agregaron Autores";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (reader.Read())
            {
                txtMostrar1.Text = reader["nombre"].ToString();
                txtMostrar2.Text = reader["apellido"].ToString();

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
            int result = SqlDataSource1.Delete();
            if (result != 0)
            {
                lblAutor.Text = "Se ha Eliminado " + result.ToString() + "Autor";
                actualizarLabel();
                txtMostrar1.Text = "";
                txtMostrar2.Text = "";
            }
            else
            {
                lblAutor.Text = "No se Eliminaron Autores";
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue.ToString();
            SqlDataSource1.UpdateParameters["nombre"].DefaultValue = txtMostrar1.Text;
            SqlDataSource1.UpdateParameters["apellido"].DefaultValue = txtMostrar2.Text;

            int result = SqlDataSource1.Update();
            if (result != 0)
            {
                lblAutor.Text = "Se ha actualiado " + result.ToString() + "Autor";
                actualizarLabel();
                txtMostrar1.Text = "";
                txtMostrar2.Text = "";
            }
            else
            {
                lblAutor.Text = "No se Axtuallizaron Autores";
            }
        }
    }
}