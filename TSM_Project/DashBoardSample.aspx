<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardSample.aspx.cs" Inherits="TSM_Project.DashBoardSample" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
        <div>

            <asp:Chart ID="Chart1" runat="server">
                <Series>
                    <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:Chart ID="Chart2" runat="server" >
                <Titles>
                    <asp:Title Text="Employee Attendence"></asp:Title>
                </Titles>
                <Series>
                    <asp:Series Name="Series1" ChartArea="ChartArea1">
                       
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                        <AxisX Title="Employee"></AxisX>
                        <AxisY Title="Attendence"></AxisY>
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </form>
</body>
</html>
