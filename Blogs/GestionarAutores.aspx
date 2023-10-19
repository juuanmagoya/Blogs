<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarAutores.aspx.cs" Inherits="Blogs.GestionarAutores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Apellido:"></asp:Label>
&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnAlta" runat="server" OnClick="Button1_Click" Text="Alta" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Label ID="lblAutor" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;
            <asp:Label ID="lbl" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nombre" DataValueField="id" Height="83px" Width="111px"></asp:ListBox>
            <br />
            <br />
            <asp:TextBox ID="txtMostrar1" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtMostrar2" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" DeleteCommand="DELETE FROM [BlogAutores] WHERE [id] = @id" InsertCommand="INSERT INTO [BlogAutores] ([nombre], [apellido]) VALUES (@nombre, @apellido)" SelectCommand="SELECT * FROM [BlogAutores]" UpdateCommand="UPDATE [BlogAutores] SET [nombre] = @nombre, [apellido] = @apellido WHERE [id] = @id">
            <DeleteParameters>
                <asp:ControlParameter ControlID="txtMostrar1" Name="id" PropertyName="Text" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtNombre" Name="nombre" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtApellido" Name="apellido" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="apellido" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:blog %>" SelectCommand="SELECT * FROM [BlogAutores] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
