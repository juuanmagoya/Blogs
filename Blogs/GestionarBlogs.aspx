<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarBlogs.aspx.cs" Inherits="Blogs.GestionarBlogs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Escribe tu Blog<br />
        <asp:TextBox ID="txtBlog" runat="server" ToolTip="Tu Blog" AutoPostBack="True"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id" AutoPostBack="True">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Agregar" runat="server" OnClick="Button1_Click" Text="Agregar" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Modificar" runat="server" Text="Modificar" OnClick="Modificar_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <div>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id" Height="16px" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="178px">
            </asp:DropDownList>
            <asp:Button ID="Borrar" runat="server" Text="Borrar" OnClick="Borrar_Click" />
            <br />
            <br />
            <br />
            <asp:Table ID="Table1" runat="server" Width="495px">
            </asp:Table>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" DeleteCommand="DELETE FROM [Blogs] WHERE [id] = @id" InsertCommand="INSERT INTO [Blogs] ([texto], [idAutor]) VALUES (@texto, @idAutor)" SelectCommand="SELECT * FROM [Blogs]" UpdateCommand="UPDATE [Blogs] SET [texto] = @texto, [idAutor] = @idAutor WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtBlog" Name="texto" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idAutor" PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtBlog" Name="texto" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idAutor" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" DeleteCommand="DELETE FROM [Blogs] WHERE [id] = @id" InsertCommand="INSERT INTO [Blogs] ([texto], [idAutor]) VALUES (@texto, @idAutor)" SelectCommand="SELECT Blogs.id, Blogs.texto, Blogs.idAutor, BlogAutores.nombre, BlogAutores.apellido FROM Blogs INNER JOIN BlogAutores ON Blogs.idAutor = BlogAutores.id" UpdateCommand="UPDATE [Blogs] SET [texto] = @texto, [idAutor] = @idAutor WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="texto" Type="String" />
                    <asp:Parameter Name="idAutor" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="texto" Type="String" />
                    <asp:Parameter Name="idAutor" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" SelectCommand="SELECT * FROM [BlogAutores]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" SelectCommand="SELECT * FROM [Blogs] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Menu</asp:HyperLink>
        <br />
    </form>
</body>
</html>
