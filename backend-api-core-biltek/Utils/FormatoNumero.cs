using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Globalization;

namespace backend_api_core.Utils
{
    public  static class FormatoNumero
    {
        private static string CerosIzquierda(int cantidad, char caracter, string cadena)
        {
            string resultado = cadena.PadLeft(cantidad, caracter);
            return resultado;
        }

        private static string CerosDerecha(int cantidad, char caracter, string cadena)
        {
            string resultado = cadena.PadRight(cantidad, caracter);
            return resultado;
        }

        /// <summary>
        /// Método que convierte un Número decimal a String con separador de miles coma (,) y separador de decimales punto (.)
        /// </summary>
        /// <param name="numero">Número decimal</param>
        /// <param name="cantidadDecimales">Cantidad de decimales</param>
        /// <returns></returns>
        public static string ToStringEnUS(decimal numero, int cantidadDecimales)
        {
            /*
             value = 1.2;
             Console.WriteLine(value.ToString("0.00", CultureInfo.InvariantCulture));
             Console.WriteLine(String.Format(CultureInfo.InvariantCulture, 
                               "{0:0.00}", value));
             // Displays 1.20
             */
            //string cadena = totalAnios.ToString("0.00", System.Globalization.CultureInfo.CreateSpecificCulture("en-US"));

            CultureInfo enUs = CultureInfo.CreateSpecificCulture("en-US");

            string decimales = CerosIzquierda(cantidadDecimales, '0', "");
            // string especificador = "{0:0,0." + decimales + "}";            
            string especificador = "{0:#,##0." + decimales + "}";
            string cadena = String.Format(enUs, especificador, numero);
            return cadena;
        }

        /// <summary>
        /// Método que convierte un Número a String con separador de miles coma (,) y separador de decimales punto (.)
        /// </summary>
        /// <param name="numero">Número decimal</param>
        /// <param name="cantidadDecimales">Cantidad de decimales</param>
        /// <returns></returns>
        public static string ToStringEsBO(decimal numero, int cantidadDecimales)
        {
            CultureInfo esBo = CultureInfo.CreateSpecificCulture("es-BO");

            string decimales = CerosIzquierda(cantidadDecimales, '0', "");
            // string especificador = "{0:0,0." + decimales + "}";
            string especificador = "{0:#,##0." + decimales + "}";

            string cadena = String.Format(esBo, especificador, numero);
            return cadena;
        }
    }
}

