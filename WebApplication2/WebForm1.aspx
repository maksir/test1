<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Ид" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Ид" HeaderText="Ид" InsertVisible="False" ReadOnly="True" SortExpression="Ид" Visible="False" />
                    <asp:TemplateField HeaderText="Наименование" SortExpression="Наименование">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Наименование") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Наименование") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ПолноеНаименование" HeaderText="ПолноеНаименование" SortExpression="ПолноеНаименование" />
                    <asp:BoundField DataField="ИНН" HeaderText="ИНН" SortExpression="ИНН" />
                    <asp:BoundField DataField="КПП" HeaderText="КПП" SortExpression="КПП" />
                    <asp:CheckBoxField DataField="Удален" HeaderText="Удален" SortExpression="Удален" Visible="False" />
                    <asp:CheckBoxField DataField="Архивный" HeaderText="Архивный" SortExpression="Архивный" Visible="False" />
                    <asp:TemplateField HeaderText="ОсновнойДоговор" SortExpression="ОсновнойДоговор">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ОсновнойДоговор") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ОсновнойДоговор") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:prog1ConnectionString %>"
            SelectCommand="SELECT Ид , Наименование, ПолноеНаименование, ИНН, КПП, Удален, Архивный, ОсновнойДоговор FROM smeh.Контрагенты ORDER BY Наименование"
            UpdateCommand="UPDATE smeh.Контрагенты SET Наименование = @Наименование, ПолноеНаименование = @ПолноеНаименование, ИНН = @ИНН, КПП = @КПП, Удален = @Удален, Архивный = @Архивный, ОсновнойДоговор = @ОсновнойДоговор WHERE (Ид = @Ид)" OnUpdating="SqlDataSource1_Updating">
            <UpdateParameters>
                <asp:Parameter Name="Наименование" Type="String" />
                <asp:Parameter Name="ПолноеНаименование" Type="String" />
                <asp:Parameter Name="ИНН" Type="String" />
                <asp:Parameter Name="КПП" Type="String" />
                <asp:Parameter Name="Удален" Type="Boolean" DefaultValue="False" />
                <asp:Parameter Name="Архивный" Type="Boolean" DefaultValue="False" />
                <asp:Parameter Name="ОсновнойДоговор" Type="Int32" />
                <asp:Parameter Name="ИдКонтрагента" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:prog1ConnectionString %>" 
            SelectCommand="smeh.[ДоговорыКонтрагента GetListForDropDownList]" 
            SelectCommandType="StoredProcedure" 
            OnDataBinding="SqlDataSource2_DataBinding" 
            OnSelecting="SqlDataSource2_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Int32" Name="Ид" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
