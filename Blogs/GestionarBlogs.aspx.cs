using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blogs
{
    public partial class GestionarBlogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();  
            }
        }
        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count > 0)
                {
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "texto";
                    headerRow.Cells.Add(new TableCell());

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "nombre";
                    headerRow.Cells.Add(new TableCell());

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "apellido";
                    headerRow.Cells.Add(new TableCell());

                    Table1.Rows.Add(headerRow);

                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["texto"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["nombre"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["apellido"].ToString();
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"Alert('Error');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource5.InsertParameters["texto"].DefaultValue = txtBlog.Text;
            SqlDataSource5.InsertParameters["idAutor"].DefaultValue = DropDownList1.SelectedValue;
            int result = SqlDataSource5.Insert();
            if (result > 0 )
            { 
                Label1.Text = "Se agrego " +result.ToString() + " Blog ";
                completarTabla();
                txtBlog.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se agregaron blogs";                
            }
        }

 

        protected void Borrar_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource5.Delete();
            if (result > 0)
            {
                Label1.Text = "Se borro " + result.ToString() + " Blog ";
                completarTabla();
                txtBlog.Text = string.Empty;
            }
            else
            {
                Label1.Text = "No se borraron blogs";
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row =  dv [0];
                txtBlog.Text = row["texto"].ToString();
                DropDownList1.SelectedValue = row ["idAutor"].ToString();
            
            }
            completarTabla();
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {
            SqlDataSource5.UpdateParameters["id"].DefaultValue = DropDownList2.SelectedValue;
            int result = SqlDataSource5.Update();
            if (result > 0)
            {
                Label1.Text = "Actualizado " + result.ToString() + " Blog";
                completarTabla();
                txtBlog.Text = string.Empty;
            }
            else {
                Label1.Text = "No se actualizaron blogs";
            }
        }
    }
}