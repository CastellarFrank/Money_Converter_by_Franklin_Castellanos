<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
	<title>Money Converter</title>
	<meta name="description" content="Welcome to this little app, you have a lot of choices yo convert quantities"/>
	<meta name="viewport" content="width=device-width,initial-scale=1"/>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="Styles/main.css" rel="Stylesheet" type="text/css" />
    <script src="Scripts/myScripts.js" type="text/javascript"></script>
    <script src="Scripts/apprise-1.5.min.js" type="text/javascript"></script>
    <link href="Styles/apprise.min.css" rel="stylesheet" type="text/css" />

    <%--<script runat="server" type="text/C#">
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            this.lblDateTime.Text = "Date: " + DateTime.Now.ToLongDateString()+"<br />"+
                "Time: "+DateTime.Now.ToLongTimeString(); 
        }
    </script>--%>
    

</head>
<body onload="setInterval('updateClock()',1000)">
    <header>
        <h1>
            <a href="Default.aspx"><img class="fade" alt="Buen Record de prueba para texto alternativo" src="img/logo.png"/></a>
            
        </h1>
    </header>
    
    <section id="contenido">
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>

            <asp:UpdatePanel ID="uP1" runat="server" Visible="true">
                <ContentTemplate>
                    <asp:Label runat="server">Convert From: </asp:Label><asp:DropDownList ID="ddlFrom" runat="server">
                    </asp:DropDownList>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server">Convert To: </asp:Label>
                    <asp:DropDownList ID="ddlTo" runat="server">
                    </asp:DropDownList>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />

            <asp:UpdatePanel ID="updatePanel1" runat="server">
                <ContentTemplate>
                    <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox>
                    <asp:Button ID="btnConvert" runat="server" Text="Convert" 
                        onclick="btnConvert_Click1" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                    <asp:BalloonPopupExtender ID="BalloonPopupExtender1" runat="server"
                        TargetControlID="txtNumber"
                        BalloonPopupControlID="Panel1"
                        BalloonStyle="Rectangle"
                        BalloonSize="Small"
                        UseShadow="False"
                        ScrollBars="Auto"
                        DisplayOnFocus="false"
                        DisplayOnClick="false" />
                    <asp:Panel ID="Panel1" runat="server" Visible="True" >
                        <asp:Label ID="lblPopup" runat="server" 
                            Text="Insert the value to Convert.">
                        </asp:Label>
                    </asp:Panel>
                </ContentTemplate>

            </asp:UpdatePanel>
            
            <asp:UpdatePanel ID="updatePanelInterval" runat="server">
                <%--<Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>--%>
                <ContentTemplate>
                    <asp:Panel ID="panelDateTame" runat="server" Width="320" Height="40">
                        <asp:Label ID="clock" runat="server" ></asp:Label>
                    </asp:Panel>                
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:AlwaysVisibleControlExtender ID="dateTimeFrame" runat="server"
                TargetControlID="updatePanelInterval"
                VerticalSide="Bottom"
                VerticalOffset="10"
                HorizontalSide="Right"
                HorizontalOffset="10"
                ScrollEffectDuration="10">
            </asp:AlwaysVisibleControlExtender>
        </form>
    </section>
    <footer>
        <p>Comprensión de todos los derechos de Copyright y demás</p>
    </footer>
</body>
</html>
