using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VentaRepuestos.Domain.Conexion
{
    public class ConexionBD
    {
        public SqlConnection connect = new SqlConnection();

        public ConexionBD(String user, String pass)
        {
            try
            {

                connect = new SqlConnection("Server=DESKTOP-D7J7DS4\\CCBB31;Database=VentaRepuestos;UID=" + user + ";PWD=" + pass);
                connect.Open();
            }
            catch (Exception)
            {


            }
        }
    }
}