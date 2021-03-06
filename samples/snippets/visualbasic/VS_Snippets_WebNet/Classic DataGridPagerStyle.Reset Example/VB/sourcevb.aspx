<!--<Snippet1>-->
<%@ Page Language="VB" AutoEventWireup="True" %>
<%@ Import Namespace="System.Data" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
   <script language="VB" runat="server">
 
    Function CreateDataSource() As ICollection
        Dim dt As New DataTable()
        Dim dr As DataRow
        
        dt.Columns.Add(New DataColumn("IntegerValue", GetType(Int32)))
        dt.Columns.Add(New DataColumn("StringValue", GetType(String)))
        dt.Columns.Add(New DataColumn("DateTimeValue", GetType(String)))
        dt.Columns.Add(New DataColumn("BoolValue", GetType(Boolean)))
        
        Dim i As Integer
        For i = 0 To 99
            dr = dt.NewRow()
            
            dr(0) = i
            dr(1) = "Item " & i.ToString()
            dr(2) = DateTime.Now.ToShortDateString()
            If i Mod 2 <> 0 Then
                dr(3) = True
            Else
                dr(3) = False
            End If
            
            dt.Rows.Add(dr)
        Next i
        
        Dim dv As New DataView(dt)
        Return dv
    End Function 'CreateDataSource


    Sub Page_Load(sender As Object, e As EventArgs)
        BindGrid()
    End Sub 'Page_Load


    Sub Set_Clicked(sender As Object, e As EventArgs)
        ' Set style properties.
        MyDataGrid.PagerStyle.BackColor = System.Drawing.Color.Lavender
        MyDataGrid.PagerStyle.ForeColor = System.Drawing.Color.Blue
    End Sub 'Set_Clicked


    Sub Reset_Clicked(sender As Object, e As EventArgs)
        ' Reset style properties.
        MyDataGrid.PagerStyle.Reset()
    End Sub 'Reset_Clicked


    Sub MyDataGrid_Page(sender As Object, e As DataGridPageChangedEventArgs)
        MyDataGrid.CurrentPageIndex = e.NewPageIndex
        BindGrid()
    End Sub 'MyDataGrid_Page


    Sub BindGrid()
        MyDataGrid.DataSource = CreateDataSource()
        MyDataGrid.DataBind()
    End Sub 'BindGrid
 
   </script>
 
<head runat="server">
    <title>Paging with DataGrid</title>
</head>
<body>
 
   <h3>Paging with DataGrid</h3>
 
   <form id="form1" runat="server">
 
      <asp:DataGrid id="MyDataGrid" runat="server"
           AllowPaging="True"
           PageSize="10"
           OnPageIndexChanged="MyDataGrid_Page"
           BorderColor="black"
           BorderWidth="1"
           GridLines="Both"
           CellPadding="3"
           CellSpacing="0"
           Font-Names="Verdana"
           Font-Size="8pt"
           HeaderStyle-BackColor="#aaaadd"
           AlternatingItemStyle-BackColor="#eeeeee"/>

      <hr />

      <asp:Button id="Set_Button"
           OnClick="Set_Clicked"
           Text="Apply Pager Style"
           runat="server"/>
      <asp:Button id="Reset_Button"
           OnClick="Reset_Clicked"
           Text="Reset Pager Style"
           runat="server"/>

   </form>

</body>
</html>

<!--</Snippet1>-->
