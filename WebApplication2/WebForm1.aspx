<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ИдКонтрагента">
            <Columns>
                <asp:BoundField DataField="ИдКонтрагента" HeaderText="ИдКонтрагента" InsertVisible="False" ReadOnly="True" SortExpression="ИдКонтрагента" Visible="false" />
                <asp:BoundField DataField="Наименование" HeaderText="Наименование" SortExpression="Наименование" />
                <asp:BoundField DataField="ПолноеНаименование" HeaderText="ПолноеНаименование" SortExpression="ПолноеНаименование" />
                <asp:BoundField DataField="ИНН" HeaderText="ИНН" SortExpression="ИНН" />
                <asp:BoundField DataField="КПП" HeaderText="КПП" SortExpression="КПП" />
                <asp:TemplateField HeaderText="ОсновнойДоговор" SortExpression="ОсновнойДоговор">
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="ddl1" DataSourceID="SqlDataSource2" DataTextField="Наименование" DataValueField ="Ид" SelectedValue='<%# Bind("ДоговорИд") %>'></asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("ОсновнойДоговор") %>' ID="Label1"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:prog1ConnectionString %>"
            SelectCommand="SELECT Контр.Ид AS ИдКонтрагента, Контр.Наименование, Контр.ПолноеНаименование, Контр.ИНН, Контр.КПП, ОсновнойДоговор as ДоговорИд, Догвр.Наименование AS ОсновнойДоговор FROM smeh.Контрагенты AS Контр LEFT OUTER JOIN smeh.ДоговорыКонтрагентов AS Догвр ON Контр.ОсновнойДоговор = Догвр.Ид ORDER BY Контр.Наименование"
            UpdateCommand="UPDATE smeh.Контрагенты SET Наименование = @Наименование, ПолноеНаименование = @ПолноеНаименование, ИНН = @ИНН, КПП = @КПП, ОсновнойДоговор = @ДоговорИд WHERE (Ид = @ИдКонтрагента)"
            OnUpdating="SqlDataSource1_Updating1">
            <UpdateParameters>
                <asp:Parameter Name="Наименование" />
                <asp:Parameter Name="ПолноеНаименование" />
                <asp:Parameter Name="ИНН" />
                <asp:Parameter Name="КПП" />
                <asp:Parameter Name="ДоговорИд" />
                <asp:Parameter Name="ИдКонтрагента" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:prog1ConnectionString %>" 
            SelectCommand="smeh.[ДоговорыКонтрагента GetListForDropDownList]" 
            SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource2_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Int32" Name="Ид" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
