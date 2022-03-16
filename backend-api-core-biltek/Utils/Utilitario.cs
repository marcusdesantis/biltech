using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace backend_api_core.Utils
{
    //public class Utilitario
    //{
    //}

    public class Utilitario
    {
        #region "Servidores"
        public enum Servidor
        {
            Local = 1,
            Remoto = 2,
        }
        #endregion

        #region "Constructor"
        public Utilitario()
        {

        }
        #endregion

        #region "Metodos de Cifrado"

        public static string Encriptar(string texto, string strKey)
        {
            string key = strKey;
            //arreglo de bytes donde guardaremos la llave
            byte[] keyArray;
            //arreglo de bytes donde guardaremos el texto
            //que vamos a encriptar
            byte[] aCifrar = UTF8Encoding.UTF8.GetBytes(texto);

            //se utilizan las clases de encriptación
            //provistas por el Framework
            //Algoritmo MD5
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            //se guarda la llave para que se le realice
            //hashing
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            //Algoritmo 3DES
            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;
            //tdes.Padding = PaddingMode.ANSIX923;

            //se empieza con la transformación de la cadena
            ICryptoTransform cTransform = tdes.CreateEncryptor();

            //arreglo de bytes donde se guarda la
            //cadena cifrada
            byte[] ArrayResultado = cTransform.TransformFinalBlock(aCifrar, 0, aCifrar.Length);
            tdes.Clear();

            //se regresa el resultado en forma de una cadena
            //return Convert.ToBase64String(ArrayResultado, 0, ArrayResultado.Length);
            return Convert.ToBase64String(ArrayResultado);
        }

        public static string Desencriptar(string textoEncriptado, string strKey)
        {
            string key = strKey;
            byte[] keyArray;
            //convierte el texto en una secuencia de bytes
            byte[] aDescifrar = Convert.FromBase64String(textoEncriptado);

            //se llama a las clases que tienen los algoritmos
            //de encriptación se le aplica hashing
            //algoritmo MD5
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();

            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));

            hashmd5.Clear();

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();

            tdes.Key = keyArray;
            tdes.Mode = CipherMode.ECB;
            tdes.Padding = PaddingMode.PKCS7;
            //tdes.Padding = PaddingMode.ANSIX923;

            ICryptoTransform cTransform = tdes.CreateDecryptor();

            byte[] resultArray = cTransform.TransformFinalBlock(aDescifrar, 0, aDescifrar.Length);

            tdes.Clear();
            //se regresa en forma de cadena
            return UTF8Encoding.UTF8.GetString(resultArray);
        }

        #endregion

        #region "Metodos de Formato de Fecha"
        /// <summary>
        /// Función para Cambiar el Formato de la Fecha origen
        /// </summary>
        /// <param name="fechaOrigen">Fecha origen a Cambiar el Formato</param>
        /// <param name="formatoFechaOrigen">Formato de la Fecha origen</param>
        /// <param name="formatoFechaSalida">Formato de la Fecha de salida</param>
        /// <returns></returns>
        public static string ObtenerFormatoFecha(string fechaOrigen, FormatoFecha formatoFechaOrigen, FormatoFecha formatoFechaSalida)
        {
            string[] fechaArray;
            string dia = "";
            string mes = "";
            string gestion = "";
            string fechaSalida = "";

            // FORMATO DE LA FECHA ORIGEN
            switch (formatoFechaOrigen)
            {
                case Utils.FormatoFecha.EN:
                    {
                        fechaArray = fechaOrigen.Split('-');
                        dia = fechaArray[2];
                        mes = fechaArray[1];
                        gestion = fechaArray[0];
                    }
                    break;
                case Utils.FormatoFecha.ES:
                    {
                        fechaArray = fechaOrigen.Split('/');
                        dia = fechaArray[0];
                        mes = fechaArray[1];
                        gestion = fechaArray[2];
                    }
                    break;
                default:
                    break;
            }

            // FORMATO DE LA FECHA DE SALIDA
            switch (formatoFechaSalida)
            {
                case Utils.FormatoFecha.EN:
                    {
                        fechaSalida = gestion + "-" + mes + "-" + dia;
                    }
                    break;
                case Utils.FormatoFecha.ES:
                    {
                        fechaSalida = dia + "/" + mes + "/" + gestion;
                    }
                    break;
                    // default:
                    // break;
            }

            return fechaSalida;
        }
        #endregion

    }
}
