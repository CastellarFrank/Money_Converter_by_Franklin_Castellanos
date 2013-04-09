using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using AjaxControlToolkit;

public partial class _Default : System.Web.UI.Page
{
    moneyService.CurrencyServiceClient money;
    
    
    protected void Page_Load(object sender, EventArgs e)
    {
        money = new moneyService.CurrencyServiceClient();
        //for (int i = 0,cant=Enum.GetNames(typeof(moneyService.CurrencyCode)).Length; i < cant; i++)
        //{
        //    this.ddlFrom.Items.Add();
        //}
        //List<moneyService.CurrencyCode> listData = Enum.GetNames(typeof(moneyService.CurrencyCode)).Cast<moneyService.CurrencyCode>().ToList();
        //String text="";
        //for (int i = 0; i < listData.Count; i++)
        //{
        //    text += listData[i].ToString()+"\r\n";
        //}
        //this.lblResult.Text = text;
        Debug.WriteLine("Load");
        
        if (!IsPostBack)
        {
            Debug.WriteLine("Execute Load");
            foreach (moneyService.CurrencyCode current in Enum.GetValues(typeof(moneyService.CurrencyCode)))
            {
                this.ddlFrom.Items.Add(current.ToString());
                this.ddlTo.Items.Add(current.ToString());
            }
            this.txtNumber.Text = "0";
        }   
        
    }

    protected void btnConvert_Click1(object sender, EventArgs e)
    {
        this.btnConvert.Enabled = false;
        Decimal test;        
        if (this.txtNumber.Text == "")
        {
            this.BalloonPopupExtender1.DisplayOnFocus = true;
            this.lblPopup.Text = "You must to enter a quantity.";
            this.lblResult.Text = "Can't Convert, there is a problem";
            this.txtNumber.Focus();
        }
        else if (!Decimal.TryParse(this.txtNumber.Text,out test))
        {
            this.BalloonPopupExtender1.DisplayOnFocus = true;
            this.lblPopup.Text = "The value entered is invalid.";
            this.lblResult.Text = "Can't Convert, there is a problem";
            this.txtNumber.Focus();
        }
        else
        {
            Decimal result=0;
            if (this.ddlFrom.SelectedItem.ToString().Equals(this.ddlTo.SelectedItem.ToString()))
            {
                result = Decimal.Parse(this.txtNumber.Text);
            }
            else
            {

                try
                {
                    moneyService.Currency radio = this.money.GetConversionRate((moneyService.CurrencyCode)Enum.Parse(typeof(moneyService.CurrencyCode),
                    this.ddlFrom.SelectedItem.ToString()), (moneyService.CurrencyCode)Enum.Parse(typeof(moneyService.CurrencyCode),
                    this.ddlTo.SelectedItem.ToString()));
                    result = (Decimal)radio.Rate * Decimal.Parse(this.txtNumber.Text);
                }catch(Exception s){
                    this.lblResult.Text = "Server Conecction Failed, Please try it later";
                    this.btnConvert.Enabled = true;
                    return;
                }
                    
            }
            
            this.lblResult.Text = "Result: "+result.ToString();
            this.lblPopup.Text = "Insert another value to convert.";
            this.BalloonPopupExtender1.DisplayOnFocus = false;
            this.txtNumber.Focus();
        }
        this.btnConvert.Enabled = true;
    }
}