using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
		{
			e.Command.Parameters[0].Value = GridView1.DataKeys[GridView1.EditIndex].Value;
		}

		protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
		{
			int a = 0;

		}

		protected void SqlDataSource1_Updating1(object sender, SqlDataSourceCommandEventArgs e)
		{
			int a = 0;
		}
	}
}